using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_Monthly_tiffin_list : System.Web.UI.Page
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
                DataSet ds = new DataSet();
                string s = "select * from city";
                ds = dc.getdata(s);

                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    DropDownList1.Items.Add(ds.Tables[0].Rows[i][0].ToString());
                }
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedIndex != 0)
        {
            DataSet ds1 = new DataSet();
            string j = "select * from monthly_tiffin_menu where p_city='" + DropDownList1.Text + "'";
            ds1 = dc.getdata(j);

            if (ds1.Tables[0].Rows.Count != 0)
            {
                Label1.Text = "Monthly Tiffin Available In " + DropDownList1.Text + " City";
                GridView1.DataSource = ds1;
                GridView1.DataBind();
            }
            else
            {
                GridView1.DataSource = "";
                GridView1.DataBind();
                Label1.Text = "No Monthly Tiffin Available In " + DropDownList1.Text + " City";
            }
        }
        else
        {
            GridView1.DataSource = "";
            GridView1.DataBind();
            Label1.Text = "";
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please Select City');", true);
            // Response.Write("<script>alert('Please Select City')</script>");
        }
    }
    protected void jk(object sender, CommandEventArgs e)
    {
        string j = e.CommandName.ToString();
        Session["monthly_tiffin_id"] = j;
        Response.Redirect("~/admin/Monthly_tiffin_edit.aspx");
    }
    protected void abc(object sender, CommandEventArgs e)
    {
        string k = e.CommandName.ToString();
        Session["pid"] = k;
        Response.Redirect("~/admin/Full_details_of_provider.aspx");
    }
    protected void EditTiffin(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        BindData();
    }
    protected void CancelEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        BindData();
    }
    protected void UpdateTiffin(object sender, GridViewUpdateEventArgs e)
    {
        string t_id = ((LinkButton)GridView1.Rows[e.RowIndex]
                            .FindControl("LinkButton1")).Text;
        string stdu = ((TextBox)GridView1.Rows[e.RowIndex]
                            .FindControl("Std_tb")).Text;
        string avgu = ((TextBox)GridView1.Rows[e.RowIndex]
                            .FindControl("Avg_tb")).Text;
        string pooru = ((TextBox)GridView1.Rows[e.RowIndex]
                            .FindControl("Poor_tb")).Text;
        string taglineu = ((TextBox)GridView1.Rows[e.RowIndex]
                            .FindControl("Tagline_tb")).Text;
        string recommendu = ((TextBox)GridView1.Rows[e.RowIndex]
                            .FindControl("Recommend_tb")).Text;

        string zk = "update monthly_tiffin_menu set standard='" + stdu + "',average='" + avgu + "',poor='" + pooru + "',tagline='" + taglineu + "',recommend='" + recommendu + "' where tiffin_id='" + t_id + "'";
        dc.setdata(zk);
        GridView1.EditIndex = -1;
        BindData();

    }
    private void BindData()
    {
        string z = "select * from monthly_tiffin_menu";
        DataSet ds10 = new DataSet();
        ds10 = dc.getdata(z);
        GridView1.DataSource = ds10;
        GridView1.DataBind();
    }
}