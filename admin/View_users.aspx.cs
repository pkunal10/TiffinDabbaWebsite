using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_View_users : System.Web.UI.Page
{
    DataCon dc = new DataCon();
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
        string s = "select * from user_accounts where id='" + TextBox1.Text + "'";
        ds = dc.getdata(s);

        if (ds.Tables[0].Rows.Count != 0)
        {
            Label1.Text = "Details Of User Id " + TextBox1.Text;
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
        else
        {
            Label1.Text = "";
            GridView1.DataSource = "";
            GridView1.DataBind();

            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Invalid User Id');", true);
           // Response.Write("<script>alert('Invalid User Id')</script>");
        }
    }
    protected void fu(object sender, CommandEventArgs e)
    {
        string k = e.CommandName.ToString();
        Session["uid"] = k;
        Response.Redirect("~/admin/Full_details_of_user.aspx");
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        DataSet ds3 = new DataSet();
        string a = "select * from user_accounts";
        ds3 = dc.getdata(a);

        if (ds3.Tables[0].Rows.Count != 0)
        {
            Total_user_lbl.Text = "Total Users Are:-    " + Convert.ToString(Convert.ToInt32(ds3.Tables[0].Rows.Count) - 1) + ".";
            Label3.Text = "Lis Of All Users";
            GridView3.DataSource = ds3;
            GridView3.DataBind();
        }
        else
        {
            Total_user_lbl.Text = "";
            Label3.Text = "";
            GridView3.DataSource = "";
            GridView3.DataBind();

            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('No Users Yet');", true);
            //Response.Write("<script>alert('No Users Yet')</script>");
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        DataSet ds4 = new DataSet();
        string jk = "select * from user_accounts where status='Blocked'";
        ds4 = dc.getdata(jk);

        if (ds4.Tables[0].Rows.Count != 0)
        {
            Label2.Text = "Lis Of Blocked Users";
            GridView2.DataSource = ds4;
            GridView2.DataBind();
        }
        else
        {
            Label2.Text = "";
            GridView2.DataSource = "";
            GridView2.DataBind();

            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('No Blocked Users Yet');", true);
            //Response.Write("<script>alert('No Users Yet')</script>");
        }
    }
}