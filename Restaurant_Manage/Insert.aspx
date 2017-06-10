<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Insert.aspx.cs" Inherits="WebAppAdmin.Restaurant_Manage.Insert" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous"/>
    <style>
        body {
            padding-top: 70px; /* Required padding for .navbar-fixed-top. Remove if using .navbar-static-top. Change if height of navigation changes. */
        }

        .portfolio-item {
            margin-bottom: 25px;
        }

        footer {
            margin: 50px 0;
        }
    </style>
</head>
<body>
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
                <a class="navbar-brand" href="..\Home.aspx">Home Page</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="\Restaurant_Manage\Insert.aspx">Insertar Nuevo Restaurante</a>
                    </li>
                    <li>
                        <a href="..\Category_Manage\Insert.aspx">Insertar Nueva Categoria</a>
                    </li>
                    <li>
                        <a href="..\User_Manage\Register.aspx">Registrar Usuario</a>
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
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBkC6V4Mv7SUkgPOHutpiBuw7dKQtpVuGo&callback=initMap" type="text/javascript"></script>  
    <script type="text/javascript">
        window.onload = function () {
            var mapOptions = {
                //18.5075676,-69.9774283,11
                center: new google.maps.LatLng(18.5075676, -69.9774283),
                zoom: 11,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };
            var infoWindow = new google.maps.InfoWindow();
            var latlngbounds = new google.maps.LatLngBounds();
            var map = new google.maps.Map(document.getElementById("dvMap"), mapOptions);
            google.maps.event.addListener(map, 'click', function (e) {
                var latlng = new google.maps.LatLng(e.latLng.lat(), e.latLng.lng());
                var geocoder = geocoder = new google.maps.Geocoder();
                geocoder.geocode({ 'latLng': latlng }, function (results, status) {
                    if (status == google.maps.GeocoderStatus.OK) {
                        if (results[1]) {
                            document.getElementById("latitude").value = e.latLng.lat();
                            document.getElementById("length").value = e.latLng.lng();
                            document.getElementById("address").value = results[1].formatted_address;
                            document.getElementById("mapzoom").value = map.getZoom();
                            //alert("Location: " + map.getZoom());
                            //alert("Location: " + map.getCenter().toUrlValue());
                            //alert("Location: " + results[1].formatted_address + "\r\nLatitude: " + e.latLng.lat() + "\r\nLongitude: " + e.latLng.lng());  getZoom
                        }
                    }
                });
            });
        }
    </script>



                <div class="col-lg-8 col-lg-offset-2">

                    <h1>Ingreso de Restaurantes</h1>

                    <p class="lead">Para ingresar la ubicacion del restaurante deseado, busquelo en el mapa y presiones en el punto</p>
                </div>

    <div id="map" style="width:70%; float:left; margin-top:10px">   
        <div id="dvMap" style="width: 100%; height: 750px">
        </div>
    </div>
    <div id="form" style="width:30%; float:right; padding: 20px">
        <form id="form1" runat="server">
            <div class="form-group">
                <div class="form-group">
                    <label for="exampleInputEmail1">Nombre de Restaurante</label>
                    <asp:TextBox ID="name" Text="" runat="server" CssClass="form-control input-lg"/>
                    <!--<input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">-->
                    <small id="emailHelp" class="form-text text-muted">Digite el nombre del Restaurante.</small>
                 </div>
                  <div class="form-group">
                    <label for="exampleTextarea">Direccion</label>
                      <asp:TextBox ID="address" Text="" TextMode="multiline" Columns="50" Rows="2" runat="server" CssClass="form-control input-lg" ReadOnly="false"/>
                      <small id="emailHelp" class="form-text text-muted">Este campo se completa automaticamente al seleccionar la ubicacion en el mapa.</small>
                  </div>
                <div class="form-group">
                    <label for="exampleInputEmail1">Numero Telefonico</label>
                    <asp:TextBox ID="phone_number" Text="" runat="server" CssClass="form-control input-lg"/>
                    <!--<input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">-->
                    <small id="emailHelp" class="form-text text-muted">Digite el numero Telefonico del Restaurant.</small>
                 </div>
                <!--<asp:TextBox ID="rating" Text="" runat="server"/>-->
                
                <div class="form-group">
                    <label for="exampleSelect2">Tipo o Categoria</label>
                    <asp:DropDownList ID="Category_data" CssClass="form-control" runat="server"/>
                    <small id="emailHelp" class="form-text text-muted">Seleccione el tipo de Restaurante.</small>
                </div>
                 <div class="form-group">
                    <label for="exampleInputEmail1">Ubicacion: Latitud</label>
                    <asp:TextBox ID="latitude" Text="" runat="server" CssClass="form-control input-lg" ReadOnly="false"/>
                    <!--<input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">-->
                    <small id="emailHelp" class="form-text text-muted">Este campo se completa automaticamente al seleccionar la ubicacion en el mapa.</small>
                 </div>
                <div class="form-group">
                    <label for="exampleInputEmail1">Ubicacion: longitud</label>
                    <asp:TextBox ID="length" Text="" runat="server" CssClass="form-control input-lg" ReadOnly="false"/>
                    <!--<input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">-->
                    <small id="emailHelp" class="form-text text-muted">Este campo se completa automaticamente al seleccionar la ubicacion en el mapa.</small>
                 </div>
                <div class="form-group">
                    <label for="exampleInputEmail1">Enfoque de la ubicacion</label>
                    <asp:TextBox ID="mapzoom" Text="" runat="server" CssClass="form-control input-lg" ReadOnly="false"/>
                    <!--<input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">-->
                    <small id="emailHelp" class="form-text text-muted">Este campo se completa automaticamente al seleccionar la ubicacion en el mapa.</small>
                 </div>
                <asp:Button ID="InsertBtn" Text="Ingresar" runat="server" OnClick="Insert_Restaurant" CssClass="btn btn-primary"/>
            </div>
        </form>

    </div>
    
 <!-- Footer -->
    <hr />
    <div>
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; Restaurant Recomendation 2017</p>
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
