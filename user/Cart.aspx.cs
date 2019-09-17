using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.Net;
using System.IO;
using System.Net.Mail;
using System.Threading;
using System.Configuration;

public partial class user_Cart : System.Web.UI.Page
{
    DataCon dc = new DataCon();
    //zk = new List<int>();
    DataSet ds = new DataSet();
    int subtotal = 0;
    string oid;
    int charge_limit = 0, del_charge = 0;
    List<Cart> list = new List<Cart>();
    List<Cart> ListForMsg = new List<Cart>();
    List<string> ProviderIds = new List<string>();
    List<string> DisProviderIds = new List<string>();
    DateTime current_time = TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.Local, TimeZoneInfo.FindSystemTimeZoneById("India Standard Time"));
    DateTime start_time, end_time;
    DataSet ds10 = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        #region Delivery Charges Get

        string jkp = "select * from delivery_charges";
        DataSet dsCharge = new DataSet();
        dsCharge = dc.getdata(jkp);
        charge_limit = Convert.ToInt32(dsCharge.Tables[0].Rows[0][1].ToString());
        del_charge = Convert.ToInt32(dsCharge.Tables[0].Rows[0][2].ToString());

        #endregion Delivery Charges Get

        //#region Fast Food Order Timmings Get

        //string ot = "select * from ff_order_timmings";
        //ds10 = dc.getdata(ot);
        //start_time = Convert.ToDateTime(ds10.Tables[0].Rows[0][1].ToString());
        //end_time = Convert.ToDateTime(ds10.Tables[0].Rows[0][2].ToString());

        //#endregion Fast Food Order Timmings Get

        if (IsPostBack != true)
        {
            order_details_pnl.Visible = false;
            Session["tiffin_type"] = "";
            if (Convert.ToString(Session["tiffin_type"]) == "")
            {
                empty_cart_lbl.Visible = false;
                add_item_in_list();
                //ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please Check Your Quntity');", true);
            }
            else
            {
                order_details_pnl.Visible = true;
                checkout_btn.Visible = false;
                fil_order_details();
                add_item_in_list();
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please Check Your Quntity');", true);
            }

            //if (Cache["productId"] != null)
            //{
            //    List<int> zk = ((List<int>)Cache["productId"]);
            //    if (zk.Count != 0 || zk != null)
            //    {

            //        for (int i = 0; i < zk.Count; i++)
            //        {
            //            string jk = "select * from fast_food_products where product_id=" + zk[i];
            //            DataSet ds1 = new DataSet();
            //            ds1 = dc.getdata(jk);
            //            list.Add(new Cart { product_name = ds1.Tables[0].Rows[0][4].ToString(), price = ds1.Tables[0].Rows[0][6].ToString(), image = ds1.Tables[0].Rows[0][8].ToString(), product_id = ds1.Tables[0].Rows[0][0].ToString() });
            //        }
            //        cart_rptr.DataSource = list;
            //        cart_rptr.DataBind();
            //    }
            //}

        }
    }
    protected void get_total_price(object sender, EventArgs e)
    {
        TextBox tb1 = ((TextBox)(sender));
        RepeaterItem rp1 = ((RepeaterItem)(tb1.NamingContainer));
        TextBox qnt = (TextBox)rp1.FindControl("quntity_tb");
        Label price = (Label)rp1.FindControl("price_lbl");
        Label total_lbl = (Label)rp1.FindControl("total_lbl");

        if (Convert.ToInt32(qnt.Text) <= 0)
        {
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please Enter Quntity');", true);
            total_lbl.Text = "";
            qnt.Text = "1";
            total_lbl.Text = price.Text.ToString();

        }
        else
        {
            int tot_price = Convert.ToInt32(qnt.Text) * Convert.ToInt32(price.Text);
            total_lbl.Text = tot_price.ToString();
            refersh();
        }
    }

    private void refersh()
    {
        del_charge_lbl.Text = "";
        fin_total_lbl.Text = "";
        subtotal = 0;
        for (int j = 0; j < cart_rptr.Items.Count; j++)
        {
            Label tot_lbl = cart_rptr.Items[j].FindControl("total_lbl") as Label;
            subtotal += Convert.ToInt32(tot_lbl.Text.ToString());
        }
        grand_total_lbl.Text = subtotal.ToString();
        if (Convert.ToInt32(grand_total_lbl.Text.ToString()) < charge_limit && Convert.ToInt32(grand_total_lbl.Text.ToString()) > 0)
        {
            fin_total_lbl.Text = Convert.ToString(Convert.ToInt32(grand_total_lbl.Text.ToString()) + del_charge);
            del_charge_lbl.Text = del_charge.ToString();
        }
        else
        {
            del_charge_lbl.Text = "0";
            fin_total_lbl.Text = grand_total_lbl.Text.ToString();
        }
    }
    // protected void rptItem_ItemDataBound(object sender, RepeaterItemEventArgs e)
    // {
    //     //if (e.Item.ItemType == ListItemType.Item)
    //     //{
    //     //   Label tot_lbl= (Label)e.Item.FindControl("total_lbl");
    //     //   subtotal += Convert.ToInt32(tot_lbl.Text.ToString());
    //     //}
    //     //foreach (RepeaterItem ri in cart_rptr.Items)
    //     //{
    //     //    if (ri.ItemType == ListItemType.Item)
    //     //    {

    //     //        Label tot_lbl = (Label)e.Item.FindControl("total_lbl");
    //     //        subtotal += Convert.ToInt32(tot_lbl.Text.ToString());                
    //     //    }
    //     //}       
    //     //grand_total_lbl.Text = subtotal.ToString();       


    //     if (e.Item.ItemType == ListItemType.Header)
    //     {
    //         subtotal = 0;
    //     }

    //// to add the product price to the sum variable (decPriceSum)
    //     else if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType ==
    //     ListItemType.AlternatingItem)
    //     {
    //         Label tot_lbl = (Label)e.Item.FindControl("total_lbl");
    //         subtotal += Convert.ToInt32(tot_lbl.Text.ToString());
    //     }
    //     // to view the total incase of footer
    //     //else if (e.Item.ItemType == ListItemType.Footer)
    //     //{
    //     //    Label lblSum = e.Item.FindControl("lblItemPrice") as Label;
    //     //    lblSum.Text = "Total Price: $ " + decPriceSum;
    //     //}
    //     grand_total_lbl.Text = subtotal.ToString();
    //     if (Convert.ToInt32(grand_total_lbl.Text.ToString()) <= 200)
    //     {
    //         fin_total_lbl.Text = Convert.ToString(Convert.ToInt32(grand_total_lbl.Text.ToString()) + 30);
    //         del_charge_lbl.Text = "30";
    //     }
    //     else
    //     {
    //         del_charge_lbl.Text = "0";
    //         fin_total_lbl.Text = grand_total_lbl.Text.ToString();
    //     }

    // }

    public void add_item_in_list()
    {
        if (Session["productId"] != null)
        {
            List<int> zk = ((List<int>)Session["productId"]);
            if (zk.Count != 0 && zk != null)
            {

                for (int i = 0; i < zk.Count; i++)
                {
                    string jk = "select * from fast_food_products where product_id=" + zk[i];
                    DataSet ds1 = new DataSet();
                    ds1 = dc.getdata(jk);
                    list.Add(new Cart { provider_id = ds1.Tables[0].Rows[0][3].ToString(), product_name = ds1.Tables[0].Rows[0][4].ToString(), price = ds1.Tables[0].Rows[0][6].ToString(), image = ds1.Tables[0].Rows[0][8].ToString(), product_id = ds1.Tables[0].Rows[0][0].ToString(), DiscountedPrice = ds1.Tables[0].Rows[0][12].ToString() });
                }
                cart_rptr.DataSource = list;
                cart_rptr.DataBind();
                refersh();
            }
            else
            {
                cart_rptr.DataSource = "";
                cart_rptr.DataBind();
                checkout_btn.Visible = false;
                empty_cart_lbl.Visible = true;
                order_details_pnl.Visible = false;
                refersh();
            }
        }

    }

    public void delete_product_from_cart(object sender, CommandEventArgs e)
    {
        string id = e.CommandName.ToString();
        int productId = Convert.ToInt32(id);
        //add_item_in_list();
        //list.Remove(list.Single(x => x.product_id == id));
        if (Session["productId"] != null)
        {
            List<int> jk = ((List<int>)Session["productId"]);
            if (jk.Count != 0 && jk != null)
            {
                jk.Remove(productId);
                Label item_no_lbl = (Label)Page.Master.FindControl("no_of_item");
                item_no_lbl.Text = jk.Count().ToString();
                add_item_in_list();
                //refersh();
            }
        }
    }
    protected void checkout_btn_Click(object sender, EventArgs e)
    {

        //if (current_time >= start_time && current_time <= end_time)
        //{
        if (Convert.ToString(Session["uid"]) == "")
        {
            Session["tiffin_type"] = "ff";
            Session["msg"] = "Please Log In First.";
            Response.Redirect("~/Log_in.aspx");
        }
        else
        {
            fil_order_details();
            checkout_btn.Visible = false;
            order_details_pnl.Visible = true;
        }
        //}
        //else
        //{
        //    time_limit_warning_lbl.Text = "You can book fast food between " + ds10.Tables[0].Rows[0][1].ToString() + " to " + ds10.Tables[0].Rows[0][2].ToString();
        //}
    }
    private void fil_order_details()
    {

        string oi = "select order_id from fast_food_orders order by order_id DESC";
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

        orderId_lbl.Text = oid;

        //city added in dd start

        DataSet ds1 = new DataSet();
        string z = "select * from city where is_fastfood=1";
        ds1 = dc.getdata(z);

        for (int i = 0; i < ds1.Tables[0].Rows.Count; i++)
        {
            city_dd.Items.Add(ds1.Tables[0].Rows[i][0].ToString());
        }

        //city added in dd end

        string zk = "select * from user_accounts where id='" + Session["uid"].ToString() + "'";
        DataSet ds11 = new DataSet();
        ds11 = dc.getdata(zk);
        if (ds11.Tables[0].Rows.Count != 0)
        {
            name_lbl.Text = ds11.Tables[0].Rows[0][1].ToString();
            mobile_lbl.Text = ds11.Tables[0].Rows[0][3].ToString();
            email_lbl.Text = ds11.Tables[0].Rows[0][4].ToString();
            name_lbl.Text = ds11.Tables[0].Rows[0][1].ToString();
            address_tb.Text = ds11.Tables[0].Rows[0][2].ToString();
            address_tb.ReadOnly = true;
            date_lbl.Text = current_time.ToLongDateString();
            time_lbl.Text = current_time.ToLongTimeString();
        }

        //ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('fill order details');", true);
    }
    protected void city_dd_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataSet ds1 = new DataSet();
        area_dd.Items.Clear();
        //fast_food_products_list_rptr.DataSource = "";
        //fast_food_products_list_rptr.DataBind();
        // Label1.Text = "";

        if (city_dd.SelectedIndex == 0)
        {
            area_dd.Items.Clear();
            //fast_food_products_list_rptr.DataSource = "";
            //fast_food_products_list_rptr.DataBind();
            //Label1.Text = "";
        }
        else
        {
            area_dd.Items.Insert(0, "--To Select--");
            string s = "select area from delivery_area where city='" + city_dd.Text + "' and is_fastfood=1";
            ds1 = dc.getdata(s);

            for (int i = 0; i < ds1.Tables[0].Rows.Count; i++)
            {
                area_dd.Items.Add(ds1.Tables[0].Rows[i][0].ToString());
            }
            //DropDownList2.CssClass = "animated bounceInLeft form-control";
        }
    }
    protected void cnfirmOrder_btn_Click(object sender, EventArgs e)
    {

        if (city_dd.SelectedIndex != 0)
        {
            if (area_dd.SelectedIndex != 0)
            {
                if (address_tb.Text != "")
                {
                    //book order
                    book_order();
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please Enter Deivery Address.');", true);
                    address_tb.Focus();
                }
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please Select Delivery Area.');", true);
                area_dd.Focus();
            }
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please Select City.');", true);
            city_dd.Focus();
        }
    }

    private void book_order()
    {
        string product_id, total_price, unit_price, quantity;
        DataSet ds_pr_id = new DataSet();

        for (int i = 0; i < cart_rptr.Items.Count; i++)
        {
            Label productId_lbl = cart_rptr.Items[i].FindControl("productId_lbl") as Label;
            Label tot_lbl = cart_rptr.Items[i].FindControl("total_lbl") as Label;
            TextBox quantity_tb = cart_rptr.Items[i].FindControl("quntity_tb") as TextBox;
            Label unitPrice_lbl = cart_rptr.Items[i].FindControl("price_lbl") as Label;

            product_id = productId_lbl.Text;
            quantity = quantity_tb.Text;
            unit_price = unitPrice_lbl.Text;
            total_price = tot_lbl.Text;

            string zk = "select * from fast_food_products where product_id='" + product_id + "'";
            ds_pr_id = dc.getdata(zk);

            string jk = "insert into fast_food_orders values('" + orderId_lbl.Text + "','" + ds_pr_id.Tables[0].Rows[0][3].ToString() + "','" + product_id + "','" + Session["uid"].ToString() + "','" +
                        quantity + "','" + unit_price + "','" + total_price + "','" + email_lbl.Text + "','" + mobile_lbl.Text + "','" + city_dd.SelectedItem + "','" + area_dd.SelectedItem + "','" +
                        address_tb.Text + "','" + date_lbl.Text + "','" + time_lbl.Text + "',false,false,false)";
            dc.setdata(jk);

        }

        //Thread email = new Thread(delegate()
        //{
        //    sendmail_user();
        //    //sendmail_provider();
        //    //sendmail_admin();
        //});
        //email.IsBackground = true;
        //email.Start();

        #region Logic For Sending Messages

        string msg2 = "";
        for (int i = 0; i < cart_rptr.Items.Count; i++)
        {
            TextBox quantity_tb = cart_rptr.Items[i].FindControl("quntity_tb") as TextBox;
            Label product_lbl = cart_rptr.Items[i].FindControl("ProductLbl") as Label;
            Label providerId_lbl = cart_rptr.Items[i].FindControl("ProviderIdLbl") as Label;

            ListForMsg.Add(new Cart { provider_id = providerId_lbl.Text, product_name = product_lbl.Text, Qty = quantity_tb.Text });
            ProviderIds.Add(providerId_lbl.Text);

            string qty = quantity_tb.Text;
            string product = product_lbl.Text;

            msg2 += qty + " - " + product + " , ";
        }

        string msg = "Hello, Admin We are from TiffinDabba new FastFood order is booked on " + time_lbl.Text + " Please Check It. Order Details :- " + msg2;

        Thread ThmsgAdm = new Thread(delegate()
        {
            sendmsg_admin(msg);
            sendmsg_user(msg2);
        });
        ThmsgAdm.IsBackground = true;
        ThmsgAdm.Start();

        DisProviderIds = ProviderIds.Distinct().ToList();
        string PrMsg = "";
        for (int j = 0; j < DisProviderIds.Count; j++)
        {
            PrMsg = "";
            var lst = ListForMsg.Where(x => x.provider_id == DisProviderIds[j]).Select(x => new Cart { product_name = x.product_name, Qty = x.Qty }).ToList();
            if (lst != null)
            {
                foreach (var li in lst)
                {
                    PrMsg += li.Qty + " - " + li.product_name + " , ";
                }
                //Thread ThmsgPr = new Thread(delegate()
                //{
                sendmsg_provider(DisProviderIds[j], PrMsg);
                //});
                //ThmsgPr.IsBackground = true;
                //ThmsgPr.Start();
            }

        }


        //Thread Thmsg = new Thread(delegate()
        //{
        //    sendmsg_provider(ds_pr_id.Tables[0].Rows[0][3].ToString(), msg2);
        //    //sendmail_provider();
        //    sendmsg_admin(msg);
        //});
        //Thmsg.IsBackground = true;
        //Thmsg.Start();

        #endregion

        ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Your Order Is Booked.');", true);
        address_tb.Text = "";
        city_dd.SelectedIndex = 0;

        emptycart();

    }

    private void sendmsg_user(string msg2)
    {
        string authKey = ConfigurationManager.AppSettings["authkey"].ToString();
        string route = ConfigurationManager.AppSettings["route"].ToString();
        string country = ConfigurationManager.AppSettings["country"].ToString();
        string sender = ConfigurationManager.AppSettings["sender"].ToString();
        string mobile_no = mobile_lbl.Text;
        string name = name_lbl.Text;

        string msg = "Hello ," + name + " We are from Tiffin Dabba. you book New Order. Order Details :- " + msg2 + "Total Amount is:-  " + grand_total_lbl.Text + ".";

        var link = "authkey=" + authKey + "&mobiles=" + mobile_no + "&message=" + msg + "&sender=" + sender + "&route=" + route + "&country=" + country;
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

    private void sendmsg_admin(string msg)
    {
        //string pr_mo = "select * from providers where pid='" + providerId + "'";
        //DataSet pr_info_ds = new DataSet();
        //pr_info_ds = dc.getdata(pr_mo);

        string authKey = ConfigurationManager.AppSettings["authkey"].ToString();
        string route = ConfigurationManager.AppSettings["route"].ToString();
        string country = ConfigurationManager.AppSettings["country"].ToString();
        string sender = ConfigurationManager.AppSettings["sender"].ToString();
        // string mobile_no = pr_info_ds.Tables[0].Rows[0][3].ToString();
        //string pr_name = pr_info_ds.Tables[0].Rows[0][1].ToString();

        var link = "authkey=" + authKey + "&mobiles=8875041417&message=" + msg + "&sender=" + sender + "&route=" + route + "&country=" + country;
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

    private void sendmsg_provider(string providerId, string msg2)
    {
        string pr_mo = "select * from providers where pid='" + providerId + "'";
        DataSet pr_info_ds = new DataSet();
        pr_info_ds = dc.getdata(pr_mo);

        string authKey = ConfigurationManager.AppSettings["authkey"].ToString();
        string route = ConfigurationManager.AppSettings["route"].ToString();
        string country = ConfigurationManager.AppSettings["country"].ToString();
        string sender = ConfigurationManager.AppSettings["sender"].ToString();
        string pr_mobile_no = pr_info_ds.Tables[0].Rows[0][3].ToString();
        string pr_name = pr_info_ds.Tables[0].Rows[0][1].ToString();

        string msg = "Hello, " + pr_name + " We are from TiffinDabba new FastFood order is booked on " + time_lbl.Text + " Please Check It. Order Details:- " + msg2;

        var link = "authkey=" + authKey + "&mobiles=" + pr_mobile_no + "&message=" + msg + "&sender=" + sender + "&route=" + route + "&country=" + country;

        string final_link = "https://control.msg91.com/api/sendhttp.php?" + link;

        //Response.Redirect(final_link);
        //Response.End();


        HttpWebRequest request = (HttpWebRequest)WebRequest.Create(final_link);

        HttpWebResponse response = (HttpWebResponse)request.GetResponse();
        StreamReader responseReader = new StreamReader(response.GetResponseStream());

        String resultmsg = responseReader.ReadToEnd();
        responseReader.Close();

    }

    private void emptycart()
    {
        if (Session["productId"] != null)
        {
            List<int> jk = ((List<int>)Session["productId"]);
            if (jk.Count != 0 && jk != null)
            {
                jk.Clear();
            }
            list.Clear();
            fin_total_lbl.Text = "";
            del_charge_lbl.Text = "";
            add_item_in_list();
        }
    }
    protected void ch_address_lb_Click(object sender, EventArgs e)
    {
        address_tb.ReadOnly = false;
    }

    //private void sendmail_user()
    //{
    //    try
    //    {
    //        //using (StringWriter sw = new StringWriter())
    //        //{
    //        //    using (HtmlTextWriter hw = new HtmlTextWriter(sw))
    //        //    {
    //        //        cart_rptr.RenderControl(hw);
    //        //        StringReader sr = new StringReader(sw.ToString());
    //                MailMessage mm = new MailMessage();
    //                mm.From = new MailAddress("tiffindabba10@gmail.com", "TIFFIN DABBA");//TIFFIN DABBA represent title in sent email.
    //                mm.To.Add(email_lbl.Text);
    //                mm.Subject = "Order Details";
    //                //mm.Body = "Hello: " + Label2.Text + "<br /><br />You book simple tiffin for DINNER from TIFFIN DABBA.<br />Your Menu of tiffin is given below:<br />" + "Order Id:  " + Label1.Text +
    //                //          "<br />Sabji:  " + Label5.Text + "<br />Roti:  " + Label6.Text + "<br />Dal:  " + Label7.Text + "<br />Chawal:  " + Label8.Text + "<br />Total Bill:  " + Label9.Text +
    //                //          "Rs.<br />You recived your tiffin at Delivery Address given by you at order time between 07:00 PM to 08:00  PM";

    //                StringBuilder sb = new StringBuilder();
    //                sb = "<br />Hello:  " + name_lbl.Text + "<br /><center><font style='font-size:10px;weight:550;'>Thank you for your interest in TiffinDabba. Your order has been received.</font><br /><br /><table border='1' height='50%' width='65%'><caption>Order Details</caption><tr><td>Order Id:</td><td>" + orderId_lbl.Text + "</td></tr><tr><td>Order Date:</td><td>" + date_lbl.Text + "</td></tr><tr><td>Order Time:</td><td>" + time_lbl.Text + "</td></tr>" +
    //                        "</table><br /><table border='1' height='100%' width='100%'><caption>Delivery Address</caption><tr><td>Address:  </td><td>" + address_tb.Text + "</td></tr></table>" +
    //                        "<br /><font style='font-size:12px;weight:450;'>Your Order Items Is Given Below:</font>";

    //                //string str="<table>"+for()+"</table>";

    //                //sb.Append("<table>"++"</table>")


    //                mm.Body += "<br />Hello:  " + name_lbl.Text + "<br /><center><font style='font-size:10px;weight:550;'>Thank you for your interest in TiffinDabba. Your order has been received.</font><br /><br /><table border='1' height='50%' width='65%'><caption>Order Details</caption><tr><td>Order Id:</td><td>" + orderId_lbl.Text + "</td></tr><tr><td>Order Date:</td><td>" + date_lbl.Text + "</td></tr><tr><td>Order Time:</td><td>" + time_lbl.Text + "</td></tr>" +
    //                        "</table><br /><table border='1' height='100%' width='100%'><caption>Delivery Address</caption><tr><td>Address:  </td><td>" + address_tb.Text + "</td></tr></table>" +
    //                        "<br /><font style='font-size:12px;weight:450;'>Your Order Items Is Given Below:</font>";


    //           //     mm.Body += sw.ToString();

    //                mm.Body += "<br /><font style='font-size:12px;'>You Will Receive Your Order At Your Delivery Address With in 50 minutes.</font></center>";

    //                mm.IsBodyHtml = true;              
    //                SmtpClient smtp = new SmtpClient();
    //                smtp.Host = "smtp.gmail.com";
    //                smtp.EnableSsl = true;
    //                smtp.UseDefaultCredentials = true;
    //                smtp.Port = 587;
    //                smtp.Credentials = new System.Net.NetworkCredential("tiffindabba10@gmail.com", "102515209");


    //                smtp.Send(mm);
    //        //    }
    //        //}
    //    }
    //    catch (Exception ex)
    //    {
    //        string Mail_msg = "Mail can't be sent because of server problem: ";
    //        Mail_msg += ex.Message;
    //        //Response.Write(Mail_msg);
    //       // Label11.Text = Mail_msg;
    //    }
    //}
    //public override void VerifyRenderingInServerForm(Control control)
    //{
    //    /* Verifies that the control is rendered */
    //}   
}