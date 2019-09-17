using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class user_View_tiffin_with_sweet_order : System.Web.UI.Page
{
    DataCon dc = new DataCon();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToString(Session["uid"]) == "")
        {
            Session["msg"] = "Please Log In First";
            Response.Redirect("~/Log_in.aspx");
        }
        else
        {
            if (IsPostBack != true)
            {
                DataSet ds = new DataSet();
                string s = "select * from tiffin_with_sweet_daily_order where uid='" + Session["uid"].ToString() + "'";// and date='" + DateTime.Now.ToLongDateString() + "'";
                ds = dc.getdata(s);

                if (ds.Tables[0].Rows.Count != 0)
                {
                    Label1.Text = "You Booked Tiffin With Sweet From Tiffin Dabba As Details Are Given Below";
                    Repeater1.DataSource = ds;
                    Repeater1.DataBind();
                }
                else
                {
                    Label1.Text = "You Did Not Book Tiffin With Sweet From Tiffin Dabba.";
                    Repeater1.DataSource = "";
                    Repeater1.DataBind();

                }
            }
        }
    }
}