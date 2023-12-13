using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_cab_rental_system
{
    public partial class Cars : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }
        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if(e.CommandName == "Viewdetails")
            {
                Response.Redirect("Details.aspx?Cid=" + e.CommandArgument.ToString());
            }
            else if (e.CommandName == "Book")
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