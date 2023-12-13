using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Security.Cryptography;

namespace Online_cab_rental_system
{
    public partial class Register : System.Web.UI.Page
    {
        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbConnection"].ToString());
        SqlCommand cmd;
        DataSet ds;
        SqlDataAdapter da;
        string subdate = DateTime.Now.ToShortDateString();

        protected void Page_Load(object sender, EventArgs e)

        {
            //login.Visible = false;
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
                cn.Open();
                cmd = new SqlCommand("proc_register", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@mode", SqlDbType.VarChar, 20));
                cmd.Parameters.Add("@Username", txtusername.Text);
                cmd.Parameters.Add("@Mobile", txtmobile.Text);
                cmd.Parameters.Add("@Gender", rdagender.SelectedValue);
                cmd.Parameters.Add("@pwd", txtpassword.Text);
                cmd.Parameters.Add("@confpwd", txtconfpwd.Text);
                cmd.Parameters.Add("@subdate", subdate);
                cmd.Parameters["@mode"].Value = "Register";
                cmd.ExecuteNonQuery();
                cn.Close();     
        } 
    }
}