using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class user_Simple_tiffin : System.Web.UI.Page
{
    DataCon dc = new DataCon();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack != true)
        {
            DataSet ds = new DataSet();
            string s = "select * from city";
            ds = dc.getdata(s);

            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                DropDownList1.Items.Add(ds.Tables[0].Rows[i][0].ToString());
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedIndex != 0)
        {
            if (DropDownList2.SelectedIndex != 0)
            {
                DataSet ds2 = new DataSet();

                //DataSet ds1 = new DataSet();
                //string j = "select standard,average,poor from simple_tiffin where p_city='" + DropDownList1.Text + "'";
                //ds1 = dc.getdata(j);

                DataSet ds11 = new DataSet();
                string zk = "select standard,average,poor from delivery_area where area='" + DropDownList2.SelectedItem + "'";
                ds11 = dc.getdata(zk);

                if (ds11.Tables[0].Rows[0][0].ToString() == "1")
                {

                    string z = "select * from simple_tiffin where p_city='" + DropDownList1.Text + "' and standard=1";
                    DataSet ds5 = new DataSet();
                    ds5 = dc.getdata(z);
                    if (ds5.Tables[0].Rows.Count != 0)
                    {
                        ds2 = dc.getdata(z);
                        DataTable dt = ds2.Tables[0];
                        ViewState["dt"] = dt;
                    }
                }
                if (ds11.Tables[0].Rows[0][1].ToString() == "1")
                {

                    string x = "select * from simple_tiffin where p_city='" + DropDownList1.Text + "' and average=1";
                    DataSet ds3 = new DataSet();
                    ds3 = dc.getdata(x);
                    if (ds3.Tables[0].Rows.Count != 0)
                    {
                        for (int i = 0; i < ds3.Tables[0].Rows.Count; i++)
                        {
                            ds2.Tables[0].ImportRow(ds3.Tables[0].Rows[i]);
                            DataTable dt = ds2.Tables[0];
                            ViewState["dt"] = dt;
                        }
                    }
                }
                if (ds11.Tables[0].Rows[0][2].ToString() == "1")
                {

                    string y = "select * from simple_tiffin where p_city='" + DropDownList1.Text + "' and poor=1";
                    DataSet ds4 = new DataSet();
                    ds4 = dc.getdata(y);
                    if (ds4.Tables[0].Rows.Count != 0)
                    {
                        for (int i = 0; i < ds4.Tables[0].Rows.Count; i++)
                        {
                            ds2.Tables[0].ImportRow(ds4.Tables[0].Rows[i]);
                            DataTable dt = ds2.Tables[0];
                            ViewState["dt"] = dt;
                        }
                    }
                }

                if (ds2.Tables[0].Rows.Count != 0)
                {
                    DataTable dt = (DataTable)ViewState["dt"];
                    dt = dt.DefaultView.ToTable(true, "t_id", "p_city", "p_id", "p_name", "sabji", "roti", "dal", "chawal", "other", "price", "standard", "average", "poor", "tagline", "recommend", "st_image", "available");

                    Label1.Text = "List Of Simple Tiffins";
                    Repeater1.DataSource = dt;
                    Repeater1.DataBind();
                }
                else
                {
                    Label1.Text = "NO Simple Tiffin For This City";
                    Repeater1.DataSource = "";
                    Repeater1.DataBind();
                }
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please Select Your Delivery Area');", true);
            }
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please Select Your City');", true);
        }

    }

    protected void kj(object sender, CommandEventArgs e)
    {

        String[] ss;
        ss = e.CommandName.ToString().Split(';');
        string j = ss[0];
        string k = ss[1];

        if (j == "Order Now")
        {
            if (Convert.ToString(Session["uid"]) == "")
            {
                Session["tiffin_type"] = "st";
                Session["stid"] = k;
                Session["delivery_area"] = DropDownList2.SelectedItem;
                Session["msg"] = "Please Log In First";
                Response.Redirect("~/Log_in.aspx");
            }
            else
            {
                Session["stid"] = k;
                Session["delivery_area"] = DropDownList2.SelectedItem;
                Response.Redirect("~/user/Simple_tiffin_order.aspx");
            }

        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('This Simple Tiffin Not Available For Today');", true);
            //   Response.Write("<script>alert('This Simple Tiffin Not Available For Today')</script>");
        }

    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataSet ds1 = new DataSet();
        DropDownList2.Items.Clear();
        Repeater1.DataSource = "";
        Repeater1.DataBind();
        Label1.Text = "";

        if (DropDownList1.SelectedIndex == 0)
        {
            DropDownList2.Items.Clear();
            Repeater1.DataSource = "";
            Repeater1.DataBind();
            Label1.Text = "";
        }
        else
        {
            DropDownList2.Items.Insert(0, "--To Select--");
            string s = "select area from delivery_area where city='" + DropDownList1.Text + "'";
            ds1 = dc.getdata(s);

            for (int i = 0; i < ds1.Tables[0].Rows.Count; i++)
            {
                DropDownList2.Items.Add(ds1.Tables[0].Rows[i][0].ToString());
            }
            //DropDownList2.CssClass = "animated bounceInLeft form-control";
        }
    }
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        Repeater1.DataSource = "";
        Repeater1.DataBind();
        Label1.Text = "";
        if (DropDownList2.SelectedIndex == 0)
        {
            Repeater1.DataSource = "";
            Repeater1.DataBind();
            Label1.Text = "";
        }
    }
    
}