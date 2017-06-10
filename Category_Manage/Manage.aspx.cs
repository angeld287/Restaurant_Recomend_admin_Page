using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

using System.Data;
using System.Configuration;

namespace WebAppAdmin.Category_Manage
{
    public partial class Manage : System.Web.UI.Page
    {
        MySql.Data.MySqlClient.MySqlConnection conn;
        MySql.Data.MySqlClient.MySqlCommand cmd;
        String query;
        MySql.Data.MySqlClient.MySqlDataReader reader;
        protected void Page_Load(object sender, EventArgs e)
        {
            String token = (String)(Session["userToken"]);
            if (token == null)
            {
                Response.Redirect("../User_Manage/Login.aspx", false);
            }
            username.Text = (String)Session["uname"];
        }

        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            //if (e.Row.RowType == DataControlRowType.DataRow && gUsers.EditIndex != e.Row.RowIndex)
            //{
            //    //(e.Row.Cells[20].Controls[20] as LinkButton).Attributes["onclick"] = "return confirm('Do you want to delete this row?');";
            //}
        }
        protected void gUsers_RowEditing(object sender, GridViewRowEventArgs e)
        {

        }
    }
}