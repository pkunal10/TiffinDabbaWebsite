using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class user_Terms_and_conditions : System.Web.UI.Page
{
    DataCon dc = new DataCon();
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Convert.ToString(Session["uid"]) == "")
        //{
        //    Session["msg"] = "Please Log In First";
        //    Response.Redirect("~/Log_in.aspx");
        //}
        if (IsPostBack != true)
        {
            DataSet ds = new DataSet();
            string jk = "select time from order_timmings";
            ds = dc.getdata(jk);
            Lunch_time_lbl.Text = ds.Tables[0].Rows[0][0].ToString();
            Dinner_time_lbl.Text = ds.Tables[0].Rows[1][0].ToString();

            #region Fast Food Order Timmings Get

            DataSet ds10 = new DataSet();
            string ffot = "select * from ff_order_timmings";
            ds10 = dc.getdata(ffot);
            StartFFTimeLbl.Text = ds10.Tables[0].Rows[0][1].ToString();
            EndFFTimeLbl.Text = ds10.Tables[0].Rows[0][2].ToString();

            #endregion Fast Food Order Timmings Get

        }
    }
}