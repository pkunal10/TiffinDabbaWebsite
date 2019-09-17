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
using System.Configuration;
using System.IO;

public partial class user_SpecialTiffinOrder : System.Web.UI.Page
{
    DataCon dc = new DataCon();
    DateTime current_time = TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.Local, TimeZoneInfo.FindSystemTimeZoneById("India Standard Time"));
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
                DateLbl.Text = current_time.ToLongDateString();
                TimeLbl.Text = current_time.ToLongTimeString();

                string jk = "select address from user_accounts where id='" + Convert.ToString(Session["uid"]) + "'";
                DataSet dsjk = new DataSet();
                dsjk = dc.getdata(jk);

                DelAddressTb.Text = dsjk.Tables[0].Rows[0][0].ToString();

                string jkp = "select * from specialtiffin where TiffinId='" + Convert.ToString(Session["sptid"]) + "'";
                DataSet dsjkp = new DataSet();
                dsjkp = dc.getdata(jkp);

                TiffinNameLbl.Text = dsjkp.Tables[0].Rows[0][3].ToString();
                Descriptionlbl.Text = dsjkp.Tables[0].Rows[0][4].ToString();
                PriceLbl.Text = dsjkp.Tables[0].Rows[0][5].ToString();
                Tiffin_Image.ImageUrl = dsjkp.Tables[0].Rows[0][10].ToString();
            }
        }
    }
    protected void ChangeAddBtn_Click(object sender, EventArgs e)
    {
        DelAddressTb.Enabled = true;
    }
    protected void ConfirmOdrBtn_Click(object sender, EventArgs e)
    {
        DateTime start_time, end_time;
        if (TermsChk.Checked == true)
        {
            string jkp = "select StartTime,EndTime from specialtiffin where TiffinId='" + Convert.ToString(Session["sptid"]) + "'";
            DataSet dsjkp = new DataSet();
            dsjkp = dc.getdata(jkp);

            start_time = Convert.ToDateTime(dsjkp.Tables[0].Rows[0][0].ToString());
            end_time = Convert.ToDateTime(dsjkp.Tables[0].Rows[0][1].ToString());

            if (current_time >= start_time && current_time <= end_time)
            {
                BookOrder();
                //ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Can Book');", true);
            }
            else
            {
                string errMsg = "you can book this tiffin from " + start_time.ToString("hh:mm tt") + " to " + end_time.ToString("hh:mm tt");
                InfoLbl.Text = errMsg;
            }
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please Agree to terms and condition');", true);
        }
    }

    private void BookOrder()
    {
        string jk = "insert into SpecialTiffinOrder (UserId,TiffinId,DelCity,DelArea,DelAddress,BookDate,BookTime,IsRead,IsDelivered,IsCancelled) values('" + Convert.ToString(Session["uid"]) + "','" +
                   Convert.ToString(Session["sptid"]) + "','" + Convert.ToString(Session["delivery_city"]) + "','" + Convert.ToString(Session["delivery_area"]) + "','" + DelAddressTb.Text + "','" +
                   DateLbl.Text + "','" + TimeLbl.Text + "',0,0,0)";
        dc.setdata(jk);

        string provider = "select ProviderId from SpecialTiffin where TiffinId='" + Convert.ToString(Session["sptid"]) + "'";
        DataSet dsProvider = new DataSet();
        dsProvider = dc.getdata(provider);

        string providerDetails = "select * from providers where pid='" + dsProvider.Tables[0].Rows[0][0].ToString() + "'";
        DataSet dsProviderDetails = new DataSet();
        dsProviderDetails = dc.getdata(providerDetails);

        string providerName = dsProviderDetails.Tables[0].Rows[0][1].ToString();
        string providerMobile = dsProviderDetails.Tables[0].Rows[0][3].ToString();
        string providerEmail = dsProviderDetails.Tables[0].Rows[0][4].ToString();

        string user = "select * from user_accounts where id='" + Convert.ToString(Session["uid"]) + "'";
        DataSet dsUser = new DataSet();
        dsUser = dc.getdata(user);

        string userName = dsUser.Tables[0].Rows[0][1].ToString();
        string userMobile = dsUser.Tables[0].Rows[0][3].ToString();
        string userEmail = dsUser.Tables[0].Rows[0][5].ToString();

        string msgAdmin = "Hello Admin, We are from Tiffin Dabba new Special Tiffin order booked.Tiffin Name:-  " + TiffinNameLbl.Text + " , Price:-  " + PriceLbl.Text + " Rs.";
        string msgProvider = "Hello " + providerName + ", We are from Tiffin Dabba new Special Tiffin order booked.Tiffin Name:-  " + TiffinNameLbl.Text;
        string msgUser = "Hello " + userName + ", We are from Tiffin Dabba,You booked Special Tiffin.Tiffin Name:-  " + TiffinNameLbl.Text + ", Price:-  " + PriceLbl.Text + " Rs.";

        Thread thread = new Thread(delegate()
        {
            SendMsgAdmin(msgAdmin);
            SendMsgProvider(msgProvider, providerMobile);
            SendMsgUser(msgUser, userMobile);
            
            SendEmailUser(msgUser, userEmail);            
        });

        thread.IsBackground = true;
        thread.Start();

        //ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Your Order Is Booked You Can Check From Simple Tiffin Order Page');window.location='View_simple_tiffin_order.aspx';", true);
        ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Your Order Is Booked.');", true);
    }

    private void SendEmailUser(string msgUser, string userEmail)
    {
        try
        {
            MailMessage mm = new MailMessage();
            mm.From = new MailAddress("tiffindabba10@gmail.com", "TIFFIN DABBA");//TIFFIN DABBA represent title in sent email.
            mm.To.Add(userEmail);
            mm.Subject = "Order Details";
            //mm.Body = "Hello: " + Label2.Text + "<br /><br />You book simple tiffin for DINNER from TIFFIN DABBA.<br />Your Menu of tiffin is given below:<br />" + "Order Id:  " + Label1.Text +
            //          "<br />Sabji:  " + Label5.Text + "<br />Roti:  " + Label6.Text + "<br />Dal:  " + Label7.Text + "<br />Chawal:  " + Label8.Text + "<br />Total Bill:  " + Label9.Text +
            //          "Rs.<br />You recived your tiffin at Delivery Address given by you at order time between 07:00 PM to 08:00  PM";


            mm.Body = msgUser;
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
            
        }
    }

    private void SendMsgUser(string msgUser, string userMobile)
    {
        string authKey = ConfigurationManager.AppSettings["authkey"].ToString();
        string route = ConfigurationManager.AppSettings["route"].ToString();
        string country = ConfigurationManager.AppSettings["country"].ToString();
        string sender = ConfigurationManager.AppSettings["sender"].ToString();
        // string mobile_no = pr_info_ds.Tables[0].Rows[0][3].ToString();
        //string pr_name = pr_info_ds.Tables[0].Rows[0][1].ToString();

        var link = "authkey=" + authKey + "&mobiles=" + userMobile + "&message=" + msgUser + "&sender=" + sender + "&route=" + route + "&country=" + country;
        //var link = "authkey=" + authKey + "&mobiles=8875296256&message=" + msg + "&sender=" + sender + "&route=" + route + "&country=" + country;

        string final_link = "https://control.msg91.com/api/sendhttp.php?" + link;

        //Response.Redirect(final_link);
        //Response.End();


        HttpWebRequest request = (HttpWebRequest)WebRequest.Create(final_link);

        HttpWebResponse response = (HttpWebResponse)request.GetResponse();
        StreamReader responseReader = new StreamReader(response.GetResponseStream());

        String resultmsg = responseReader.ReadToEnd();
        responseReader.Close();
    }

    private void SendMsgProvider(string msgProvider, string providerMobile)
    {
        string authKey = ConfigurationManager.AppSettings["authkey"].ToString();
        string route = ConfigurationManager.AppSettings["route"].ToString();
        string country = ConfigurationManager.AppSettings["country"].ToString();
        string sender = ConfigurationManager.AppSettings["sender"].ToString();
        // string mobile_no = pr_info_ds.Tables[0].Rows[0][3].ToString();
        //string pr_name = pr_info_ds.Tables[0].Rows[0][1].ToString();

        var link = "authkey=" + authKey + "&mobiles=" + providerMobile + "&message=" + msgProvider + "&sender=" + sender + "&route=" + route + "&country=" + country;
        //var link = "authkey=" + authKey + "&mobiles=8875296256&message=" + msg + "&sender=" + sender + "&route=" + route + "&country=" + country;

        string final_link = "https://control.msg91.com/api/sendhttp.php?" + link;

        //Response.Redirect(final_link);
        //Response.End();


        HttpWebRequest request = (HttpWebRequest)WebRequest.Create(final_link);

        HttpWebResponse response = (HttpWebResponse)request.GetResponse();
        StreamReader responseReader = new StreamReader(response.GetResponseStream());

        String resultmsg = responseReader.ReadToEnd();
        responseReader.Close();
    }

    private void SendMsgAdmin(string msgAdmin)
    {
        string authKey = ConfigurationManager.AppSettings["authkey"].ToString();
        string route = ConfigurationManager.AppSettings["route"].ToString();
        string country = ConfigurationManager.AppSettings["country"].ToString();
        string sender = ConfigurationManager.AppSettings["sender"].ToString();
        // string mobile_no = pr_info_ds.Tables[0].Rows[0][3].ToString();
        //string pr_name = pr_info_ds.Tables[0].Rows[0][1].ToString();

        var link = "authkey=" + authKey + "&mobiles=8875041417&message=" + msgAdmin + "&sender=" + sender + "&route=" + route + "&country=" + country;
        //var link = "authkey=" + authKey + "&mobiles=8875296256&message=" + msg + "&sender=" + sender + "&route=" + route + "&country=" + country;

        string final_link = "https://control.msg91.com/api/sendhttp.php?" + link;

        //Response.Redirect(final_link);
        //Response.End();


        HttpWebRequest request = (HttpWebRequest)WebRequest.Create(final_link);

        HttpWebResponse response = (HttpWebResponse)request.GetResponse();
        StreamReader responseReader = new StreamReader(response.GetResponseStream());

        String resultmsg = responseReader.ReadToEnd();
        responseReader.Close();
    }
}