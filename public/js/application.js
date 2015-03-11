$(document).ready(function() {
  var current_location;

  $('input[type=submit]').on('click', function(event){
    event.preventDefault();
    navigator.geolocation.getCurrentPosition(function(position){
      currentLat = position.coords.latitude;
      currentLong = position.coords.longitude;

      var returnLimit = 4;

      $.ajax({
        type:'post',
        url:'/new_request',
        data: {latitude: currentLat, longitude: currentLong, limit: returnLimit, bars: "All" , term: $('#search_term').val()}
      }).done(function(data){
        $('#results').empty();
        $('#results').append(data);
      });
    });
  });

    $('button').on('click', function(event){
    event.preventDefault();
    navigator.geolocation.getCurrentPosition(function(position){
      currentLat = position.coords.latitude;
      currentLong = position.coords.longitude;

      var returnLimit = 4;

      $.ajax({
        type:'post',
        url:'/other_request',
        data: {latitude: currentLat, longitude: currentLong, limit: returnLimit, bars: "All"}
      }).done(function(data){
        $('#results').empty();
        console.log(data.term)
        $('#results').append(data);
      });
    });
  });
});



