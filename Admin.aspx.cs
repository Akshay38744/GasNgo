using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Configuration;



namespace Online_cab_rental_system
{
    public partial class Admin : System.Web.UI.Page
    {
        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbConnection"].ToString());
        SqlCommand cmd;
        DataSet ds;
        SqlDataAdapter da;
        int cnt = 0;

        protected void Page_Load(object sender, EventArgs e)
             
        {           
            //if(Session["Role"] == null && Session["Uname"] == null)
            //{
            //    Response.Redirect("Login.aspx");
            //}

            if (!(Page.IsPostBack))
            {
                
                grid();             
            }            
        }

        public void grid()
        {
            cn.Open();
            cmd = new SqlCommand("proc_cabs", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@mode", SqlDbType.VarChar, 20));
            cmd.Parameters["@mode"].Value = "Select";
            da = new SqlDataAdapter(cmd);
            ds = new DataSet();
            da.Fill(ds,"Cabs");
            cnt = Convert.ToInt32(cmd.ExecuteScalar());
            if(cnt > 0)
            {
                Grid_cabs.DataSource = ds.Tables["Cabs"].DefaultView;
                Grid_cabs.DataBind();
            }
            else
            {
                DataTable dt = new DataTable();
                dt.Columns.Add("CID");
                dt.Columns.Add("Cabno");
                dt.Columns.Add("Cdesc");
                dt.Columns.Add("Cimg");
                dt.Columns.Add("Average");
                dt.Columns.Add("model");
                dt.Columns.Add("Gtype");
                dt.Columns.Add("Navigation");
                dt.Columns.Add("Rate");
                dt.Columns.Add("Driverno");
                dt.Rows.Add(0, string.Empty, string.Empty, string.Empty);
                Grid_cabs.DataSource = dt;
                Grid_cabs.DataBind();
                Grid_cabs.Rows[0].Visible = false;

            }    
            cn.Close();
        }

        protected void Grid_cabs_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Insert")
            {
                cn.Open();
                cmd = new SqlCommand("proc_cabs", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@mode", SqlDbType.VarChar, 20));
                cmd.Parameters.Add("@Cabno", (Grid_cabs.FooterRow.FindControl("txtfootercabno") as TextBox).Text.Trim());
                cmd.Parameters.Add("@CDesc", (Grid_cabs.FooterRow.FindControl("txtfooterdesc") as TextBox).Text.Trim());

                FileUpload fuPhoto = Grid_cabs.FooterRow.FindControl("FileUpload2") as FileUpload;     
                fuPhoto.SaveAs(Server.MapPath("Images/" + fuPhoto.FileName));
                cmd.Parameters.Add("@Cimg", "Images/" + fuPhoto.FileName);

                cmd.Parameters.Add("@CAveg", (Grid_cabs.FooterRow.FindControl("txtfooteravg") as TextBox).Text.Trim());
                cmd.Parameters.Add("@CModel", (Grid_cabs.FooterRow.FindControl("txtfootermodel") as TextBox).Text.Trim());
                cmd.Parameters.Add("@CGtype", (Grid_cabs.FooterRow.FindControl("txtfootergear") as TextBox).Text.Trim());
                cmd.Parameters.Add("@Cnav", (Grid_cabs.FooterRow.FindControl("txtfooternav") as TextBox).Text.Trim());
                cmd.Parameters.Add("@Rate", (Grid_cabs.FooterRow.FindControl("txtfooterrate") as TextBox).Text.Trim());
                cmd.Parameters.Add("@driverno", (Grid_cabs.FooterRow.FindControl("txtfooterdriverno") as TextBox).Text.Trim());
                cmd.Parameters["@mode"].Value = "Insert";
                cmd.ExecuteNonQuery();
                cn.Close();
                grid();
            }
        }

        protected void Grid_cabs_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            
            cn.Open();
            cmd = new SqlCommand("Proc_Cabs", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@mode", SqlDbType.VarChar, 20));
            cmd.Parameters.Add("@Cabno", (Grid_cabs.Rows[e.RowIndex].FindControl("txtcabno") as TextBox).Text.Trim());
            cmd.Parameters.Add("@CDesc", (Grid_cabs.Rows[e.RowIndex].FindControl("txtdesc") as TextBox).Text.Trim());

            FileUpload FileUpload1 = (FileUpload)Grid_cabs.Rows[e.RowIndex].FindControl("FileUpload1");
            string path = "/Images/";
            if (FileUpload1.HasFile)
            {
                path += FileUpload1.FileName;
                //save image in folder
                FileUpload1.SaveAs(MapPath(path));            
            }
            else
            {
                // use previous user image if new image is not changed
                Image img = (Image)Grid_cabs.Rows[e.RowIndex].FindControl("Image1");
                path = img.ImageUrl;
            }

            cmd.Parameters.Add("@Cimg", path);
            cmd.Parameters.Add("@CAveg", (Grid_cabs.Rows[e.RowIndex].FindControl("txtaveg") as TextBox).Text.Trim());
            cmd.Parameters.Add("@CModel", (Grid_cabs.Rows[e.RowIndex].FindControl("txtmodel") as TextBox).Text.Trim());
            cmd.Parameters.Add("@CGtype", (Grid_cabs.Rows[e.RowIndex].FindControl("txtgtype") as TextBox).Text.Trim());
            cmd.Parameters.Add("@Cnav", (Grid_cabs.Rows[e.RowIndex].FindControl("txtnav") as TextBox).Text.Trim());
            cmd.Parameters.Add("@Rate", (Grid_cabs.Rows[e.RowIndex].FindControl("txtrate") as TextBox).Text.Trim());
            cmd.Parameters.Add("@driverno", (Grid_cabs.Rows[e.RowIndex].FindControl("txtdriverno") as TextBox).Text.Trim());
            cmd.Parameters.Add("@Cid", Convert.ToInt32(Grid_cabs.DataKeys[e.RowIndex].Value.ToString()));
            cmd.Parameters["@mode"].Value = "Update";
            cmd.ExecuteNonQuery();
            cn.Close();
            Grid_cabs.EditIndex = -1;
            grid();
        }

        protected void Grid_cabs_RowEditing(object sender, GridViewEditEventArgs e)
        {
            Grid_cabs.EditIndex = e.NewEditIndex;
            grid();
        }

        protected void Grid_cabs_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            Grid_cabs.EditIndex = -1;
            grid();
        }

        protected void Grid_cabs_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            cn.Open();
            cmd = new SqlCommand("proc_cabs", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@mode", SqlDbType.VarChar, 20));
            cmd.Parameters.Add("@Cid", Convert.ToInt32(Grid_cabs.DataKeys[e.RowIndex].Value.ToString()));
            cmd.Parameters["@mode"].Value = "Delete";
            cmd.ExecuteNonQuery();
            cn.Close();
            grid();
        }
    }
}




       
