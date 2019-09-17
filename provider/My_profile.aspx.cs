using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class provider_My_profile : System.Web.UI.Page
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
                Panel1.Visible = true;
                
                DataSet ds = new DataSet();
                string s = "select pid,name,city,mob_no,e_id,address from providers where pid='" + Session["pid"].ToString() + "'";
                ds = dc.getdata(s);

                //Label1.Text = ds.Tables[0].Rows[0][0].ToString();
                Label2.Text = ds.Tables[0].Rows[0][1].ToString();
                Label3.Text = ds.Tables[0].Rows[0][2].ToString();
                Label4.Text = ds.Tables[0].Rows[0][3].ToString();
                Label5.Text = ds.Tables[0].Rows[0][4].ToString();
                Label6.Text = ds.Tables[0].Rows[0][5].ToString();
            }
        }
    }
   
    
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/provider/Update_profile.aspx");
    }
    
}