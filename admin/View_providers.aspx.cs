using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_View_providers : System.Web.UI.Page
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
                Button4.Visible = false;
                DataSet ds1 = new DataSet();
                string j = "select * from city";
                ds1 = dc.getdata(j);

                for (int i = 0; i < ds1.Tables[0].Rows.Count; i++)
                {
                    DropDownList1.Items.Add(ds1.Tables[0].Rows[i][0].ToString());
                }
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Button4.Visible = true;
        DataSet ds = new DataSet();
        string s = "select pid,name,city,mob_no,e_id,address,pass from providers where pid='" + TextBox1.Text + "'";
        ds = dc.getdata(s);

        if (ds.Tables[0].Rows.Count != 0)
        {
            Label1.Text = "Details Of Provider";
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
        else
        {
            Label1.Text = "";
            GridView1.DataSource = "";
            GridView1.DataBind();
            Button4.Visible = false;
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Invalid Provider Id');", true);
          //  Response.Write("<script>alert('Invalid Provider Id')</script>");
        }
    }
    protected void fp(object sender, CommandEventArgs e)
    {
        string j = e.CommandName.ToString();
        Session["pid"] = j;
        Response.Redirect("~/admin/Full_details_of_provider.aspx");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedIndex != 0)
        {
            DataSet ds2 = new DataSet();
            string k = "select pid,name,city,mob_no,e_id,address,pass from providers where city='" + DropDownList1.Text + "'";
            ds2 = dc.getdata(k);

            if (ds2.Tables[0].Rows.Count != 0)
            {
                Label2.Text = "Details Of Providers Of " + DropDownList1.Text + " City";
                GridView2.DataSource = ds2;
                GridView2.DataBind();
            }
            else
            {
                Label2.Text = "No Providers In " + DropDownList1.Text + " City";
                GridView2.DataSource = "";
                GridView2.DataBind();
            }

        }
        else
        {
            Label2.Text = "";
            GridView2.DataSource = "";
            GridView2.DataBind();

            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please Select City');", true);
            //Response.Write("<script>alert('Please Select City')</script>");
        }
    }
    
    protected void Button3_Click(object sender, EventArgs e)
    {
        DataSet ds3 = new DataSet();
        string a = "select * from providers";
        ds3 = dc.getdata(a);

        if (ds3.Tables[0].Rows.Count != 0)
        {
            Label3.Text = "Lis Of All Providers";
            GridView3.DataSource = ds3;
            GridView3.DataBind();
        }
        else
        {
            Label3.Text = "";
            GridView3.DataSource = "";
            GridView3.DataBind();

            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('No Providers Yet');", true);
            //Response.Write("<script>alert('No Providers Yet')</script>");
        }
    }

    protected void EditProvider(object sender, GridViewEditEventArgs e)
    {
        GridView3.EditIndex = e.NewEditIndex;
        BindData();
    }
    protected void CancelEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView3.EditIndex = -1;
        BindData();
    }

    private void BindData()
    {
        DataSet ds26 = new DataSet();
        string zk = "select * from providers";
        ds26 = dc.getdata(zk);
        GridView3.DataSource = ds26;
        GridView3.DataBind();
    }
    protected void UpdateProvider(object sender, GridViewUpdateEventArgs e)
    {
        string id = ((LinkButton)GridView3.Rows[e.RowIndex]
                            .FindControl("LinkButton3")).Text;
        string ff = ((TextBox)GridView3.Rows[e.RowIndex]
                            .FindControl("is_ff_tb")).Text;

        string zk = "update  providers set is_fastfood='" + ff + "' where pid='" + id + "'";
        dc.setdata(zk);
        GridView3.EditIndex = -1;
        BindData();

    }
    
    protected void Button4_Click(object sender, EventArgs e)
    {
        string g = "delete from providers where pid='" + TextBox1.Text + "'";
        dc.setdata(g);
        string h = "delete from simple_tiffin where p_id='" + TextBox1.Text + "'";
        dc.setdata(h);
        string i = "delete from tiffin_with_sweet where p_id='" + TextBox1.Text + "'";
        dc.setdata(i);
        string l = "delete from simple_tiffin_daily_order where pid='" + TextBox1.Text + "'";
        dc.setdata(l);
        string m = "delete from tiffin_with_sweet_daily_order where pid='" + TextBox1.Text + "'";
        dc.setdata(m);

        Label1.Text = "";
        GridView1.DataSource = "";
        GridView1.DataBind();
        Button4.Visible = false;

        ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('This Provider Is Deleted');", true);
       // Response.Write("<script>alert('This Provider Is Deleted')</script>");
    }
    
}