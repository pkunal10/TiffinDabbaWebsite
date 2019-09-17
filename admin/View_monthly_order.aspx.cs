using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_View_monthly_order : System.Web.UI.Page
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
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        DataSet ds = new DataSet();
        string jk = "select * from monthly_order where order_id='" + TextBox1.Text + "'";
        ds = dc.getdata(jk);

        if(ds.Tables[0].Rows.Count==0)
        {
            Label1.Text = TextBox1.Text + "Is Invalid Order Id";
            GridView1.DataSource = "";
            GridView1.DataBind();
        }
        else
        {
            GridView1.DataSource = ds;
            GridView1.DataBind();
            Label1.Text = "Order Details Of " + TextBox1.Text;
        }

    }
    protected void fp(object sender, CommandEventArgs e)
    {
        string j = e.CommandName.ToString();
        Session["pid"] = j;
        Response.Redirect("~/admin/Full_details_of_provider.aspx");
    }
    protected void fu(object sender, CommandEventArgs e)
    {
        string k = e.CommandName.ToString();
        Session["uid"] = k;
        Response.Redirect("~/admin/Full_details_of_user.aspx");
    }
    protected void full_details_of_order(object sender, CommandEventArgs e)
    {
        string y = e.CommandName.ToString();
        Session["monthly_order_id"] = y;
        Response.Redirect("~/admin/Full_details_of_monthly_order.aspx");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        if(DropDownList1.SelectedIndex==0)
        {
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please Select Order For Lunch Or Dinner Or Both');", true);
        }
        else
        {
            DataSet ds4 = new DataSet();
            string jk = "select * from monthly_order where pid='" + TextBox2.Text + "' and book_for='" + DropDownList1.SelectedItem + "'";
            ds4 = dc.getdata(jk);
            if(ds4.Tables[0].Rows.Count!=0)
            {
                Label2.Text = "Orders For " + DropDownList1.SelectedItem + " of " + TextBox2.Text;
                GridView2.DataSource = ds4;
                GridView2.DataBind();
            }
            else
            {
                Label2.Text = "No Orders for " + DropDownList1.Text + " of " + TextBox2.Text;
                GridView2.DataSource = "";
                GridView2.DataBind();
            }
        }
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        if(DropDownList2.SelectedIndex==0)
        {
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please Select Order For Lunch Or Dinner Or Both');", true);
        }
        else
        {
            DataSet ds5 = new DataSet();
            string a = "select * from monthly_order where book_for='" + DropDownList2.SelectedItem + "' and booking_date='" + current_time.ToLongDateString() + "'";
            ds5 = dc.getdata(a);
            if(ds5.Tables[0].Rows.Count==0)
            {
                GridView3.DataSource = "";
                GridView3.DataBind();
                Label3.Text = "No One Book Orders On Monthly Base for " + DropDownList2.Text + " Today";
            }
            else
            {
                GridView3.DataSource = ds5;
                GridView3.DataBind();
                Label3.Text = "Today's Monthly Booked Orders For " + DropDownList2.Text + " Are Showing Below";
            }
        }
        
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        if(DropDownList3.SelectedIndex==0)
        {
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please Select Order For Lunch Or Dinner Or Both');", true);
        }
        else
        {
            DataSet ds6 = new DataSet();
            string b = "select * from monthly_order where ((start_date <='" + current_time.ToString("dd/MM/yyyy") + "'  and finish_date>= '" + current_time.ToString("dd/MM/yyyy") + "') and book_for='" + DropDownList3.SelectedItem + "')";
           // string b = "select * from monthly_order where ((start_date <='" + current_time.ToLongDateString() + "'<=finish_date  ) and book_for='" + DropDownList3.SelectedItem + "')";
            
            ds6 = dc.getdata(b);

            if(ds6.Tables[0].Rows.Count==0)
            {
                Label4.Text = "No Monthly Base Order For " + DropDownList3.SelectedItem + " Today";
                GridView4.DataSource = "";
                GridView4.DataBind();
            }
            else
            {
                Label4.Text = "Monthly Base Order For " + DropDownList3.SelectedItem + " Today Are Showing Below";
                GridView4.DataSource = ds6;
                GridView4.DataBind();
            }
        }
    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        if (DropDownList4.SelectedIndex == 0)
        {
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please Select Order For Lunch Or Dinner Or Both');", true);
        }
        else
        {
            DataSet ds7 = new DataSet();
            string c = "select * from monthly_order where book_for='" + DropDownList4.SelectedItem + "'";
            ds7 = dc.getdata(c);

            if (ds7.Tables[0].Rows.Count == 0)
            {
                Label5.Text = "No Monthly Base Order For " + DropDownList4.SelectedItem + " Yet";
                GridView5.DataSource = "";
                GridView5.DataBind();
            }
            else
            {
                Label5.Text = "All Monthly Base Order For " + DropDownList4.SelectedItem + " Are Showing Below";
                GridView5.DataSource = ds7;
                GridView5.DataBind();
            }
        }
    }
}