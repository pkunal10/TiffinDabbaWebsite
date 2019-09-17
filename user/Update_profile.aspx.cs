using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class user_Update_profile : System.Web.UI.Page
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
                Panel1.Visible = false;
                Panel2.Visible = false;
                DataSet ds = new DataSet();
                string s = "select id,name,address,mob_no,eid from user_accounts where id='" + Session["uid"].ToString() + "'";
                ds = dc.getdata(s);

                // Label1.Text = ds.Tables[0].Rows[0][0].ToString();
                TextBox1.Text = ds.Tables[0].Rows[0][1].ToString();
                TextBox4.Text = ds.Tables[0].Rows[0][2].ToString();
                TextBox2.Text = ds.Tables[0].Rows[0][3].ToString();
                Label1.Text = ds.Tables[0].Rows[0][4].ToString();
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string j = "update user_accounts set name='" + TextBox1.Text + "',mob_no='" + TextBox2.Text + "',address='" + TextBox4.Text + "' where id='" + Label1.Text + "'";
        dc.setdata(j);
        ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Your Profile Is Updated');window.location='My_profile.aspx';", true);
        //Response.Redirect("~/user/My_profile.aspx");
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Panel1.Visible = true;
        Panel2.Visible = false;
        TextBox6.Text = "";
        TextBox7.Text = "";
        TextBox5.Text = "";
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        DataSet ds5 = new DataSet();
        string l = "select pass from user_accounts where id='" + Session["uid"] + "'";
        ds5 = dc.getdata(l);

        if (ds5.Tables[0].Rows[0][0].ToString() == TextBox5.Text)
        {
            Panel1.Visible = false;
            Panel2.Visible = true;
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Incorrect Password');", true);
            //    Response.Write("<script>alert('Incorrect Password')</script>");
            TextBox5.Text = "";
            TextBox5.Focus();
        }
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        string m = "update user_accounts set pass='" + TextBox7.Text + "' where id='" + Session["uid"] + "'";
        dc.setdata(m);
        Session["msg"] = "Your Password Is Changed Log In With New Password";
        Response.Redirect("~/Log_in.aspx");
    }
}