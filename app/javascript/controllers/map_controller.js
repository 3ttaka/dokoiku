import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["latitude", "longitude"];

  connect() {
    // 緯度と経度が設定されているかを確認
    const hasCoordinates = this.latitudeTarget.value && this.longitudeTarget.value;

    // 緯度と経度を取得。なければデフォルトの東京座標を使用
    const latitude = hasCoordinates ? parseFloat(this.latitudeTarget.value) : 35.6895;
    const longitude = hasCoordinates ? parseFloat(this.longitudeTarget.value) : 139.6917;

    // 地図を初期化
    this.map = L.map(this.element).setView([latitude, longitude], 13);

    L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
      maxZoom: 19,
    }).addTo(this.map);

    // カスタムアイコンを定義
    const shopIcon = L.icon({
      iconUrl: '/assets/sdesign_00247.png', // 赤いピンのアイコン画像のパス
      iconSize: [70, 60], // アイコンのサイズ
      iconAnchor: [19, 38], // アイコンのアンカー（中央下）
    });

    // ピンを設定
    this.marker = L.marker([latitude, longitude], { icon: shopIcon, draggable: !hasCoordinates }).addTo(this.map);

    // 詳細画面ではピンを移動できないようにするため、hasCoordinatesがある場合、クリックイベントを無効化
    if (!hasCoordinates) {
      this.map.locate({ setView: true, maxZoom: 16 });

      this.map.on("locationfound", (e) => {
        if (!this.marker) {
          this.marker = L.marker(e.latlng, { icon: shopIcon }).addTo(this.map);
        } else {
          this.marker.setLatLng(e.latlng);
        }
        this.latitudeTarget.value = e.latlng.lat;
        this.longitudeTarget.value = e.latlng.lng;
      });

      this.map.on("click", this.onMapClick.bind(this));
    } else {
      // 現在地を表示するために、ユーザーの現在地をピン付け
      this.map.locate({ setView: false, maxZoom: 16 });

      this.map.on("locationfound", (e) => {
        L.marker(e.latlng).addTo(this.map).bindPopup("現在地").openPopup();
      });
    }
  }

  onMapClick(e) {
    const { lat, lng } = e.latlng;
    if (this.marker) {
      this.marker.setLatLng(e.latlng);
    } else {
      this.marker = L.marker(e.latlng, { icon: shopIcon }).addTo(this.map);
    }

    this.latitudeTarget.value = lat;
    this.longitudeTarget.value = lng;
  }
}
