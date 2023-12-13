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
    
    public partial class View_bookings : System.Web.UI.Page
    {
        
        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbConnection"].ToString());
        SqlCommand cmd;
        DataSet ds;
        SqlDataAdapter da;
        string Username = "";

        protected void Page_Load(object sender, EventArgs e)
        {
           if(Session["Uname"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            Username = Session["Uname"].ToString();
            
            if(!(Page.IsPostBack))
            {
                Grid_bookings();
            }
        }
        public void Grid_bookings()
        {
            cn.Open();
            cmd = new SqlCommand("proc_bookings", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@mode", SqlDbType.VarChar, 20));
            cmd.Parameters.Add("@Uname", Username);
            cmd.Parameters["@mode"].Value = "view_bookings";
            da = new SqlDataAdapter(cmd);
            ds = new DataSet();
            da.Fill(ds);       
            cmd.ExecuteNonQuery();
            gr_bookings.DataSource = ds;
            gr_bookings.DataBind();
            cn.Close();
        }

        protected void gr_bookings_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            cn.Open();
            cmd = new SqlCommand("proc_bookings", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@mode", SqlDbType.VarChar, 20));
            cmd.Parameters.Add("@Bid",(Convert.ToInt32(gr_bookings.DataKeys[e.RowIndex].Value.ToString())));
            cmd.Parameters["@mode"].Value = "Cancel_bookings";
            cmd.ExecuteNonQuery();
            cn.Close();
            Grid_bookings();
        }
    }
}