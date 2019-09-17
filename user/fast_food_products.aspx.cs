using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class user_fast_food_products : System.Web.UI.Page
{
    DataCon dc = new DataCon();
    string cat_id;
    DataSet ds3 = new DataSet();
    DateTime current_time = TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.Local, TimeZoneInfo.FindSystemTimeZoneById("India Standard Time"));
    DateTime start_time, end_time, commonStartTime, commonEndTime;
    DataSet ds10 = new DataSet();

    protected void Page_Load(object sender, EventArgs e)
    {
        #region Fast Food Order Timmings Get

        string ot = "select * from ff_order_timmings";
        ds10 = dc.getdata(ot);
        commonStartTime = Convert.ToDateTime(ds10.Tables[0].Rows[0][1].ToString());
        commonEndTime = Convert.ToDateTime(ds10.Tables[0].Rows[0][2].ToString());

        #endregion Fast Food Order Timmings Get

        if (IsPostBack != true)
        {
            if (Session["productId"] == null)
            {
                Session["productId"] = new List<int>();
            }
            //DataSet ds1 = new DataSet();
            //string s = "select * from city where is_fastfood=1";
            //ds1 = dc.getdata(s);

            //for (int i = 0; i < ds1.Tables[0].Rows.Count; i++)
            //{
            //    DropDownList1.Items.Add(ds1.Tables[0].Rows[i][0].ToString());
            //}           
            cat_id = Request.QueryString["cat_id"];
            if (cat_id == "102515209")
            {
                product_name_lbl.Text = "All Products";
                product_name_lbl2.Text = "All Products";
            }
            else
            {
                string jk = "select name from fast_food_categories where cat_id='" + cat_id + "'";
                ds3 = dc.getdata(jk);
                product_name_lbl.Text = ds3.Tables[0].Rows[0][0].ToString();
                product_name_lbl2.Text = ds3.Tables[0].Rows[0][0].ToString();
                SearchTb.Visible = false;
                SearchBtn.Visible = false;
            }


            //#region Old Way Displayproducts

            //if (cat_id == "102515209")
            //{
            //    DataSet ds = new DataSet();
            //    //string zk = "select * from fast_food_products where cat_id='" + Request.QueryString["cat_id"] + "' and is_available=1 and provider_city='" + DropDownList1.Text + "'";
            //    string zk = "select * from fast_food_products where is_available=1";
            //    ds = dc.getdata(zk);

            //    if (ds.Tables[0].Rows.Count != 0)
            //    {
            //        fast_food_products_list_rptr.DataSource = ds;
            //        fast_food_products_list_rptr.DataBind();
            //        Label1.Text = "List Of " + product_name_lbl.Text;
            //    }
            //    else
            //    {
            //        fast_food_products_list_rptr.DataSource = "";
            //        fast_food_products_list_rptr.DataBind();
            //        Label1.Text = "No Products Available";
            //    }
            //}
            //else
            //{
            //    DataSet ds = new DataSet();
            //    //string zk = "select * from fast_food_products where cat_id='" + Request.QueryString["cat_id"] + "' and is_available=1 and provider_city='" + DropDownList1.Text + "'";
            //    string zk = "select * from fast_food_products where cat_id='" + Request.QueryString["cat_id"] + "' and is_available=1";
            //    ds = dc.getdata(zk);

            //    if (ds.Tables[0].Rows.Count != 0)
            //    {
            //        fast_food_products_list_rptr.DataSource = ds;
            //        fast_food_products_list_rptr.DataBind();
            //        Label1.Text = "List Of " + product_name_lbl.Text;
            //    }
            //    else
            //    {
            //        fast_food_products_list_rptr.DataSource = "";
            //        fast_food_products_list_rptr.DataBind();
            //        Label1.Text = product_name_lbl.Text + " Is Not Available";
            //    }
            //}


            //#endregion Old Way Displayproducts


            #region New Way Display Products

            List<FastFoodProduct> FastFoodProductList = new List<FastFoodProduct>();


            if (cat_id == "102515209")
            {
                DataSet ds5 = new DataSet();
                //string zk = "select * from fast_food_products where cat_id='" + Request.QueryString["cat_id"] + "' and is_available=1 and provider_city='" + DropDownList1.Text + "'";
                string zk = "select * from fast_food_products where is_available=1";
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
                    fast_food_products_list_rptr.DataSource = FastFoodProductList;
                    fast_food_products_list_rptr.DataBind();
                    Label1.Text = "List Of " + product_name_lbl.Text;
                }
                else
                {
                    fast_food_products_list_rptr.DataSource = "";
                    fast_food_products_list_rptr.DataBind();
                    Label1.Text = "No Products Available";
                }

            }
            else
            {
                string zk = "select * from fast_food_products where cat_id='" + Request.QueryString["cat_id"] + "' and is_available=1";
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
                    fast_food_products_list_rptr.DataSource = FastFoodProductList;
                    fast_food_products_list_rptr.DataBind();
                    Label1.Text = "List Of " + product_name_lbl.Text;
                }
                else
                {
                    fast_food_products_list_rptr.DataSource = "";
                    fast_food_products_list_rptr.DataBind();
                    Label1.Text = product_name_lbl.Text + " Is Not Available";
                }
            }

            #endregion
        }
    }

    //protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    DataSet ds1 = new DataSet();
    //    DropDownList2.Items.Clear();
    //    fast_food_products_list_rptr.DataSource = "";
    //    fast_food_products_list_rptr.DataBind();
    //    Label1.Text = "";

    //    if (DropDownList1.SelectedIndex == 0)
    //    {
    //        DropDownList2.Items.Clear();
    //        fast_food_products_list_rptr.DataSource = "";
    //        fast_food_products_list_rptr.DataBind();
    //        Label1.Text = "";
    //    }
    //    else
    //    {
    //        DropDownList2.Items.Insert(0, "--To Select--");
    //        string s = "select area from delivery_area where city='" + DropDownList1.Text + "' and is_fastfood=1";
    //        ds1 = dc.getdata(s);

    //        for (int i = 0; i < ds1.Tables[0].Rows.Count; i++)
    //        {
    //            DropDownList2.Items.Add(ds1.Tables[0].Rows[i][0].ToString());
    //        }
    //        //DropDownList2.CssClass = "animated bounceInLeft form-control";
    //    }
    //}
    //protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    fast_food_products_list_rptr.DataSource = "";
    //    fast_food_products_list_rptr.DataBind();
    //    Label1.Text = "";
    //    if (DropDownList2.SelectedIndex == 0)
    //    {
    //        fast_food_products_list_rptr.DataSource = "";
    //        fast_food_products_list_rptr.DataBind();
    //        Label1.Text = "";
    //    }
    //}
    //protected void Button1_Click(object sender, EventArgs e)
    //{
    //    if (DropDownList1.SelectedIndex != 0)
    //    {
    //        if (DropDownList2.SelectedIndex != 0)
    //        {
    //            DataSet ds = new DataSet();
    //            string zk = "select * from fast_food_products where cat_id='" + Request.QueryString["cat_id"] + "' and is_available=1 and provider_city='" + DropDownList1.Text + "'";
    //            ds = dc.getdata(zk);

    //            if (ds.Tables[0].Rows.Count != 0)
    //            {
    //                fast_food_products_list_rptr.DataSource = ds;
    //                fast_food_products_list_rptr.DataBind();
    //                Label1.Text = "List Of " + product_name_lbl.Text;
    //            }
    //            else
    //            {
    //                fast_food_products_list_rptr.DataSource = "";
    //                fast_food_products_list_rptr.DataBind();
    //                Label1.Text = product_name_lbl.Text + " Is Not Available";
    //            }

    //        }
    //        else
    //        {
    //            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please Select Your Delivery Area');", true);
    //        }
    //    }
    //    else
    //    {
    //        ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please Select Your City');", true);
    //    }
    //}
    public void AddToCart(object sender, CommandEventArgs e)
    {
        int pid = Convert.ToInt32(e.CommandName.ToString());

        string jk = "select start_time,end_time,product_name from fast_food_products where product_id='" + pid + "'";
        DataSet ds11 = new DataSet();
        ds11 = dc.getdata(jk);
        if (ds11.Tables[0].Rows[0][0].ToString() != "" && ds11.Tables[0].Rows[0][1].ToString() != "")
        {
            start_time = Convert.ToDateTime(ds11.Tables[0].Rows[0][0].ToString());
            end_time = Convert.ToDateTime(ds11.Tables[0].Rows[0][1].ToString());
        }
        else
        {
            start_time = commonStartTime;
            end_time = commonEndTime;
        }


        if(current_time >= start_time && current_time <= end_time)
        {
            List<int> zk = ((List<int>)Session["productId"]);
            bool already = zk.Contains(pid);
            if (already == false)
            {
                ((List<int>)Session["productId"]).Add(pid);
                Label item_no_lbl = (Label)Page.Master.FindControl("no_of_item");
                item_no_lbl.Text = zk.Count().ToString();
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Product Added In Cart');", true);
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('This Product Already Added');", true);
                //((List<int>)Session["productId"]).Add(pid);
                Label item_no_lbl = (Label)Page.Master.FindControl("no_of_item");
                item_no_lbl.Text = zk.Count().ToString();
            }
        }
        else
        {
            string err = "You can book " + ds11.Tables[0].Rows[0][2].ToString() + " between " + start_time.ToShortTimeString() + " to " + end_time.ToShortTimeString();
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('" + err + "');", true);
            //time_limit_warning_lbl.Text = "You can book " + ds11.Tables[0].Rows[0][2].ToString() + " between " + start_time.ToShortTimeString() + " to " + end_time.ToShortTimeString();
            //time_limit_warning_lbl.Focus();
        }
        
    }
    protected void SearchBtn_ServerClick(object sender, EventArgs e)
    {
        List<FastFoodProduct> FastFoodProductList = new List<FastFoodProduct>();

        if (Request.QueryString["cat_id"].ToString() == "102515209")
        {
            DataSet ds5 = new DataSet();
            //string zk = "select * from fast_food_products where cat_id='" + Request.QueryString["cat_id"] + "' and is_available=1 and provider_city='" + DropDownList1.Text + "'";
            string zk = "select * from fast_food_products where is_available=1 and product_name LIKE '%" + SearchTb.Text + "%'";
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
                fast_food_products_list_rptr.DataSource = FastFoodProductList;
                fast_food_products_list_rptr.DataBind();
                if (SearchTb.Text != "")
                {
                    Label1.Text = "List Of " + SearchTb.Text;
                }
                else
                {
                    Label1.Text = "List Of " + product_name_lbl.Text;
                }

            }
            else
            {
                fast_food_products_list_rptr.DataSource = "";
                fast_food_products_list_rptr.DataBind();
                Label1.Text = "Search String " + SearchTb.Text + " Not Matched";
            }
        }
        else
        {
            DataSet ds5 = new DataSet();
            //string zk = "select * from fast_food_products where cat_id='" + Request.QueryString["cat_id"] + "' and is_available=1 and provider_city='" + DropDownList1.Text + "'";
            string zk = "select * from fast_food_products where cat_id='" + Request.QueryString["cat_id"] + "' and is_available=1 and product_name LIKE '%" + SearchTb.Text + "%'";
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
                fast_food_products_list_rptr.DataSource = FastFoodProductList;
                fast_food_products_list_rptr.DataBind();
                if (SearchTb.Text != "")
                {
                    Label1.Text = "List Of " + SearchTb.Text;
                }
                else
                {
                    Label1.Text = "List Of " + product_name_lbl.Text;
                }
            }
            else
            {
                fast_food_products_list_rptr.DataSource = "";
                fast_food_products_list_rptr.DataBind();
                Label1.Text = "Search String " + SearchTb.Text + " Not Matched";
            }
        }
    }
}