using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppAdmin
{
    public partial class login : System.Web.UI.Page
    {
        MySql.Data.MySqlClient.MySqlConnection conn;
        MySql.Data.MySqlClient.MySqlCommand cmd;
        MySql.Data.MySqlClient.MySqlDataReader reader;
        String query;
        String token;
        String id;

        protected void Page_Load(object sender, EventArgs e)
        {
            String token = (String)(Session["userToken"]);
            if (token != null)
            {
                Response.Redirect("Home.aspx", false);
            }
        }

        protected void LoginUser(object sender, EventArgs e)
        {
            if (name.Text == "" || password.Text == "")
            {
                validation.Text = "Hay algun campo bacio";
            }
            else
            {
                String connString = System.Configuration.ConfigurationManager.ConnectionStrings["WebAppConnString"].ToString();
                conn = new MySql.Data.MySqlClient.MySqlConnection(connString);
                conn.Open();
                query = "";
                query = "SELECT * from adm_users_table where name='" + name.Text + "' and password='" + password.Text + "'";
                cmd = new MySql.Data.MySqlClient.MySqlCommand(query, conn);

                reader = cmd.ExecuteReader();
                token = "";
                id = "";
                while (reader.HasRows && reader.Read())
                {
                    token = reader.GetString(reader.GetOrdinal("name")) + reader.GetString(reader.GetOrdinal("password")) +
                        reader.GetString(reader.GetOrdinal("id"));
                    id = reader.GetString(reader.GetOrdinal("id"));
                }
                if (reader.HasRows)
                {
                    Session["userToken"] = token;
                    Session["userid"] = id;
                    Response.BufferOutput = true;
                    Response.Redirect("../Home.aspx", false);

                }
                else
                {
                    validation.Text = "Nombre o clave incorrecto";
                    //password.Text = "";
                    //name.Text = "";
                }
                reader.Close();
                conn.Close();
            }       

        }
    }
}