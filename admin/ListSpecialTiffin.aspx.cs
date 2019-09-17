using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_ListSpecialTiffin : System.Web.UI.Page
{
    DataCon dc = new DataCon();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToString(Session["aid"]) == "")
        {
            Session["msg"] = "Please Log In First";
            Response.Redirect("~/Log_In.aspx");
        }
        else
        {
            if (IsPostBack != true)
            {
                BindData();
            }
        }

    }

    private void BindData()
    {
        string jk = "select * from SpecialTiffin";
        DataSet dsjk = new DataSet();
        dsjk = dc.getdata(jk);

        SpecialTiffinGv.DataSource = dsjk;
        SpecialTiffinGv.DataBind();
    }
    protected void ProviderIdLb_Command(object sender, CommandEventArgs e)
    {
        string id = e.CommandArgument.ToString();
        Session["pid"] = id;
        Response.Redirect("~/admin/Full_details_of_provider.aspx");
    }
    protected void DeleteLb_Command(object sender, CommandEventArgs e)
    {
        string id = e.CommandArgument.ToString();
        string jkp = "delete from SpecialTiffin where TiffinId='" + id + "'";
        dc.setdata(jkp);
        BindData();
    }
    protected void EditLb_Command(object sender, CommandEventArgs e)
    {
        string id = e.CommandArgument.ToString();
        Response.Redirect("~/admin/AddUpdateSpecialTiffin.aspx?TiffinId=" + id);
    }
}