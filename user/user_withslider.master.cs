using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class user_user_withslider : System.Web.UI.MasterPage
{
    DataCon dc = new DataCon();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToString(Session["uid"]) == "")
        {
            LinkButton1.Visible = false;
          //  myprofile.Visible = false;
            order_history_lb.Visible = false;
            simple_tiffin_order.Visible = false;
            tiffin_with_sweet_order.Visible = false;
            SpecialTiffinOdr.Visible = false;
            SpecialTiffinOdr2.Visible = false;
            simple_tiffin_order_his_lb_2.Visible = false;
            tiffin_with_sweet_order_his_lb_2.Visible = false;
            my_profile_lb_2.Visible = false;

            if (Session["productId"] != null)
            {
                List<int> zkp = ((List<int>)Session["productId"]);
                no_of_item.Text = zkp.Count().ToString();
            }
            else
            {
                no_of_item.Text = "0";
            }

            //DataSet ds = new DataSet();
            //string zk = "select * from fast_food_categories";
            //ds = dc.getdata(zk);

            //DataTable dt = ds.Tables[0];
            //DataRow row = dt.NewRow();
            //row[0] = "102515209";
            //row[1] = "All Categories";
            //ds.Tables[0].Rows.InsertAt(row, 0);
            //Fast_food_category_rptr.DataSource = ds;
            //Fast_food_category_rptr.DataBind();
        }
        else
        {
            LinkButton2.Visible = false;
            //DataSet ds = new DataSet();
            //string zk = "select * from fast_food_categories";
            //ds = dc.getdata(zk);

            //DataTable dt = ds.Tables[0];
            //DataRow row = dt.NewRow();
            //row[0] = "102515209";
            //row[1] = "All Categories";
            //ds.Tables[0].Rows.InsertAt(row, 0);
            //Fast_food_category_rptr.DataSource = ds;
            //Fast_food_category_rptr.DataBind();

            if (Session["productId"] != null)
            {
                List<int> zkp = ((List<int>)Session["productId"]);
                no_of_item.Text = zkp.Count().ToString();
            }
            else
            {
                no_of_item.Text = "0";
            }
        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Session["tiffin_type"] = "";
        Session["twsid"] = "";
        Session["stid"] = "";
        Session["uid"] = "";
        Response.Redirect("~/user/Home.aspx");
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Session["tiffin_type"] = "";
        Session["twsid"] = "";
        Session["stid"] = "";
        Response.Redirect("~/Log_in.aspx");
    }
    public void zk(object sender,CommandEventArgs e)
    {
        string id = e.CommandName.ToString();

        Response.Redirect("fast_food_products.aspx?cat_id=" + id);
    }
    protected void login_lb_2_Click(object sender, EventArgs e)
    {
        Session["tiffin_type"] = "";
        Session["twsid"] = "";
        Session["stid"] = "";
        Response.Redirect("~/Log_in.aspx");
    }
    protected void myprofile_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/user/My_profile.aspx");
    }
    protected void simple_tiffin_order_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/user/View_simple_tiffin_order.aspx");
    }
    protected void tiffin_with_sweet_order_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/user/View_tiffin_with_sweet_order.aspx");
    }
    protected void my_profile_lb_2_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/user/My_profile.aspx");
    }
    protected void simple_tiffin_order_his_lb_2_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/user/View_simple_tiffin_order.aspx");
    }
    protected void tiffin_with_sweet_order_his_lb_2_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/user/View_tiffin_with_sweet_order.aspx");
    }
    protected void SpecialTiffinOdr_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/user/ViewSpecialTiffinOrder.aspx");
    }
}
