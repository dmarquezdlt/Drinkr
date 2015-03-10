$(document).ready(function() {
  $('button').on('click', console.log("work"));
});


var = current_location = navigator.geolocation.getCurrentPosition(function(position){
  console.log("lat: " + position.coords.latitude + ". long: " +  position.coords.longitude)
});