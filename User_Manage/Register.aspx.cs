using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppAdmin
{
    public partial class Register : System.Web.UI.Page
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
                Response.Redirect("Login.aspx", false);
            }
        }

        protected Boolean validateUserDuplicate(object sender, EventArgs e)
        {
            String connString = System.Configuration.ConfigurationManager.ConnectionStrings["WebAppConnString"].ToString();
            conn = new MySql.Data.MySqlClient.MySqlConnection(connString);
            conn.Open();
            query = "";
            query = "SELECT name FROM adm_users_table WHERE name = '" + name.Text + "'";
            cmd = new MySql.Data.MySqlClient.MySqlCommand(query, conn);

            reader = cmd.ExecuteReader();

            if (!reader.HasRows)
            {
                return true;
            }
            else
            {
                validation.Text = "Este nombre ya existe, elige otro";
            }

            reader.Close();
            conn.Close();

            return false;
        }

        protected void RegisterUser(object sender, EventArgs e)
        {
            if (validateUserDuplicate(sender, e))
            {
                String connString = System.Configuration.ConfigurationManager.ConnectionStrings["WebAppConnString"].ToString();
                conn = new MySql.Data.MySqlClient.MySqlConnection(connString);
                conn.Open();
                query = "";
                query = "INSERT INTO adm_users_table (name, password) values('" + name.Text + "','" + password.Text + "')";
                cmd = new MySql.Data.MySqlClient.MySqlCommand(query, conn);

                reader = cmd.ExecuteReader();

                reader.Close();
                conn.Close();

                Response.Redirect("../Home.aspx", false);
            }
        }
    }
}