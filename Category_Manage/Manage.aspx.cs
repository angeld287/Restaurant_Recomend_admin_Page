using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppAdmin.Category_Manage
{
    public partial class Manage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String token = (String)(Session["userToken"]);
            if (token == null)
            {
                Response.Redirect("../User_Manage/Login.aspx", false);
            }
        }

        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            //if (e.Row.RowType == DataControlRowType.DataRow && gUsers.EditIndex != e.Row.RowIndex)
            //{
            //    //(e.Row.Cells[20].Controls[20] as LinkButton).Attributes["onclick"] = "return confirm('Do you want to delete this row?');";
            //}
        }
    }
}