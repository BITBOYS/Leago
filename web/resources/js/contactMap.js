function initialize() {
    var hamburg = new google.maps.LatLng(53.5510846, 9.9936818);
    var mapOptions = {
        zoom: 15,
        center: hamburg,
        draggable: false
    };
    var map = new google.maps.Map(document.getElementById('map-canvas'),
            mapOptions);

    var marker = new google.maps.Marker({
        position: new google.maps.LatLng(53.5510846, 9.9936818),
        title: 'Zentrale der Macht',
        animation: google.maps.Animation.DROP
    });

    marker.setMap(map);
}

google.maps.event.addDomListener(window, 'load', initialize);
