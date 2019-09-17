using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_Full_details_of_ff_order : System.Web.UI.Page
{
    DataCon dc = new DataCon();
    int subtotal = 0, charge_limit = 0, del_charge = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        #region Delivery Charges Get

        string jkp = "select * from delivery_charges";
        DataSet dsCharge = new DataSet();
        dsCharge = dc.getdata(jkp);
        charge_limit = Convert.ToInt32(dsCharge.Tables[0].Rows[0][1].ToString());
        del_charge = Convert.ToInt32(dsCharge.Tables[0].Rows[0][2].ToString());

        #endregion Delivery Charges Get
        if (Convert.ToString(Session["aid"]) == "")
        {
            Session["msg"] = "Please Log In First";
            Response.Redirect("~/Log_In.aspx");
        }
        else
        {
            string o_id = Request.QueryString["o_id"].ToString();
            fetch_order_details(o_id);
        }
    }

    private void fetch_order_details(string o_id)
    {

        string jkp = "SELECT DISTINCT provider_id FROM fast_food_orders where order_id='" + o_id + "'";
        DataSet ds10 = new DataSet();
        ds10 = dc.getdata(jkp);

        string flag = "";
        if (ds10.Tables[0].Rows.Count > 1)
        {
            flag = "MoreId";
        }

        //string zk = "select DISTINCT provider_id,user_id,del_address,del_city,del_area,date,time,read_order,delivered,cancelled,mobile_no from fast_food_orders where order_id='" + o_id + "'";
        string zk = "select DISTINCT provider_id,user_id,del_address,del_city,del_area,date,time,read_order,delivered,cancelled,mobile_no from fast_food_orders where order_id='" + o_id + "'";
        DataSet ds1 = new DataSet();
        ds1 = dc.getdata(zk);
        string provider_id = flag == "" ? ds1.Tables[0].Rows[0][0].ToString() : "";
        string user_id = ds1.Tables[0].Rows[0][1].ToString();
        string del_address = ds1.Tables[0].Rows[0][2].ToString();
        string del_city = ds1.Tables[0].Rows[0][3].ToString();
        string del_area = ds1.Tables[0].Rows[0][4].ToString();
        string date = ds1.Tables[0].Rows[0][5].ToString();
        string time = ds1.Tables[0].Rows[0][6].ToString();
        bool is_read = Convert.ToBoolean(ds1.Tables[0].Rows[0][7].ToString());
        bool is_delivered = Convert.ToBoolean(ds1.Tables[0].Rows[0][8].ToString());
        bool is_cancelled = Convert.ToBoolean(ds1.Tables[0].Rows[0][9].ToString());
        string mobile = ds1.Tables[0].Rows[0][10].ToString();

        get_cart_details(o_id);
        get_other_details(provider_id, user_id, del_address, del_city, del_area, date, time, is_read, is_delivered, is_cancelled, mobile);
        //get_other_details(user_id, del_address, del_city, del_area, date, time, is_read, is_delivered, is_cancelled, mobile);
        cart_calculation();
    }

    private void cart_calculation()
    {
        del_charge_lbl.Text = "";
        fin_total_lbl.Text = "";
        subtotal = 0;
        fin_total_bill_2_lbl.Text = "";
        for (int j = 0; j < cart_rptr.Items.Count; j++)
        {
            Label tot_lbl = cart_rptr.Items[j].FindControl("total_lbl") as Label;
            subtotal += Convert.ToInt32(tot_lbl.Text.ToString());
        }
        grand_total_lbl.Text = subtotal.ToString();
        if (Convert.ToInt32(grand_total_lbl.Text.ToString()) < charge_limit && Convert.ToInt32(grand_total_lbl.Text.ToString()) > 0)
        {
            fin_total_lbl.Text = Convert.ToString(Convert.ToInt32(grand_total_lbl.Text.ToString()) + del_charge);
            fin_total_bill_2_lbl.Text = fin_total_lbl.Text.ToString();
            del_charge_lbl.Text = del_charge.ToString();
        }
        else
        {
            del_charge_lbl.Text = "0";
            fin_total_lbl.Text = grand_total_lbl.Text.ToString();
            fin_total_bill_2_lbl.Text = fin_total_lbl.Text.ToString();
        }
    }

    private void get_cart_details(string o_id)
    {
        string jk = "select fast_food_orders.order_id,fast_food_orders.product_id,fast_food_orders.provider_id,fast_food_orders.quantity,fast_food_orders.unit_price,fast_food_orders.total_price,fast_food_products.product_name,fast_food_products.image from fast_food_orders INNER JOIN fast_food_products ON fast_food_orders.product_id=fast_food_products.product_id where fast_food_orders.order_id='" + o_id + "'";
        DataSet ds2 = new DataSet();
        ds2 = dc.getdata(jk);
        cart_rptr.DataSource = ds2;
        cart_rptr.DataBind();
    }

    private void get_other_details(string provider_id, string user_id, string del_address, string del_city, string del_area, string date, string time, bool is_read, bool is_delivered, bool is_cancelled, string mobile)
    // private void get_other_details(string user_id, string del_address, string del_city, string del_area, string date, string time, bool is_read, bool is_delivered, bool is_cancelled, string mobile)
    {
        string z = "select * from user_accounts where id='" + user_id + "'";
        DataSet ds3 = new DataSet();
        ds3 = dc.getdata(z);

        providerId_lb.Text = provider_id;
        user_id_lb.Text = user_id;
        name_lbl.Text = ds3.Tables[0].Rows[0][1].ToString();
        mobile_lbl.Text = mobile;
        email_lbl.Text = user_id;
        address_lbl.Text = del_address;
        del_city_lbl.Text = del_city;
        del_area_lbl.Text = del_area;
        date_lbl.Text = date;
        time_lbl.Text = time;
        read_btn.Visible = !is_read;
        delivered_btn.Visible = !is_delivered;
        cancelled_btn.Visible = !is_cancelled;
        order_id_lbl.Text = Request.QueryString["o_id"].ToString();
        is_read_lbl.Text = is_read == true ? "Yes" : "No";
        is_delivered_lbl.Text = is_delivered == true ? "Yes" : "No";
        is_cancelled_lbl.Text = is_cancelled == true ? "Yes" : "No";
    }
    protected void providerId_lb_Click(object sender, EventArgs e)
    {
        string j = providerId_lb.Text.ToString();
        Session["pid"] = j;
        Response.Redirect("~/admin/Full_details_of_provider.aspx");
    }
    protected void user_id_lb_Click(object sender, EventArgs e)
    {
        string j = user_id_lb.Text.ToString();
        Session["uid"] = j;
        Response.Redirect("~/admin/Full_details_of_user.aspx");
    }
    protected void read_btn_Click(object sender, EventArgs e)
    {
        string g = "update fast_food_orders set read_order=1 where order_id='" + order_id_lbl.Text.ToString() + "'";
        dc.setdata(g);
        fetch_order_details(order_id_lbl.Text.ToString());
    }
    protected void delivered_btn_Click(object sender, EventArgs e)
    {
        string g = "update fast_food_orders set delivered=1 where order_id='" + order_id_lbl.Text.ToString() + "'";
        dc.setdata(g);
        fetch_order_details(order_id_lbl.Text.ToString());
    }
    protected void cancelled_btn_Click(object sender, EventArgs e)
    {
        string g = "update fast_food_orders set cancelled=1 where order_id='" + order_id_lbl.Text.ToString() + "'";
        dc.setdata(g);
        fetch_order_details(order_id_lbl.Text.ToString());
    }
    protected void ProviderIdLb_Command(object sender, CommandEventArgs e)
    {
        string j = e.CommandArgument.ToString();
        Session["pid"] = j;
        Response.Redirect("~/admin/Full_details_of_provider.aspx");
    }
}