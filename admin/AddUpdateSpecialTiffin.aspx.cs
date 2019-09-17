using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_AddUpdateSpecialTiffin : System.Web.UI.Page
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
                if (!Request.QueryString.AllKeys.Contains("TiffinId"))
                {
                    string j = "select pid from providers";
                    DataSet dsj = new DataSet();
                    dsj = dc.getdata(j);

                    ProviderIdDD.DataSource = dsj;
                    ProviderIdDD.DataBind();
                    ProviderIdDD.DataTextField = "pid";
                    ProviderIdDD.DataBind();
                    ProviderIdDD.Items.Insert(0, "-- To Select --");
                }
                else
                {
                    GetTiffinDetails(Request.QueryString["TiffinId"].ToString());
                }
            }
        }
    }

    private void GetTiffinDetails(string tiffinId)
    {
        UpdateBtn.Visible = true;
        AddBtn.Visible = false;
        ProviderIdDD.Visible = false;

        string jk = "select * from SpecialTiffin where TiffinId='" + tiffinId + "'";
        DataSet dsjk = new DataSet();
        dsjk = dc.getdata(jk);

        string PName = "select name from providers where pid='" + dsjk.Tables[0].Rows[0][1].ToString() + "'";
        DataSet dsPName = new DataSet();
        dsPName = dc.getdata(PName);

        ProviderIdLbl.Text = dsjk.Tables[0].Rows[0][1].ToString();
        ProviderNameLbl.Text = dsPName.Tables[0].Rows[0][0].ToString();
        ProviderCityLbl.Text = dsjk.Tables[0].Rows[0][2].ToString();
        TiffinNameTb.Text = dsjk.Tables[0].Rows[0][3].ToString();
        DescriptionTb.Text = dsjk.Tables[0].Rows[0][4].ToString();
        PriceTb.Text = dsjk.Tables[0].Rows[0][5].ToString();
        StartTimeTb.Text = dsjk.Tables[0].Rows[0][6].ToString();
        EndTimeTb.Text = dsjk.Tables[0].Rows[0][7].ToString();
        IsAvailableChk.Checked = Convert.ToBoolean(dsjk.Tables[0].Rows[0][8].ToString());
        IsAppHome.Checked = Convert.ToBoolean(dsjk.Tables[0].Rows[0][9].ToString());

    }
    protected void ProviderIdDD_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ProviderIdDD.SelectedIndex == 0)
        {
            ProviderCityLbl.Text = "";
            ProviderNameLbl.Text = "";
        }
        else
        {
            string y = "select name,city from providers where pid='" + ProviderIdDD.SelectedItem + "'";
            DataSet dsy = new DataSet();
            dsy = dc.getdata(y);

            ProviderNameLbl.Text = dsy.Tables[0].Rows[0][0].ToString();
            ProviderCityLbl.Text = dsy.Tables[0].Rows[0][1].ToString();
        }
    }
    protected void AddBtn_Click(object sender, EventArgs e)
    {
        if (ProviderIdDD.SelectedIndex == 0)
        {
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please select Provider');", true);
        }
        else
        {
            String ext = System.IO.Path.GetExtension(Image.FileName);
            if (ext.ToLower() == ".png" || ext.ToLower() == ".jpg" || ext.ToLower() == ".jpeg" || ext.ToLower() == ".gif")
            {
                Image.SaveAs(Server.MapPath("~//admin//special_tiffin_image//" + Image.FileName));
                string path = "~//admin//special_tiffin_image//" + Image.FileName;

                string o = "insert into SpecialTiffin (ProviderId,ProviderCity,TiffinName,Description,Price,StartTime,EndTime,IsAvailable,IsAppHome,Image) values('" + ProviderIdDD.SelectedItem.ToString() + "','" +
                         ProviderCityLbl.Text + "','" + TiffinNameTb.Text + "','" + DescriptionTb.Text + "','" + PriceTb.Text + "','" + StartTimeTb.Text + "','" + EndTimeTb.Text + "'," +
                         IsAvailableChk.Checked + "," + IsAppHome.Checked + ",'" + path + "')";
                dc.setdata(o);

                ProviderIdDD.SelectedIndex = 0;
                ProviderCityLbl.Text = "";
                ProviderNameLbl.Text = "";
                TiffinNameTb.Text = "";
                DescriptionTb.Text = "";
                PriceTb.Text = "";
                StartTimeTb.Text = "";
                EndTimeTb.Text = "";
                IsAvailableChk.Checked = false;
                IsAppHome.Checked = false;

                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Tiffin Added.');", true);
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please select image only');", true);
            }
        }
    }
    protected void UpdateBtn_Click(object sender, EventArgs e)
    {
        if (Image.HasFile)
        {
            string ext = System.IO.Path.GetExtension(Image.FileName);
            if (ext.ToLower() == ".png" || ext.ToLower() == ".jpg" || ext.ToLower() == ".jpeg" || ext.ToLower() == ".gif")
            {
                Image.SaveAs(Server.MapPath("~//admin//special_tiffin_image//" + Image.FileName));
                string path = "~//admin//special_tiffin_image//" + Image.FileName;

                string jk = "update SpecialTiffin set TiffinName='" + TiffinNameTb.Text + "',Description='" + DescriptionTb.Text + "',Price='" + PriceTb.Text + "',StartTime='" + StartTimeTb.Text + "',EndTime='" +
                           EndTimeTb.Text + "',IsAvailable=" + IsAvailableChk.Checked + ",IsAppHome=" + IsAppHome.Checked + ",Image='" + path + "' where TiffinId='" + Request.QueryString["TiffinId"].ToString() + "'";

                dc.setdata(jk);

                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Tiffin Updated');window.location='ListSpecialTiffin.aspx';", true);
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please select image only');", true);
            }
        }
        else
        {
            string jk = "update SpecialTiffin set TiffinName='" + TiffinNameTb.Text + "',Description='" + DescriptionTb.Text + "',Price='" + PriceTb.Text + "',StartTime='" + StartTimeTb.Text + "',EndTime='" +
                           EndTimeTb.Text + "',IsAvailable=" + IsAvailableChk.Checked + ",IsAppHome=" + IsAppHome.Checked + " where TiffinId='" + Request.QueryString["TiffinId"].ToString() + "'";

            dc.setdata(jk);

            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Tiffin Updated');window.location='ListSpecialTiffin.aspx';", true);
        }
    }
}