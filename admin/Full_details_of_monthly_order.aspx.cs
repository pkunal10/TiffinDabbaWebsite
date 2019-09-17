using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_Full_details_of_monthly_order : System.Web.UI.Page
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
                DataSet ds = new DataSet();
                string jk = "select * from monthly_order where order_id='" + Convert.ToString(Session["monthly_order_id"]) + "'";
                ds = dc.getdata(jk);
                Caption_lbl.Text = "Full Details Of Monthly Base Order Id:- " + ds.Tables[0].Rows[0][0].ToString();
                Order_id_lbl.Text = ds.Tables[0].Rows[0][0].ToString();
                Book_for_lbl.Text = ds.Tables[0].Rows[0][1].ToString();
                Tiffin_id_lbl.Text = ds.Tables[0].Rows[0][2].ToString();
                Provider_id_lb.Text = ds.Tables[0].Rows[0][3].ToString();
                User_id_lb.Text = ds.Tables[0].Rows[0][4].ToString();
                Uname_lbl.Text = ds.Tables[0].Rows[0][5].ToString();
                Ueid_lbl.Text = ds.Tables[0].Rows[0][6].ToString();
                Mobile_no_lbl.Text = ds.Tables[0].Rows[0][7].ToString();
                Delivery_area_lbl.Text = ds.Tables[0].Rows[0][8].ToString();
                Delivery_address_lbl.Text = ds.Tables[0].Rows[0][9].ToString();
                Booking_date_lbl.Text = ds.Tables[0].Rows[0][10].ToString();
                No_of_days_lbl.Text = ds.Tables[0].Rows[0][11].ToString();
                Start_date_lbl.Text = ds.Tables[0].Rows[0][12].ToString();
                Finish_date_lbl.Text = ds.Tables[0].Rows[0][13].ToString();
                No_of_roti_lbl.Text = ds.Tables[0].Rows[0][14].ToString();
                Price_lbl.Text = ds.Tables[0].Rows[0][15].ToString();
            }
        }
    }
    protected void Provider_id_lb_Click(object sender, EventArgs e)
    {
        Session["pid"] = Provider_id_lb.Text;
        Response.Redirect("~/admin/Full_details_of_provider.aspx");
    }
    protected void User_id_lb_Click(object sender, EventArgs e)
    {
        Session["uid"] = User_id_lb.Text;
        Response.Redirect("~/admin/Full_details_of_user.aspx");
    }
    protected void Delete_order_btn_Click(object sender, EventArgs e)
    {
        string kj = "delete from monthly_order where order_id='" + Order_id_lbl.Text + "'";
        dc.setdata(kj);
        ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('This Order Is Deleted');window.location='View_monthly_order.aspx';", true);
    }
}