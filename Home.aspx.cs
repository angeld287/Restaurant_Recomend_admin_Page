using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppAdmin
{
    public partial class Home : System.Web.UI.Page
    {
        MySql.Data.MySqlClient.MySqlConnection conn;
        MySql.Data.MySqlClient.MySqlCommand cmd;
        MySql.Data.MySqlClient.MySqlDataReader reader;
        String query;
        String name;
        String token;
        String id;
        protected void Page_Load(object sender, EventArgs e)
        {

            String token = (String)(Session["userToken"]);
            if (token == null)
            {
                Response.Redirect("User_Manage/login.aspx", false);
            }
            else
            {
                HomeView();
            }
        }

        protected void HomeView()
        {
            token = (String)(Session["userToken"]);
            id = (String)(Session["userid"]);

            //session_token.Text = token;
            //session_id.Text = id;

            String connString = System.Configuration.ConfigurationManager.ConnectionStrings["WebAppConnString"].ToString();
            conn = new MySql.Data.MySqlClient.MySqlConnection(connString);
            conn.Open();
            query = "";
            query = "SELECT * from adm_users_table where id = " + id; //where id = " + id;
            cmd = new MySql.Data.MySqlClient.MySqlCommand(query, conn);

            reader = cmd.ExecuteReader();
            name = "";
            while (reader.HasRows && reader.Read())
            {
                name = reader.GetString(reader.GetOrdinal("name"));
            }
            if (reader.HasRows)
            {
                //username.Text = Session["uname"];
                Session["uname"] = name;
                Response.BufferOutput = true;
                username.Text = name;
            }
            else
            {
                //username.Text = "nada";
            }
            reader.Close();
            conn.Close();
        }

        protected void logout()
        {

        }
    }
}