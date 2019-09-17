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

public partial class admin_View_tiffin_with_sweet_order : System.Web.UI.Page
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
                string s = "select * from city";
                ds = dc.getdata(s);

                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    DropDownList6.Items.Add(ds.Tables[0].Rows[i][0].ToString());
                    DropDownList9.Items.Add(ds.Tables[0].Rows[i][0].ToString());
                }
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        DataSet ds = new DataSet();
        string s = "select * from tiffin_with_sweet_daily_order where order_id=" + TextBox1.Text;
        ds = dc.getdata(s);

        if (ds.Tables[0].Rows.Count != 0)
        {
            Label1.Text = "Details Of Order Id " + TextBox1.Text;
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
        else
        {
            Label1.Text = "";
            GridView1.DataSource = "";
            GridView1.DataBind();

            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Invalid Order Id');", true);
           // Response.Write("<script>alert('Invalid Order Id')</script>");
        }
    }
    protected void fp(object sender, CommandEventArgs e)
    {
        string j = e.CommandName.ToString();
        Session["pid"] = j;
        Response.Redirect("~/admin/Full_details_of_provider.aspx");
    }
    protected void fu(object sender, CommandEventArgs e)
    {
        string k = e.CommandName.ToString();
        Session["uid"] = k;
        Response.Redirect("~/admin/Full_details_of_user.aspx");
    }
    protected void full_details_of_order(object sender, CommandEventArgs e)
    {
        string y = e.CommandName.ToString();
        Session["tws_order_id"] = y;
        Response.Redirect("~/admin/Full_details_of_tiffin_with_sweet_order.aspx");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedIndex != 0)
        {
            DataSet ds1 = new DataSet();
            string j = "select * from tiffin_with_sweet_daily_order where pid='" + TextBox2.Text + "' and book_for='" + DropDownList1.Text + "'";
            ds1 = dc.getdata(j);

            if (ds1.Tables[0].Rows.Count != 0)
            {
                Label2.Text = "Order Details For " + DropDownList1.Text + " Of Provider Id " + TextBox2.Text;
                GridView2.DataSource = ds1;
                GridView2.DataBind();
            }
            else
            {
                Label2.Text = "";
                GridView2.DataSource = "";
                GridView2.DataBind();

                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Invalid Provider Id');", true);
                //Response.Write("<script>alert('Invalid Provider Id')</script>");
            }
        }
        else
        {

            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please Select Order For Lunch Or Dinner');", true);
            //Response.Write("<script>alert('Please Select Order For Lunch Or Dinner')</script>");
            Label2.Text = "";
            GridView2.DataSource = "";
            GridView2.DataBind();
        }
    }
    
    protected void Button3_Click(object sender, EventArgs e)
    {
        if (DropDownList2.SelectedIndex != 0)
        {
            DataSet ds2 = new DataSet();
            string k = "select * from tiffin_with_sweet_daily_order where date='" + TextBox3.Text + "' and book_for='" + DropDownList2.Text + "'";
            ds2 = dc.getdata(k);

            if (ds2.Tables[0].Rows.Count != 0)
            {
                Label3.Text = "Order Details For " + DropDownList2.Text + " Of Date " + TextBox3.Text;
                GridView3.DataSource = ds2;
                GridView3.DataBind();
            }
            else
            {
                Label3.Text = TextBox3.Text + " Date Has No Order For " + DropDownList2.Text;
                GridView3.DataSource = "";
                GridView3.DataBind();
            }
        }
        else
        {

            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please Select Order For Lunch Or Dinner');", true);
            //Response.Write("<script>alert('Please Select Order For Lunch Or Dinner')</script>");
            Label3.Text = "";
            GridView3.DataSource = "";
            GridView3.DataBind();
        }
    }
    
    protected void Button4_Click(object sender, EventArgs e)
    {
        if (DropDownList3.SelectedIndex != 0)
        {
            DataSet ds3 = new DataSet();
            string l = "select * from tiffin_with_sweet_daily_order where date='" + DateTime.Now.ToLongDateString() + "' and book_for='" + DropDownList3.Text + "'";
            ds3 = dc.getdata(l);

            if (ds3.Tables[0].Rows.Count != 0)
            {
                Label4.Text = "Today's Order Details For " + DropDownList3.Text + " Of Tiffin With Sweet";
                GridView4.DataSource = ds3;
                GridView4.DataBind();
            }
            else
            {
                Label4.Text = "No Orders Of Tiffin With Sweet For " + DropDownList3.Text + " Today";
                GridView4.DataSource = "";
                GridView4.DataBind();
            }
        }
        else
        {

            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please Select Order For Lunch Or Dinner');", true);
            //Response.Write("<script>alert('Please Select Order For Lunch Or Dinner')</script>");
            Label4.Text = "";
            GridView4.DataSource = "";
            GridView4.DataBind();
        }
    }
    
    protected void Button5_Click(object sender, EventArgs e)
    {
        if (DropDownList4.SelectedIndex != 0)
        {
            DataSet ds4 = new DataSet();
            string m = "select * from tiffin_with_sweet_daily_order where book_for='" + DropDownList4.Text + "'";
            ds4 = dc.getdata(m);

            if (ds4.Tables[0].Rows.Count != 0)
            {
                Label5.Text = "All Orders Of Tiffin With Sweet For " + DropDownList4.Text;
                GridView5.DataSource = ds4;
                GridView5.DataBind();
            }
            else
            {
                Label5.Text = "No Order Of Tiffin With Sweet For " + DropDownList4.Text + " Yet";
                GridView5.DataSource = "";
                GridView5.DataBind();
            }
        }
        else
        {

            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please Select Order For Lunch Or Dinner');", true);
            //Response.Write("<script>alert('Please Select Order For Lunch Or Dinner')</script>");
            Label5.Text = "";
            GridView5.DataSource = "";
            GridView5.DataBind();
        }
    }

    protected void DropDownList6_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataSet ds1 = new DataSet();

        if (DropDownList6.SelectedIndex == 0)
        {
            DropDownList7.Items.Clear();
            GridView6.DataSource = "";
            GridView6.DataBind();
            Label6.Text = "";
        }
        else
        {
            DropDownList7.Items.Insert(0, "--To Select--");
            string s = "select area from delivery_area where city='" + DropDownList6.Text + "'";
            ds1 = dc.getdata(s);

            for (int i = 0; i < ds1.Tables[0].Rows.Count; i++)
            {
                DropDownList7.Items.Add(ds1.Tables[0].Rows[i][0].ToString());
            }
        }
    }
    protected void DropDownList7_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList7.SelectedIndex == 0)
        {
            GridView6.DataSource = "";
            GridView6.DataBind();
            Label6.Text = "";
        }
    }
    protected void Button6_Click(object sender, EventArgs e)
    {
        if (DropDownList5.SelectedIndex == 0)
        {
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please Select Order For Lunch Or Dinner');", true);
            Label6.Text = "";
            GridView6.DataSource = "";
            GridView6.DataBind();
        }
        else
        {
            if (DropDownList6.SelectedIndex == 0)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please Select City');", true);
                Label6.Text = "";
                GridView6.DataSource = "";
                GridView6.DataBind();
            }
            else
            {
                if (DropDownList7.SelectedIndex == 0)
                {
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please Select Area');", true);
                    Label6.Text = "";
                    GridView6.DataSource = "";
                    GridView6.DataBind();
                }
                else
                {
                    DataSet ds10 = new DataSet();
                    string j = "select * from tiffin_with_sweet_daily_order where date='" + DateTime.Now.ToLongDateString() + "' and book_for='" + DropDownList5.Text + "' and delivery_area='" + DropDownList7.Text + "'";
                    ds10 = dc.getdata(j);
                    if (ds10.Tables[0].Rows.Count != 0)
                    {
                        Label6.Text = "Today's Orders Of Tiffin With Sweet For " + DropDownList5.SelectedItem + " In:-  " + DropDownList7.SelectedItem;
                        GridView6.DataSource = ds10;
                        GridView6.DataBind();
                    }
                    else
                    {
                        Label6.Text = "No Orders Of Tiffin With Sweet In:-  " + DropDownList7.SelectedItem + "  For " + DropDownList5.Text + " Today";
                        GridView6.DataSource = ds10;
                        GridView6.DataBind();
                    }
                }
            }
        }
    }
    protected void DropDownList9_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataSet ds1 = new DataSet();

        if (DropDownList9.SelectedIndex == 0)
        {
            DropDownList10.Items.Clear();
            GridView7.DataSource = "";
            GridView7.DataBind();
            Label7.Text = "";
        }
        else
        {
            DropDownList10.Items.Insert(0, "--To Select--");
            string s = "select area from delivery_area where city='" + DropDownList9.Text + "'";
            ds1 = dc.getdata(s);

            for (int i = 0; i < ds1.Tables[0].Rows.Count; i++)
            {
                DropDownList10.Items.Add(ds1.Tables[0].Rows[i][0].ToString());
            }
        }
    }
    protected void DropDownList10_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList10.SelectedIndex == 0)
        {
            GridView7.DataSource = "";
            GridView7.DataBind();
            Label7.Text = "";
        }
    }
    protected void Button7_Click(object sender, EventArgs e)
    {
        if (DropDownList8.SelectedIndex == 0)
        {
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please Select Order For Lunch Or Dinner');", true);
            Label7.Text = "";
            GridView7.DataSource = "";
            GridView7.DataBind();
        }
        else
        {
            if (DropDownList9.SelectedIndex == 0)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please Select City');", true);
                Label7.Text = "";
                GridView7.DataSource = "";
                GridView7.DataBind();
            }
            else
            {
                if (DropDownList10.SelectedIndex == 0)
                {
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please Select Area');", true);
                    Label7.Text = "";
                    GridView7.DataSource = "";
                    GridView7.DataBind();
                }
                else
                {
                    DataSet ds10 = new DataSet();
                    string j = "select * from tiffin_with_sweet_daily_order where delivery_area='" + DropDownList10.Text + "'";
                    ds10 = dc.getdata(j);
                    if (ds10.Tables[0].Rows.Count != 0)
                    {
                        Label7.Text = "All Orders Of Tiffin With Sweet For " + DropDownList8.SelectedItem + " In:-  " + DropDownList10.SelectedItem;
                        GridView7.DataSource = ds10;
                        GridView7.DataBind();
                    }
                    else
                    {
                        Label7.Text = "No Orders Of Tiffin With Sweet In:-  " + DropDownList10.SelectedItem + "  For " + DropDownList8.Text + " Yet";
                        GridView7.DataSource = "";
                        GridView7.DataBind();
                    }
                }
            }
        }
    }
    protected void Button8_Click(object sender, EventArgs e)
    {
        using (StringWriter sw = new StringWriter())
        {
            using (HtmlTextWriter hw = new HtmlTextWriter(sw))
            {
                StringBuilder sb = new StringBuilder();

                //my own pdf start

                //Company name block start

                sb.Append("<table border='1'>");
                sb.Append("<tr>");
                sb.Append("<td colspan='2'>");
                sb.Append("Company Name:- Tiffin Dabba");
                sb.Append("</td>");
                sb.Append("<td colspan='2'>");
                sb.Append("Date:- " + DateTime.Now.ToLongDateString());
                sb.Append("</td>");
                sb.Append("</tr>");
                sb.Append("<tr>");
                sb.Append("<td colspan='2'>");
                sb.Append("Orders Of:- " + DropDownList3.SelectedItem);
                sb.Append("</td>");
                sb.Append("<td colspan='2'>");
                sb.Append("Tiffin Type:- Tiffin With Seet");
                sb.Append("</td>");
                sb.Append("</tr>");
                sb.Append("<tr>");
                sb.Append("<td colspan='4' align='center'>");
                sb.Append("-:Orders Are:-");
                sb.Append("</td>");
                sb.Append("</tr>");
                sb.Append("</table>");

                //Company name block finish

                //sheet block start
                sb.Append("<table border='1'>");
                sb.Append("<tr>");
                sb.Append("<th style='width:50px;'>");
                sb.Append("<font style='font-size:10px;'>Order Id</font>");
                sb.Append("</th>");
                sb.Append("<th>");
                sb.Append("<font style='font-size:10px;'>Name</font>");
                sb.Append("</th>");
                sb.Append("<th>");
                sb.Append("<font style='font-size:10px;'>Mob.No</font>");
                sb.Append("</th>");
                sb.Append("<th>");
                sb.Append("<font style='font-size:10px;'>Address</font>");
                sb.Append("</th>");
                sb.Append("<th>");
                sb.Append("<font style='font-size:10px;'>Sabji</font>");
                sb.Append("</th>");
                sb.Append("<th>");
                sb.Append("<font style='font-size:10px;'>Roti</font>");
                sb.Append("</th>");
                sb.Append("<th>");
                sb.Append("<font style='font-size:10px;'>Dal</font>");
                sb.Append("</th>");
                sb.Append("<th>");
                sb.Append("<font style='font-size:10px;'>Rice</font>");
                sb.Append("</th>");
                sb.Append("<th>");
                sb.Append("<font style='font-size:10px;'>Sweet</font>");
                sb.Append("</th>");
                sb.Append("<th>");
                sb.Append("<font style='font-size:10px;'>Price</font>");
                sb.Append("</th>");
                sb.Append("<th>");
                sb.Append("<font style='font-size:10px;'>Sign.</font>");
                sb.Append("</th>");
                sb.Append("</tr>");

                foreach (GridViewRow gr in GridView4.Rows)
                {
                    LinkButton lb_o_id = (LinkButton)gr.FindControl("LinkButton14");
                    Label name_lbl = (Label)gr.FindControl("name_lbl");
                    Label del_add_lbl = (Label)gr.FindControl("del_add_lbl");
                    Label mob_lbl = (Label)gr.FindControl("mob_lbl");
                    Label sabji_lbl = (Label)gr.FindControl("sabji_lbl");
                    Label roti_lbl = (Label)gr.FindControl("roti_lbl");
                    Label dal_lbl = (Label)gr.FindControl("dal_lbl");
                    Label chawal_lbl = (Label)gr.FindControl("chawal_lbl");
                    Label sweet_lbl = (Label)gr.FindControl("sweet_lbl");
                    Label price_lbl = (Label)gr.FindControl("price_lbl");


                    sb.Append("<tr>");
                    sb.Append("<td>");
                    sb.Append("<font style='font-size:8px;'>" + lb_o_id.Text + "</font>");
                    sb.Append("</td>");

                    sb.Append("<td>");
                    sb.Append("<font style='font-size:8px;'>" + name_lbl.Text + "</font>");
                    sb.Append("</td>");

                    sb.Append("<td>");
                    sb.Append("<font style='font-size:8px;'>" + mob_lbl.Text + "</font>");
                    sb.Append("</td>");

                    sb.Append("<td>");
                    sb.Append("<font style='font-size:8px;'>" + del_add_lbl.Text + "</font>");
                    sb.Append("</td>");

                    sb.Append("<td>");
                    sb.Append("<font style='font-size:8px;'>" + sabji_lbl.Text + "</font>");
                    sb.Append("</td>");

                    sb.Append("<td>");
                    sb.Append("<font style='font-size:8px;'>" + roti_lbl.Text + "</font>");
                    sb.Append("</td>");

                    sb.Append("<td>");
                    sb.Append("<font style='font-size:8px;'>" + dal_lbl.Text + "</font>");
                    sb.Append("</td>");

                    sb.Append("<td>");
                    sb.Append("<font style='font-size:8px;'>" + chawal_lbl.Text + "</font>");
                    sb.Append("</td>");

                    sb.Append("<td>");
                    sb.Append("<font style='font-size:8px;'>" + sweet_lbl.Text + "</font>");
                    sb.Append("</td>");

                    sb.Append("<td>");
                    sb.Append("<font style='font-size:8px;'>" + price_lbl.Text + "</font>");
                    sb.Append("</td>");

                    sb.Append("<td>");
                    sb.Append("</td>");

                    sb.Append("</tr>");


                }
                sb.Append("</table>");



                //sheet block finish


                //Export HTML String as PDF.
                StringReader sr = new StringReader(sb.ToString());
                Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);
                HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
                PdfWriter writer = PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
                pdfDoc.Open();
                htmlparser.Parse(sr);
                pdfDoc.Close();
                Response.ContentType = "application/pdf";
                Response.AddHeader("content-disposition", "attachment;filename=Tiffin With Sweet Order Sheet Of " + DropDownList3.Text + " On " + DateTime.Now.ToLongDateString() + ".pdf");
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                Response.Write(pdfDoc);
                Response.End();
            }
        }
    }
}