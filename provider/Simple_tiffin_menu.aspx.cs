using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class provider_Simple_tiffin_menu : System.Web.UI.Page
{
    DataCon dc = new DataCon();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToString(Session["pid"]) == "")
        {
            Session["msg"] = "Please Log In First";
            Response.Redirect("~/Log_in.aspx");
        }
        else
        {
            if (IsPostBack != true)
            {
                DataSet ds = new DataSet();
                string s = "select sabji,roti,dal,chawal,price from simple_tiffin where t_id='" + Session["stid"].ToString() + "'";
                ds = dc.getdata(s);

                Label1.Text = ds.Tables[0].Rows[0][0].ToString();
                Label2.Text = ds.Tables[0].Rows[0][1].ToString();
                Label3.Text = ds.Tables[0].Rows[0][2].ToString();
                Label4.Text = ds.Tables[0].Rows[0][3].ToString();
                Label5.Text = ds.Tables[0].Rows[0][4].ToString() + " Rs.";
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedIndex == 0)
        {
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please select Availability of tiffin');", true);
            //Response.Write("<script>alert('Please select Availability of tiffin')</script>");
        }
        else if (DropDownList1.SelectedIndex == 1)
        {
            string j = "update simple_tiffin set available='Order Now' where t_id='" + Session["stid"].ToString() + "'";
            dc.setdata(j);
            Response.Redirect("~/provider/Simple_tiffin_list.aspx");
        }
        else if (DropDownList1.SelectedIndex == 2)
        {
            string j = "update simple_tiffin set available='Not Available' where t_id='" + Session["stid"].ToString() + "'";
            dc.setdata(j);
            Response.Redirect("~/provider/Simple_tiffin_list.aspx");
        }

    }
}