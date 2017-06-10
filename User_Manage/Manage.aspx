<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Manage.aspx.cs" Inherits="WebAppAdmin.User_Manage.Manage" %>

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
                        <a href="..\Restaurant_Manage\Insert.aspx">Insertar Nuevo Restaurante</a>
                    </li>
                    <li>
                        <a href="..\Category_Manage\Insert.aspx">Insertar Nueva Categoria</a>
                    </li>
                    <li>
                        <a href="Register.aspx">Registrar Usuario</a>
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
    <form id="form1" runat="server">
    <div>
    <asp:GridView ID="gCategoria" runat="server" Width="300px" AutoGenerateColumns="False" CssClass="table table-bordered bs-table" DataSourceID="MySqlDataSource" DataKeyNames="id" 
           OnRowDataBound="OnRowDataBound" EmptyDataText="No records has been added.">
              <Columns>
                    <asp:BoundField DataField="name" HeaderText="Name" ItemStyle-Width ="15%" ItemStyle-Wrap="false" ControlStyle-Width="300px"/> 
                  <asp:BoundField DataField="password" HeaderText="Name" ItemStyle-Width ="15%" ItemStyle-Wrap="false" ControlStyle-Width="300px"/>  
                    <asp:CommandField ButtonType="Link" ControlStyle-CssClass="btn btn-info" ShowEditButton="true" ItemStyle-Width ="15%" ItemStyle-Wrap="false" ControlStyle-Width="100px" />
                    <asp:CommandField ButtonType="Link" ControlStyle-CssClass="btn btn-danger" ShowDeleteButton="true" ItemStyle-Width ="15%" ItemStyle-Wrap="false" ControlStyle-Width="100px" />                
              </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="MySqlDataSource" ProviderName="MySql.Data.MySqlClient" runat="server" ConnectionString="<%$ ConnectionStrings:WebAppConnString %>"
            SelectCommand="SELECT id, name, password FROM adm_users_table"
            UpdateCommand="UPDATE adm_users_table SET name = @name, password = @password WHERE id = @id"
            DeleteCommand="DELETE FROM adm_users_table WHERE id = @id">
            <UpdateParameters>
                <asp:Parameter Name="id" Type="String" />
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="password" Type="String" />
            </UpdateParameters>
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
        </asp:SqlDataSource>
    </div>
    </form>

    <hr />
    <div>
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
