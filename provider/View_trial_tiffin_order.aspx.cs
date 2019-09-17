using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class provider_View_trial_tiffin_order : System.Web.UI.Page
{
    DataCon dc = new DataCon();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        DataSet ds = new DataSet();
        string s = "select * from trial_tiffin_order where date='" + DateTime.Now.ToLongDateString() + "' and pid='" + Session["pid"].ToString() + "'";
        ds = dc.getdata(s);

        if (ds.Tables[0].Rows.Count != 0)
        {
            Label1.Text = "-:Your Today's Trial Tiffin Orders Are:-";
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
        else
        {
            GridView1.DataSource = "";
            GridView1.DataBind();
            Label1.Text = "-:You Have No Order Of Trial Tiffin Today:-";
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        DataSet ds1 = new DataSet();
        string j = "select * from trial_tiffin_order where date='" + TextBox1.Text + "' and pid='" + Session["pid"].ToString() + "'";
        ds1 = dc.getdata(j);

        if (ds1.Tables[0].Rows.Count != 0)
        {
            Label2.Text = "-:Order Of Trial Tiffin On " + TextBox1.Text + " :-";
            GridView2.DataSource = ds1;
            GridView2.DataBind();
        }
        else
        {
            GridView2.DataSource = "";
            GridView2.DataBind();
            Label2.Text = "-:You Have No Order Of Trial Tiffin On " + TextBox1.Text + " :-";
        }
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        DataSet ds2 = new DataSet();
        string k = "select * from trial_tiffin_order where pid='" + Session["pid"].ToString() + "'";
        ds2 = dc.getdata(k);

        if (ds2.Tables[0].Rows.Count != 0)
        {
            Label3.Text = "All Order Of Trial Tiffin";
            GridView3.DataSource = ds2;
            GridView3.DataBind();
        }
        else
        {
            GridView3.DataSource = "";
            GridView3.DataBind();
            Label3.Text = "You Have No Order Of Trial Tiffin Yet";
        }
    }

    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/provider/View_tiffin_with_sweet_order.aspx");
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedIndex != 0)
        {
            DataSet ds3 = new DataSet();
            string c = "select * from trial_tiffin_order where date='" + DateTime.Now.ToLongDateString() + "' and pid='" + Session["pid"].ToString() + "' and book_for='" + DropDownList1.Text + "'";
            ds3 = dc.getdata(c);

            if (ds3.Tables[0].Rows.Count != 0)
            {
                Label4.Text = "-:Your Today's Trial Tiffin Orders For " + DropDownList1.Text + " Are:-";
                GridView4.DataSource = ds3;
                GridView4.DataBind();
            }
            else
            {
                GridView4.DataSource = "";
                GridView4.DataBind();
                Label4.Text = "-:You Have No Trial Tiffin Orders For " + DropDownList1.Text + " Today:-";
            }
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please Select Order For Lunch Or Dinner');", true);
            // Response.Write("<script>alert('Please Select Order For Lunch Or Dinner')</script>");
            GridView4.DataSource = "";
            GridView4.DataBind();
            Label4.Text = "";
        }
    }

}