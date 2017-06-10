<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="view.aspx.cs" Inherits="WebAppAdmin.Restaurant_Manage.view" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous"/>
    <title></title>
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

        #marco {
            margin-left: 50px;
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
    <form id="form1" runat="server">
    
        <div class="row" id="marco">
            <div class="" id="myModal">
              <div class="modal-header">
                <h3>Edicion de Restaurantes</h3>
              </div>
              <div class="modal-body">
                <asp:GridView ID="grvRestaurants" runat="server" Width="100%" AutoGenerateColumns="False" CssClass="table table-bordered bs-table" DataSourceID="MySqlDataSource" DataKeyNames="restaurant_id" 
                   OnRowDataBound="OnRowDataBound" EmptyDataText="No records has been added.">
                      <Columns>
                            <asp:BoundField DataField="name" HeaderText="Name" ItemStyle-Width ="15%" ItemStyle-Wrap="false" ControlStyle-Width="300px"/> 
                            <asp:BoundField DataField="category_name" HeaderText="Categoria" ItemStyle-Width ="15%" ItemStyle-Wrap="false" ControlStyle-Width="300px"/>
                            <asp:BoundField DataField="latitude" HeaderText="latitude" ItemStyle-Width ="15%" ItemStyle-Wrap="false" ControlStyle-Width="300px"/>
                            <asp:BoundField DataField="length" HeaderText="length" ItemStyle-Width ="15%" ItemStyle-Wrap="false" ControlStyle-Width="300px"/>
                            <asp:BoundField DataField="phone_number" HeaderText="phone_number" ItemStyle-Width ="15%" ItemStyle-Wrap="false" ControlStyle-Width="300px"/>
                            <asp:BoundField DataField="rating" HeaderText="rating" ItemStyle-Width ="15%" ItemStyle-Wrap="false" ControlStyle-Width="300px"/>
                            <asp:BoundField DataField = "address" HeaderText = "address" ItemStyle-Width ="15%" ItemStyle-Wrap="false" ControlStyle-Width="300px"/>
                            <asp:BoundField DataField="mapzoom" HeaderText="mapzoom"/>

                            <asp:TemplateField HeaderText="Category" SortExpression="CategoryID">
                                <ItemTemplate>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DdlCategories" DataSourceID="SqlDataSource4" DataTextField="category_name" DataValueField="category_id" runat="server" SelectedValue='<%# Bind("category_id") %>'></asp:DropDownList>
                                    <asp:SqlDataSource ProviderName="MySql.Data.MySqlClient" ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:WebAppConnString %>" SelectCommand="SELECT category_id, category_name FROM category_restaurant"></asp:SqlDataSource>
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:CommandField ButtonType="Link" ControlStyle-CssClass="btn btn-info" ShowEditButton="true" ItemStyle-Width ="15%" ItemStyle-Wrap="false" ControlStyle-Width="100px" />
                          <asp:CommandField ButtonType="Link" ControlStyle-CssClass="btn btn-danger" ShowDeleteButton="true" ItemStyle-Width="100" />
                      </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="MySqlDataSource" ProviderName="MySql.Data.MySqlClient" runat="server" ConnectionString="<%$ ConnectionStrings:WebAppConnString %>"
                    SelectCommand="SELECT restaurant_id, name, latitude, length, rating, category, c.category_name, c.category_id, phone_number, address, mapzoom from restaurant r LEFT OUTer join category_restaurant c on c.category_id = r.category"
                    UpdateCommand="UPDATE restaurant SET name = @name, latitude = @latitude, length = @length, rating = @rating, category = @category_id, phone_number = @phone_number, mapzoom = @mapzoom, address = @address WHERE restaurant_id = @restaurant_id"
                    DeleteCommand="DELETE FROM restaurant WHERE restaurant_id = @restaurant_id">
                    <UpdateParameters>
                        <asp:Parameter Name="restaurant_id" Type="Int32" />
                        <asp:Parameter Name="name" Type="String" />
                        <asp:Parameter Name="latitude" Type="String" />
                        <asp:Parameter Name="length" Type="String" />
                        <asp:Parameter Name="rating" Type="String" />
                        <asp:Parameter Name="category_id" Type="String" />
                        <asp:Parameter Name="phone_number" Type="String" />
                        <asp:Parameter Name="address" Type="String" />
                        <asp:Parameter Name="mapzoom" Type="String" />
                    </UpdateParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="restaurant_id" Type="Int32" />
                    </DeleteParameters>
                </asp:SqlDataSource>
                </div>
            </div>
	    </div>
    
    </form>
  <!-- Footer -->
    <hr />
    <div>
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
