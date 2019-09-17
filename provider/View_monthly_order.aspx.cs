using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class provider_View_monthly_order_aspx : System.Web.UI.Page
{
    DataCon dc = new DataCon();
    DateTime current_time = TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.Local, TimeZoneInfo.FindSystemTimeZoneById("India Standard Time"));
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedIndex == 0)
        {
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please Select Order For Lunch Or Dinner Or Both');", true);
        }
        else
        {
            DataSet ds6 = new DataSet();
            string b = "select * from monthly_order where ((start_date <='" + current_time.ToString("dd/MM/yyyy") + "'  and finish_date>= '" + current_time.ToString("dd/MM/yyyy") + "') and book_for='" + DropDownList1.SelectedItem + "' and pid='" + Convert.ToString(Session["pid"]) + "')";
            ds6 = dc.getdata(b);

            if (ds6.Tables[0].Rows.Count == 0)
            {
                Label1.Text = "No Monthly Base Order For " + DropDownList1.SelectedItem + " Today";
                GridView1.DataSource = "";
                GridView1.DataBind();
            }
            else
            {
                Label1.Text = "Monthly Base Order For " + DropDownList1.SelectedItem + " Today Are Showing Below";
                GridView1.DataSource = ds6;
                GridView1.DataBind();
            }
        }
    }
}