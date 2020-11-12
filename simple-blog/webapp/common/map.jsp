
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAuBxvCl1OmWm8LBjlCLtR9Puj-TvZqaCA&callback=initMap&libraries=places,geometry"></script>
<script>
    var map;
    var myCenter = {
        lat: 15.9684863,
        lng: 108.2583681
    };
    function initMap() {
        var googleMap = document.getElementById('map');
        googleMap.style.display = 'block';
        map = new google.maps.Map(googleMap, {
            zoom: 16,
            center: myCenter,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        });
        var varLocation = document.getElementById('yourLocation');
        varLocation.style.display = 'block';
        map.controls[google.maps.ControlPosition.RIGHT_BOTTOM].push(varLocation);
    }
    //-------------------------------------------------------------------
    function yourLocation(){
        // Try HTML5 geolocation.
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(function (position) {
                myCenter = {
                    lat: position.coords.latitude,
                    lng: position.coords.longitude
                };
                var marker = new google.maps.Marker({
                    position: myCenter,
                    icon: 'template/images/current.png'
                });
                var infowindow = new google.maps.InfoWindow();
                infowindow.setContent('Your location');
                marker.setMap(map);
                infowindow.open(map, marker);
                map.setCenter(myCenter);
            });
        } else{
            swal.fire(
                'Location Error!',
                'Please enable location permission to continue.',
                'error'
            )
        }
    }
    //-------------------------------------------------------------------
    google.maps.event.addDomListener(window, 'load', initMap);
</script>