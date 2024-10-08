# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "radio_toggle", to: "radio_toggle.js"
pin "leaflet", to: "https://unpkg.com/leaflet@1.7.1/dist/leaflet.js"
