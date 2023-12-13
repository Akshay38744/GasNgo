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
    public partial class Book_now : System.Web.UI.Page
    {
        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbConnection"].ToString());
        SqlCommand cmd;
        DataSet ds;
        SqlDataAdapter da;
        String Cabno;
        string Username;
        String Usermobile;
        String Driverno;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Uname"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            Username = Session["Uname"].ToString();
            Driverno = Request.QueryString["Driverno"];
            Cabno = Request.QueryString["Cabno"];

            if (!(Page.IsPostBack))
            {
                bind_Ploc();

                bind_Dloc();
            }
        }
        public void bind_Ploc()
        {
            cn.Open();
            cmd = new SqlCommand("proc_loc", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@mode", SqlDbType.VarChar,20));       
            cmd.Parameters["@mode"].Value = "Ploc";
            ds = new DataSet();
            da = new SqlDataAdapter(cmd);
            da.Fill(ds,"Plocation");
            ddlploc.DataValueField = "Ploc";
            ddlploc.DataSource = ds.Tables["Plocation"].DefaultView;
            ddlploc.DataBind();
            ddlploc.Items.Insert(0, new ListItem("--- Select Pickup location ---","0"));
            cn.Close();
        }
        public void bind_Dloc()
        {
            cn.Open();
            cmd = new SqlCommand("proc_loc", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@mode", SqlDbType.VarChar, 20));
            cmd.Parameters["@mode"].Value = "Dloc";
            ds = new DataSet();
            da = new SqlDataAdapter(cmd);
            da.Fill(ds, "Dlocation");
            ddldloc.DataValueField = "Drop_location";
            ddldloc.DataSource = ds.Tables["Dlocation"].DefaultView;
            ddldloc.DataBind();
            ddldloc.Items.Insert(0, new ListItem("--- select Drop location ---", "0"));
            cn.Close();
        }
        public bool check_loc()
        {
            if(ddlploc.SelectedIndex == ddldloc.SelectedIndex)
            {
                Response.Write("Invalid location");
                return false;
            }
            else
            {
                return true;   
            }
        }
        public bool check_booking()
        {
            cn.Open();
            cmd = new SqlCommand("proc_bookings", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@mode", SqlDbType.VarChar, 20));
            cmd.Parameters.Add("@Cabno", Cabno);
            cmd.Parameters["@mode"].Value = "Check_bookings";
            int cnt = 0;
            cnt = Convert.ToInt32(cmd.ExecuteScalar());
            cn.Close();
            if (cnt > 0)
            {
                return false;
            }
            else
            {
                return true;
            }
           
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            if(check_loc() == true && check_booking() == true)
            {
                cn.Open();
                cmd = new SqlCommand("proc_bookings",cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@mode", SqlDbType.VarChar, 20));
                cmd.Parameters.Add("@Uname", Username);
                cmd.Parameters.Add("@Umobile",Usermobile);
                cmd.Parameters.Add("@Cabno",Cabno);
                cmd.Parameters.Add("@Driverno", Driverno);
                cmd.Parameters.Add("@Ploc",ddlploc.SelectedValue);
                cmd.Parameters.Add("@Dloc",ddldloc.SelectedValue);
                cmd.Parameters.Add("@Pdate",Pdate.Value);
                cmd.Parameters.Add("@Ptime",ptime.Value);
                cmd.Parameters.Add("@Sreq",Sreq.Value);
                cmd.Parameters["@mode"].Value = "Book";
                cmd.ExecuteNonQuery();
                cn.Close();
                Response.Write("Inserted Sucessfully");
                Session["Cabnumber"] = Cabno;
                Session["Drivernumber"] = Driverno;
                Response.Redirect("~/Acknowledgement.aspx");
            }
            else
            {
                Response.Write("<script>alert('Cab is Already Booked by Someone');</script>");
                Response.Write("<script>alert('Please Book Another Cab');</script>");
               // Response.Redirect("Cars.aspx");
            }


        }
    }
}


