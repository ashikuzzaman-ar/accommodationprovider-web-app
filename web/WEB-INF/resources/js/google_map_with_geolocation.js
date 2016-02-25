var geocoder;
var map;
function initialize() {
    geocoder = new google.maps.Geocoder();
    var latlng = new google.maps.LatLng(23.81033, 90.41252);
    var mapOptions = {
        zoom: 13,
        center: latlng
    }
    map = new google.maps.Map(document.getElementById("map"), mapOptions);
    var input = document.getElementById("address");
    var autocomplete = new google.maps.places.Autocomplete(input);
    autocomplete.addListener('place_changed', function () {
        var place = autocomplete.getPlace();
        var address = '';
//        if (place.address_components) {
//            address = [
//                (place.address_components[0] && place.address_components[0].short_name || ''),
//                (place.address_components[1] && place.address_components[1].short_name || ''),
//                (place.address_components[2] && place.address_components[2].short_name || '')
//            ].join(' ');
//        }
//        var infowindow = new google.maps.InfoWindow();
//        infowindow.setContent('<div><strong>' + place.name + '</strong><br>' + address);
    });
}

function codeAddress() {
    var address = document.getElementById("address").value;
    geocoder.geocode({'address': address}, function (results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
            map.setCenter(results[0].geometry.location);
            var marker = new google.maps.Marker({
                map: map,
                position: results[0].geometry.location
            });
        } else {
            alert("Geocode was not successful for the following reason: " + status);
        }
    });
}

