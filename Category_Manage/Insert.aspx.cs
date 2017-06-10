using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppAdmin.Category_Manage
{
    public partial class Insert : System.Web.UI.Page
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

        protected Boolean validateCategoryDuplicate(object sender, EventArgs e)
        {
            String connString = System.Configuration.ConfigurationManager.ConnectionStrings["WebAppConnString"].ToString();
            conn = new MySql.Data.MySqlClient.MySqlConnection(connString);
            conn.Open();
            query = "";
            query = "SELECT category_name FROM category_restaurant WHERE category_name = '" + name.Text + "'";
            cmd = new MySql.Data.MySqlClient.MySqlCommand(query, conn);

            reader = cmd.ExecuteReader();

            if (!reader.HasRows)
            {
                return true;
            }
            else
            {
                validation.Text = "Esta categoria ya existe, elige otra";
            }

            reader.Close();
            conn.Close();

            return false;
        }


        protected void Insert_Category(object sender, EventArgs e)
        {
            if (name.Text == "")
            {
                validation.Text = "Hay algun campo Bacio";
            }
            else
            {
                if (validateCategoryDuplicate(sender, e))
                {
                    String connString = System.Configuration.ConfigurationManager.ConnectionStrings["WebAppConnString"].ToString();
                    conn = new MySql.Data.MySqlClient.MySqlConnection(connString);

                    conn.Open();
                    query = "";
                    query = "INSERT INTO category_restaurant (category_name) values('" + name.Text + "')";
                    cmd = new MySql.Data.MySqlClient.MySqlCommand(query, conn);

                    reader = cmd.ExecuteReader();

                    reader.Close();
                    conn.Close();

                    Response.Redirect("Manage.aspx", false);
                }
            }
        }

    }
}