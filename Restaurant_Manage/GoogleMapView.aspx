<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GoogleMapView.aspx.cs" Inherits="WebAppAdmin.Restaurant_Manage.GoogleMapView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <style>
        html,
        body,
        #map_canvas {
          height: 100%;
          width: 100%;
          margin: 0px;
          padding: 0px
        }
    </style>
</head>
<body>

    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBkC6V4Mv7SUkgPOHutpiBuw7dKQtpVuGo&callback=initMap" type="text/javascript"></script>  
    <script type="text/javascript">
        

        //$.post('localhost/rest_recomm_service/database/restaurant_management/return_rest_data.php', { 'place': place }, function (data) {
        //    var json = JSON.parse(data);
        //    alert(data);
        //});

        var locations = ['Centro Médico Hispánico, Calle Marginal Santo Domingo Este 11506', 'Antojitos Premium, Calle Rosa Blanca Santo Domingo Este 11506'];
        var geocoder;
        var map;
        var bounds = new google.maps.LatLngBounds();

        function initialize() {
            map = new google.maps.Map(
              document.getElementById("map_canvas"), {
                  center: new google.maps.LatLng(37.4419, -122.1419),
                  zoom: 13,
                  mapTypeId: google.maps.MapTypeId.ROADMAP
              });
            geocoder = new google.maps.Geocoder();

            for (i = 0; i < locations.length; i++) {


                geocodeAddress(locations, i);
            }
        }
        google.maps.event.addDomListener(window, "load", initialize);

        function geocodeAddress(locations, i) {
            var title = '';
            var address = '';
            var url = '';
            geocoder.geocode({
                'address': locations[i]
            },

              function (results, status) {
                  if (status == google.maps.GeocoderStatus.OK) {
                      var marker = new google.maps.Marker({
                          icon: 'http://maps.google.com/mapfiles/ms/icons/blue.png',
                          map: map,
                          position: results[0].geometry.location,
                          title: title,
                          animation: google.maps.Animation.DROP,
                          address: address,
                          url: url
                      })
                      infoWindow(marker, map, title, address, url);
                      bounds.extend(marker.getPosition());
                      map.fitBounds(bounds);
                  } else {
                      alert("geocode of " + address + " failed:" + status);
                  }
              });
        }

        function infoWindow(marker, map, title, address, url) {
            google.maps.event.addListener(marker, 'click', function () {
                var html = "<div><h3>" + title + "</h3><p>" + address + "<br></div><a href='" + url + "'>View location</a></p></div>";
                iw = new google.maps.InfoWindow({
                    content: html,
                    maxWidth: 350
                });
                iw.open(map, marker);
            });
        }

        function createMarker(results) {
            var marker = new google.maps.Marker({
                icon: 'http://maps.google.com/mapfiles/ms/icons/blue.png',
                map: map,
                position: results[0].geometry.location,
                title: title,
                animation: google.maps.Animation.DROP,
                address: address,
                url: url
            })
            bounds.extend(marker.getPosition());
            map.fitBounds(bounds);
            infoWindow(marker, map, title, address, url);
            return marker;
        }
    </script>
   <div id="map_canvas" style="border: 2px solid #3872ac;"></div>
</body>
</html>
