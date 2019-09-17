using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_Orders_time : System.Web.UI.Page
{
    DataCon dc = new DataCon();
    protected void Page_Load(object sender, EventArgs e)
    {

        if (IsPostBack != true)
        {
            Panel2.Visible = false;
            ff_order_time_pnl.Visible = false;

            DataSet ds = new DataSet();
            DataSet dsFFOrder = new DataSet();

            string jkp = "select * from ff_order_timmings where time_id=1";
            dsFFOrder = dc.getdata(jkp);
            ff_start_time_tb.Text = dsFFOrder.Tables[0].Rows[0][1].ToString();
            ff_end_time_tb.Text = dsFFOrder.Tables[0].Rows[0][2].ToString();

            string s = "select * from order_timmings";
            ds = dc.getdata(s);
            Lunch_Time_tb.Text = ds.Tables[0].Rows[0][1].ToString();
            Dinner_Time_tb.Text = ds.Tables[0].Rows[1][1].ToString();
        }
    }
    protected void Security_Key_btn_Click(object sender, EventArgs e)
    {
        if (Security_Key_tb.Text == "102515209")
        {
            Panel1.Visible = false;
            Panel2.Visible = true;
            ff_order_time_pnl.Visible = true;
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Invalid Security Key');", true);
            Security_Key_tb.Text = "";
            Security_Key_tb.Focus();
        }
    }
    protected void Order_Time_btn_Click(object sender, EventArgs e)
    {
        string j = "update order_timmings set time='" + Lunch_Time_tb.Text + "' where order_for='Lunch'";
        dc.setdata(j);
        string k = "update order_timmings set time='" + Dinner_Time_tb.Text + "' where order_for='Dinner'";
        dc.setdata(k);

        ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Tiffin Times are updated');", true);
        Panel2.Visible = false;
        ff_order_time_pnl.Visible = false;
        Panel1.Visible = true;

        //DataSet ds1 = new DataSet();
        //string l = "select * from order_timmings";
        //ds1 = dc.getdata(l);
        //Lunch_Time_tb.Text = ds1.Tables[0].Rows[0][1].ToString();
        //Dinner_Time_tb.Text = ds1.Tables[0].Rows[1][1].ToString();
    }
    protected void ff_order_time_btn_Click(object sender, EventArgs e)
    {
        string zkp = "update ff_order_timmings set start_time='" + ff_start_time_tb.Text + "', end_time='" + ff_end_time_tb.Text + "' where time_id=1";
        dc.setdata(zkp);        

        ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Fast Food Times are updated');", true);
        Panel2.Visible = false;
        ff_order_time_pnl.Visible = false;
        Panel1.Visible = true;
    }
}