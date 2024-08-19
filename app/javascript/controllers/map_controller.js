import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["latitude", "longitude", "shopLatitudes", "shopLongitudes", "shopNames", "shopIds"];

  initializeMap() {
    // 既に初期化されている場合、地図をリセット
    if (this.map) {
      this.map.off(); // イベントリスナーをオフ
      this.map.remove(); // 既存の地図インスタンスを削除
    }

    // マップを初期化するためのデフォルト位置
    const defaultLat = 35.6895;
    const defaultLng = 139.6917;

    const latitudes = this.hasShopLatitudesTarget ? JSON.parse(this.shopLatitudesTarget.value) : [];
    const longitudes = this.hasShopLongitudesTarget ? JSON.parse(this.shopLongitudesTarget.value) : [];
    const names = this.hasShopNamesTarget ? JSON.parse(this.shopNamesTarget.value) : [];
    const ids = this.hasShopIdsTarget ? JSON.parse(this.shopIdsTarget.value) : [];

    this.map = L.map(this.element).setView([defaultLat, defaultLng], 13);

    L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
      maxZoom: 19,
    }).addTo(this.map);

    const shopIcon = L.icon({
      iconUrl: '/assets/sdesign_00247.png',
      iconSize: [70, 60],
      iconAnchor: [35, 60],
      popupAnchor: [0, -60]
    });

    if (latitudes.length > 0 && longitudes.length > 0) {
      // 一覧画面: 複数の店舗のピンを配置
      latitudes.forEach((lat, index) => {
        const lng = longitudes[index];
        const name = names[index];
        const id = ids[index];

        if (lat && lng) {
          const marker = L.marker([lat, lng], { icon: shopIcon }).addTo(this.map);
          const popupContent = `<a href="/shops/${id}">${name}</a>`;
          marker.bindPopup(popupContent);

          marker.on("mouseover", function () {
            marker.openPopup();
          });

          marker.on("click", function () {
            window.location.href = `/shops/${id}`;
          });
        }
      });

      // 地図の表示位置をショップの中心にする
      const bounds = L.latLngBounds(latitudes.map((lat, i) => [lat, longitudes[i]]));
      this.map.fitBounds(bounds);

      // 現在地も表示する
      this.map.locate({ setView: false, maxZoom: 16 });

      this.map.on("locationfound", (e) => {
        L.marker(e.latlng).addTo(this.map).bindPopup("現在地").openPopup();
      });

    } else if (this.hasLatitudeTarget && this.hasLongitudeTarget) {
      const hasCoordinates = this.latitudeTarget.value && this.longitudeTarget.value;
      const latitude = hasCoordinates ? parseFloat(this.latitudeTarget.value) : defaultLat;
      const longitude = hasCoordinates ? parseFloat(this.longitudeTarget.value) : defaultLng;

      this.marker = L.marker([latitude, longitude], { icon: shopIcon, draggable: !hasCoordinates }).addTo(this.map);

      if (!hasCoordinates) {
        // 投稿画面: ユーザーの現在地を取得してピンを配置
        this.map.locate({ setView: true, maxZoom: 16 });

        this.map.on("locationfound", (e) => {
          this.marker.setLatLng(e.latlng);
          this.latitudeTarget.value = e.latlng.lat;
          this.longitudeTarget.value = e.latlng.lng;
          this.map.setView(e.latlng, 16); // 現在地を取得後に再度中央にセット
        });

        this.map.on("click", this.onMapClick.bind(this));
        this.marker.on("dragend", (event) => {
          const marker = event.target;
          const position = marker.getLatLng();
          this.latitudeTarget.value = position.lat;
          this.longitudeTarget.value = position.lng;
        });
      } else {
        this.map.setView([latitude, longitude], 16);
        this.marker.setLatLng([latitude, longitude]);

        // 現在地も表示する
        this.map.locate({ setView: false, maxZoom: 16 });

        this.map.on("locationfound", (e) => {
          L.marker(e.latlng).addTo(this.map).bindPopup("現在地").openPopup();
        });
      }
    }
  }

  onMapClick(e) {
    const { lat, lng } = e.latlng;
    if (this.marker) {
      this.marker.setLatLng([lat, lng]);
    } else {
      const shopIcon = L.icon({
        iconUrl: '/assets/sdesign_00247.png',
        iconSize: [70, 60],
        iconAnchor: [35, 60],
        popupAnchor: [0, -60]
      });
      this.marker = L.marker([lat, lng], { icon: shopIcon }).addTo(this.map);
    }
    this.latitudeTarget.value = lat;
    this.longitudeTarget.value = lng;
  }

  connect() {
    this.initializeMap();
  }
}

// ページロードや再レンダリング時に地図を初期化
window.addEventListener("turbo:load", () => {
  const mapElements = document.querySelectorAll('[data-controller="map"]');
  mapElements.forEach((mapElement) => {
    const mapController = Stimulus.controllers.find(controller => controller.element === mapElement && controller.identifier === 'map');
    if (mapController) {
      mapController.initializeMap();
    }
  });
});
