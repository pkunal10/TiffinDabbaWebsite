using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Threading;

public partial class admin_Full_details_of_order : System.Web.UI.Page
{
    DataCon dc = new DataCon();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack != true)
        {
            if (Convert.ToString(Session["aid"]) == "")
            {
                Session["msg"] = "Please Log In First";
                Response.Redirect("~/Log_In.aspx");
            }
            else
            {
                Label18.Text = "";
                DataSet ds = new DataSet();
                string j = "select * from simple_tiffin_daily_order where order_id=" + Session["st_order_id"];
                ds = dc.getdata(j);

                Label4.Text = "Full Simple Tiffin Order Details Of :- " + ds.Tables[0].Rows[0][0].ToString();
                Label1.Text = ds.Tables[0].Rows[0][0].ToString();
                Label2.Text = ds.Tables[0].Rows[0][1].ToString();
                Label3.Text = ds.Tables[0].Rows[0][2].ToString();
                LinkButton1.Text = ds.Tables[0].Rows[0][3].ToString();
                LinkButton2.Text = ds.Tables[0].Rows[0][4].ToString();
                Label6.Text = ds.Tables[0].Rows[0][5].ToString();
                Label7.Text = ds.Tables[0].Rows[0][6].ToString();
                Label8.Text = ds.Tables[0].Rows[0][7].ToString();
                Label9.Text = ds.Tables[0].Rows[0][8].ToString();
                Label10.Text = ds.Tables[0].Rows[0][9].ToString();
                Label5.Text = ds.Tables[0].Rows[0][10].ToString();
                Label11.Text = ds.Tables[0].Rows[0][11].ToString();
                Label12.Text = ds.Tables[0].Rows[0][12].ToString();
                Label13.Text = ds.Tables[0].Rows[0][13].ToString();
                Label14.Text = ds.Tables[0].Rows[0][14].ToString();
                Label15.Text = ds.Tables[0].Rows[0][15].ToString();
                Other_lbl.Text = ds.Tables[0].Rows[0][16].ToString();
                Label16.Text = ds.Tables[0].Rows[0][17].ToString();
                Image1.ImageUrl = ds.Tables[0].Rows[0][18].ToString();
                Label17.Text = ds.Tables[0].Rows[0][19].ToString();
            }
        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Label18.Text = "";
        Session["pid"] = LinkButton1.Text;
        Response.Redirect("~/admin/Full_details_of_provider.aspx");
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Label18.Text = "";
        Session["uid"] = LinkButton2.Text;
        Response.Redirect("~/admin/Full_details_of_user.aspx");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        using (StringWriter sw = new StringWriter())
        {
            Label18.Text = "";
            using (HtmlTextWriter hw = new HtmlTextWriter(sw))
            {
                StringBuilder sb = new StringBuilder();

                //my own pdf start

                //Company name block start

                sb.Append("<table border='1' height='72%' style='width:350px'>");
                sb.Append("<tr height='10%'>");
                sb.Append("<td rowspan='2' colspan='2' style='width:100px'>");
                sb.Append("<font style='color:red;'>Company Name:-TIFFIN DABBA</font>");
                sb.Append("<br><br>");
                sb.Append("Order Id:- ");
                sb.Append(Label1.Text);
                sb.Append("</td>");
                sb.Append("<td rowspan='2' colspan='2' style='width:250px'>");
                sb.Append("Date:- " + Label9.Text);
                sb.Append("<br><br>");
                sb.Append("Order For:- " + Label2.Text);
                sb.Append("</td>");
                sb.Append("</tr>");

                //Company name block finish

                //User Details block start

                sb.Append("<tr height='10%'>");
                sb.Append("<td colspan='4' align='center'>");
                sb.Append("<h1>User Details</h1>");
                sb.Append("</td>");
                sb.Append("</tr>");

                sb.Append("<tr height='12%'>");
                sb.Append("<td rowspan='2' colspan='2'>");
                sb.Append("Name:- " + Label6.Text);
                sb.Append("<br><br>");
                sb.Append("Mobile No:- " + Label10.Text);
                sb.Append("</td>");
                sb.Append("<td rowspan='2' colspan='2'>");
                sb.Append("Delivery Address:- " + Label11.Text);
                sb.Append("</td>");
                sb.Append("</tr>");

                //User Details block finish
                
                //Menu Block start

                sb.Append("<tr height='10%'>");
                sb.Append("<td colspan='4' align='center'>");
                sb.Append("<h1>Menu Of Your Simple Tiffin</h1>");
                sb.Append("</td>");
                sb.Append("</tr>");

                sb.Append("<tr height='10%'>");
                sb.Append("<td colspan='4' align='center'>");
                sb.Append("Sabji:- "+Label12.Text);
                sb.Append("</td>");
                sb.Append("</tr>");

                sb.Append("<tr height='10%'>");
                sb.Append("<td colspan='4' align='center'>");
                sb.Append("Roti:- " + Label13.Text);
                sb.Append("</td>");
                sb.Append("</tr>");

                sb.Append("<tr height='10%'>");
                sb.Append("<td colspan='4' align='center'>");
                sb.Append("Dal:- " + Label14.Text);
                sb.Append("</td>");
                sb.Append("</tr>");

                sb.Append("<tr height='10%'>");
                sb.Append("<td colspan='4' align='center'>");
                sb.Append("Chawal:- " + Label15.Text);
                sb.Append("</td>");
                sb.Append("</tr>");

                sb.Append("<tr height='10%'>");
                sb.Append("<td colspan='4' align='right'>");
                sb.Append("Total Bill:- " + Label16.Text +"Rs. (Inclusive All Taxes)");
                sb.Append("</td>");
                sb.Append("</tr>");

                sb.Append("</table>");

                //menu Block finish

                //my own pdf finish


                

                //Export HTML String as PDF.
                StringReader sr = new StringReader(sb.ToString());
                Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);
                HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
                PdfWriter writer = PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
                pdfDoc.Open();
                htmlparser.Parse(sr);
                pdfDoc.Close();
                Response.ContentType = "application/pdf";
                Response.AddHeader("content-disposition", "attachment;filename=Invoice_Order_Id " + Label1.Text + ".pdf");
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                Response.Write(pdfDoc);
                Response.End();
            }
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Label18.Text = "";
        send_depart_email();
    }

    private void send_depart_email()
    {
        try
        {

            MailMessage mm = new MailMessage();
            mm.From = new MailAddress("tiffindabba10@gmail.com", "TIFFIN DABBA");//TIFFIN DABBA represent title in sent email.
            mm.To.Add(Label7.Text);
            mm.Subject = "Departure Email";
            mm.Body = "Hello:  " + Label6.Text + "<br /><br /> Your order for " + Label2.Text + " of Simple Tiffin is Departure from here. you will get your Simple Tiffin " +
                "with in one hour.<br /><br /> Your menu is given below:<br />" + "Order Id:  " + Label1.Text + "<br />Sabji:  " + Label12.Text +
                          "<br />Roti:  " + Label13.Text + "<br />Dal:  " + Label14.Text + "<br />Chawal:  " + Label15.Text + "<br />Price:   " + Label16.Text;

            mm.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.EnableSsl = true;
            smtp.Port = 587;
            smtp.Credentials = new System.Net.NetworkCredential("tiffindabba10@gmail.com", "102515209");


            smtp.Send(mm);

            Label18.Text = "";
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Departure Email Is Sent');", true);
        }
        catch (Exception ex)
        {
            Label18.Text = "Email Sending is failed due to server error please try again";
        }
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        string s = "update simple_tiffin_daily_order set status='Delivered' where order_id=" + Label1.Text;
        dc.setdata(s);

        DataSet ds10 = new DataSet();
        string j = "select * from simple_tiffin_daily_order where order_id=" + Label1.Text;       
        ds10 = dc.getdata(j);
        Label17.Text = ds10.Tables[0].Rows[0][18].ToString();

        ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('This tiffin is delireved');", true);
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        DataSet ds11 = new DataSet();
        DataSet ds12 = new DataSet();

        string p = "select * from simple_tiffin_daily_order where uid='" + LinkButton2.Text + "' and status='Cancelled'"; 
        ds11 = dc.getdata(p);

        string q = "select * from tiffin_with_sweet_daily_order where uid='" + LinkButton2.Text + "' and status='Cancelled'";
        ds12 = dc.getdata(q);

        int no_cnc_st = ds11.Tables[0].Rows.Count;
        int no_cnc_tws = ds12.Tables[0].Rows.Count;
        int total_cnc_tiffin = no_cnc_st + no_cnc_tws;

        if (total_cnc_tiffin == 0)
        {
            update_status();
        }
        else if (total_cnc_tiffin == 1)
        {
            Thread email = new Thread(delegate()
                {
                    send_warning_email();
                });
            email.IsBackground = true;
            email.Start();
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Warning Email Is Sent');", true);

            update_status();
        }
        else if (total_cnc_tiffin == 2)
        {
            block_user();
        }
    }

    private void block_user()
    {
        string jk = "update user_accounts set status='Blocked' where id='" + LinkButton2.Text + "'";
        dc.setdata(jk);

        DataSet ds10 = new DataSet();
        string j = "select * from simple_tiffin_daily_order where order_id=" + Label1.Text;
        ds10 = dc.getdata(j);
        Label17.Text = ds10.Tables[0].Rows[0][18].ToString();

        string pj = "insert into cancelled_simple_tiffin_daily_order values('" + Label1.Text + "','" + Label2.Text + "','" + Label3.Text + "','" + LinkButton1.Text + "','" + LinkButton2.Text + "','" + Label6.Text + "','" + Label7.Text + "','" + Label8.Text + "','" + Label9.Text + "','" + Label10.Text + "','" + Label5.Text + "','" + Label11.Text + "','" + Label12.Text + "','" + Label13.Text + "','" + Label14.Text + "','" + Label15.Text + "','" + Label16.Text + "','" + ds10.Tables[0].Rows[0][17].ToString() + "')";
        dc.setdata(pj);

        string jp = "delete from simple_tiffin_daily_order where order_id=" + Label1.Text;
        dc.setdata(jp);

        Thread email = new Thread(delegate()
        {
            send_blocking_info_email();
        });
        email.IsBackground = true;
        email.Start();

        ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('This user is blocked now.');window.location='View_users.aspx';", true);
    }

    private void send_blocking_info_email()
    {
        try
        {

            MailMessage mm = new MailMessage();
            mm.From = new MailAddress("tiffindabba10@gmail.com", "TIFFIN DABBA");//TIFFIN DABBA represent title in sent email.
            mm.To.Add(Label7.Text);
            mm.Subject = "Your account is blocked";
            mm.Body = "Hello:  " + Label6.Text + "<br /><br />SORRY !!<br /> You cancelled your order from TIFFIN DABBA more than twice.now your TIFFIN DABBA account is blocked." +
                " To acivate please contact us on following Email Id.<br ><br />tiffindabba10@gmail.com<br /><br /><br />Thank You<br />&nbsp;&nbsp;&nbsp;&nbsp;-TIFFIN DABBA";


            mm.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.EnableSsl = true;
            smtp.Port = 587;
            smtp.Credentials = new System.Net.NetworkCredential("tiffindabba10@gmail.com", "102515209");


            smtp.Send(mm);

            Label18.Text = "";
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Blocking info  Email Is Sent');", true);
        }
        catch (Exception ex)
        {
            Label18.Text = "Email Sending is failed due to server error please try again";
        }
    }

    private void send_warning_email()
    {
        try
        {

            MailMessage mm = new MailMessage();
            mm.From = new MailAddress("tiffindabba10@gmail.com", "TIFFIN DABBA");//TIFFIN DABBA represent title in sent email.
            mm.To.Add(Label7.Text);
            mm.Subject = "Warning Email";
            mm.Body = "Hello:  " + Label6.Text + "<br /><br /> It is second time you cancelled your order at TIFFIN DABBA.If it happened again your account" +
                " will be blocked from site.<br /><br /><br />Thank You<br />&nbsp;&nbsp;&nbsp;&nbsp;-TIFFIN DABBA";
                

            mm.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.EnableSsl = true;
            smtp.Port = 587;
            smtp.Credentials = new System.Net.NetworkCredential("tiffindabba10@gmail.com", "102515209");


            smtp.Send(mm);

            Label18.Text = "";
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Warning Email Is Sent');", true);
        }
        catch (Exception ex)
        {
            Label18.Text = "Email Sending is failed due to server error please try again";
        }       
    }

    private void update_status()
    {
        string r = "update simple_tiffin_daily_order set status='Cancelled' where order_id=" + Label1.Text;
        dc.setdata(r);

        DataSet ds10 = new DataSet();
        string j = "select * from simple_tiffin_daily_order where order_id=" + Label1.Text;
        ds10 = dc.getdata(j);
        Label17.Text = ds10.Tables[0].Rows[0][18].ToString();

        string jk = "insert into cancelled_simple_tiffin_daily_order values('" + Label1.Text + "','" + Label2.Text + "','" + Label3.Text + "','" + LinkButton1.Text + "','" + LinkButton2.Text + "','" + Label6.Text + "','" + Label7.Text + "','" + Label8.Text + "','" + Label9.Text + "','" + Label10.Text + "','" + Label5.Text + "','" + Label11.Text + "','" + Label12.Text + "','" + Label13.Text + "','" + Label14.Text + "','" + Label15.Text + "','" + Label16.Text + "','" + ds10.Tables[0].Rows[0][17].ToString() + "')";
        dc.setdata(jk);

        ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('This order is cancelled');", true);
    }
}