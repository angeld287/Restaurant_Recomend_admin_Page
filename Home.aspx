<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="WebAppAdmin.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <link href="css/4-col-portfolio.css" rel="stylesheet"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous"/>
    <style>
        
        html,
        body,
        #map_canvas {
          height: 700px;
          width: 100%;
          margin: 0px;
          padding: 0px
        }
    </style>
    <title></title>
</head>
<body>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBkC6V4Mv7SUkgPOHutpiBuw7dKQtpVuGo&callback=initMap" type="text/javascript"></script>  
    <script type="text/javascript">
        

        //$.post('localhost/rest_recomm_service/database/restaurant_management/return_rest_data.php', { 'place': place }, function (data) {
        //    var json = JSON.parse(data);
        //    alert(data);
        //});

        var locations = ['Centro Médico Hispánico, Calle Marginal Santo Domingo Este 11506',
                            'Súper Chimi El Patricio Av. San Vicente de Paúl Santo Domingo Este 11504',
                            'Pk Pollos Calle Marginal Santo Domingo Este 11506',
                            'DW EL Mago Drink Billar Santo Domingo Este 11506',
                            'Helados Bon Av San Vicente de Paúl Santo Domingo Este 11504',
                            'Súper Chimi El Patricio Av. San Vicente de Paúl Santo Domingo Este 11504',
                            'k.delicias Premium Santo Domingo Este 11604',
                            'Dominos Calle 26 Santo Domingo Este 11605',
                            'Karbón Y Leña Calle 19 esq. Aut. de San Isidro Marginal Norte 22'];
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
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand">Logged User: <asp:Label ID="username" Text="No User" runat="server"/></a>
                <a class="navbar-brand" href="Home.aspx">Home Page</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="Restaurant_Manage\Insert.aspx">Insertar Nuevo Restaurante</a>
                    </li>
                    <li>
                        <a href="Category_Manage\Insert.aspx">Insertar Nueva Categoria</a>
                    </li>
                    <li>
                        <a href="User_Manage\Register.aspx">Registrar Usuario</a>
                    </li>
                    <li>
                        <a href="logout.aspx">Salir</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

<%--    <form id="form1" runat="server">
    <div>
        <p>Logged in Page</p>
        <a href="Register.aspx">Salir</a>
        <asp:Label ID="session_token" Text="" runat="server"/>
        <asp:Label ID="session_id" Text="" runat="server"/>
    </div>
    </form>--%>


       <!-- Page Content  -  |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||\-->
    <div class="container">

        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Restaurantes Localizados
                    <small>Para ver los datos de Restaurantes haga clic en "Ver Lista de Restaurantes"</small>
                </h1>
            </div>
        </div>
        <!-- /.row -->
        
        <!-- Projects Row -->
        <div class="row">
            <div class="col-md-9 portfolio-item">
                <a href="#">
                    
                </a>
            </div>
        </div>
        <!-- /.row -->
        <a href="Restaurant_Manage\View.aspx" class="btn btn-info" role="button">Ver Lista de Restaurantes</a>
        <a href="Category_Manage\Manage.aspx" class="btn btn-info" role="button">Ver Lista de Categorias</a>
        <%--<a href="Restaurant_Manage\GoogleMapView.aspx" hidden="hidden" class="btn btn-info" role="button">Ver Lista de Usuarios Administrativos</a>--%>
        <hr/>

        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; Restaurant recommendations 2017</p>
                </div>
            </div>
            <!-- /.row -->
        </footer>

    </div>
    <!-- /.container -->

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</body>
</html>
