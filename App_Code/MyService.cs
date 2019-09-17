using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Script.Serialization;
using System.Web.Script.Services;
using System.Data;
using System.Net;
using System.Net.Mail;
using System.Threading;
using System.Configuration;
using System.IO;

/// <summary>
/// Summary description for MyService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]
public class MyService : System.Web.Services.WebService
{
    DataCon dc = new DataCon();
    DateTime current_time = TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.Local, TimeZoneInfo.FindSystemTimeZoneById("India Standard Time"));
    DateTime start_time, end_time, commonStartTime, commonEndTime;
    List<Cart> ListForMsg = new List<Cart>();
    List<string> ProviderIds = new List<string>();
    List<string> DisProviderIds = new List<string>();
    public MyService()
    {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string HelloWorld()
    {
        return "Hello World";
    }

    [WebMethod]
    //[ScriptMethod(ResponseFormat=ResponseFormat.Json)]
    public string Login(string EmailId, string Password)
    {
        //var response = new Dictionary<string, string>();
        string response = "";

        string jk = "select status from user_accounts where id='" + EmailId + "' and pass='" + Password + "'";
        DataSet ds = new DataSet();
        ds = dc.getdata(jk);
        if (ds.Tables[0].Rows.Count != 0)
        {
            if (ds.Tables[0].Rows[0][0].ToString() == "Allowed")
            {
                response = "Success";
            }
            else
            {
                response = "NotAllowed";
            }
        }
        else
        {
            response = "Invalid";
        }
        return response;
    }
    [WebMethod]
    public string RegisterUser(string Name, string Address, string Mobile, string EmailId, string Password)
    {
        string response = "";
        DataSet ds1 = new DataSet();
        string zk = "select * from user_accounts where eid='" + EmailId + "'";
        ds1 = dc.getdata(zk);

        if (ds1.Tables[0].Rows.Count == 0)
        {
            string kz = "insert into user_accounts values('" + EmailId + "','" + Name + "','" + Address + "','" + Mobile + "','" + EmailId + "','" + Password + "','Allowed')";
            dc.setdata(kz);

            response = "Registered";
        }
        else
        {
            response = "EmailId Exist";
        }
        return response;
    }

    [WebMethod]
    public List<FastFoodCategory> GetFastFoodCategory()
    {
        string fc = "select * from fast_food_categories";
        DataSet ds3 = new DataSet();
        ds3 = dc.getdata(fc);

        List<FastFoodCategory> FastFoodCategories = new List<FastFoodCategory>();

        for (int i = 0; i < ds3.Tables[0].Rows.Count; i++)
        {
            FastFoodCategory fastFoodCategory = new FastFoodCategory();

            string jkp = "select * from fast_food_products where cat_id='" + ds3.Tables[0].Rows[i][0].ToString() + "'";
            DataSet dsjkp = new DataSet();
            dsjkp = dc.getdata(jkp);

            fastFoodCategory.CategoryId = ds3.Tables[0].Rows[i][0].ToString();
            fastFoodCategory.CategoryName = ds3.Tables[0].Rows[i][1].ToString();
            fastFoodCategory.Image = ds3.Tables[0].Rows[i][2].ToString();
            fastFoodCategory.NoOfDishes = dsjkp.Tables[0].Rows.Count.ToString();

            FastFoodCategories.Add(fastFoodCategory);
        }

        return FastFoodCategories;

    }

    [WebMethod]
    public string GetUserName(string UserId)
    {
        string jkp = "select name from user_accounts where id='" + UserId + "'";
        DataSet ds4 = new DataSet();
        ds4 = dc.getdata(jkp);

        if (ds4.Tables[0].Rows.Count != 0)
        {
            return ds4.Tables[0].Rows[0][0].ToString();
        }
        else
        {
            return "Fail";
        }
    }

    [WebMethod]
    public List<FastFoodProduct> GetFastFoodProducts(string CategoryId)
    {

        #region Fast Food Order Timmings Get

        DataSet ds10 = new DataSet();

        string ot = "select * from ff_order_timmings";
        ds10 = dc.getdata(ot);
        commonStartTime = Convert.ToDateTime(ds10.Tables[0].Rows[0][1].ToString());
        commonEndTime = Convert.ToDateTime(ds10.Tables[0].Rows[0][2].ToString());

        #endregion Fast Food Order Timmings Get

        List<FastFoodProduct> FastFoodProductList = new List<FastFoodProduct>();

        string zk = "select * from fast_food_products where cat_id='" + CategoryId + "' and is_available=1";
        DataSet ds5 = new DataSet();
        ds5 = dc.getdata(zk);

        if (ds5.Tables[0].Rows.Count != 0)
        {
            for (int i = 0; i < ds5.Tables[0].Rows.Count; i++)
            {
                if (ds5.Tables[0].Rows[i][7].ToString() != "" && ds5.Tables[0].Rows[i][8].ToString() != "")
                {
                    start_time = Convert.ToDateTime(ds5.Tables[0].Rows[i][7].ToString());
                    end_time = Convert.ToDateTime(ds5.Tables[0].Rows[i][8].ToString());
                }
                else
                {
                    start_time = commonStartTime;
                    end_time = commonEndTime;
                }

                if (current_time >= start_time && current_time <= end_time)
                {

                    FastFoodProduct FastFoodProduct = new FastFoodProduct();
                    FastFoodProduct.ProductId = ds5.Tables[0].Rows[i][0].ToString();
                    FastFoodProduct.CategoryId = ds5.Tables[0].Rows[i][1].ToString();
                    FastFoodProduct.ProviderCity = ds5.Tables[0].Rows[i][2].ToString();
                    FastFoodProduct.ProviderId = ds5.Tables[0].Rows[i][3].ToString();
                    FastFoodProduct.ProductName = ds5.Tables[0].Rows[i][4].ToString();
                    FastFoodProduct.Description = ds5.Tables[0].Rows[i][5].ToString();
                    FastFoodProduct.Price = ds5.Tables[0].Rows[i][6].ToString();
                    FastFoodProduct.StartTime = start_time.ToString("hh:mm tt");
                    FastFoodProduct.EndTime = end_time.ToString("hh:mm tt");
                    FastFoodProduct.Image = ds5.Tables[0].Rows[i][10].ToString();
                    FastFoodProduct.DiscountedPrice = ds5.Tables[0].Rows[i][12].ToString();
                    FastFoodProduct.Status = "Success";
                    FastFoodProduct.CanBook = "true";

                    FastFoodProductList.Add(FastFoodProduct);

                }
                else
                {
                    FastFoodProduct FastFoodProduct = new FastFoodProduct();
                    FastFoodProduct.ProductId = ds5.Tables[0].Rows[i][0].ToString();
                    FastFoodProduct.CategoryId = ds5.Tables[0].Rows[i][1].ToString();
                    FastFoodProduct.ProviderCity = ds5.Tables[0].Rows[i][2].ToString();
                    FastFoodProduct.ProviderId = ds5.Tables[0].Rows[i][3].ToString();
                    FastFoodProduct.ProductName = ds5.Tables[0].Rows[i][4].ToString();
                    FastFoodProduct.Description = ds5.Tables[0].Rows[i][5].ToString();
                    FastFoodProduct.Price = ds5.Tables[0].Rows[i][6].ToString();
                    FastFoodProduct.StartTime = start_time.ToString("hh:mm tt");
                    FastFoodProduct.EndTime = end_time.ToString("hh:mm tt");
                    FastFoodProduct.Image = ds5.Tables[0].Rows[i][10].ToString();
                    FastFoodProduct.DiscountedPrice = ds5.Tables[0].Rows[i][12].ToString();
                    FastFoodProduct.Status = "Success";
                    FastFoodProduct.CanBook = "false";

                    FastFoodProductList.Add(FastFoodProduct);
                }

            }
        }
        else
        {
            FastFoodProduct FastFoodProduct = new FastFoodProduct();
            FastFoodProduct.Status = "Fail";

            FastFoodProductList.Add(FastFoodProduct);
        }

        return FastFoodProductList;
    }

    [WebMethod]
    public string ForgetPasswordAPI(string Email)
    {
        string jkp = "select name,pass from user_accounts where id='" + Email + "'";
        DataSet ds6 = new DataSet();
        ds6 = dc.getdata(jkp);

        if (ds6.Tables[0].Rows.Count == 0)
        {
            return "InvalidId";
        }
        else
        {
            MailMessage mm = new MailMessage();
            mm.From = new MailAddress("tiffindabba10@gmail.com", "TIFFIN DABBA");//TIFFIN DABBA represent title in sent email.
            mm.To.Add(Email);
            mm.Subject = "Forget Password";
            mm.Body = "Hello:  " + ds6.Tables[0].Rows[0][0].ToString() + "<br />Your TIFFIN DABBA Password :-       " + ds6.Tables[0].Rows[0][1].ToString();

            mm.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.EnableSsl = true;
            smtp.Port = 587;
            smtp.Credentials = new System.Net.NetworkCredential("tiffindabba10@gmail.com", "102515209");

            smtp.Send(mm);

            return "Success";
        }
    }

    [WebMethod]
    public FastFoodProduct GetCart(String ProductId)
    {
        #region Fast Food Order Timmings Get

        DataSet ds10 = new DataSet();

        string ot = "select * from ff_order_timmings";
        ds10 = dc.getdata(ot);
        commonStartTime = Convert.ToDateTime(ds10.Tables[0].Rows[0][1].ToString());
        commonEndTime = Convert.ToDateTime(ds10.Tables[0].Rows[0][2].ToString());

        #endregion Fast Food Order Timmings Get

        DataSet ds7 = new DataSet();
        string jkp = "select * from fast_food_products where product_id='" + ProductId + "'";
        ds7 = dc.getdata(jkp);
        if (ds7.Tables[0].Rows.Count != 0)
        {
            if (ds7.Tables[0].Rows[0][7].ToString() != "" && ds7.Tables[0].Rows[0][8].ToString() != "")
            {
                start_time = Convert.ToDateTime(ds7.Tables[0].Rows[0][7].ToString());
                end_time = Convert.ToDateTime(ds7.Tables[0].Rows[0][8].ToString());
            }
            else
            {
                start_time = commonStartTime;
                end_time = commonEndTime;
            }

            if (current_time >= start_time && current_time <= end_time)
            {

                FastFoodProduct FastFoodProduct = new FastFoodProduct();
                FastFoodProduct.ProductId = ds7.Tables[0].Rows[0][0].ToString();
                FastFoodProduct.CategoryId = ds7.Tables[0].Rows[0][1].ToString();
                FastFoodProduct.ProviderCity = ds7.Tables[0].Rows[0][2].ToString();
                FastFoodProduct.ProviderId = ds7.Tables[0].Rows[0][3].ToString();
                FastFoodProduct.ProductName = ds7.Tables[0].Rows[0][4].ToString();
                FastFoodProduct.Description = ds7.Tables[0].Rows[0][5].ToString();
                FastFoodProduct.Price = ds7.Tables[0].Rows[0][6].ToString();
                FastFoodProduct.StartTime = start_time.ToString("hh:mm tt");
                FastFoodProduct.EndTime = end_time.ToString("hh:mm tt");
                FastFoodProduct.Image = ds7.Tables[0].Rows[0][10].ToString();
                FastFoodProduct.DiscountedPrice = ds7.Tables[0].Rows[0][12].ToString();
                FastFoodProduct.Status = "Success";
                FastFoodProduct.CanBook = "true";

                return FastFoodProduct;
            }
            else
            {
                FastFoodProduct FastFoodProduct = new FastFoodProduct();
                FastFoodProduct.ProductId = ds7.Tables[0].Rows[0][0].ToString();
                FastFoodProduct.CategoryId = ds7.Tables[0].Rows[0][1].ToString();
                FastFoodProduct.ProviderCity = ds7.Tables[0].Rows[0][2].ToString();
                FastFoodProduct.ProviderId = ds7.Tables[0].Rows[0][3].ToString();
                FastFoodProduct.ProductName = ds7.Tables[0].Rows[0][4].ToString();
                FastFoodProduct.Description = ds7.Tables[0].Rows[0][5].ToString();
                FastFoodProduct.Price = ds7.Tables[0].Rows[0][6].ToString();
                FastFoodProduct.StartTime = start_time.ToString("hh:mm tt");
                FastFoodProduct.EndTime = end_time.ToString("hh:mm tt");
                FastFoodProduct.Image = ds7.Tables[0].Rows[0][10].ToString();
                FastFoodProduct.DiscountedPrice = ds7.Tables[0].Rows[0][12].ToString();
                FastFoodProduct.Status = "Success";
                FastFoodProduct.CanBook = "false";

                return FastFoodProduct;
            }
        }
        else
        {
            FastFoodProduct FastFoodProduct = new FastFoodProduct();
            FastFoodProduct.Status = "Fail";

            return FastFoodProduct;
        }
    }

    [WebMethod]
    public List<DeliveryCharges> GetDeliveryCharges()
    {
        List<DeliveryCharges> List = new List<DeliveryCharges>();
        string charge_limit, del_charge;

        string jkp = "select * from delivery_charges";
        DataSet dsCharge = new DataSet();
        dsCharge = dc.getdata(jkp);
        charge_limit = dsCharge.Tables[0].Rows[0][1].ToString();
        del_charge = dsCharge.Tables[0].Rows[0][2].ToString();

        DeliveryCharges DeliveryCharges = new DeliveryCharges();
        DeliveryCharges.ChargeLimit = charge_limit;
        DeliveryCharges.DeliveryCharge = del_charge;

        List.Add(DeliveryCharges);

        return List;
    }
    [WebMethod]
    public string GetOrderId()
    {
        DataSet dsoi = new DataSet();
        string oi = "select order_id from fast_food_orders order by order_id DESC";
        dsoi = dc.getdata(oi);

        if (dsoi.Tables[0].Rows.Count == 0)
        {
            return "1";
        }
        else
        {
            String s = dsoi.Tables[0].Rows[0][0].ToString();

            int n = Convert.ToInt32(s);
            n = n + 1;


            return n.ToString();
            //rid = Convert.ToString(Convert.ToInt32(ds3.Tables[0].Rows[0][0].ToString()) + 1);
        }
    }

    [WebMethod]
    public List<string> GetCityList()
    {
        List<string> cityList = new List<string>();

        string jk = "select * from city where is_fastfood=1";
        DataSet ds11 = new DataSet();
        ds11 = dc.getdata(jk);


        for (int i = 0; i < ds11.Tables[0].Rows.Count; i++)
        {
            cityList.Add(ds11.Tables[0].Rows[i][0].ToString());
        }

        return cityList;
    }

    [WebMethod]
    public List<string> GetAreaList(string City)
    {
        List<string> areaList = new List<string>();

        string jk = "select * from delivery_area where is_fastfood=1 and city='" + City + "'";
        DataSet ds11 = new DataSet();
        ds11 = dc.getdata(jk);


        for (int i = 0; i < ds11.Tables[0].Rows.Count; i++)
        {
            areaList.Add(ds11.Tables[0].Rows[i][1].ToString());
        }

        return areaList;
    }

    [WebMethod]
    public string GetUserAddress(string UserId)
    {
        string jk = "select address from user_accounts where id='" + UserId + "'";
        DataSet ds11 = new DataSet();
        ds11 = dc.getdata(jk);

        return ds11.Tables[0].Rows[0][0].ToString();
    }
    [WebMethod]
    public string SaveFastFoodOrder(string OrderId, string Time, string City, string Area, string Address, string UserId, string ProductId, string Qty, string UnitPrice, string TotalPrice, string ProviderId)
    {        
        string jk = "select eid,mob_no from user_accounts where id='" + UserId + "'";
        DataSet dsjk = dc.getdata(jk);

        string jkp = "insert into fast_food_orders values('" + OrderId + "','" + ProviderId + "','" + ProductId + "','" + UserId + "','" + Qty + "','" + UnitPrice + "','" + TotalPrice + "','" + dsjk.Tables[0].Rows[0][0].ToString() + "','" +
                                                        dsjk.Tables[0].Rows[0][1].ToString() + "','" + City + "','" + Area + "','" + Address + "','" + current_time.ToLongDateString() + "','" + Time + "',false,false,false)";
        dc.setdata(jkp);

        return "Success";
    }

    [WebMethod]
    public string CheckVacation()
    {
        string jk = "select * from vacation_details";
        DataSet dsjk = new DataSet();
        dsjk = dc.getdata(jk);
        if(Convert.ToBoolean(dsjk.Tables[0].Rows[0][1].ToString())==true)
        {
            return "Vacation";
        }
        else
        {
            return "NoVacation";
        }
    }
    [WebMethod]
    public string SendMsgsOfFastFoodOrder(string OrderId)
    {

        string jk = "select * from fast_food_orders where order_id='" + OrderId + "'";
        DataSet ds12 = new DataSet();
        ds12 = dc.getdata(jk);

        #region Logic For Sending Messages

        string msg2 = "";
        int tot = 0;
        for (int i = 0; i < ds12.Tables[0].Rows.Count; i++)
        {

            string jkp = "select product_name from fast_food_products where product_id='" + ds12.Tables[0].Rows[i][2].ToString() + "'";
            DataSet ds15 = new DataSet();
            ds15 = dc.getdata(jkp);


            ListForMsg.Add(new Cart { provider_id = ds12.Tables[0].Rows[i][1].ToString(), product_name = ds15.Tables[0].Rows[0][0].ToString(), Qty = ds12.Tables[0].Rows[i][4].ToString() });
            ProviderIds.Add(ds12.Tables[0].Rows[i][1].ToString());

            string qty = ds12.Tables[0].Rows[i][4].ToString();
            string product = ds15.Tables[0].Rows[0][0].ToString();
            tot += Convert.ToInt32(ds12.Tables[0].Rows[i][6].ToString());

            msg2 += qty + " - " + product + " , ";
        }

        string msg = "Hello, Admin We are from TiffinDabba new FastFood order is booked on " + ds12.Tables[0].Rows[0][13].ToString() + " Please Check It. Order Details :- " + msg2;

        Thread ThmsgAdm = new Thread(delegate()
        {
            sendmsg_admin(msg);
            sendmsg_user(msg2, ds12.Tables[0].Rows[0][3].ToString(), tot);
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
                sendmsg_provider(DisProviderIds[j], PrMsg, ds12.Tables[0].Rows[0][13].ToString());
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

        return "Success";
    }

    private void sendmsg_provider(string p, string PrMsg, string time)
    {
        string pr_mo = "select * from providers where pid='" + p + "'";
        DataSet pr_info_ds = new DataSet();
        pr_info_ds = dc.getdata(pr_mo);

        string authKey = ConfigurationManager.AppSettings["authkey"].ToString();
        string route = ConfigurationManager.AppSettings["route"].ToString();
        string country = ConfigurationManager.AppSettings["country"].ToString();
        string sender = ConfigurationManager.AppSettings["sender"].ToString();
        string pr_mobile_no = pr_info_ds.Tables[0].Rows[0][3].ToString();
        string pr_name = pr_info_ds.Tables[0].Rows[0][1].ToString();

        string msg = "Hello, " + pr_name + " We are from TiffinDabba new FastFood order is booked on " + time + " Please Check It. Order Details:- " + PrMsg;

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

    private void sendmsg_user(string msg2, string userId, int tot)
    {
        string jk = "select name,mob_no from user_accounts where id='" + userId + "'";
        DataSet ds13 = new DataSet();
        ds13 = dc.getdata(jk);

        string authKey = ConfigurationManager.AppSettings["authkey"].ToString();
        string route = ConfigurationManager.AppSettings["route"].ToString();
        string country = ConfigurationManager.AppSettings["country"].ToString();
        string sender = ConfigurationManager.AppSettings["sender"].ToString();
        string mobile_no = ds13.Tables[0].Rows[0][1].ToString();
        string name = ds13.Tables[0].Rows[0][0].ToString();

        string msg = "Hello ," + name + " We are from Tiffin Dabba. you book New Order. Order Details :- " + msg2 + "Total Amount is:-  " + tot.ToString() + ".";

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

    [WebMethod]
    public List<SimpleTiffins> FetchSimpleTiffinList(string ProviderCity)
    {        
        List<SimpleTiffins> List = new List<SimpleTiffins>();
        string isvacation = "false", btntxt = "";

        string jkp = "select * from vacation_details";
        DataSet dsjkp = new DataSet();
        dsjkp = dc.getdata(jkp);
        if(Convert.ToBoolean(dsjkp.Tables[0].Rows[0][1].ToString())==true)
        {
            isvacation = "true";
            btntxt = dsjkp.Tables[0].Rows[0][2].ToString();
        }

        string jk = "select * from simple_tiffin where p_city='" + ProviderCity + "' and available='Order Now'";
        DataSet ds16 = new DataSet();
        ds16 = dc.getdata(jk);

        if (ds16.Tables[0].Rows.Count != 0)
        {
            for (int i = 0; i < ds16.Tables[0].Rows.Count; i++)
            {
                SimpleTiffins SimpleTiffin = new SimpleTiffins();
                SimpleTiffin.TiffinId = ds16.Tables[0].Rows[i][0].ToString();
                SimpleTiffin.ProviderCity = ds16.Tables[0].Rows[i][1].ToString();
                SimpleTiffin.ProviderId = ds16.Tables[0].Rows[i][2].ToString();
                SimpleTiffin.ProviderName = ds16.Tables[0].Rows[i][3].ToString();
                SimpleTiffin.Sabji = ds16.Tables[0].Rows[i][4].ToString();
                SimpleTiffin.Roti = ds16.Tables[0].Rows[i][5].ToString();
                SimpleTiffin.Dal = ds16.Tables[0].Rows[i][6].ToString();
                SimpleTiffin.Chawal = ds16.Tables[0].Rows[i][7].ToString();
                SimpleTiffin.Other = ds16.Tables[0].Rows[i][8].ToString();
                SimpleTiffin.Price = ds16.Tables[0].Rows[i][9].ToString();
                SimpleTiffin.Tagline = ds16.Tables[0].Rows[i][13].ToString();
                SimpleTiffin.Recommend = ds16.Tables[0].Rows[i][14].ToString();
                SimpleTiffin.Image = ds16.Tables[0].Rows[i][15].ToString();
                SimpleTiffin.IsVacation = isvacation;
                SimpleTiffin.BtnTxt = btntxt;
                SimpleTiffin.Status = "Success";

                List.Add(SimpleTiffin);
            }
        }
        else
        {
            SimpleTiffins SimpleTiffin = new SimpleTiffins();
            SimpleTiffin.Status = "Fail";

            List.Add(SimpleTiffin);
        }
        return List;
    }

    [WebMethod]
    public SimpleTiffins GetSimpleTiffinDetailsByTiffinId(string TiffinId)
    {
        string jk = "select * from simple_tiffin where t_id='" + TiffinId + "'";
        DataSet ds17 = new DataSet();
        ds17 = dc.getdata(jk);

        if (ds17.Tables[0].Rows.Count != 0)
        {

            SimpleTiffins SimpleTiffin = new SimpleTiffins();
            SimpleTiffin.TiffinId = ds17.Tables[0].Rows[0][0].ToString();
            SimpleTiffin.ProviderCity = ds17.Tables[0].Rows[0][1].ToString();
            SimpleTiffin.ProviderId = ds17.Tables[0].Rows[0][2].ToString();
            SimpleTiffin.ProviderName = ds17.Tables[0].Rows[0][3].ToString();
            SimpleTiffin.Sabji = ds17.Tables[0].Rows[0][4].ToString();
            SimpleTiffin.Roti = ds17.Tables[0].Rows[0][5].ToString();
            SimpleTiffin.Dal = ds17.Tables[0].Rows[0][6].ToString();
            SimpleTiffin.Chawal = ds17.Tables[0].Rows[0][7].ToString();
            SimpleTiffin.Other = ds17.Tables[0].Rows[0][8].ToString();
            SimpleTiffin.Price = ds17.Tables[0].Rows[0][9].ToString();
            SimpleTiffin.Tagline = ds17.Tables[0].Rows[0][13].ToString();
            SimpleTiffin.Recommend = ds17.Tables[0].Rows[0][14].ToString();
            SimpleTiffin.Image = ds17.Tables[0].Rows[0][15].ToString();
            SimpleTiffin.Status = "Success";
            return SimpleTiffin;

        }
        else
        {
            SimpleTiffins SimpleTiffin = new SimpleTiffins();
            SimpleTiffin.Status = "Fail";
            return SimpleTiffin;
        }
    }
    [WebMethod]
    public List<string> BookSimpleTiffinOrder(string BookFor, string TiffinId, string UserId, string DeliveryArea, string DeliveryAddress)
    {
        DateTime lunch_time;
        DateTime dinner_time;
        DataSet ds10 = new DataSet();
        DataSet dsTiffinDetails = new DataSet();
        DataSet dsUserDetails = new DataSet();
        string oid;

        List<string> list = new List<string>();

        #region Fetch Booking TImmings

        string ot = "select * from order_timmings";
        ds10 = dc.getdata(ot);
        lunch_time = Convert.ToDateTime(ds10.Tables[0].Rows[0][1].ToString());
        dinner_time = Convert.ToDateTime(ds10.Tables[0].Rows[1][1].ToString());

        #endregion

        #region Fetch Order Id

        DataSet ds = new DataSet();
        string oi = "select order_id from simple_tiffin_daily_order order by order_id DESC";
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

        #endregion

        string jk = "select * from simple_tiffin where t_id='" + TiffinId + "'";
        dsTiffinDetails = dc.getdata(jk);

        string jkp = "select * from user_accounts where id='" + UserId + "'";
        dsUserDetails = dc.getdata(jkp);

        if (BookFor == "Lunch")
        {
            if (current_time <= lunch_time)
            {
                string zk = "insert into simple_tiffin_daily_order values('" + oid + "','" + BookFor + "','" + TiffinId + "','" + dsTiffinDetails.Tables[0].Rows[0][2].ToString() + "','" +
                                                                       UserId + "','" + dsUserDetails.Tables[0].Rows[0][1].ToString() + "','" + UserId + "','" + current_time.ToLongTimeString() + "','" +
                                                                       current_time.ToLongDateString() + "','" + dsUserDetails.Tables[0].Rows[0][3].ToString() + "','" + DeliveryArea + "','" +
                                                                       DeliveryAddress + "','" + dsTiffinDetails.Tables[0].Rows[0][4].ToString() + "','" + dsTiffinDetails.Tables[0].Rows[0][5].ToString() + "','" +
                                                                       dsTiffinDetails.Tables[0].Rows[0][6].ToString() + "','" + dsTiffinDetails.Tables[0].Rows[0][7].ToString() + "','" + dsTiffinDetails.Tables[0].Rows[0][8].ToString() + "','" +
                                                                       dsTiffinDetails.Tables[0].Rows[0][9].ToString() + "','" + dsTiffinDetails.Tables[0].Rows[0][15].ToString() + "','Not Delivered')";
                dc.setdata(zk);

                list.Insert(0, "Success");

            }
            else
            {
                list.Insert(0, "Fail");
                list.Insert(1, BookFor);
                list.Insert(2, lunch_time.ToString("hh:mm tt"));

            }
        }
        else if (BookFor == "Dinner")
        {
            if (current_time <= dinner_time)
            {
                string zkp = "insert into simple_tiffin_daily_order values('" + oid + "','" + BookFor + "','" + TiffinId + "','" + dsTiffinDetails.Tables[0].Rows[0][2].ToString() + "','" +
                                                                       UserId + "','" + dsUserDetails.Tables[0].Rows[0][1].ToString() + "','" + UserId + "','" + current_time.ToLongTimeString() + "','" +
                                                                       current_time.ToLongDateString() + "','" + dsUserDetails.Tables[0].Rows[0][3].ToString() + "','" + DeliveryArea + "','" +
                                                                       DeliveryAddress + "','" + dsTiffinDetails.Tables[0].Rows[0][4].ToString() + "','" + dsTiffinDetails.Tables[0].Rows[0][5].ToString() + "','" +
                                                                       dsTiffinDetails.Tables[0].Rows[0][6].ToString() + "','" + dsTiffinDetails.Tables[0].Rows[0][7].ToString() + "','" + dsTiffinDetails.Tables[0].Rows[0][8].ToString() + "','" +
                                                                       dsTiffinDetails.Tables[0].Rows[0][9].ToString() + "','" + dsTiffinDetails.Tables[0].Rows[0][15].ToString() + "','Not Delivered')";
                dc.setdata(zkp);

                list.Insert(0, "Success");
            }
            else
            {
                list.Insert(0, "Fail");
                list.Insert(1, BookFor);
                list.Insert(2, dinner_time.ToString("hh:mm tt"));
            }
        }
        else
        {
            list.Insert(0, "NotBooked");
        }

        return list;
    }

    [WebMethod]
    public List<TiffinWithSweets> FetchTiffinWithSweetList(string ProviderCity)
    {
        List<TiffinWithSweets> List = new List<TiffinWithSweets>();
        string isvacation = "false", btntxt = "";

        string jkp = "select * from vacation_details";
        DataSet dsjkp = new DataSet();
        dsjkp = dc.getdata(jkp);
        if (Convert.ToBoolean(dsjkp.Tables[0].Rows[0][1].ToString()) == true)
        {
            isvacation = "true";
            btntxt = dsjkp.Tables[0].Rows[0][2].ToString();
        }

        string jk = "select * from tiffin_with_sweet where p_city='" + ProviderCity + "' and available='Order Now'";
        DataSet ds16 = new DataSet();
        ds16 = dc.getdata(jk);

        if (ds16.Tables[0].Rows.Count != 0)
        {
            for (int i = 0; i < ds16.Tables[0].Rows.Count; i++)
            {
                TiffinWithSweets TiffinWithSweet = new TiffinWithSweets();
                TiffinWithSweet.TiffinId = ds16.Tables[0].Rows[i][0].ToString();
                TiffinWithSweet.ProviderCity = ds16.Tables[0].Rows[i][1].ToString();
                TiffinWithSweet.ProviderId = ds16.Tables[0].Rows[i][2].ToString();
                TiffinWithSweet.ProviderName = ds16.Tables[0].Rows[i][3].ToString();
                TiffinWithSweet.Sabji = ds16.Tables[0].Rows[i][4].ToString();
                TiffinWithSweet.Roti = ds16.Tables[0].Rows[i][5].ToString();
                TiffinWithSweet.Dal = ds16.Tables[0].Rows[i][6].ToString();
                TiffinWithSweet.Chawal = ds16.Tables[0].Rows[i][7].ToString();
                TiffinWithSweet.Sweet = ds16.Tables[0].Rows[i][8].ToString();
                TiffinWithSweet.Other = ds16.Tables[0].Rows[i][9].ToString();
                TiffinWithSweet.Price = ds16.Tables[0].Rows[i][10].ToString();
                TiffinWithSweet.Tagline = ds16.Tables[0].Rows[i][14].ToString();
                TiffinWithSweet.Recommend = ds16.Tables[0].Rows[i][15].ToString();
                TiffinWithSweet.Image = ds16.Tables[0].Rows[i][16].ToString();
                TiffinWithSweet.IsVacation = isvacation;
                TiffinWithSweet.BtnTxt = btntxt;
                TiffinWithSweet.Status = "Success";

                List.Add(TiffinWithSweet);
            }
        }
        else
        {
            TiffinWithSweets TiffinWithSweet = new TiffinWithSweets();
            TiffinWithSweet.Status = "Fail";

            List.Add(TiffinWithSweet);
        }
        return List;
    }

    [WebMethod]
    public TiffinWithSweets GetTiffinWithSweetDetailsByTiffinId(string TiffinId)
    {
        string jk = "select * from tiffin_with_sweet where t_id='" + TiffinId + "'";
        DataSet ds17 = new DataSet();
        ds17 = dc.getdata(jk);

        if (ds17.Tables[0].Rows.Count != 0)
        {

            TiffinWithSweets TiffinWithSweet = new TiffinWithSweets();
            TiffinWithSweet.TiffinId = ds17.Tables[0].Rows[0][0].ToString();
            TiffinWithSweet.ProviderCity = ds17.Tables[0].Rows[0][1].ToString();
            TiffinWithSweet.ProviderId = ds17.Tables[0].Rows[0][2].ToString();
            TiffinWithSweet.ProviderName = ds17.Tables[0].Rows[0][3].ToString();
            TiffinWithSweet.Sabji = ds17.Tables[0].Rows[0][4].ToString();
            TiffinWithSweet.Roti = ds17.Tables[0].Rows[0][5].ToString();
            TiffinWithSweet.Dal = ds17.Tables[0].Rows[0][6].ToString();
            TiffinWithSweet.Chawal = ds17.Tables[0].Rows[0][7].ToString();
            TiffinWithSweet.Sweet = ds17.Tables[0].Rows[0][8].ToString();
            TiffinWithSweet.Other = ds17.Tables[0].Rows[0][9].ToString();
            TiffinWithSweet.Price = ds17.Tables[0].Rows[0][10].ToString();
            TiffinWithSweet.Tagline = ds17.Tables[0].Rows[0][14].ToString();
            TiffinWithSweet.Recommend = ds17.Tables[0].Rows[0][15].ToString();
            TiffinWithSweet.Image = ds17.Tables[0].Rows[0][16].ToString();
            TiffinWithSweet.Status = "Success";
            return TiffinWithSweet;

        }
        else
        {
            TiffinWithSweets TiffinWithSweet = new TiffinWithSweets();
            TiffinWithSweet.Status = "Fail";
            return TiffinWithSweet;
        }
    }
    [WebMethod]
    public List<string> BookTiffinWithSweetOrder(string BookFor, string TiffinId, string UserId, string DeliveryArea, string DeliveryAddress)
    {
        DateTime lunch_time;
        DateTime dinner_time;
        DataSet ds10 = new DataSet();
        DataSet dsTiffinDetails = new DataSet();
        DataSet dsUserDetails = new DataSet();
        string oid;

        List<string> list = new List<string>();

        #region Fetch Booking TImmings

        string ot = "select * from order_timmings";
        ds10 = dc.getdata(ot);
        lunch_time = Convert.ToDateTime(ds10.Tables[0].Rows[0][1].ToString());
        dinner_time = Convert.ToDateTime(ds10.Tables[0].Rows[1][1].ToString());

        #endregion

        #region Fetch Order Id

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

            int n = Convert.ToInt32(s);
            n = n + 1;


            oid = n.ToString();
            //rid = Convert.ToString(Convert.ToInt32(ds3.Tables[0].Rows[0][0].ToString()) + 1);
        }

        #endregion

        string jk = "select * from tiffin_with_sweet where t_id='" + TiffinId + "'";
        dsTiffinDetails = dc.getdata(jk);

        string jkp = "select * from user_accounts where id='" + UserId + "'";
        dsUserDetails = dc.getdata(jkp);

        if (BookFor == "Lunch")
        {
            if (current_time <= lunch_time)
            {
                string zk = "insert into tiffin_with_sweet_daily_order values('" + oid + "','" + BookFor + "','" + TiffinId + "','" + dsTiffinDetails.Tables[0].Rows[0][2].ToString() + "','" +
                                                                       UserId + "','" + dsUserDetails.Tables[0].Rows[0][1].ToString() + "','" + UserId + "','" + current_time.ToLongTimeString() + "','" +
                                                                       current_time.ToLongDateString() + "','" + dsUserDetails.Tables[0].Rows[0][3].ToString() + "','" + DeliveryArea + "','" +
                                                                       DeliveryAddress + "','" + dsTiffinDetails.Tables[0].Rows[0][4].ToString() + "','" + dsTiffinDetails.Tables[0].Rows[0][5].ToString() + "','" +
                                                                       dsTiffinDetails.Tables[0].Rows[0][6].ToString() + "','" + dsTiffinDetails.Tables[0].Rows[0][7].ToString() + "','" + dsTiffinDetails.Tables[0].Rows[0][8].ToString() + "','" +
                                                                       dsTiffinDetails.Tables[0].Rows[0][9].ToString() + "','" + dsTiffinDetails.Tables[0].Rows[0][10].ToString() + "','" + dsTiffinDetails.Tables[0].Rows[0][16].ToString() + "','Not Delivered')";
                dc.setdata(zk);

                list.Insert(0, "Success");

            }
            else
            {
                list.Insert(0, "Fail");
                list.Insert(1, BookFor);
                list.Insert(2, lunch_time.ToString("hh:mm tt"));

            }
        }
        else if (BookFor == "Dinner")
        {
            if (current_time <= dinner_time)
            {
                string zkp = "insert into tiffin_with_sweet_daily_order values('" + oid + "','" + BookFor + "','" + TiffinId + "','" + dsTiffinDetails.Tables[0].Rows[0][2].ToString() + "','" +
                                                                       UserId + "','" + dsUserDetails.Tables[0].Rows[0][1].ToString() + "','" + UserId + "','" + current_time.ToLongTimeString() + "','" +
                                                                       current_time.ToLongDateString() + "','" + dsUserDetails.Tables[0].Rows[0][3].ToString() + "','" + DeliveryArea + "','" +
                                                                       DeliveryAddress + "','" + dsTiffinDetails.Tables[0].Rows[0][4].ToString() + "','" + dsTiffinDetails.Tables[0].Rows[0][5].ToString() + "','" +
                                                                       dsTiffinDetails.Tables[0].Rows[0][6].ToString() + "','" + dsTiffinDetails.Tables[0].Rows[0][7].ToString() + "','" + dsTiffinDetails.Tables[0].Rows[0][8].ToString() + "','" +
                                                                       dsTiffinDetails.Tables[0].Rows[0][9].ToString() + "','" + dsTiffinDetails.Tables[0].Rows[0][10].ToString() + "','" + dsTiffinDetails.Tables[0].Rows[0][16].ToString() + "','Not Delivered')";
                dc.setdata(zkp);

                list.Insert(0, "Success");
            }
            else
            {
                list.Insert(0, "Fail");
                list.Insert(1, BookFor);
                list.Insert(2, dinner_time.ToString("hh:mm tt"));
            }
        }
        else
        {
            list.Insert(0, "NotBooked");
        }

        return list;
    }
    [WebMethod]
    public List<string> GetStartEndDate(string Days)
    {
        List<string> list = new List<string>();

        string startDate = current_time.AddDays(1).ToString("dd/MM/yyyy");
        string endDate = current_time.AddDays(Convert.ToInt32(Days)).ToString("dd/MM/yyy");

        list.Insert(0, startDate);
        list.Insert(1, endDate);

        return list;
    }
    [WebMethod]
    public string BookMonthlyOrder(string BookFor, string UserId, string DeliveryArea, string DeliveryAddress, string NoOfDays, string StartDate, string EndDate)
    {
        #region Order Id

        string oid = "";
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

        #endregion


        string kjp = "select * from vacation_details";
        DataSet dskjp = new DataSet();
        dskjp = dc.getdata(kjp);
        if (Convert.ToBoolean(dskjp.Tables[0].Rows[0][1].ToString()) == true)
        {
            return "Vacation";
        }
        else
        {
            DataSet ds5 = new DataSet();
            string j = "select * from monthly_order where uid='" + UserId + "'";
            ds5 = dc.getdata(j);

            DataSet UserDetailsDs = new DataSet();
            string jk = "select name,mob_no from user_accounts where id='" + UserId + "'";
            UserDetailsDs = dc.getdata(jk);

            if (ds5.Tables[0].Rows.Count == 0)
            {
                //Insert Query

                string z = "insert into monthly_order values('" + oid + "','" + BookFor + "','MT1','pragy20patel@gmail.com','" + UserId + "','" + UserDetailsDs.Tables[0].Rows[0][0].ToString() + "','" + UserId + "','" + UserDetailsDs.Tables[0].Rows[0][1].ToString() + "','" + DeliveryArea + "','" + DeliveryAddress + "','" + current_time.ToLongDateString() + "','" + NoOfDays + "','" + StartDate + "','" + EndDate + "','5','59')";
                dc.setdata(z);

                return "Success";
            }
            else
            {
                //Update Query

                string kj = "update monthly_order set order_id='" + oid + "',book_for='" + BookFor + "',tiffin_id='MT1',pid='pragy20patel@gmail.com',uname='" + UserDetailsDs.Tables[0].Rows[0][0].ToString() + "',ueid='" + UserId + "',mobile_no='" + UserDetailsDs.Tables[0].Rows[0][1].ToString() + "',delivery_area='" + DeliveryArea + "',delivery_add='" + DeliveryAddress + "',booking_date='" + current_time.ToLongDateString() + "',no_of_days='" + NoOfDays + "',start_date='" + StartDate + "',finish_date='" + EndDate + "',no_of_roti='5',price='59' where uid='" + UserId + "'";
                dc.setdata(kj);

                return "Success";
            }
        }
    }
    [WebMethod]
    public List<string> CheckPanelVisible(string UserId)
    {
        #region Delete Current Order

        DataSet ds12 = new DataSet();
        string jk = "select finish_date from monthly_order where uid='" + UserId + "'";
        ds12 = dc.getdata(jk);

        if (ds12.Tables[0].Rows.Count != 0)
        {
            string td = current_time.ToString("dd/MM/yyyy");
            if (td == ds12.Tables[0].Rows[0][0].ToString())
            {
                string jkp = "delete from monthly_order where uid='" + UserId + "'";
                dc.setdata(jkp);
            }
        }

        #endregion

        List<string> list = new List<string>();

        DataSet ds11 = new DataSet();
        string order_check = "select no_of_days,start_date,finish_date,no_of_roti,price,uname from monthly_order where uid='" + UserId + "'";
        ds11 = dc.getdata(order_check);

        if (ds11.Tables[0].Rows.Count == 0)
        {
            list.Insert(0, "CanBook");
        }
        else
        {
            //string order_check_finish_date = ds11.Tables[0].Rows[0][2].ToString();
            //DateTime order_check_final_finish_date = Convert.ToDateTime(order_check_finish_date);
            //string today_date = current_time.ToLongDateString();


            //int comp = DateTime.Compare(Convert.ToDateTime(today_date), order_check_final_finish_date);
            //if (comp < 0 || comp == 0)
            //{
            list.Insert(0, "AlreadyBook");
            list.Insert(1, ds11.Tables[0].Rows[0][0].ToString());
            list.Insert(2, ds11.Tables[0].Rows[0][1].ToString());
            list.Insert(3, ds11.Tables[0].Rows[0][2].ToString());
            list.Insert(4, ds11.Tables[0].Rows[0][5].ToString());
            //}
            //else
            //{
            //    list.Insert(0, "CanBook");
            //}
        }
        return list;
    }

    [WebMethod]
    public List<string> BookTrialOrder(string BookFor, string UserId, string DeliveryArea, string DeliveryAddress)
    {
        DateTime lunch_time;
        DateTime dinner_time;
        DataSet ds10 = new DataSet();
        DataSet dsTiffinDetails = new DataSet();
        DataSet dsUserDetails = new DataSet();
        string oid;

        List<string> list = new List<string>();

        #region Fetch Booking TImmings

        string ot = "select * from order_timmings";
        ds10 = dc.getdata(ot);
        lunch_time = Convert.ToDateTime(ds10.Tables[0].Rows[0][1].ToString());
        dinner_time = Convert.ToDateTime(ds10.Tables[0].Rows[1][1].ToString());

        #endregion

        #region Fetch Order Id

        DataSet ds = new DataSet();
        string oi = "select order_id from trial_tiffin_order order by order_id DESC";
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

        #endregion

        //string jk = "select * from tiffin_with_sweet where t_id='" + TiffinId + "'";
        //dsTiffinDetails = dc.getdata(jk); 

        string jk = "select * from vacation_details";
        DataSet dsjk = new DataSet();
        dsjk = dc.getdata(jk);
        if (Convert.ToBoolean(dsjk.Tables[0].Rows[0][1].ToString()) == true)
        {
            list.Insert(0, "Vacation");
        }
        else
        {

            string jkp = "select * from user_accounts where id='" + UserId + "'";
            dsUserDetails = dc.getdata(jkp);

            if (BookFor == "Lunch")
            {
                if (current_time <= lunch_time)
                {
                    string zk = "insert into trial_tiffin_order values('" + oid + "','" + BookFor + "','MT1','pragy20patel@gmail.com','" +
                                                                           UserId + "','" + dsUserDetails.Tables[0].Rows[0][1].ToString() + "','" + UserId + "','" + current_time.ToLongTimeString() + "','" +
                                                                           current_time.ToLongDateString() + "','" + dsUserDetails.Tables[0].Rows[0][3].ToString() + "','" + DeliveryArea + "','" +
                                                                           DeliveryAddress + "','5','65','~//admin//monthly_tiffin_image//2kunchboxcroped.jpg','Not Delivered')";
                    dc.setdata(zk);

                    list.Insert(0, "Success");

                }
                else
                {
                    list.Insert(0, "Fail");
                    list.Insert(1, BookFor);
                    list.Insert(2, lunch_time.ToString("hh:mm tt"));

                }
            }
            else if (BookFor == "Dinner")
            {
                if (current_time <= dinner_time)
                {
                    string zkp = "insert into trial_tiffin_order values('" + oid + "','" + BookFor + "','MT1','pragy20patel@gmail.com','" + UserId + "','" + dsUserDetails.Tables[0].Rows[0][1].ToString() + "','" + UserId + "','" + current_time.ToLongTimeString() + "','" +
                                                                           current_time.ToLongDateString() + "','" + dsUserDetails.Tables[0].Rows[0][3].ToString() + "','" + DeliveryArea + "','" +
                                                                           DeliveryAddress + "','5','65','~//admin//monthly_tiffin_image//2kunchboxcroped.jpg','Not Delivered')";
                    dc.setdata(zkp);

                    list.Insert(0, "Success");
                }
                else
                {
                    list.Insert(0, "Fail");
                    list.Insert(1, BookFor);
                    list.Insert(2, dinner_time.ToString("hh:mm tt"));
                }
            }
            else
            {
                list.Insert(0, "NotBooked");
            }
        }

        return list;
    }
    [WebMethod]
    public List<SimpleTiffins> GetSimpleTiffinOrderHistory(string UserId)
    {
        List<SimpleTiffins> list = new List<SimpleTiffins>();

        string jk = "select * from simple_tiffin_daily_order where uid='" + UserId + "'";
        DataSet dsSTOH = new DataSet();
        dsSTOH = dc.getdata(jk);

        if (dsSTOH.Tables[0].Rows.Count != 0)
        {
            for (int i = 0; i < dsSTOH.Tables[0].Rows.Count; i++)
            {
                SimpleTiffins SimpleTiffin = new SimpleTiffins();
                SimpleTiffin.BookFor = dsSTOH.Tables[0].Rows[i][1].ToString();
                SimpleTiffin.BookDate = Convert.ToDateTime(dsSTOH.Tables[0].Rows[i][8].ToString()).ToString("dd/MM/yyyy");
                SimpleTiffin.Sabji = dsSTOH.Tables[0].Rows[i][12].ToString();
                SimpleTiffin.Roti = dsSTOH.Tables[0].Rows[i][13].ToString();
                SimpleTiffin.Dal = dsSTOH.Tables[0].Rows[i][14].ToString();
                SimpleTiffin.Chawal = dsSTOH.Tables[0].Rows[i][15].ToString();
                SimpleTiffin.Other = dsSTOH.Tables[0].Rows[i][16].ToString();
                SimpleTiffin.Price = dsSTOH.Tables[0].Rows[i][17].ToString();
                SimpleTiffin.Image = dsSTOH.Tables[0].Rows[i][18].ToString();
                SimpleTiffin.OrderStatus = dsSTOH.Tables[0].Rows[i][19].ToString();
                SimpleTiffin.Status = "Success";

                list.Add(SimpleTiffin);
            }
        }
        else
        {
            SimpleTiffins SimpleTiffin = new SimpleTiffins();
            SimpleTiffin.Status = "NoOrder";

            list.Add(SimpleTiffin);
        }
        return list;
    }
    [WebMethod]
    public List<TiffinWithSweets> GetTiffinWithSweetOrderHistory(string UserId)
    {
        List<TiffinWithSweets> list = new List<TiffinWithSweets>();

        string jk = "select * from tiffin_with_sweet_daily_order where uid='" + UserId + "'";
        DataSet dsTWSOH = new DataSet();
        dsTWSOH = dc.getdata(jk);

        if (dsTWSOH.Tables[0].Rows.Count != 0)
        {
            for (int i = 0; i < dsTWSOH.Tables[0].Rows.Count; i++)
            {
                TiffinWithSweets TiffinWithSweet = new TiffinWithSweets();
                TiffinWithSweet.BookFor = dsTWSOH.Tables[0].Rows[i][1].ToString();
                TiffinWithSweet.BookDate = Convert.ToDateTime(dsTWSOH.Tables[0].Rows[i][8].ToString()).ToString("dd/MM/yyyy");
                TiffinWithSweet.Sabji = dsTWSOH.Tables[0].Rows[i][12].ToString();
                TiffinWithSweet.Roti = dsTWSOH.Tables[0].Rows[i][13].ToString();
                TiffinWithSweet.Dal = dsTWSOH.Tables[0].Rows[i][14].ToString();
                TiffinWithSweet.Chawal = dsTWSOH.Tables[0].Rows[i][15].ToString();
                TiffinWithSweet.Sweet = dsTWSOH.Tables[0].Rows[i][16].ToString();
                TiffinWithSweet.Other = dsTWSOH.Tables[0].Rows[i][17].ToString();
                TiffinWithSweet.Price = dsTWSOH.Tables[0].Rows[i][18].ToString();
                TiffinWithSweet.Image = dsTWSOH.Tables[0].Rows[i][19].ToString();
                TiffinWithSweet.OrderStatus = dsTWSOH.Tables[0].Rows[i][20].ToString();
                TiffinWithSweet.Status = "Success";

                list.Add(TiffinWithSweet);
            }
        }
        else
        {
            TiffinWithSweets TiffinWithSweet = new TiffinWithSweets();
            TiffinWithSweet.Status = "NoOrder";

            list.Add(TiffinWithSweet);
        }
        return list;
    }
    [WebMethod]
    public List<TrialTiffins> GetTrialTiffinOrderHistory(string UserId)
    {
        List<TrialTiffins> list = new List<TrialTiffins>();

        string jk = "select * from trial_tiffin_order where uid='" + UserId + "'";
        DataSet dsTTOH = new DataSet();
        dsTTOH = dc.getdata(jk);

        if (dsTTOH.Tables[0].Rows.Count != 0)
        {
            for (int i = 0; i < dsTTOH.Tables[0].Rows.Count; i++)
            {
                TrialTiffins TrialTiffin = new TrialTiffins();
                TrialTiffin.BookFor = dsTTOH.Tables[0].Rows[i][1].ToString();
                TrialTiffin.BookDate = Convert.ToDateTime(dsTTOH.Tables[0].Rows[i][8].ToString()).ToString("dd/MM/yyyy");
                TrialTiffin.Price = dsTTOH.Tables[0].Rows[i][13].ToString();
                TrialTiffin.Image = dsTTOH.Tables[0].Rows[i][14].ToString();
                TrialTiffin.OrderStatus = dsTTOH.Tables[0].Rows[i][15].ToString();
                TrialTiffin.Status = "Success";

                list.Add(TrialTiffin);
            }
        }
        else
        {
            TrialTiffins TrialTiffin = new TrialTiffins();
            TrialTiffin.Status = "NoOrder";

            list.Add(TrialTiffin);
        }
        return list;
    }
    [WebMethod]
    public List<FastFoodProduct> GetFastFoodOrderHistory(string UserId)
    {
        List<FastFoodProduct> list = new List<FastFoodProduct>();

        string jk = "select fast_food_orders.product_id,fast_food_orders.quantity,fast_food_orders.total_price,fast_food_orders.date,fast_food_orders.delivered,fast_food_orders.cancelled,fast_food_products.product_name,fast_food_products.image from fast_food_orders JOIN fast_food_products ON fast_food_orders.product_id=fast_food_products.product_id where fast_food_orders.user_id='" + UserId + "'";
        DataSet dsFFOH = new DataSet();
        dsFFOH = dc.getdata(jk);

        if (dsFFOH.Tables[0].Rows.Count != 0)
        {
            for (int i = 0; i < dsFFOH.Tables[0].Rows.Count; i++)
            {
                FastFoodProduct fastFoodProduct = new FastFoodProduct();
                fastFoodProduct.ProductName = dsFFOH.Tables[0].Rows[i][6].ToString();
                fastFoodProduct.Quntity = dsFFOH.Tables[0].Rows[i][1].ToString();
                fastFoodProduct.TotalPrice = dsFFOH.Tables[0].Rows[i][2].ToString();
                fastFoodProduct.BookDate = Convert.ToDateTime(dsFFOH.Tables[0].Rows[i][3].ToString()).ToString("dd/MM/yyyy");
                fastFoodProduct.Image = dsFFOH.Tables[0].Rows[i][7].ToString();
                fastFoodProduct.Status = "Success";
                if (Convert.ToBoolean(dsFFOH.Tables[0].Rows[i][4].ToString()) == true)
                {
                    fastFoodProduct.OrderStatus = "Delivered";
                }
                else
                {
                    fastFoodProduct.OrderStatus = "Not Delivered";
                }

                if (Convert.ToBoolean(dsFFOH.Tables[0].Rows[i][5].ToString()) == true)
                {
                    fastFoodProduct.OrderStatus = "Cancelled";
                }

                list.Add(fastFoodProduct);
            }
        }
        else
        {
            FastFoodProduct fastFoodProduct = new FastFoodProduct();
            fastFoodProduct.Status = "NoOrder";
            list.Add(fastFoodProduct);
        }
        return list;
    }
    [WebMethod]
    public UserProfile GetUserProfile(string UserId)
    {
        UserProfile userProfile = new UserProfile();

        string jk = "select ProfileImg from app_setting where Id='App1'";
        DataSet dsjk = new DataSet();
        dsjk = dc.getdata(jk);

        string jkp = "select name,address,mob_no from user_accounts where id='" + UserId + "'";
        DataSet dsjkp = new DataSet();
        dsjkp = dc.getdata(jkp);

        userProfile.ProfileImage = dsjk.Tables[0].Rows.Count != 0 ? dsjk.Tables[0].Rows[0][0].ToString() : "";
        userProfile.Name = dsjkp.Tables[0].Rows[0][0].ToString();
        userProfile.Address = dsjkp.Tables[0].Rows[0][1].ToString();
        userProfile.MobileNo = dsjkp.Tables[0].Rows[0][2].ToString();

        return userProfile;
    }
    [WebMethod]
    public string UpdateUserProfile(string Value, string Field, string UserId)
    {
        if (Field == "Name")
        {
            string jk = "update user_accounts set name='" + Value + "' where id='" + UserId + "'";
            dc.setdata(jk);
            return "Success";
        }

        if (Field == "Address")
        {
            string jk = "update user_accounts set address='" + Value + "' where id='" + UserId + "'";
            dc.setdata(jk);
            return "Success";
        }

        if (Field == "Mobile")
        {
            string jk = "update user_accounts set mob_no='" + Value + "' where id='" + UserId + "'";
            dc.setdata(jk);
            return "Success";
        }

        return "Fail";
    }
    [WebMethod]
    public AppHomeViewModal GetDataForAppHome()
    {
        
        #region Fast Food Order Timmings Get

        DataSet ds10 = new DataSet();

        string ot = "select * from ff_order_timmings";
        ds10 = dc.getdata(ot);
        commonStartTime = Convert.ToDateTime(ds10.Tables[0].Rows[0][1].ToString());
        commonEndTime = Convert.ToDateTime(ds10.Tables[0].Rows[0][2].ToString());

        #endregion Fast Food Order Timmings Get       

        string isvacation = "false", btntxt = "";

        string jkp = "select * from vacation_details";
        DataSet dsjkp = new DataSet();
        dsjkp = dc.getdata(jkp);
        if (Convert.ToBoolean(dsjkp.Tables[0].Rows[0][1].ToString()) == true)
        {
            isvacation = "true";
            btntxt = dsjkp.Tables[0].Rows[0][2].ToString();
        }

        AppHomeViewModal response = new AppHomeViewModal();
        List<SimpleTiffins> simpleTiffinLst = new List<SimpleTiffins>();
        List<TiffinWithSweets> tiffinWithSweetLst = new List<TiffinWithSweets>();
        List<SpecialTiffins> specialTiffinList = new List<SpecialTiffins>();
        List<FastFoodProduct> fastFoodProductLst = new List<FastFoodProduct>();
        List<string> imagesLst = new List<string>();
        List<string> odrtimeLst = new List<string>();

        #region Fetch Simple Tiffin

        string ST = "select * from simple_tiffin where IsAppHome=1 and available='Order Now'";
        DataSet dsST = new DataSet();
        dsST = dc.getdata(ST);

        if (dsST.Tables[0].Rows.Count != 0)
        {
            for (int i = 0; i < dsST.Tables[0].Rows.Count; i++)
            {
                SimpleTiffins SimpleTiffin = new SimpleTiffins();
                SimpleTiffin.TiffinId = dsST.Tables[0].Rows[i][0].ToString();
                SimpleTiffin.ProviderCity = dsST.Tables[0].Rows[i][1].ToString();
                SimpleTiffin.ProviderId = dsST.Tables[0].Rows[i][2].ToString();
                SimpleTiffin.ProviderName = dsST.Tables[0].Rows[i][3].ToString();
                SimpleTiffin.Sabji = dsST.Tables[0].Rows[i][4].ToString();
                SimpleTiffin.Roti = dsST.Tables[0].Rows[i][5].ToString();
                SimpleTiffin.Dal = dsST.Tables[0].Rows[i][6].ToString();
                SimpleTiffin.Chawal = dsST.Tables[0].Rows[i][7].ToString();
                SimpleTiffin.Other = dsST.Tables[0].Rows[i][8].ToString();
                SimpleTiffin.Price = dsST.Tables[0].Rows[i][9].ToString();
                SimpleTiffin.Tagline = dsST.Tables[0].Rows[i][13].ToString();
                SimpleTiffin.Recommend = dsST.Tables[0].Rows[i][14].ToString();
                SimpleTiffin.Image = dsST.Tables[0].Rows[i][15].ToString();
                SimpleTiffin.IsVacation = isvacation;
                SimpleTiffin.BtnTxt = btntxt;
                SimpleTiffin.Status = "Success";

                simpleTiffinLst.Add(SimpleTiffin);
            }
        }
        else
        {
            SimpleTiffins SimpleTiffin = new SimpleTiffins();
            SimpleTiffin.Status = "NOST";
            simpleTiffinLst.Add(SimpleTiffin);
        }

        #endregion

        #region Fetch Tiffin With Sweets

        string TWS = "select * from tiffin_with_sweet where IsAppHome=1 and available='Order Now'";
        DataSet dsTWS = new DataSet();
        dsTWS = dc.getdata(TWS);

        if (dsTWS.Tables[0].Rows.Count != 0)
        {
            for (int i = 0; i < dsTWS.Tables[0].Rows.Count; i++)
            {
                TiffinWithSweets TiffinWithSweet = new TiffinWithSweets();
                TiffinWithSweet.TiffinId = dsTWS.Tables[0].Rows[i][0].ToString();
                TiffinWithSweet.ProviderCity = dsTWS.Tables[0].Rows[i][1].ToString();
                TiffinWithSweet.ProviderId = dsTWS.Tables[0].Rows[i][2].ToString();
                TiffinWithSweet.ProviderName = dsTWS.Tables[0].Rows[i][3].ToString();
                TiffinWithSweet.Sabji = dsTWS.Tables[0].Rows[i][4].ToString();
                TiffinWithSweet.Roti = dsTWS.Tables[0].Rows[i][5].ToString();
                TiffinWithSweet.Dal = dsTWS.Tables[0].Rows[i][6].ToString();
                TiffinWithSweet.Chawal = dsTWS.Tables[0].Rows[i][7].ToString();
                TiffinWithSweet.Sweet = dsTWS.Tables[0].Rows[i][8].ToString();
                TiffinWithSweet.Other = dsTWS.Tables[0].Rows[i][9].ToString();
                TiffinWithSweet.Price = dsTWS.Tables[0].Rows[i][10].ToString();
                TiffinWithSweet.Tagline = dsTWS.Tables[0].Rows[i][14].ToString();
                TiffinWithSweet.Recommend = dsTWS.Tables[0].Rows[i][15].ToString();
                TiffinWithSweet.Image = dsTWS.Tables[0].Rows[i][16].ToString();
                TiffinWithSweet.IsVacation = isvacation;
                TiffinWithSweet.BtnTxt = btntxt;
                TiffinWithSweet.Status = "Success";

                tiffinWithSweetLst.Add(TiffinWithSweet);
            }
        }
        else
        {
            TiffinWithSweets TiffinWithSweet = new TiffinWithSweets();
            TiffinWithSweet.Status = "NOTWS";

            tiffinWithSweetLst.Add(TiffinWithSweet);
        }

        #endregion

        #region Fetch FastFood Products

        string FF = "select * from fast_food_products where IsAppHome=1 and is_available=1";
        DataSet dsFF = new DataSet();
        dsFF = dc.getdata(FF);

        if (dsFF.Tables[0].Rows.Count != 0)
        {
            for (int i = 0; i < dsFF.Tables[0].Rows.Count; i++)
            {
                if (dsFF.Tables[0].Rows[i][7].ToString() != "" && dsFF.Tables[0].Rows[i][8].ToString() != "")
                {
                    start_time = Convert.ToDateTime(dsFF.Tables[0].Rows[i][7].ToString());
                    end_time = Convert.ToDateTime(dsFF.Tables[0].Rows[i][8].ToString());
                }
                else
                {
                    start_time = commonStartTime;
                    end_time = commonEndTime;
                }

                if (current_time >= start_time && current_time <= end_time)
                {

                    FastFoodProduct FastFoodProduct = new FastFoodProduct();
                    FastFoodProduct.ProductId = dsFF.Tables[0].Rows[i][0].ToString();
                    FastFoodProduct.CategoryId = dsFF.Tables[0].Rows[i][1].ToString();
                    FastFoodProduct.ProviderCity = dsFF.Tables[0].Rows[i][2].ToString();
                    FastFoodProduct.ProviderId = dsFF.Tables[0].Rows[i][3].ToString();
                    FastFoodProduct.ProductName = dsFF.Tables[0].Rows[i][4].ToString();
                    FastFoodProduct.Description = dsFF.Tables[0].Rows[i][5].ToString();
                    FastFoodProduct.Price = dsFF.Tables[0].Rows[i][6].ToString();
                    FastFoodProduct.StartTime = start_time.ToString("hh:mm tt");
                    FastFoodProduct.EndTime = end_time.ToString("hh:mm tt");
                    FastFoodProduct.Image = dsFF.Tables[0].Rows[i][10].ToString();
                    FastFoodProduct.DiscountedPrice = dsFF.Tables[0].Rows[i][12].ToString();
                    FastFoodProduct.Status = "Success";
                    FastFoodProduct.CanBook = "true";

                    fastFoodProductLst.Add(FastFoodProduct);

                }
                else
                {
                    FastFoodProduct FastFoodProduct = new FastFoodProduct();
                    FastFoodProduct.ProductId = dsFF.Tables[0].Rows[i][0].ToString();
                    FastFoodProduct.CategoryId = dsFF.Tables[0].Rows[i][1].ToString();
                    FastFoodProduct.ProviderCity = dsFF.Tables[0].Rows[i][2].ToString();
                    FastFoodProduct.ProviderId = dsFF.Tables[0].Rows[i][3].ToString();
                    FastFoodProduct.ProductName = dsFF.Tables[0].Rows[i][4].ToString();
                    FastFoodProduct.Description = dsFF.Tables[0].Rows[i][5].ToString();
                    FastFoodProduct.Price = dsFF.Tables[0].Rows[i][6].ToString();
                    FastFoodProduct.StartTime = start_time.ToString("hh:mm tt");
                    FastFoodProduct.EndTime = end_time.ToString("hh:mm tt");
                    FastFoodProduct.Image = dsFF.Tables[0].Rows[i][10].ToString();
                    FastFoodProduct.DiscountedPrice = dsFF.Tables[0].Rows[i][12].ToString();
                    FastFoodProduct.Status = "Success";
                    FastFoodProduct.CanBook = "false";

                    fastFoodProductLst.Add(FastFoodProduct);
                }

            }
        }
        else
        {
            FastFoodProduct fastFoodProduct = new FastFoodProduct();
            fastFoodProduct.Status = "NOFF";
            fastFoodProductLst.Add(fastFoodProduct);
        }

        #endregion

        #region Fetch Special Tiffin

        string SPT = "select * from SpecialTiffin where IsAppHome=1 and IsAvailable=1";
        DataSet dsSPT = new DataSet();
        dsSPT = dc.getdata(SPT);

        if (dsSPT.Tables[0].Rows.Count != 0)
        {
            for (int i = 0; i < dsSPT.Tables[0].Rows.Count; i++)
            {
                SpecialTiffins SpecialTiffin = new SpecialTiffins();

                SpecialTiffin.TiffinId = dsSPT.Tables[0].Rows[i][0].ToString();
                SpecialTiffin.ProviderId = dsSPT.Tables[0].Rows[i][1].ToString();
                SpecialTiffin.ProviderCity = dsSPT.Tables[0].Rows[i][2].ToString();
                SpecialTiffin.TiffinName = dsSPT.Tables[0].Rows[i][3].ToString();
                SpecialTiffin.Description = dsSPT.Tables[0].Rows[i][4].ToString();
                SpecialTiffin.Price = dsSPT.Tables[0].Rows[i][5].ToString();
                SpecialTiffin.StartTime = dsSPT.Tables[0].Rows[i][6].ToString();
                SpecialTiffin.EndTime = dsSPT.Tables[0].Rows[i][7].ToString();
                SpecialTiffin.Image = dsSPT.Tables[0].Rows[i][10].ToString();
                SpecialTiffin.IsVacation = isvacation;
                SpecialTiffin.BtnTxt = btntxt;
                SpecialTiffin.Status = "Success";

                specialTiffinList.Add(SpecialTiffin);
            }
        }
        else
        {
            SpecialTiffins SpecialTiffin = new SpecialTiffins();
            SpecialTiffin.Status = "NOSPT";
            specialTiffinList.Add(SpecialTiffin);
        }

        #endregion

        #region FetchImages

        string IMG = "select Image from app_home_images";
        DataSet dsIMG = new DataSet();
        dsIMG = dc.getdata(IMG);

        for (int i = 0; i < dsIMG.Tables[0].Rows.Count; i++)
        {
            imagesLst.Add(dsIMG.Tables[0].Rows[i][0].ToString());
        }

        #endregion

        #region FetchTiffin Order Timmings

        string TTMS = "select time from order_timmings";
        DataSet dsTTMS = new DataSet();
        dsTTMS = dc.getdata(TTMS);

        odrtimeLst.Insert(0, dsTTMS.Tables[0].Rows[0][0].ToString());
        odrtimeLst.Insert(1, dsTTMS.Tables[0].Rows[1][0].ToString());

        #endregion

        response.SimpleTiffinList = simpleTiffinLst;
        response.TiffinWithSweetsList = tiffinWithSweetLst;
        response.SpecialTiffinList = specialTiffinList;
        response.FastFoodList = fastFoodProductLst;
        response.Images = imagesLst;
        response.OrderTimmings = odrtimeLst;

        return response;
    }
    [WebMethod]
    public List<SpecialTiffins> GetSpecialTiffinList(string ProviderCity)
    {
        List<SpecialTiffins> list = new List<SpecialTiffins>();
        string isvacation = "false", btntxt = "";

        string jkp = "select * from vacation_details";
        DataSet dsjkp = new DataSet();
        dsjkp = dc.getdata(jkp);
        if (Convert.ToBoolean(dsjkp.Tables[0].Rows[0][1].ToString()) == true)
        {
            isvacation = "true";
            btntxt = dsjkp.Tables[0].Rows[0][2].ToString();
        }

        string jk = "select * from specialtiffin where ProviderCity='" + ProviderCity + "' and IsAvailable=1";
        DataSet dsjk = new DataSet();
        dsjk = dc.getdata(jk);

        if (dsjk.Tables[0].Rows.Count != 0)
        {
            for (int i = 0; i < dsjk.Tables[0].Rows.Count; i++)
            {
                SpecialTiffins SpecialTiffin = new SpecialTiffins();

                SpecialTiffin.TiffinId = dsjk.Tables[0].Rows[i][0].ToString();
                SpecialTiffin.ProviderId = dsjk.Tables[0].Rows[i][1].ToString();
                SpecialTiffin.ProviderCity = dsjk.Tables[0].Rows[i][2].ToString();
                SpecialTiffin.TiffinName = dsjk.Tables[0].Rows[i][3].ToString();
                SpecialTiffin.Description = dsjk.Tables[0].Rows[i][4].ToString();
                SpecialTiffin.Price = dsjk.Tables[0].Rows[i][5].ToString();
                SpecialTiffin.StartTime = Convert.ToDateTime(dsjk.Tables[0].Rows[i][6].ToString()).ToString("hh:mm tt");
                SpecialTiffin.EndTime = Convert.ToDateTime(dsjk.Tables[0].Rows[i][7].ToString()).ToString("hh:mm tt");
                SpecialTiffin.Image = dsjk.Tables[0].Rows[i][10].ToString();
                SpecialTiffin.IsVacation = isvacation;
                SpecialTiffin.BtnTxt = btntxt;
                SpecialTiffin.Status = "Success";

                list.Add(SpecialTiffin);
            }
        }
        else
        {
            SpecialTiffins SpecialTiffin = new SpecialTiffins();
            SpecialTiffin.Status = "NoTiffin";
            list.Add(SpecialTiffin);
        }
        return list;
    }
    [WebMethod]
    public List<string> BookSpecialTiffinOrder(string UserId, string TiffinId, string DelCity, string DelArea, string DelAddress)
    {

        List<string> list = new List<string>();        

        DateTime start_time, end_time;

        string jkp = "select StartTime,EndTime from specialtiffin where TiffinId='" + TiffinId + "'";
        DataSet dsjkp = new DataSet();
        dsjkp = dc.getdata(jkp);

        start_time = Convert.ToDateTime(dsjkp.Tables[0].Rows[0][0].ToString());
        end_time = Convert.ToDateTime(dsjkp.Tables[0].Rows[0][1].ToString());

        if (current_time >= start_time && current_time <= end_time)
        {
            string jk = "insert into SpecialTiffinOrder (UserId,TiffinId,DelCity,DelArea,DelAddress,BookDate,BookTime,IsRead,IsDelivered,IsCancelled) values('" + UserId + "','" +
               TiffinId + "','" + DelCity + "','" + DelArea + "','" + DelAddress + "','" +
               current_time.ToLongDateString() + "','" + current_time.ToLongTimeString() + "',0,0,0)";
            dc.setdata(jk);

            string provider = "select ProviderId,TiffinName,Price from SpecialTiffin where TiffinId='" + TiffinId + "'";
            DataSet dsProvider = new DataSet();
            dsProvider = dc.getdata(provider);

            string providerDetails = "select * from providers where pid='" + dsProvider.Tables[0].Rows[0][0].ToString() + "'";
            DataSet dsProviderDetails = new DataSet();
            dsProviderDetails = dc.getdata(providerDetails);

            string providerName = dsProviderDetails.Tables[0].Rows[0][1].ToString();
            string providerMobile = dsProviderDetails.Tables[0].Rows[0][3].ToString();
            string providerEmail = dsProviderDetails.Tables[0].Rows[0][4].ToString();

            string user = "select * from user_accounts where id='" + UserId + "'";
            DataSet dsUser = new DataSet();
            dsUser = dc.getdata(user);

            string userName = dsUser.Tables[0].Rows[0][1].ToString();
            string userMobile = dsUser.Tables[0].Rows[0][3].ToString();
            string userEmail = dsUser.Tables[0].Rows[0][5].ToString();

            string msgAdmin = "Hello Admin, We are from Tiffin Dabba new Special Tiffin order booked.Tiffin Name:-  " + dsProvider.Tables[0].Rows[0][1].ToString() + " , Price:-  " + dsProvider.Tables[0].Rows[0][2].ToString() + " Rs.";
            string msgProvider = "Hello " + providerName + ", We are from Tiffin Dabba new Special Tiffin order booked.Tiffin Name:-  " + dsProvider.Tables[0].Rows[0][1].ToString();
            string msgUser = "Hello " + userName + ", We are from Tiffin Dabba,You booked Special Tiffin.Tiffin Name:-  " + dsProvider.Tables[0].Rows[0][1].ToString() + ", Price:-  " + dsProvider.Tables[0].Rows[0][2].ToString() + " Rs.";

            Thread thread = new Thread(delegate()
            {
                SendMsgAdmin(msgAdmin);
                SendMsgProvider(msgProvider, providerMobile);
                SendMsgUser(msgUser, userMobile);

                SendEmailUser(msgUser, userEmail);
            });

            thread.IsBackground = true;
            thread.Start();

            list.Insert(0, "Success");

        }
        else
        {
            list.Insert(0, "CantBook");
            list.Insert(1, start_time.ToString("hh:mm tt"));
            list.Insert(2, end_time.ToString("hh:mm tt"));
        }
        return list;
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

    [WebMethod]
    public List<SpecialTiffins> GetSpecialTiffinOrderHistory(string UserId)
    {
        List<SpecialTiffins> list = new List<SpecialTiffins>();

        string jk = "select * from SpecialTiffinOrder where UserId='" + UserId + "'";
        DataSet dsjk = new DataSet();
        dsjk = dc.getdata(jk);

        if(dsjk.Tables[0].Rows.Count!=0)
        {
            for(int i=0;i<dsjk.Tables[0].Rows.Count;i++)
            {
                string tiffin = "select * from SpecialTiffin where TiffinId='" + dsjk.Tables[0].Rows[i][2].ToString() + "'";
                DataSet dsTiffin = new DataSet();
                dsTiffin = dc.getdata(tiffin);

                SpecialTiffins SpecialTiffin = new SpecialTiffins();
                SpecialTiffin.TiffinName = dsTiffin.Tables[0].Rows[0][3].ToString();
                SpecialTiffin.Description = dsTiffin.Tables[0].Rows[0][4].ToString();
                SpecialTiffin.Price = dsTiffin.Tables[0].Rows[0][5].ToString();
                SpecialTiffin.Image = dsTiffin.Tables[0].Rows[0][10].ToString();
                SpecialTiffin.BookDate = Convert.ToDateTime(dsjk.Tables[0].Rows[i][6].ToString()).ToString("dd/MM/yyyy");
                SpecialTiffin.BookTime = Convert.ToDateTime(dsjk.Tables[0].Rows[i][7].ToString()).ToString("hh:mm tt");
                SpecialTiffin.Status = "Success";

                if (Convert.ToBoolean(dsjk.Tables[0].Rows[i][9].ToString()) == true)
                {
                    SpecialTiffin.OrderStatus = "Delivered";
                }
                else
                {
                    SpecialTiffin.OrderStatus = "Not Delivered";
                }

                if (Convert.ToBoolean(dsjk.Tables[0].Rows[i][10].ToString()) == true)
                {
                    SpecialTiffin.OrderStatus = "Cancelled";
                }
                list.Add(SpecialTiffin);
                
            }
        }
        else
        {
            SpecialTiffins SpecialTiffin = new SpecialTiffins();
            SpecialTiffin.Status = "NoOrder";
            list.Add(SpecialTiffin);

        }
        return list;
    }
    [WebMethod]
    public SpecialTiffins GetSpecialTiffinById(string TiffinId)
    {
        SpecialTiffins SpecialTiffin = new SpecialTiffins();

        string jk = "select * from SpecialTiffin where TiffinId='" + TiffinId + "'";
        DataSet dsjk = new DataSet();
        dsjk = dc.getdata(jk);

        SpecialTiffin.TiffinName = dsjk.Tables[0].Rows[0][3].ToString();
        SpecialTiffin.Description = dsjk.Tables[0].Rows[0][4].ToString();
        SpecialTiffin.Price = dsjk.Tables[0].Rows[0][5].ToString();
        SpecialTiffin.Image = dsjk.Tables[0].Rows[0][10].ToString();
        SpecialTiffin.Status = "Success";

        return SpecialTiffin;
    }

    [WebMethod]
    public string SaveDeviceToken(string UserId,string DeviceToken)
    {
        string jk = "update user_accounts set DeviceToken='" + DeviceToken + "' where id='" + UserId + "'";
        dc.setdata(jk);

        return "Success";
    }
}