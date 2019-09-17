using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_Add_remove_fastfood_products : System.Web.UI.Page
{
    DataCon dc = new DataCon();
    int is_avai, product_id;
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
                cat_lbl.Visible = false;
                provider_id_lbl.Visible = false;
                provider_city_lbl.Visible = false;
                update_btn.Visible = false;
                if (!Request.QueryString.AllKeys.Contains("product_id"))
                {
                    DataSet ds1 = new DataSet();
                    string j = "select * from  fast_food_categories";
                    ds1 = dc.getdata(j);

                    DropDownList3.DataSource = ds1;
                    DropDownList3.DataBind();
                    DropDownList3.DataTextField = "name";
                    DropDownList3.DataValueField = "cat_id";
                    DropDownList3.DataBind();
                    DropDownList3.Items.Insert(0, "--To Select--");
                    //for (int z = 0; z < ds1.Tables[0].Rows.Count; z++)
                    //{
                    //    DropDownList3.Items.Add(ds1.Tables[0].Rows[z][1].ToString());
                    //}

                    DataSet ds = new DataSet();
                    string p = "select city from city where is_fastfood=1";
                    ds = dc.getdata(p);

                    for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                    {
                        DropDownList1.Items.Add(ds.Tables[0].Rows[i][0].ToString());
                    }
                }
                else
                {
                    update_btn.Visible = true;
                    Button1.Visible = false;
                    product_id = Convert.ToInt32(Request.QueryString["product_id"].ToString());

                    GetProductById(product_id);
                }
            }
        }
    }

    private void GetProductById(int product_id)
    {
        DataSet ds5 = new DataSet();
        DataSet ds6 = new DataSet();
        string zkp = "select * from fast_food_products where product_id=" + product_id;
        ds5 = dc.getdata(zkp);
        string jkp = "select name from providers where pid='" + ds5.Tables[0].Rows[0][3].ToString() + "'";
        ds6 = dc.getdata(jkp);

        cat_lbl.Visible = true;
        provider_id_lbl.Visible = true;
        provider_city_lbl.Visible = true;
        DropDownList1.Visible = false;
        DropDownList2.Visible = false;
        DropDownList3.Visible = false;
        cat_lbl.Text = Request.QueryString["cat"].ToString();
        provider_city_lbl.Text = ds5.Tables[0].Rows[0][2].ToString();
        provider_id_lbl.Text = ds5.Tables[0].Rows[0][3].ToString();
        Label2.Text = ds6.Tables[0].Rows[0][0].ToString();
        ProductName_tb.Text = ds5.Tables[0].Rows[0][4].ToString();
        ProductDisc_tb.Text = ds5.Tables[0].Rows[0][5].ToString();
        Price_tb.Text = ds5.Tables[0].Rows[0][6].ToString();
        StartOrderTimeTb.Text = ds5.Tables[0].Rows[0][7].ToString();
        EndOrderTimeTb.Text = ds5.Tables[0].Rows[0][8].ToString();
        is_avai_chk.Checked = Convert.ToBoolean(ds5.Tables[0].Rows[0][9].ToString());
        IsAppHomeChk.Checked = Convert.ToBoolean(ds5.Tables[0].Rows[0][11].ToString());
        DiscountTb.Text = ds5.Tables[0].Rows[0][12].ToString();
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataSet ds1 = new DataSet();
        string j = "select pid from providers where city='" + DropDownList1.SelectedItem + "' and is_fastfood=1";
        ds1 = dc.getdata(j);
        if (DropDownList1.SelectedIndex == 0)
        {
            DropDownList2.Items.Clear();
            Label2.Text = "";
        }
        else
        {
            DropDownList2.Items.Clear();
            DropDownList2.Items.Insert(0, "--To Select--");
            for (int k = 0; k < ds1.Tables[0].Rows.Count; k++)
            {
                DropDownList2.Items.Add(ds1.Tables[0].Rows[k][0].ToString());
            }
        }
    }
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList2.SelectedIndex == 0)
        {
            Label2.Text = "";
        }
        else
        {
            DataSet ds2 = new DataSet();
            string l = "select name from providers where pid='" + DropDownList2.SelectedItem + "'";
            ds2 = dc.getdata(l);
            Label2.Text = ds2.Tables[0].Rows[0][0].ToString();
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (DropDownList3.SelectedIndex != 0)
        {
            if (DropDownList1.SelectedIndex != 0)
            {
                if (DropDownList2.SelectedIndex != 0)
                {
                    string ext = System.IO.Path.GetExtension(FileUpload1.FileName);
                    if (ext == ".jpg" || ext == ".png" || ext == ".jpeg" || ext == ".gif" || ext == ".GIF" || ext == ".PNG" || ext == ".JPEG" || ext == ".JPG")
                    {
                        FileUpload1.SaveAs(Server.MapPath("~//admin//fast_food_image//" + FileUpload1.FileName));
                        string path = "~//admin//fast_food_image//" + FileUpload1.FileName;

                        if (is_avai_chk.Checked == true)
                        {
                            is_avai = 1;
                        }
                        else
                        {
                            is_avai = 0;
                        }

                        string query = "insert into fast_food_products (cat_id,provider_city,provider_id,product_name,description,price,start_time,end_time,is_available,image,IsAppHome,DiscountedPrice) values(" + Convert.ToInt32(DropDownList3.SelectedValue) + ",'" + DropDownList1.Text + "','" + DropDownList2.Text + "','"
                                        + ProductName_tb.Text + "','" + ProductDisc_tb.Text + "','" + Price_tb.Text + "','" + StartOrderTimeTb.Text + "','" + EndOrderTimeTb.Text + "'," + is_avai + ",'" + path + "'," + IsAppHomeChk.Checked + ",'" + DiscountTb.Text + "')";
                        dc.setdata(query);
                        DropDownList1.SelectedIndex = 0;
                        DropDownList2.SelectedIndex = 0;
                        DropDownList2.Items.Clear();
                        DropDownList3.SelectedIndex = 0;
                        ProductName_tb.Text = "";
                        StartOrderTimeTb.Text = "";
                        EndOrderTimeTb.Text = "";
                        ProductDisc_tb.Text = "";
                        Price_tb.Text = "";
                        DiscountTb.Text = "";
                        is_avai_chk.Checked = false;
                        Label2.Text = "";
                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please select Image Only');", true);
                    }
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please select provider');", true);
                }
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please Select City');", true);
            }
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please Select Category');", true);
        }
    }
    protected void update_btn_Click(object sender, EventArgs e)
    {
        if (!FileUpload1.HasFile)
        {
            if (is_avai_chk.Checked == true)
            {
                is_avai = 1;
            }
            else
            {
                is_avai = 0;
            }
            string q = "update fast_food_products set product_name='" + ProductName_tb.Text + "',description='" + ProductDisc_tb.Text + "',price='" + Price_tb.Text + "',start_time='" + StartOrderTimeTb.Text + "',end_time='" + EndOrderTimeTb.Text + "',is_available=" + is_avai + ",IsAppHome=" + IsAppHomeChk.Checked + ",DiscountedPrice='" + DiscountTb.Text + "' where product_id=" + Convert.ToInt32(Request.QueryString["product_id"].ToString());
            dc.setdata(q);
            Response.Redirect("~/admin/List_of_fastfood.aspx");
        }
        else
        {
            string ext = System.IO.Path.GetExtension(FileUpload1.FileName);
            if (ext == ".jpg" || ext == ".png" || ext == ".jpeg" || ext == ".gif" || ext == ".GIF" || ext == ".PNG" || ext == ".JPEG" || ext == ".JPG")
            {
                FileUpload1.SaveAs(Server.MapPath("~//admin//fast_food_image//" + FileUpload1.FileName));
                string path = "~//admin//fast_food_image//" + FileUpload1.FileName;

                if (is_avai_chk.Checked == true)
                {
                    is_avai = 1;
                }
                else
                {
                    is_avai = 0;
                }
                string q = "update fast_food_products set product_name='" + ProductName_tb.Text + "',description='" + ProductDisc_tb.Text + "',price='" + Price_tb.Text + "',start_time='" + StartOrderTimeTb.Text + "',end_time='" + EndOrderTimeTb.Text + "',is_available=" + is_avai + ",image='" + path + "',IsAppHome=" + IsAppHomeChk.Checked + ",DiscountedPrice='" + DiscountTb.Text + "' where product_id=" + Convert.ToInt32(Request.QueryString["product_id"].ToString());
                dc.setdata(q);
                Response.Redirect("~/admin/List_of_fastfood.aspx");
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please select Image Only');", true);
            }
        }
    }
}