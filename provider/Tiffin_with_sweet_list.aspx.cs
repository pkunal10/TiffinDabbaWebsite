using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class provider_Tiffin_with_sweet_list : System.Web.UI.Page
{
    DataCon dc = new DataCon();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToString(Session["pid"]) == "")
        {
            Session["msg"] = "Please Log In First";
            Response.Redirect("~/Log_in.aspx");
        }
        else
        {
            if (IsPostBack != true)
            {
                DataSet ds = new DataSet();
                string s = "select * from tiffin_with_sweet where p_id='" + Session["pid"].ToString() + "'";
                ds = dc.getdata(s);

                if (ds.Tables[0].Rows.Count != 0)
                {
                    GridView1.DataSource = ds;
                    GridView1.DataBind();
                }
                else
                {
                    GridView1.DataSource = "";
                    GridView1.DataBind();
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('You have no Tiffin With Sweet');", true);
                    //Response.Write("<script>alert('You have no Tiffin With Sweet')</script>");
                }
            }
        }
    }
    protected void kj(object sender, CommandEventArgs e)
    {
        string j = e.CommandName.ToString();
        Session["twsid"] = j;
        Response.Redirect("~/provider/Tiffin_with_sweet_menu.aspx");
    }
    
}