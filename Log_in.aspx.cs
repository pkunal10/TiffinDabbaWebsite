using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Net;
using System.Net.Mail;
using System.Threading;
using ASPSnippets.FaceBookAPI;
using System.Web.Script.Serialization;

public partial class Log_in : System.Web.UI.Page
{
    DataCon dc = new DataCon();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack != true)
        {
            Label1.Text = Convert.ToString(Session["msg"]);                      
        }

    }
    protected void Login_btn_Click(object sender, EventArgs e)
    {
        DataSet ds = new DataSet();
        DataSet ds1 = new DataSet();
        DataSet ds2 = new DataSet();
        string jk = "select status from user_accounts where id='" + Email_login_tb.Text + "' and pass='" + Password_login_tb.Text + "'";
        ds = dc.getdata(jk);

        string kj = "select * from providers where pid='" + Email_login_tb.Text + "' and pass='" + Password_login_tb.Text + "'";
        ds1 = dc.getdata(kj);

        string j = "select * from admin_login where id='" + Email_login_tb.Text + "' and pass='" + Password_login_tb.Text + "'";
        ds2 = dc.getdata(j);

        if (ds.Tables[0].Rows.Count != 0)
        {
            //if (ds.Tables[0].Rows[0][0].ToString() == "Not Allowed")
            //{
            //    ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please activate your account.');", true);
            //}
            if (ds.Tables[0].Rows[0][0].ToString() == "Blocked")
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Your account is blocked please contant the admin.');", true);
            }
            else if (ds.Tables[0].Rows[0][0].ToString() == "Allowed")
            {
                if (Convert.ToString(Session["tiffin_type"]) == "")
                {
                    Session["uid"] = Email_login_tb.Text;
                    Label1.Text = "";
                    Response.Redirect("~/user/Home.aspx");
                }
                else
                {
                    if (Convert.ToString(Session["tiffin_type"]) == "tws")
                    {
                        Session["uid"] = Email_login_tb.Text;
                        Response.Redirect("~/user/Tiffin_with_sweet_order.aspx");
                    }
                    else if (Convert.ToString(Session["tiffin_type"]) == "st")
                    {
                        Session["uid"] = Email_login_tb.Text;
                        Response.Redirect("~/user/Simple_tiffin_order.aspx");
                    }
                    else if (Convert.ToString(Session["tiffin_type"]) == "monthly tiffin")
                    {
                        Session["uid"] = Email_login_tb.Text;
                        Response.Redirect("~/user/Book_monthly_order.aspx");
                    }
                    else if (Convert.ToString(Session["tiffin_type"]) == "trial tiffin")
                    {
                        Session["uid"] = Email_login_tb.Text;
                        Response.Redirect("~/user/Book_trial_tiffin.aspx");
                    }
                    else if (Convert.ToString(Session["tiffin_type"]) == "ff")
                    {
                        Session["uid"] = Email_login_tb.Text;
                        Response.Redirect("~/user/Cart.aspx");
                    }
                    else if (Convert.ToString(Session["tiffin_type"]) == "spt")
                    {
                        Session["uid"] = Email_login_tb.Text;
                        Response.Redirect("~/user/SpecialTiffinOrder.aspx");
                    }
                }

            }
        }
        else if (ds1.Tables[0].Rows.Count != 0)
        {
            Session["pid"] = Email_login_tb.Text;
            Label1.Text = "";
            Response.Redirect("~/provider/Home.aspx");
        }
        else if (ds2.Tables[0].Rows.Count != 0)
        {
            Session["aid"] = Email_login_tb.Text;
            Label1.Text = "";
            Response.Redirect("~/admin/Add_Remove_city.aspx");
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Invalid Id Or Password');", true);
            //Response.Write("<script>alert('Invalid User Id Or Password')</script>");
            Email_login_tb.Text = "";
            Password_login_tb.Text = "";
            Email_login_tb.Focus();
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        DataSet ds5 = new DataSet();
        string zk = "select * from user_accounts where eid='" + TextBox4.Text + "'";
        ds5 = dc.getdata(zk);

        if (ds5.Tables[0].Rows.Count == 0)
        {

            //string s = "insert into user_accounts values('" + TextBox4.Text + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "','" + TextBox4.Text + "','" + TextBox5.Text + "','Not Allowed')";
            //dc.setdata(s);

            //Thread email = new Thread(delegate()
            //    {
            send_activation_mail();
            //});

            // Label1.Text = Convert.ToString(Convert.ToInt32(Label1.Text) + 1);
            //TextBox1.Text = "";
            //TextBox2.Text = "";
            //TextBox3.Text = "";
            //TextBox4.Text = "";
            //TextBox5.Text = "";

            //TextBox1.Focus();



            //ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('activation link is send to your email id please activate your account');window.location='Log_in.aspx';", true);
            //Session["msg"] = "activation link is send to your email id please activate your account";
            //Response.Redirect("~/user/Log_in.aspx");
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Your Email Id has already an account.');", true);
            TextBox4.Text = "";
            TextBox4.Focus();
        }
    }

    private void send_activation_mail()
    {
        //try
        //{
        //    string activationlink = "http://localhost:62634/Tiffin_Dabba/user/Activation_page.aspx?uid=" + TextBox4.Text;
        //    MailMessage mm = new MailMessage();
        //    mm.From = new MailAddress("tiffindabba10@gmail.com", "TIFFIN DABBA");//TIFFIN DABBA represent title in sent email.
        //    mm.To.Add(TextBox4.Text);
        //    mm.Subject = "Account Activation";
        //    mm.Body = "Hello: " + TextBox1.Text + "<br /><br />To activate your TIFFIN DABBA account <a href='" + activationlink + "'>Click here</a>";

        //    mm.IsBodyHtml = true;
        //    SmtpClient smtp = new SmtpClient();
        //    smtp.Host = "smtp.gmail.com";
        //    smtp.EnableSsl = true;
        //    smtp.Port = 587;
        //    smtp.Credentials = new System.Net.NetworkCredential("tiffindabba10@gmail.com", "102515209");


        //    smtp.Send(mm);

        string kz = "insert into user_accounts values('" + TextBox4.Text + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "','" + TextBox4.Text + "','" + TextBox5.Text + "','Allowed')";
        dc.setdata(kz);

        TextBox1.Text = "";
        TextBox2.Text = "";
        TextBox3.Text = "";
        TextBox4.Text = "";
        TextBox5.Text = "";

        TextBox1.Focus();

        ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Now You Can Login');", true);
        Email_login_tb.Focus();
        //Session["msg"] = "Now You Can Log In";
        //Response.Redirect("~/Log_in.aspx");
        //ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('activation link is send to your email id please activate your account');window.location='Log_in.aspx';", true);
        //}
        //catch (Exception ex)
        //{
        //    string Mail_msg = "Registration fail please try again.";
        //    ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('" + Mail_msg + "');", true);
        //}
    }

    protected void fb_login_btn_Click(object sender, EventArgs e)
    {
        FaceBookConnect.Authorize("user_photos,email", Request.Url.AbsoluteUri.Split('?')[0]);
    }
}
public class FaceBookUser
{
    public string Id { get; set; }
    public string Name { get; set; }
    public string UserName { get; set; }
    public string PictureUrl { get; set; }
    public string Mob_No { get; set; }
    public string Email { get; set; }
}