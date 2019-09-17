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

public partial class user_Tiffin_with_sweet_order : System.Web.UI.Page
{
    DataCon dc = new DataCon();
    string oid;
    DataSet ds10 = new DataSet();
    //DateTime current_time = DateTime.Now;
    DateTime current_time = TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.Local, TimeZoneInfo.FindSystemTimeZoneById("India Standard Time"));
    DateTime lunch_time;
    DateTime dinner_time;
    DataSet ds_p_details = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        string ot = "select * from order_timmings";
        ds10 = dc.getdata(ot);
        lunch_time = Convert.ToDateTime(ds10.Tables[0].Rows[0][1].ToString());
        dinner_time = Convert.ToDateTime(ds10.Tables[0].Rows[1][1].ToString());
        if (Convert.ToString(Session["uid"]) == "")
        {
            Session["msg"] = "Please Log In First";
            Response.Redirect("~/Log_in.aspx");
        }
        else
        {
            if (IsPostBack != true)
            {
                Label12.Text = "";

                DataSet ds = new DataSet();
                string oi = "select order_id from tiffin_with_sweet_daily_order order by order_id DESC";
                ds = dc.getdata(oi);

                if (ds.Tables[0].Rows.Count == 0)
                {
                    oid = "1";
                }
                else
                {
                    String s = ds.Tables[0].Rows[0][0].ToString();

                    //string t = s.Substring(5, s.Length - 5);
                    //int n = Convert.ToInt32(t);
                    int n = Convert.ToInt32(s);
                    n = n + 1;


                    //oid = "ODTWS" + n.ToString();
                    oid = n.ToString();
                    //rid = Convert.ToString(Convert.ToInt32(ds3.Tables[0].Rows[0][0].ToString()) + 1);
                }

                Label1.Text = oid;

                Label3.Text = current_time.ToLongDateString();
                Label4.Text = current_time.ToLongTimeString();

                DataSet ds1 = new DataSet();
                string j = "select name,eid from user_accounts where id='" + Session["uid"].ToString() + "'";
                ds1 = dc.getdata(j);
                Label2.Text = ds1.Tables[0].Rows[0][0].ToString();
                Label10.Text = ds1.Tables[0].Rows[0][1].ToString();

                DataSet ds2 = new DataSet();
                string k = "select sabji,roti,dal,chawal,sweet,price,other,tws_image from tiffin_with_sweet where t_id='" + Session["twsid"].ToString() + "'";
                ds2 = dc.getdata(k);

                Tiffin_Image.ImageUrl = ds2.Tables[0].Rows[0][7].ToString();
                Label5.Text = ds2.Tables[0].Rows[0][0].ToString();
                Label6.Text = ds2.Tables[0].Rows[0][1].ToString();
                Label7.Text = ds2.Tables[0].Rows[0][2].ToString();
                Label8.Text = ds2.Tables[0].Rows[0][3].ToString();
                Label11.Text = ds2.Tables[0].Rows[0][4].ToString();
                Label9.Text = ds2.Tables[0].Rows[0][5].ToString();
                Other_lbl.Text = ds2.Tables[0].Rows[0][6].ToString();
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedIndex == 0)
        {
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please select book for LUNCH or DINNER');", true);
            DropDownList1.Focus();
        }
        else if (CheckBox1.Checked == false)
        {
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please agree to Terms & Condition');", true);
        }
        else if (DropDownList1.SelectedIndex == 1)
        {
            int in_lunch_time = DateTime.Compare(current_time, lunch_time);

            if (in_lunch_time < 0)
            {
                System.Threading.Thread.Sleep(1000);

                DataSet ds3 = new DataSet();
                string l = "select p_id from tiffin_with_sweet where t_id='" + Session["twsid"].ToString() + "'";
                ds3 = dc.getdata(l);

                DataSet ds4 = new DataSet();
                string z = "select tws_image from tiffin_with_sweet where t_id='" + Session["twsid"].ToString() + "'";
                ds4 = dc.getdata(z);

                string p = "insert into tiffin_with_sweet_daily_order values('" + Label1.Text + "','" + DropDownList1.Text + "','" + Session["twsid"].ToString() + "','" + ds3.Tables[0].Rows[0][0].ToString() + "','" + Session["uid"].ToString() + "','" + Label2.Text + "','" + Label10.Text + "','" + Label4.Text + "','" + Label3.Text + "','" + TextBox1.Text + "','" + Session["delivery_area"].ToString() + "','" + TextBox2.Text + "','" + Label5.Text + "','" + Label6.Text + "','" + Label7.Text + "','" + Label8.Text + "','" + Label11.Text + "','" + Other_lbl.Text + "','" + Label9.Text + "','" + ds4.Tables[0].Rows[0][0].ToString() + "','Not Delivered')";
                dc.setdata(p);

                Thread email = new Thread(delegate()
                {
                    sendmail_user_lunch();
                    sendmail_provider_lunch();
                    sendmail_admin_lunch();
                });
                email.IsBackground = true;
                email.Start();

                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Your Order Is Booked You Can Check From Tiffin With Sweet Order Page');window.location='View_tiffin_with_sweet_order.aspx';", true);
            }
            else if (in_lunch_time == 0)
            {
                System.Threading.Thread.Sleep(1000);

                DataSet ds3 = new DataSet();
                string l = "select p_id from tiffin_with_sweet where t_id='" + Session["twsid"].ToString() + "'";
                ds3 = dc.getdata(l);

                DataSet ds4 = new DataSet();
                string z = "select tws_image from tiffin_with_sweet where t_id='" + Session["twsid"].ToString() + "'";
                ds4 = dc.getdata(z);

                string p = "insert into tiffin_with_sweet_daily_order values('" + Label1.Text + "','" + DropDownList1.Text + "','" + Session["twsid"].ToString() + "','" + ds3.Tables[0].Rows[0][0].ToString() + "','" + Session["uid"].ToString() + "','" + Label2.Text + "','" + Label10.Text + "','" + Label4.Text + "','" + Label3.Text + "','" + TextBox1.Text + "','" + Session["delivery_area"].ToString() + "','" + TextBox2.Text + "','" + Label5.Text + "','" + Label6.Text + "','" + Label7.Text + "','" + Label8.Text + "','" + Label11.Text + "','" + Other_lbl.Text + "','" + Label9.Text + "','" + ds4.Tables[0].Rows[0][0].ToString() + "','Not Delivered')";
                dc.setdata(p);

                Thread email = new Thread(delegate()
                {
                    sendmail_user_lunch();
                    sendmail_provider_lunch();
                    sendmail_admin_lunch();
                });
                email.IsBackground = true;
                email.Start();

                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Your Order Is Booked You Can Check From Tiffin With Sweet Order Page');window.location='View_tiffin_with_sweet_order.aspx';", true);
            }
            else if (in_lunch_time > 0)
            {

                Label12.Text = "You can't book tiffin for LUNCH after " + ds10.Tables[0].Rows[0][1].ToString() + ".";
                //TextBox1.Text = "";
                //TextBox2.Text = "";
                DropDownList1.SelectedIndex = 0;
                CheckBox1.Checked = false;
                //ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('You can't book tiffin for LUNCH after 10:30 AM');", true);
            }
        }
        else if (DropDownList1.SelectedIndex == 2)
        {
            int in_dinner_time = DateTime.Compare(current_time, dinner_time);

            if (in_dinner_time < 0)
            {
                System.Threading.Thread.Sleep(1000);

                DataSet ds3 = new DataSet();
                string l = "select p_id from tiffin_with_sweet where t_id='" + Session["twsid"].ToString() + "'";
                ds3 = dc.getdata(l);

                DataSet ds4 = new DataSet();
                string z = "select tws_image from tiffin_with_sweet where t_id='" + Session["twsid"].ToString() + "'";
                ds4 = dc.getdata(z);

                string p = "insert into tiffin_with_sweet_daily_order values('" + Label1.Text + "','" + DropDownList1.Text + "','" + Session["twsid"].ToString() + "','" + ds3.Tables[0].Rows[0][0].ToString() + "','" + Session["uid"].ToString() + "','" + Label2.Text + "','" + Label10.Text + "','" + Label4.Text + "','" + Label3.Text + "','" + TextBox1.Text + "','" + Session["delivery_area"].ToString() + "','" + TextBox2.Text + "','" + Label5.Text + "','" + Label6.Text + "','" + Label7.Text + "','" + Label8.Text + "','" + Label11.Text + "','" + Other_lbl.Text + "','" + Label9.Text + "','" + ds4.Tables[0].Rows[0][0].ToString() + "','Not Delivered')";
                dc.setdata(p);

                Thread email = new Thread(delegate()
                {
                    sendmail_user_dinner();
                    sendmail_provider_dinner();
                    sendmail_admin_dinner();
                });
                email.IsBackground = true;
                email.Start();

                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Your Order Is Booked You Can Check From Tiffin With Sweet Order Page');window.location='View_tiffin_with_sweet_order.aspx';", true);
            }
            else if (in_dinner_time == 0)
            {
                System.Threading.Thread.Sleep(1000);

                DataSet ds3 = new DataSet();
                string l = "select p_id from tiffin_with_sweet where t_id='" + Session["twsid"].ToString() + "'";
                ds3 = dc.getdata(l);

                DataSet ds4 = new DataSet();
                string z = "select tws_image from tiffin_with_sweet where t_id='" + Session["twsid"].ToString() + "'";
                ds4 = dc.getdata(z);

                string p = "insert into tiffin_with_sweet_daily_order values('" + Label1.Text + "','" + DropDownList1.Text + "','" + Session["twsid"].ToString() + "','" + ds3.Tables[0].Rows[0][0].ToString() + "','" + Session["uid"].ToString() + "','" + Label2.Text + "','" + Label10.Text + "','" + Label4.Text + "','" + Label3.Text + "','" + TextBox1.Text + "','" + Session["delivery_area"].ToString() + "','" + TextBox2.Text + "','" + Label5.Text + "','" + Label6.Text + "','" + Label7.Text + "','" + Label8.Text + "','" + Label11.Text + "','" + Other_lbl.Text + "','" + Label9.Text + "','" + ds4.Tables[0].Rows[0][0].ToString() + "','Not Delivered')";
                dc.setdata(p);

                Thread email = new Thread(delegate()
                {
                    sendmail_user_dinner();
                    sendmail_provider_dinner();
                    sendmail_admin_dinner();
                });
                email.IsBackground = true;
                email.Start();

                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Your Order Is Booked You Can Check From Tiffin With Sweet Order Page');window.location='View_tiffin_with_sweet_order.aspx';", true);
            }
            else if (in_dinner_time > 0)
            {
                Label12.Text = "You can't book tiffin for DINNER after " + ds10.Tables[0].Rows[1][1].ToString() + ".";
                //TextBox1.Text = "";
                //TextBox2.Text = "";
                DropDownList1.SelectedIndex = 0;
                CheckBox1.Checked = false;
                //ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('You can't book tiffin for DINNER after 04:30 PM');", true);
            }
        }
    }

    private void sendmail_provider_dinner()
    {

        try
        {
            DataSet ds_p_id = new DataSet();
            string p_id = "select p_id from tiffin_with_sweet where t_id='" + Session["twsid"].ToString() + "'";
            ds_p_id = dc.getdata(p_id);
            string p_details = "select e_id,name from providers where pid='" + ds_p_id.Tables[0].Rows[0][0].ToString() + "'";
            ds_p_details = dc.getdata(p_details);

            MailMessage mm = new MailMessage();
            mm.From = new MailAddress("tiffindabba10@gmail.com", "TIFFIN DABBA");//TIFFIN DABBA represent title in sent email.
            mm.To.Add(ds_p_details.Tables[0].Rows[0][0].ToString());
            mm.Subject = "Order Details";
            mm.Body = "Hello: " + ds_p_details.Tables[0].Rows[0][1].ToString() + "<br /><br />Your order of simple tiffin for DINNER from TIFFIN DABBA.<br />Date:   " + Label3.Text +
                      "<br />Menu of tiffin is given below:<br />" + "Order Id:  " + Label1.Text + "<br />Sabji:  " + Label5.Text +
                      "<br />Roti:  " + Label6.Text + "<br />Dal/Kadi:  " + Label7.Text + "<br />Chawal/Khichdi:  " + Label8.Text + "<br />Other:   " + Other_lbl.Text + "<br />You have to make this tiffin before 07:30 PM.";

            mm.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.EnableSsl = true;
            smtp.Port = 587;
            smtp.Credentials = new System.Net.NetworkCredential("tiffindabba10@gmail.com", "102515209");


            smtp.Send(mm);
        }
        catch (Exception ex)
        {
            string Mail_msg = "Mail can't be sent because of server problem: ";
            Mail_msg += ex.Message;
            //Response.Write(Mail_msg);
            Label12.Text = Mail_msg;
            //ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Your Order is booked but mail is not send due to server problem');window.location='View_simple_tiffin_order.aspx'", true);
        }
    }

    private void sendmail_provider_lunch()
    {
        try
        {
            DataSet ds_p_id = new DataSet();
            string p_id = "select p_id from tiffin_with_sweet where t_id='" + Session["twsid"].ToString() + "'";
            ds_p_id = dc.getdata(p_id);
            string p_details = "select e_id,name from providers where pid='" + ds_p_id.Tables[0].Rows[0][0].ToString() + "'";
            ds_p_details = dc.getdata(p_details);

            MailMessage mm = new MailMessage();
            mm.From = new MailAddress("tiffindabba10@gmail.com", "TIFFIN DABBA");//TIFFIN DABBA represent title in sent email.
            mm.To.Add(ds_p_details.Tables[0].Rows[0][0].ToString());
            mm.Subject = "Order Details";
            mm.Body = "Hello: " + ds_p_details.Tables[0].Rows[0][1].ToString() + "<br /><br />Your order of simple tiffin for LUNCH from TIFFIN DABBA.<br />Date:   " + Label3.Text +
                      "<br />Menu of tiffin is given below:<br />" + "Order Id:  " + Label1.Text + "<br />Sabji:  " + Label5.Text +
                      "<br />Roti:  " + Label6.Text + "<br />Dal/Kadi:  " + Label7.Text + "<br />Chawal/Khichdi:  " + Label8.Text + "<br />Other:   " + Other_lbl.Text + "<br />You have to make this tiffin before 12:00 PM.";

            mm.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.EnableSsl = true;
            smtp.Port = 587;
            smtp.Credentials = new System.Net.NetworkCredential("tiffindabba10@gmail.com", "102515209");


            smtp.Send(mm);
        }
        catch (Exception ex)
        {
            string Mail_msg = "Mail can't be sent because of server problem: ";
            Mail_msg += ex.Message;
            //Response.Write(Mail_msg);
            Label12.Text = Mail_msg;
            //ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Your Order is booked but mail is not send due to server problem');window.location='View_simple_tiffin_order.aspx'", true);
        }
    }


    private void sendmail_user_dinner()
    {
        try
        {
            MailMessage mm = new MailMessage();
            mm.From = new MailAddress("tiffindabba10@gmail.com", "TIFFIN DABBA");//TIFFIN DABBA represent title in sent email.
            mm.To.Add(Label10.Text);
            mm.Subject = "Order Details";
            //mm.Body = "Hello: " + Label2.Text + "<br /><br />You book tiffin with sweet for DINNER from TIFFIN DABBA.<br />Your Menu of tiffin is given below:<br />" + "Order Id:  " + Label1.Text +
            //          "<br />Sabji:  " + Label5.Text + "<br />Roti:  " + Label6.Text + "<br />Dal:  " + Label7.Text + "<br />Chawal:  " + Label8.Text + "<br />Sweet  :" + Label11.Text + "<br />Total Bill:  " + Label9.Text +
            //          "Rs.<br />You recived your tiffin at Delivery Address given by you at order time between 07:00 PM to 08:00  PM";

            mm.Body = "<br />Hello:  " + Label2.Text + "<br /><center><font style='font-size:13px;weight:550;'>You Book Tiffin With Sweet For DINNER From TIFFIN DABBA.</font><br /><br /><table border='1' height='50%' width='65%'><caption>Order Details</caption><tr><td>Order Id:</td><td>" + Label1.Text + "</td></tr><tr><td>Order Date:</td><td>" + Label3.Text + "</td></tr><tr><td>Order Time:</td><td>" + Label4.Text + "</td></tr>" +
                    "</table><br /><table border='1' height='100%' width='100%'><caption>Delivery Address</caption><tr><td>Address:  </td><td>" + TextBox2.Text + "</td></tr></table>" +
                    "<br /><font style='font-size:12px;weight:450;'>Your Tiffin's Menu Is Given Below:</font><table border='1' height='50%' width='60%'><tr><td>Sabji:</td><td>" + Label5.Text + "</td></tr>" +
                    "<tr><td>Roti:</td><td>" + Label6.Text + "</td></tr><tr><td>Dal/Kadi:</td><td>" + Label7.Text + "</td></tr><tr><td>Chawal/Khihdi:</td><td>" + Label8.Text + "</td></tr><tr><td>Sweet:</td><td>" + Label11.Text + "</td></tr><tr><td>Other:</td><td>" + Other_lbl.Text + "</td></tr><tr><td colspan='2' align='center'><b>Total Bill:  " + Label9.Text + " Rs.</b>(Inclusive Of All Charges)</td></tr></table>" +
                    "<br /><font style='font-size:12px;'>You Will Receive Your Tiffin At Your Delivery Address Between 07:30 PM to 08:30 PM.</font></center>";

            mm.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.EnableSsl = true;
            smtp.Port = 587;
            smtp.Credentials = new System.Net.NetworkCredential("tiffindabba10@gmail.com", "102515209");


            smtp.Send(mm);
        }
        catch (Exception ex)
        {
            string Mail_msg = "Mail can't be sent because of server problem: ";
            Mail_msg += ex.Message;
            //Response.Write(Mail_msg);
            Label12.Text = Mail_msg;
            //ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Your Order is booked but mail is not send due to server problem');window.location='View_simple_tiffin_order.aspx'", true);
        }
    }

    private void sendmail_user_lunch()
    {
        try
        {
            MailMessage mm = new MailMessage();
            mm.From = new MailAddress("tiffindabba10@gmail.com", "TIFFIN DABBA");//TIFFIN DABBA represent title in sent email.
            mm.To.Add(Label10.Text);
            mm.Subject = "Order Details";
            //mm.Body = "Hello: " + Label2.Text + "<br /><br />You book tiffin with sweet for LUNCH from TIFFIN DABBA.<br />Your Menu of tiffin is given below:<br />" + "Order Id:  " + Label1.Text +
            //          "<br />Sabji:  " + Label5.Text + "<br />Roti:  " + Label6.Text + "<br />Dal:  " + Label7.Text + "<br />Chawal:  " + Label8.Text + "<br />Sweet  :" + Label11.Text + "<br />Total Bill:  " + Label9.Text +
            //          "Rs.<br />You recived your tiffin at Delivery Address given by you at order time between 11:30 AM to 12:30  PM";


            mm.Body = "<br />Hello:  " + Label2.Text + "<br /><center><font style='font-size:13px;weight:550;'>You Book Tiffin With Sweet For LUNCH From TIFFIN DABBA.</font><br /><br /><table border='1' height='50%' width='65%'><caption>Order Details</caption><tr><td>Order Id:</td><td>" + Label1.Text + "</td></tr><tr><td>Order Date:</td><td>" + Label3.Text + "</td></tr><tr><td>Order Time:</td><td>" + Label4.Text + "</td></tr>" +
                        "</table><br /><table border='1' height='100%' width='100%'><caption>Delivery Address</caption><tr><td>Address:  </td><td>" + TextBox2.Text + "</td></tr></table>" +
                        "<br /><font style='font-size:12px;weight:450;'>Your Tiffin's Menu Is Given Below:</font><table border='1' height='50%' width='60%'><tr><td>Sabji:</td><td>" + Label5.Text + "</td></tr>" +
                        "<tr><td>Roti:</td><td>" + Label6.Text + "</td></tr><tr><td>Dal/Kadi:</td><td>" + Label7.Text + "</td></tr><tr><td>Chawal/Khichdi:</td><td>" + Label8.Text + "</td></tr><tr><td>Sweet:</td><td>" + Label11.Text + "</td></tr><tr><td>Other:</td><td>" + Other_lbl.Text + "</td></tr><tr><td colspan='2' align='center'><b>Total Bill:  " + Label9.Text + " Rs.</b>(Inclusive Of All Charges)</td></tr></table>" +
                        "<br /><font style='font-size:12px;'>You Will Receive Your Tiffin At Your Delivery Address Between 12:00 PM to 01:30 PM.</font></center>";
            mm.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.EnableSsl = true;
            smtp.Port = 587;
            smtp.Credentials = new System.Net.NetworkCredential("tiffindabba10@gmail.com", "102515209");


            smtp.Send(mm);
        }
        catch (Exception ex)
        {
            string Mail_msg = "Mail can't be sent because of server problem: ";
            Mail_msg += ex.Message;
            //Response.Write(Mail_msg);
            Label12.Text = Mail_msg;
            //ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Your Order is booked but mail is not send due to server problem');window.location='View_simple_tiffin_order.aspx'", true);
        }

    }

    private void sendmail_admin_lunch()
    {
        try
        {
            MailMessage mm = new MailMessage();
            mm.From = new MailAddress("tiffindabba10@gmail.com", "TIFFIN DABBA");//TIFFIN DABBA represent title in sent email.
            mm.To.Add("zainabmushtaqwani@gmail.com");
            mm.Subject = "Order Details";
            //mm.Body = "Hello: " + Label2.Text + "<br /><br />You book tiffin with sweet for LUNCH from TIFFIN DABBA.<br />Your Menu of tiffin is given below:<br />" + "Order Id:  " + Label1.Text +
            //          "<br />Sabji:  " + Label5.Text + "<br />Roti:  " + Label6.Text + "<br />Dal:  " + Label7.Text + "<br />Chawal:  " + Label8.Text + "<br />Sweet  :" + Label11.Text + "<br />Total Bill:  " + Label9.Text +
            //          "Rs.<br />You recived your tiffin at Delivery Address given by you at order time between 11:30 AM to 12:30  PM";


            mm.Body = "<br />Hello:  Admin<br /><center><font style='font-size:13px;weight:550;'>Someone Book Tiffin With Sweet For LUNCH From TIFFIN DABBA.</font><br /><br /><table border='1' height='50%' width='65%'><caption>Order Details</caption><tr><td>Order Id:</td><td>" + Label1.Text + "</td></tr><tr><td>Order Date:</td><td>" + Label3.Text + "</td></tr><tr><td>Order Time:</td><td>" + Label4.Text + "</td></tr>" +
                        "</table><br /><table border='1' height='100%' width='100%'><caption>Delivery Address</caption><tr><td>Address:  </td><td>" + TextBox2.Text + "</td></tr></table>" +
                        "<br /><font style='font-size:12px;weight:450;'>Your Tiffin's Menu Is Given Below:</font><table border='1' height='50%' width='60%'><tr><td>Sabji:</td><td>" + Label5.Text + "</td></tr>" +
                        "<tr><td>Roti:</td><td>" + Label6.Text + "</td></tr><tr><td>Dal/Kadi:</td><td>" + Label7.Text + "</td></tr><tr><td>Chawal/Khichdi:</td><td>" + Label8.Text + "</td></tr><tr><td>Sweet:</td><td>" + Label11.Text + "</td></tr><tr><td>Other:</td><td>" + Other_lbl.Text + "</td></tr><tr><td colspan='2' align='center'><b>Total Bill:  " + Label9.Text + " Rs.</b>(Inclusive Of All Charges)</td></tr></table>" +
                        "<br /><font style='font-size:12px;'>You Will Receive Your Tiffin At Your Delivery Address Between 12:00 PM to 01:30 PM.</font></center>";
            mm.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.EnableSsl = true;
            smtp.Port = 587;
            smtp.Credentials = new System.Net.NetworkCredential("tiffindabba10@gmail.com", "102515209");


            smtp.Send(mm);
        }
        catch (Exception ex)
        {
            string Mail_msg = "Mail can't be sent because of server problem: ";
            Mail_msg += ex.Message;
            //Response.Write(Mail_msg);
            Label12.Text = Mail_msg;
            //ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Your Order is booked but mail is not send due to server problem');window.location='View_simple_tiffin_order.aspx'", true);
        }

    }
    private void sendmail_admin_dinner()
    {
        try
        {
            MailMessage mm = new MailMessage();
            mm.From = new MailAddress("tiffindabba10@gmail.com", "TIFFIN DABBA");//TIFFIN DABBA represent title in sent email.
            mm.To.Add("zainabmushtaqwani@gmail.com");
            mm.Subject = "Order Details";
            //mm.Body = "Hello: " + Label2.Text + "<br /><br />You book tiffin with sweet for DINNER from TIFFIN DABBA.<br />Your Menu of tiffin is given below:<br />" + "Order Id:  " + Label1.Text +
            //          "<br />Sabji:  " + Label5.Text + "<br />Roti:  " + Label6.Text + "<br />Dal:  " + Label7.Text + "<br />Chawal:  " + Label8.Text + "<br />Sweet  :" + Label11.Text + "<br />Total Bill:  " + Label9.Text +
            //          "Rs.<br />You recived your tiffin at Delivery Address given by you at order time between 07:00 PM to 08:00  PM";

            mm.Body = "<br />Hello:  Admin<br /><center><font style='font-size:13px;weight:550;'>Someone Book Tiffin With Sweet For DINNER From TIFFIN DABBA.</font><br /><br /><table border='1' height='50%' width='65%'><caption>Order Details</caption><tr><td>Order Id:</td><td>" + Label1.Text + "</td></tr><tr><td>Order Date:</td><td>" + Label3.Text + "</td></tr><tr><td>Order Time:</td><td>" + Label4.Text + "</td></tr>" +
                    "</table><br /><table border='1' height='100%' width='100%'><caption>Delivery Address</caption><tr><td>Address:  </td><td>" + TextBox2.Text + "</td></tr></table>" +
                    "<br /><font style='font-size:12px;weight:450;'>Your Tiffin's Menu Is Given Below:</font><table border='1' height='50%' width='60%'><tr><td>Sabji:</td><td>" + Label5.Text + "</td></tr>" +
                    "<tr><td>Roti:</td><td>" + Label6.Text + "</td></tr><tr><td>Dal/Kadi:</td><td>" + Label7.Text + "</td></tr><tr><td>Chawal/Khichdi:</td><td>" + Label8.Text + "</td></tr><tr><td>Sweet:</td><td>" + Label11.Text + "</td></tr><tr><td>Other:</td><td>" + Other_lbl.Text + "</td></tr><tr><td colspan='2' align='center'><b>Total Bill:  " + Label9.Text + " Rs.</b>(Inclusive Of All Charges)</td></tr></table>" +
                    "<br /><font style='font-size:12px;'>You Will Receive Your Tiffin At Your Delivery Address Between 07:30 PM to 08:30 PM.</font></center>";

            mm.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.EnableSsl = true;
            smtp.Port = 587;
            smtp.Credentials = new System.Net.NetworkCredential("tiffindabba10@gmail.com", "102515209");


            smtp.Send(mm);
        }
        catch (Exception ex)
        {
            string Mail_msg = "Mail can't be sent because of server problem: ";
            Mail_msg += ex.Message;
            //Response.Write(Mail_msg);
            Label12.Text = Mail_msg;
            //ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Your Order is booked but mail is not send due to server problem');window.location='View_simple_tiffin_order.aspx'", true);
        }
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label12.Text = "";
    }
}