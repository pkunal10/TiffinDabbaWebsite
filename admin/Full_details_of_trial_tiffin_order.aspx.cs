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

public partial class admin_Full_details_of_trial_tiffin_order : System.Web.UI.Page
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
                string j = "select * from trial_tiffin_order where order_id=" + Session["tt_order_id"];
                ds = dc.getdata(j);

                Label4.Text = "Full Trial Tiffin Order Details Of :- " + ds.Tables[0].Rows[0][0].ToString();
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
                Label13.Text = ds.Tables[0].Rows[0][12].ToString();
                Label16.Text = ds.Tables[0].Rows[0][13].ToString();
                Image1.ImageUrl = ds.Tables[0].Rows[0][14].ToString();
                Label17.Text = ds.Tables[0].Rows[0][15].ToString();
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
                sb.Append("No Of Roti:- " + Label13.Text);
                sb.Append("</td>");
                sb.Append("</tr>");

                sb.Append("<tr height='10%'>");
                sb.Append("<td colspan='4' align='right'>");
                sb.Append("Total Bill:- " + Label16.Text + "Rs. (Inclusive All Taxes)");
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
                Response.AddHeader("content-disposition", "attachment;filename=Invoice_trial_tiffin_Order_Id " + Label1.Text + ".pdf");
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
            mm.Body = "Hello:  " + Label6.Text + "<br /><br /> Your order for " + Label2.Text + " of Trial Tiffin is Departure from here. you will get your Trial Tiffin " +
                "with in one hour.<br /><br /> Your menu is given below:<br />" + "Order Id:  " + Label1.Text + "<br />No Of Roti:  " + Label13.Text + "<br />Price:   " + Label16.Text;

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
        string s = "update trial_tiffin_order set status='Delivered' where order_id=" + Label1.Text;
        dc.setdata(s);

        DataSet ds10 = new DataSet();
        string j = "select * from trial_tiffin_order where order_id=" + Label1.Text;
        ds10 = dc.getdata(j);
        Label17.Text = ds10.Tables[0].Rows[0][15].ToString();

        ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('This tiffin is delireved');", true);
    }
}