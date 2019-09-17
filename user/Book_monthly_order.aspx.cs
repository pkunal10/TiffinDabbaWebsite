using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class user_Book_monthly_order : System.Web.UI.Page
{
    DataCon dc = new DataCon();
    string oid;
    DateTime current_time = TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.Local, TimeZoneInfo.FindSystemTimeZoneById("India Standard Time"));
    DataSet ds4 = new DataSet();
    DateTime finish_date, start_date;
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
                DeleteCurrentOrder();

                Fill_order_details_panel.Visible = false;
                Order_details_panel.Visible = false;

                string jk = "select * from monthly_tiffin_menu where tiffin_id='" + Convert.ToString(Session["monthly_tiffin_id"]) + "'";
                ds4 = dc.getdata(jk);
                No_of_roti_lbl.Text = ds4.Tables[0].Rows[0][1].ToString();
                Price_lbl.Text = ds4.Tables[0].Rows[0][4].ToString();
                Tiffin_image.ImageUrl = ds4.Tables[0].Rows[0][11].ToString();
                Tiffin_image2.ImageUrl = ds4.Tables[0].Rows[0][11].ToString();

                //ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('"+current_time+"');", true);    
                DataSet ds = new DataSet();
                string oi = "select order_id from monthly_order order by order_id DESC";
                ds = dc.getdata(oi);

                if (ds.Tables[0].Rows.Count == 0)
                {
                    oid = "1";
                }
                else
                {
                    String s = ds.Tables[0].Rows[0][0].ToString();

                    int n = Convert.ToInt32(s);
                    n = n + 1;


                    oid = n.ToString();
                    //rid = Convert.ToString(Convert.ToInt32(ds3.Tables[0].Rows[0][0].ToString()) + 1);
                }

                Label1.Text = oid;
                DataSet ds1 = new DataSet();
                string j = "select name,eid from user_accounts where id='" + Session["uid"].ToString() + "'";
                ds1 = dc.getdata(j);
                Name_lbl.Text = ds1.Tables[0].Rows[0][0].ToString();
                Email_id_lbl.Text = ds1.Tables[0].Rows[0][1].ToString();

                DataSet ds11 = new DataSet();
                string order_check = "select no_of_days,start_date,finish_date,no_of_roti,price,uname from monthly_order where uid='" + Convert.ToString(Session["uid"]) + "'";
                ds11 = dc.getdata(order_check);

                if (ds11.Tables[0].Rows.Count == 0)
                {
                    Fill_order_details_panel.Visible = true;
                }
                else
                {
                    //string order_check_finish_date = ds11.Tables[0].Rows[0][2].ToString();
                    //DateTime order_check_final_finish_date = DateTime.ParseExact(order_check_finish_date, "dd/MM/yyyy", null);
                    //string today_date = current_time.ToLongDateString();


                    //int comp = DateTime.Compare(Convert.ToDateTime(today_date), order_check_final_finish_date);
                    //if (comp < 0 || comp == 0)
                    //{
                        Order_details_panel.Visible = true;
                        No_of_days_already_book_lbl.Text = ds11.Tables[0].Rows[0][0].ToString();
                        Finish_date_already_book_lbl.Text = ds11.Tables[0].Rows[0][2].ToString();
                        Start_date_already_book_lbl.Text = ds11.Tables[0].Rows[0][1].ToString();
                        Already_book_name_lbl.Text = ds11.Tables[0].Rows[0][5].ToString();
                        Finish_date_already_book_lbl2.Text = ds11.Tables[0].Rows[0][2].ToString();
                        Label2.Text = ds11.Tables[0].Rows[0][3].ToString();
                        Label3.Text = ds11.Tables[0].Rows[0][4].ToString();
                    //}
                    //else
                    //{
                       // Fill_order_details_panel.Visible = true;
                    //}
                }

            }
        }
    }

    private void DeleteCurrentOrder()
    {
        DataSet ds12=new DataSet();
        string jk = "select finish_date from monthly_order where uid='" + Convert.ToString(Session["uid"]) + "'";
        ds12 = dc.getdata(jk);

        if(ds12.Tables[0].Rows.Count!=0)
        {
           string td= current_time.ToString("dd/MM/yyyy");
            if(td==ds12.Tables[0].Rows[0][0].ToString())
            {
                string jkp = "delete from monthly_order where uid='" + Convert.ToString(Session["uid"]) + "'";
                dc.setdata(jkp);
            }
        }
    }
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList2.SelectedIndex == 0)
        {
            Start_date_lbl.Text = "";
            Finish_date_lbl.Text = "";
        }
        else if (DropDownList2.SelectedIndex == 1)
        {
            start_date = current_time.AddDays(1);
            finish_date = current_time.AddDays(15);
            string final_start_date = start_date.ToString("dd/MM/yyyy");
            string final_finish_date = finish_date.ToString("dd/MM/yyyy");
            Start_date_lbl.Text = final_start_date;
            Finish_date_lbl.Text = final_finish_date;
        }
        else if (DropDownList2.SelectedIndex == 2)
        {
            start_date = current_time.AddDays(1);
            finish_date = current_time.AddDays(30);
            string final_start_date = start_date.ToString("dd/MM/yyyy");
            string final_finish_date = finish_date.ToString("dd/MM/yyyy");
            Start_date_lbl.Text = final_start_date;
            Finish_date_lbl.Text = final_finish_date;
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedIndex == 0)
        {
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please Select Book For LUNCH or DINNER');", true);
        }
        else
        {
            if (DropDownList2.SelectedIndex == 0)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please Select No Of Days');", true);
            }
            else
            {
                if (CheckBox1.Checked == false)
                {
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please Agree To Terms And Conditions');", true);
                }
                else
                {
                    DataSet ds5 = new DataSet();
                    string j = "select * from monthly_order where uid='" + Convert.ToString(Session["uid"]) + "'";
                    ds5 = dc.getdata(j);
                    if (ds5.Tables[0].Rows.Count == 0)
                    {
                        insert_into_monthly_order();
                    }
                    else
                    {
                        update_monthly_order();
                    }

                }
            }
        }
    }

    private void update_monthly_order()
    {
        DataSet ds7 = new DataSet();
        string x = "select pid from monthly_tiffin_menu where tiffin_id='" + Convert.ToString(Session["monthly_tiffin_id"]) + "'";
        ds7 = dc.getdata(x);

        string kj = "update monthly_order set order_id='" + Label1.Text + "',book_for='" + DropDownList1.SelectedItem + "',tiffin_id='" + Session["monthly_tiffin_id"].ToString() + "',pid='" + ds7.Tables[0].Rows[0][0].ToString() + "',uname='" + Name_lbl.Text + "',ueid='" + Email_id_lbl.Text + "',mobile_no='" + TextBox1.Text + "',delivery_area='" + Session["delivery_area"].ToString() + "',delivery_add='" + TextBox2.Text + "',booking_date='" + current_time.ToLongDateString() + "',no_of_days='" + DropDownList2.SelectedItem + "',start_date='" + Start_date_lbl.Text + "',finish_date='" + Finish_date_lbl.Text + "',no_of_roti='" + No_of_roti_lbl.Text + "',price='" + Price_lbl.Text + "' where uid='" + Convert.ToString(Session["uid"]) + "'";
        dc.setdata(kj);
        ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Your Order Is Booked');window.location='Monthly_order.aspx';", true);
    }

    private void insert_into_monthly_order()
    {
        DataSet ds6 = new DataSet();
        string y = "select pid from monthly_tiffin_menu where tiffin_id='" + Convert.ToString(Session["monthly_tiffin_id"]) + "'";
        ds6 = dc.getdata(y);

        string z = "insert into monthly_order values('" + Label1.Text + "','" + DropDownList1.SelectedItem + "','" + Session["monthly_tiffin_id"].ToString() + "','" + ds6.Tables[0].Rows[0][0].ToString() + "','" + Session["uid"].ToString() + "','" + Name_lbl.Text + "','" + Email_id_lbl.Text + "','" + TextBox1.Text + "','" + Session["delivery_area"].ToString() + "','" + TextBox2.Text + "','" + current_time.ToLongDateString() + "','" + DropDownList2.SelectedItem + "','" + Start_date_lbl.Text + "','" + Finish_date_lbl.Text + "','" + No_of_roti_lbl.Text + "','" + Price_lbl.Text + "')";
        dc.setdata(z);
        ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Your Order Is Booked');window.location='Monthly_order.aspx';", true);
    }
}