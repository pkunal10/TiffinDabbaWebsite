using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Add_Remove_city : System.Web.UI.Page
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

                GridView1.DataSource = ds;
                GridView1.DataBind();
                GridView2.DataSource = ds;
                GridView2.DataBind();

                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    DropDownList1.Items.Add(ds.Tables[0].Rows[i][0].ToString());
                }

            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text == "")
        {
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please Select City');", true);
            //Response.Write("<script>alert('Please Enter City')</script>");
        }
        else
        {
            string j = "insert into city (city) values('" + TextBox1.Text + "')";
            dc.setdata(j);
            TextBox1.Text = "";


            DataSet ds1 = new DataSet();
            string k = "select * from city";
            ds1 = dc.getdata(k);

            GridView1.DataSource = ds1;
            GridView1.DataBind();
            GridView2.DataSource = ds1;
            GridView2.DataBind();


            DropDownList1.Items.Clear();
            for (int i = 0; i < ds1.Tables[0].Rows.Count; i++)
            {
                DropDownList1.Items.Add(ds1.Tables[0].Rows[i][0].ToString());
            }
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedIndex == 0)
        {
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please Select City');", true);
            //Response.Write("<script>alert('Please Select City')</script>");
        }
        else
        {
            string p = "delete from city where city='" + DropDownList1.Text + "'";
            dc.setdata(p);
            string r = "delete from providers where city='" + DropDownList1.Text + "'";
            dc.setdata(r);
            string t = "delete from simple_tiffin where p_city='" + DropDownList1.Text + "'";
            dc.setdata(t);
            string u = "delete from tiffin_with_sweet where p_city='" + DropDownList1.Text + "'";
            dc.setdata(u);

            DataSet ds2 = new DataSet();
            string q = "select * from city";
            ds2 = dc.getdata(q);

            GridView1.DataSource = ds2;
            GridView1.DataBind();
            GridView2.DataSource = ds2;
            GridView2.DataBind();

            DropDownList1.Items.Clear();
            for (int i = 0; i < ds2.Tables[0].Rows.Count; i++)
            {
                DropDownList1.Items.Add(ds2.Tables[0].Rows[i][0].ToString());
            }
        }
    }
    protected void EditCity(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        BindData();
    }
    protected void CancelEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        BindData();
    }
    protected void UpdateCity(object sender, GridViewUpdateEventArgs e)
    {
        string city = ((Label)GridView1.Rows[e.RowIndex]
                            .FindControl("city_lbl")).Text;
        string is_ff = ((TextBox)GridView1.Rows[e.RowIndex]
                            .FindControl("is_fastfood_tb")).Text;


        string zk = "update city set is_fastfood='" + is_ff + "' where city='" + city + "'";
        dc.setdata(zk);
        GridView1.EditIndex = -1;
        BindData();

    }
    private void BindData()
    {
        string z = "select * from city";
        DataSet ds10 = new DataSet();
        ds10 = dc.getdata(z);
        GridView1.DataSource = ds10;
        GridView1.DataBind();
    }
}