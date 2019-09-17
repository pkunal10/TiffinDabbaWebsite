using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class provider_provider_highted_master : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToString(Session["pid"]) == "")
        {
            Session["msg"] = "please log in first";
            Response.Redirect("~/log_in.aspx");
        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Session["pid"] = "";
        Response.Redirect("~/Log_in.aspx");
    }
}
