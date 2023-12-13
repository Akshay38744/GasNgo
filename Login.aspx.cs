using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Web.Security;


namespace Online_cab_rental_system
{
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbConnection"].ToString());
        SqlCommand cmd;
        SqlDataAdapter da;
        protected void Page_Load(object sender, EventArgs e)
        
        {
            Session["Uname"] = null;
            Session["pwd"] = null;
            Session["Role"] = null;
            Session["Umobile"] = null;

        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            cn.Open();
            cmd = new SqlCommand("pro_login", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@mode", SqlDbType.VarChar, 20));
            cmd.Parameters.Add("@username", txtuser.Text);
            cmd.Parameters.Add("@password", txtpwd.Text);
            cmd.Parameters["@mode"].Value = "login";
            SqlDataReader dtr;
            dtr = cmd.ExecuteReader();
            while (dtr.Read())
            {
                if (dtr[1].ToString().Equals(txtuser.Text) && dtr[4].ToString().Equals(txtpwd.Text))
                {
                    Session["uname"] = txtuser.Text;
                    Session["pwd"] = txtpwd.Text;
                    Session["Role"] = dtr[7].ToString();
                    Session["Umobile"] = dtr[2].ToString();
                    FormsAuthentication.RedirectFromLoginPage(txtuser.Text, false);
                    if (dtr[7].ToString() == "Admin")
                    {
                        Response.Redirect("Admin.aspx");
                    }
                    else
                    {
                        Response.Redirect("Cars.aspx");
                    }
                    Response.Redirect("Cars.aspx");
                }
                else
                {
                    lblerror.Text = "Invalid Username & Password";
                }
            }
        }
    }
}