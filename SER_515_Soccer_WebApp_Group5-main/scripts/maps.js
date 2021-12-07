function initMap() {
  var center = {lat: 33.416699936007866, lng: -111.93158556477486};
  var locations = [
    ['SDFC Fields<br>\
    1110-1150 S McAllister Ave, Tempe, AZ 85281<br>\
   <a href="https://goo.gl/maps/5gUoCXYv1B7JL8Ds6">Get Directions</a>',   33.416699936007866, -111.93158556477486]
  ];
var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 9,
    center: center
  });
var infowindow =  new google.maps.InfoWindow({});
var marker, count;
for (count = 0; count < locations.length; count++) {
    marker = new google.maps.Marker({
      position: new google.maps.LatLng(locations[count][1], locations[count][2]),
      map: map,
      title: locations[count][0]
    });
google.maps.event.addListener(marker, 'click', (function (marker, count) {
      return function () {
        infowindow.setContent(locations[count][0]);
        infowindow.open(map, marker);
      }
    })(marker, count));
  }
}