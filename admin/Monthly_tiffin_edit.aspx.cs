using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_Monthly_tiffin_edit : System.Web.UI.Page
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
                Panel1.Visible = false;
                DataSet ds = new DataSet();
                string s = "select * from monthly_tiffin_menu where tiffin_id='" + Session["monthly_tiffin_id"].ToString() + "'";
                ds = dc.getdata(s);

                Label1.Text = ds.Tables[0].Rows[0][0].ToString();
                LinkButton2.Text = ds.Tables[0].Rows[0][2].ToString();
                No_of_roti_tb.Text = ds.Tables[0].Rows[0][1].ToString();
                Price_tb.Text = ds.Tables[0].Rows[0][4].ToString();
                Trial_price_tb.Text = ds.Tables[0].Rows[0][5].ToString();
                Image1.ImageUrl = ds.Tables[0].Rows[0][6].ToString();
            }
        }
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Session["pid"] = LinkButton2.Text;
        Response.Redirect("~/admin/Full_details_of_provider.aspx");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string p = "update monthly_tiffin_menu set no_of_roti='" + No_of_roti_tb.Text + "',price='" + Price_tb.Text + "',trial_price='" + Trial_price_tb.Text + "' where tiffin_id='" + Session["monthly_tiffin_id"] + "'";
        dc.setdata(p);
        Response.Redirect("~/admin/Monthly_tiffin_list.aspx");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        string q = "delete from monthly_tiffin_menu where tiffin_id='" + Session["monthly_tiffin_id"].ToString() + "'";
        dc.setdata(q);

        ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('This Tiffin Is Deleted');", true);
        // Response.Write("<script>alert('This Tiffin Is Deleted')</script>");
        Response.Redirect("~/admin/Monthly_tiffin_list.aspx");
    }

    protected void LinkButton14_Click(object sender, EventArgs e)
    {
        Panel1.Visible = true;
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        string ext = System.IO.Path.GetExtension(FileUpload1.FileName);

        if (ext.ToLower() == ".jpg" || ext.ToLower() == ".png" || ext.ToLower() == ".jpeg" || ext.ToLower() == ".gif")
        {
            FileUpload1.SaveAs(Server.MapPath("~//admin//monthly_tiffin_image//" + FileUpload1.FileName));
            string path = "~//admin//monthly_tiffin_image//" + FileUpload1.FileName;

            string j = "update monthly_tiffin_menu set image='" + path + "' where tiffin_id='" + Session["monthly_tiffin_id"].ToString() + "'";
            dc.setdata(j);

            Panel1.Visible = false;

            DataSet ds4 = new DataSet();
            string k = "select image from monthly_tiffin_menu where tiffin_id='" + Session["monthly_tiffin_id"].ToString() + "'";
            ds4 = dc.getdata(k);
            Image1.ImageUrl = ds4.Tables[0].Rows[0][0].ToString();
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Select Image Only');", true);
        }
    }
}