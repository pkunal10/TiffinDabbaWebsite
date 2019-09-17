using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_Change_password : System.Web.UI.Page
{
    DataCon dc = new DataCon();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToString(Session["aid"]) == "")
        {
            Session["msg"] = "Please Log In First";
            Response.Redirect("~/Log_In.aspx");
        }
        else
        {
            if (IsPostBack != true)
            {
                Panel1.Visible = true;
                Panel2.Visible = false;
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text == "102515209")
        {
            TextBox1.Text = "";
            Panel1.Visible = false;
            Panel2.Visible = true;
        }
        else
        {
            TextBox1.Text = "";
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Invalid Security Key');", true);
            //Response.Write("<script>alert('Invalid Sequrity Key')</script>");
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        string s = "update admin_login set pass='" + TextBox3.Text + "' where id='" + Session["aid"].ToString() + "'";
        dc.setdata(s);

        Session["msg"] = "Password Is Changed Please Log In With New Password";
        Response.Redirect("~/Log_in.aspx");
    }
}