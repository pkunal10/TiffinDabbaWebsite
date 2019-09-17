using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_New_fast_food_order : System.Web.UI.Page
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
            if (ds.Tables[0].Rows.Count != 0)
            {
                new_ff_order_gv.DataSource = ds;
                new_ff_order_gv.DataBind();
            }
            else
            {
                new_ff_order_gv.DataSource = "";
                new_ff_order_gv.DataBind();
                no_order_lbl.Text = "No New Orders";
            }
        }
    }

    public void FullDetilsOfFFOrder(object sender, CommandEventArgs e)
    {
        string id = e.CommandName.ToString();
        Response.Redirect("~/admin/Full_details_of_ff_order.aspx?o_id=" + id);
    }
}