using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Web.UI.WebControls;

public partial class admin_admin : System.Web.UI.MasterPage
{
    DataCon dc = new DataCon();
    DateTime current_time = TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.Local, TimeZoneInfo.FindSystemTimeZoneById("India Standard Time"));
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToString(Session["aid"]) == "")
        {
            Session["msg"] = "Please Log In First";
            Response.Redirect("~/Log_In.aspx");
        }
        else
        {
            string zk = "select DISTINCT order_id,date,time,del_city,del_area from fast_food_orders where date='" + current_time.ToLongDateString() + "' and time<='" + current_time.ToLongTimeString() + "' and read_order = 0 and delivered = 0 and cancelled = 0";
            //string zk = "select DISTINCT order_id,date,time,del_city,del_area from fast_food_orders where date='" + current_time.ToLongDateString() + "' and time<='" + current_time.ToLongTimeString() + "'";
            DataSet ds = new DataSet();
            ds = dc.getdata(zk);
            if(ds.Tables[0].Rows.Count!=0)
            {
                no_of_order_lbl.Text = ds.Tables[0].Rows.Count.ToString();
            }
            else
            {
                no_of_order_lbl.Text = "0";
            }

            string jk = "select * from SpecialTiffinOrder where BookDate='" + current_time.ToLongDateString() + "' and BookTime<='" + current_time.ToLongTimeString() + "' and IsRead = 0 and IsDelivered = 0 and IsCancelled = 0";
            DataSet dsjk = dc.getdata(jk);
            if(dsjk.Tables[0].Rows.Count==0)
            {
                SPTNoOfOdr.Text = "0";
            }
            else
            {
                SPTNoOfOdr.Text = dsjk.Tables[0].Rows.Count.ToString();
            }
        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/admin/Add_Remove_city.aspx");
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/admin/Simple_tiffin_add.aspx");
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/admin/Simple_tiffin_list.aspx");
    }
    protected void LinkButton5_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/admin/Tiffin_with_sweet_add.aspx");
    }
    protected void LinkButton6_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/admin/Tiffin_with_sweet_list.aspx");
    }
    protected void LinkButton8_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/admin/View_simple_tiffin_order.aspx");
    }
    protected void LinkButton9_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/admin/View_tiffin_with_sweet_order.aspx");
    }
    protected void LinkButton10_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/admin/View_providers.aspx");
    }
    protected void LinkButton12_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/admin/View_users.aspx");
    }
    protected void LinkButton13_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/admin/Registration_of_providers.aspx");
    }
    protected void LinkButton11_Click(object sender, EventArgs e)
    {
        Session["aid"] = "";
        Response.Redirect("~/Log_in.aspx");
    }
    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/admin/Change_password.aspx");
    }
    protected void LinkButton15_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/admin/Add_monthly_tiffin.aspx");
    }
    protected void LinkButton16_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/admin/Monthly_tiffin_list.aspx");
    }
    protected void LinkButton7_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/admin/Add_remove_area.aspx");
    }
    protected void LinkButton14_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/admin/Orders_time.aspx");
    }
    protected void Visit_site_lbtn_Click(object sender, EventArgs e)
    {
        Session["aid"] = "";
        Response.Redirect("~/user/Home.aspx");
    }
    protected void LinkButton17_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/admin/View_monthly_order.aspx");
    }
    protected void LinkButton9_Click1(object sender, EventArgs e)
    {
        Response.Redirect("~/admin/View_trial_tiffin_order.aspx");
    }
}
