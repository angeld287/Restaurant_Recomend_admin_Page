using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

using System.Data;
using System.Configuration;

namespace WebAppAdmin.Restaurant_Manage
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

            if (!this.IsPostBack)
            {
                string constr = ConfigurationManager.ConnectionStrings["WebAppConnString"].ConnectionString;
                using (MySqlConnection con = new MySqlConnection(constr))
                {
                    using (MySqlCommand cmd = new MySqlCommand("SELECT category_id, category_name FROM category_restaurant"))
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = con;
                        con.Open();
                        Category_data.DataSource = cmd.ExecuteReader();
                        Category_data.DataTextField = "category_name";
                        Category_data.DataValueField = "category_id";
                        Category_data.DataBind();
                        con.Close();
                    }
                }
                Category_data.Items.Insert(0, new ListItem("--Select Category--", "0"));
            }

        }

        protected void Insert_Restaurant(object sender, EventArgs e)
        {
            
                String connString = System.Configuration.ConfigurationManager.ConnectionStrings["WebAppConnString"].ToString();
                conn = new MySql.Data.MySqlClient.MySqlConnection(connString);

                conn.Open();
                query = "";
                query = "INSERT INTO restaurant (name, latitude, length, rating, category, phone_number, mapzoom, address) " +
                    "values('" + name.Text + "','" + latitude.Text + "', '" + length.Text + "','0','" + Category_data.Text + 
                    "','" + phone_number.Text + "','" + mapzoom.Text + "','" + address.Text + "')";
                cmd = new MySql.Data.MySqlClient.MySqlCommand(query, conn);

                reader = cmd.ExecuteReader();

                reader.Close();
                conn.Close();

                Response.Redirect("view.aspx", false);
            
        }

    }
}