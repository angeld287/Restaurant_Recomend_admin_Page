using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace WebAppAdmin.Restaurant_Manage
{

    public partial class view : System.Web.UI.Page
    {
        //MySql.Data.MySqlClient.MySqlDataReader reader;
        String constr = ConfigurationManager.ConnectionStrings["WebAppConnString"].ConnectionString;
        private MySqlConnection conn = new MySqlConnection("server=localhost;User ID=root;Password=;Database=resta_recomm_app_db");
        //String query = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            String token = (String)(Session["userToken"]);
            if (token == null)
            {
                Response.Redirect("../User_Manage/Login.aspx", false);
            }
            else
            {
               // Grv_Bind();
            }
        }

        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && grvRestaurants.EditIndex != e.Row.RowIndex)
            {
                //(e.Row.Cells[20].Controls[20] as LinkButton).Attributes["onclick"] = "return confirm('Do you want to delete this row?');";
            }
        }


    }
}