document.addEventListener("turbo:load", function() {  
  var radios = document.querySelectorAll(".custom-radio");

  radios.forEach(function(radio) {
    
    radio.previousChecked = false;

    radio.addEventListener("click", function(event) {
      if (this.previousChecked) {
        this.checked = false;
        this.previousChecked = false;
      } else {
        this.checked = true;
        this.previousChecked = true;
      }
    });
  });
});
