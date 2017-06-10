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
    <title></title>
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
                    <img class="img-responsive" src="http://placehold.it/750x450" alt=""/>
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
