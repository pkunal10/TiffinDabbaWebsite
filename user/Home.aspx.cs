using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class user_Home : System.Web.UI.Page
{
    DataCon dc = new DataCon();
    DataSet ds = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        string ot = "select * from order_timmings";
        ds = dc.getdata(ot);
        Lunch_time_lbl.Text = ds.Tables[0].Rows[0][1].ToString() + ".";
        Dinner_time_lbl.Text = ds.Tables[0].Rows[1][1].ToString() + ".";

        //#region Fast Food Order Timmings Get

        //DataSet ds10 = new DataSet();
        //string ffot = "select * from ff_order_timmings";
        //ds10 = dc.getdata(ffot);
        //StartFFTimeLbl.Text = ds10.Tables[0].Rows[0][1].ToString();
        //EndFFTimeLbl.Text = ds10.Tables[0].Rows[0][2].ToString();

        //#endregion Fast Food Order Timmings Get

        //if (Convert.ToString(Session["uid"]) == "")
        //{
        //    Session["msg"] = "Please Log In First";
        //    Response.Redirect("~/Log_in.aspx");
        //}
    }
}