import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["latitude", "longitude"];

  connect() {
    // 'L'はleaflet.jsが読み込まれるとグローバル変数として利用可能
    this.map = L.map(this.element).setView([35.6895, 139.6917], 13);

    L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
      maxZoom: 19,
    }).addTo(this.map);

    this.marker = null;

    // 初期ピンをユーザーの現在地に設定
    this.map.locate({ setView: true, maxZoom: 16 });

    this.map.on("locationfound", (e) => {
      if (!this.marker) {
        this.marker = L.marker(e.latlng).addTo(this.map);
      } else {
        this.marker.setLatLng(e.latlng);
      }
      this.latitudeTarget.value = e.latlng.lat;
      this.longitudeTarget.value = e.latlng.lng;
    });

    this.map.on("click", this.onMapClick.bind(this));
  }

  onMapClick(e) {
    const { lat, lng } = e.latlng;
    if (this.marker) {
      this.marker.setLatLng(e.latlng);
    } else {
      this.marker = L.marker(e.latlng).addTo(this.map);
    }

    this.latitudeTarget.value = lat;
    this.longitudeTarget.value = lng;
  }
}
