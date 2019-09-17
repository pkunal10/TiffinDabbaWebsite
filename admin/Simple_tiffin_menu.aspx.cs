using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_Simple_tiffin_menu : System.Web.UI.Page
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
                string s = "select * from simple_tiffin where t_id='" + Session["stid"].ToString() + "'";
                ds = dc.getdata(s);

                Label1.Text = ds.Tables[0].Rows[0][0].ToString();
                LinkButton2.Text = ds.Tables[0].Rows[0][2].ToString();
                TextBox1.Text = ds.Tables[0].Rows[0][4].ToString();
                TextBox2.Text = ds.Tables[0].Rows[0][5].ToString();
                TextBox3.Text = ds.Tables[0].Rows[0][6].ToString();
                TextBox4.Text = ds.Tables[0].Rows[0][7].ToString();
                TextBox5.Text = ds.Tables[0].Rows[0][9].ToString();
                TextBox6.Text = ds.Tables[0].Rows[0][8].ToString();
                Image1.ImageUrl = ds.Tables[0].Rows[0][10].ToString();
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
        string p = "update simple_tiffin set sabji='" + TextBox1.Text + "',roti='" + TextBox2.Text + "',dal='" + TextBox3.Text + "',chawal='" + TextBox4.Text + "',other='" + TextBox6.Text + "',price='" + TextBox5.Text + "' where t_id='" + Session["stid"] + "'";
        dc.setdata(p);
        Response.Redirect("~/admin/Simple_tiffin_list.aspx");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        string q = "delete from simple_tiffin where t_id='" + Session["stid"].ToString() + "'";
        dc.setdata(q);

        ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('This Tiffin Is Deleted');", true);
       // Response.Write("<script>alert('This Tiffin Is Deleted')</script>");
        Response.Redirect("~/admin/Simple_tiffin_list.aspx");
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
            FileUpload1.SaveAs(Server.MapPath("~//admin//simple_tiffin_image//" + FileUpload1.FileName));
            string path = "~//admin//simple_tiffin_image//" + FileUpload1.FileName;

            string j = "update simple_tiffin set st_image='" + path + "' where t_id='" + Session["stid"].ToString() + "'";
            dc.setdata(j);

            Panel1.Visible = false;

            DataSet ds4 = new DataSet();
            string k = "select st_image from simple_tiffin where t_id='" + Session["stid"].ToString() + "'";
            ds4 = dc.getdata(k);
            Image1.ImageUrl = ds4.Tables[0].Rows[0][0].ToString();
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Select Image Only');", true);
        }
    }
}