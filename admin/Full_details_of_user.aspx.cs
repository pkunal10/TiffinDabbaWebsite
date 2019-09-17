using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Net;
using System.Net.Mail;

public partial class admin_Full_details_of_user : System.Web.UI.Page
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
                DataSet ds = new DataSet();
                string s = "select * from user_accounts where id='" + Session["uid"].ToString() + "'";
                ds = dc.getdata(s);

                Label1.Text = ds.Tables[0].Rows[0][0].ToString();
                Label2.Text = ds.Tables[0].Rows[0][1].ToString();
                Label3.Text = ds.Tables[0].Rows[0][2].ToString();
                Label4.Text = ds.Tables[0].Rows[0][3].ToString();
                Label5.Text = ds.Tables[0].Rows[0][4].ToString();
                Label6.Text = ds.Tables[0].Rows[0][5].ToString();
                Label7.Text = ds.Tables[0].Rows[0][6].ToString();
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string j = "delete from user_accounts where id='" + Label1.Text + "'";
        dc.setdata(j);
        ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('This user is deleted from TIFFIN DABBA');window.location='View_users.aspx';", true);
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        string j = "update user_accounts set status='Allowed' where id='" + Label1.Text + "'";
        dc.setdata(j);
        string jk = "update simple_tiffin_daily_order set status='Delivered' where uid='" + Label1.Text + "'";
        dc.setdata(jk);
        string jp = "update tiffin_with_sweet_daily_order set status='Delivered' where uid='" + Label1.Text + "'";
        dc.setdata(jp);

        send_allowed_info_email();

        ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('This user is allowed to use our site.');window.location='View_users.aspx';", true);
    }

    private void send_allowed_info_email()
    {
        try
        {

            MailMessage mm = new MailMessage();
            mm.From = new MailAddress("tiffindabba10@gmail.com", "TIFFIN DABBA");//TIFFIN DABBA represent title in sent email.
            mm.To.Add(Label5.Text);
            mm.Subject = "Good News";
            mm.Body = "Hello:  " + Label2.Text + "<br /></br >Good news from TIFFIN DABBA....now you are aloowed to use our site so now you can log in to our site and book your Tiffin."
                + "<br /><br /><br />Thank You<br />&nbsp;&nbsp;&nbsp;TIFFIN DABBA";

            mm.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.EnableSsl = true;
            smtp.Port = 587;
            smtp.Credentials = new System.Net.NetworkCredential("tiffindabba10@gmail.com", "102515209");


            smtp.Send(mm);

            
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Departure Email Is Sent');", true);
        }
        catch (Exception ex)
        {
            string msg = "Email Sending is failed due to server error please try again";
            alert(msg);
        }
    }

    private void alert(string msg)
    {
        ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('" + msg + "');", true);
    }
}