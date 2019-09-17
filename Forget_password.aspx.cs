using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Net;
using System.Net.Mail;

public partial class Forget_password : System.Web.UI.Page
{
    DataCon dc = new DataCon();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        DataSet ds = new DataSet();
        DataSet ds1 = new DataSet();

        string s = "select * from user_accounts where id='" + TextBox1.Text + "'";
        ds = dc.getdata(s);

        string jk = "select * from providers where pid='" + TextBox1.Text + "'";
        ds1 = dc.getdata(jk);

        if (ds.Tables[0].Rows.Count != 0)
        {
            //Thread email = new Thread(delegate()
            //    {
            sendmail_user_forget_password();
            //    });
            //email.IsBackground = true;
            //email.Start();
            //ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Password Is Sent to your Email Id');window.location='Log_in.aspx';", true);
        }
        else if (ds1.Tables[0].Rows.Count != 0)
        {
            //Thread email = new Thread(delegate()
            //    {
            sendmail_provider_forget_password();
            //    });
            //email.IsBackground = true;
            //email.Start();
            //ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Password Is Sent to your Email Id');window.location='Log_in.aspx';", true);
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Your Email Id was not found in our record');", true);
            TextBox1.Text = "";
            TextBox1.Focus();
        }
    }

    private void sendmail_user_forget_password()
    {
        try
        {
            DataSet ds2 = new DataSet();
            string j = "select name,eid,pass from user_accounts where id='" + TextBox1.Text + "'";
            ds2 = dc.getdata(j);

            MailMessage mm = new MailMessage();
            mm.From = new MailAddress("tiffindabba10@gmail.com", "TIFFIN DABBA");//TIFFIN DABBA represent title in sent email.
            mm.To.Add(ds2.Tables[0].Rows[0][1].ToString());
            mm.Subject = "Forget Password";
            mm.Body = "Hello:  " + ds2.Tables[0].Rows[0][0].ToString() + "<br />Your TIFFIN DABBA Password :-       " + ds2.Tables[0].Rows[0][2].ToString();

            mm.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.EnableSsl = true;
            smtp.Port = 587;
            smtp.Credentials = new System.Net.NetworkCredential("tiffindabba10@gmail.com", "102515209");


            smtp.Send(mm);

            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Password Is Sent to your Email Id');window.location='Log_in.aspx';", true);
        }
        catch (Exception ex)
        {
            string mail_msg = "Email Sending is failed due to server error please try again";
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('" + mail_msg + "');", true);
        }
    }

    private void sendmail_provider_forget_password()
    {
        try
        {
            DataSet ds2 = new DataSet();
            string j = "select name,e_id,pass from providers where pid='" + TextBox1.Text + "'";
            ds2 = dc.getdata(j);

            MailMessage mm = new MailMessage();
            mm.From = new MailAddress("tiffindabba10@gmail.com", "TIFFIN DABBA");//TIFFIN DABBA represent title in sent email.
            mm.To.Add(ds2.Tables[0].Rows[0][1].ToString());
            mm.Subject = "Forget Password";
            mm.Body = "Hello:  " + ds2.Tables[0].Rows[0][0].ToString() + "<br />Your TIFFIN DABBA Password :-       " + ds2.Tables[0].Rows[0][2].ToString();

            mm.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.EnableSsl = true;
            smtp.Port = 587;
            smtp.Credentials = new System.Net.NetworkCredential("tiffindabba10@gmail.com", "102515209");


            smtp.Send(mm);

            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Password Is Sent to your Email Id');window.location='Log_in.aspx';", true);
        }
        catch (Exception ex)
        {
            string mail_msg = "Email Sending is failed due to server error please try again";
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('" + mail_msg + "');", true);
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Log_in.aspx");
    }
}