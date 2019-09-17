using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class user_SpecialTiffin : System.Web.UI.Page
{
    DataCon dc = new DataCon();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack != true)
        {
            DataSet ds = new DataSet();
            string s = "select * from city";
            ds = dc.getdata(s);

            CityDD.DataSource = ds;
            CityDD.DataTextField = "city";
            CityDD.DataBind();
        }
    }
    protected void CityDD_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataSet ds1 = new DataSet();
        AreaDD.Items.Clear();
        SpecialTiffinRptr.DataSource = "";
        SpecialTiffinRptr.DataBind();
        InfoLbl.Text = "";

        if (CityDD.SelectedIndex == 0)
        {
            AreaDD.Items.Clear();
            SpecialTiffinRptr.DataSource = "";
            SpecialTiffinRptr.DataBind();
            InfoLbl.Text = "";
        }
        else
        {
            
            string s = "select area from delivery_area where city='" + CityDD.Text + "'";
            ds1 = dc.getdata(s);

            AreaDD.DataSource = ds1;
            AreaDD.DataTextField = "area";
            AreaDD.DataBind();
            AreaDD.Items.Insert(0, "--To Select--");
        }
    }
    protected void AreaDD_SelectedIndexChanged(object sender, EventArgs e)
    {
        SpecialTiffinRptr.DataSource = "";
        SpecialTiffinRptr.DataBind();
        InfoLbl.Text = "";
        if (AreaDD.SelectedIndex == 0)
        {
            SpecialTiffinRptr.DataSource = "";
            SpecialTiffinRptr.DataBind();
            InfoLbl.Text = "";
        }
    }
    protected void GoBtn_Click(object sender, EventArgs e)
    {
        if(CityDD.SelectedIndex!=0)
        {
            if(AreaDD.SelectedIndex!=0)
            {
                string jk = "select * from specialtiffin where ProviderCity='" + CityDD.Text + "' and IsAvailable=1";
                DataSet dsjk = new DataSet();
                dsjk = dc.getdata(jk);

                if (dsjk.Tables[0].Rows.Count == 0)
                {
                    SpecialTiffinRptr.DataSource = "";
                    SpecialTiffinRptr.DataBind();

                    InfoLbl.Text = "No Special Tiffin Available";
                }
                else
                {
                    SpecialTiffinRptr.DataSource = dsjk;
                    SpecialTiffinRptr.DataBind();

                    InfoLbl.Text = "List Of Special Tiffin";
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
    protected void BookBtn_Command(object sender, CommandEventArgs e)
    {
        string id = e.CommandArgument.ToString();
        if (Convert.ToString(Session["uid"]) == "")
        {
            Session["tiffin_type"] = "spt";
            Session["sptid"] = id;
            Session["delivery_area"] = AreaDD.SelectedItem;
            Session["delivery_city"] = CityDD.SelectedItem;
            Session["msg"] = "Please Log In First";
            Response.Redirect("~/Log_in.aspx");
        }
        else
        {
            Session["sptid"] = id;
            Session["delivery_area"] = AreaDD.SelectedItem;
            Response.Redirect("~/user/SpecialTiffinOrder.aspx");
        }
    }
}