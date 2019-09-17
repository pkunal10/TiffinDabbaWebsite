using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_Full_details_of_provider : System.Web.UI.Page
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
            DataSet ds = new DataSet();
            string s = "select * from providers where pid='" + Session["pid"].ToString() + "'";
            ds = dc.getdata(s);

            Label1.Text = ds.Tables[0].Rows[0][0].ToString();
            Label2.Text = ds.Tables[0].Rows[0][1].ToString();
            Label3.Text = ds.Tables[0].Rows[0][2].ToString();
            Label4.Text = ds.Tables[0].Rows[0][3].ToString();
            Label5.Text = ds.Tables[0].Rows[0][4].ToString();
            Label6.Text = ds.Tables[0].Rows[0][5].ToString();
            Label7.Text = ds.Tables[0].Rows[0][7].ToString();
            
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string j = "delete from providers where pid='" + Label1.Text + "'";
        dc.setdata(j);
        string y = "delete from simple_tiffin where p_id='" + Label1.Text + "'";
        dc.setdata(y);
        string o = "delete from tiffin_with_sweet where p_id='" + Label1.Text + "'";
        dc.setdata(o);
        string t = "delete from simple_tiffin_daily_order where pid='" + Label1.Text + "'";
        dc.setdata(t);
        string i = "delete from tiffin_with_sweet_daily_order where pid='" + Label1.Text + "'";
        dc.setdata(i);
        ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('This provider is deleted from TIFFIN DABBA');window.location='View_providers.aspx';", true);
    }
}