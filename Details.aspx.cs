using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace Online_cab_rental_system
{
    public partial class Details : System.Web.UI.Page
    {
        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbConnection"].ToString());
        SqlCommand cmd;
        DataSet ds;
        string id = "";
        SqlDataAdapter da;
        protected void Page_Load(object sender, EventArgs e)
        {
            id = Request.QueryString["Cid"];
            if (!(Page.IsPostBack))
            {
                Databind();
            }
           
            Response.Write(id);
        }

        public void Databind()
        {
            cn.Open();
            cmd = new SqlCommand("Proc_Cabs", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@mode", SqlDbType.VarChar, 20));
            cmd.Parameters.Add("@Cid",id);
            cmd.Parameters["@mode"].Value = "Details";
            cmd.ExecuteNonQuery();
            ds = new DataSet();
            da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            DataList1.DataSource = ds;
            DataList1.DataBind();
            cn.Close();
   
        }

       

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {

            if (e.CommandName == "Book")
            {
                string commandArg = e.CommandArgument.ToString();
                string[] args = commandArg.Split(',');

                string cabno = args[0];
                string driverNo = args[1];

                Response.Redirect("Book_now.aspx?Cabno=" + cabno + "&DriverNo=" + driverNo);
            }
        }
    }
}