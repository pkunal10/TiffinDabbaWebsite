using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_Add_remove_area : System.Web.UI.Page
{
    DataCon dc = new DataCon();
    int std,avg,poor,is_ff;
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

                string c = "select city from city";
                ds = dc.getdata(c);

                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    DropDownList1.Items.Add(ds.Tables[0].Rows[i][0].ToString());
                    DropDownList2.Items.Add(ds.Tables[0].Rows[i][0].ToString());
                }
            }
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        //this is for add area

        if (DropDownList1.SelectedIndex == 0)
        {
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please Select City');", true);
            //Response.Write("<script>alert('Please Select City')</script>");
            TextBox2.Text = "";
        }
        else
        {

            if(Std_chk.Checked==true)
            {
                std = 1;
            }
            else
            {
                std = 0;
            }

            if (avg_chk.Checked == true)
            {
                avg = 1;
            }
            else
            {
                avg = 0;
            }

            if (poor_chk.Checked == true)
            {
                poor = 1;
            }
            else
            {
                poor = 0;
            }

            if (is_ff_chk.Checked == true)
            {
                is_ff = 1;
            }
            else
            {
                is_ff = 0;
            }

            string s = "insert into delivery_area values('" + DropDownList1.Text + "','" + TextBox2.Text + "'," + std + "," + avg + "," + poor + "," + is_ff + ")";
            dc.setdata(s);

            DataSet ds2 = new DataSet();
            string a = "select * from delivery_area";
            ds2 = dc.getdata(a);
            GridView2.DataSource = ds2;
            GridView2.DataBind();
            GridView1.DataSource = ds2;
            GridView1.DataBind();

            DropDownList1.SelectedIndex = 0;
            TextBox2.Text = "";
            Std_chk.Checked = false;
            avg_chk.Checked = false;
            poor_chk.Checked = false;
            is_ff_chk.Checked = false;

            Label2.Text = "List Of Delivery Area";
        }

    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        //this is for add area
        if (DropDownList1.SelectedIndex != 0)
        {
            DataSet ds4 = new DataSet();

            string j = "select * from delivery_area where city='" + DropDownList1.SelectedItem + "'";
            ds4 = dc.getdata(j);

            GridView2.DataSource = ds4;
            GridView2.DataBind();

            Label2.Text = "List Of Delivery Area";
        }
        else
        {
            GridView2.DataSource = "";
            GridView2.DataBind();
        }
    }
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        //this is for remove area
        if (DropDownList2.SelectedIndex != 0)
        {
            DataSet ds4 = new DataSet();

            string j = "select * from delivery_area where city='" + DropDownList2.SelectedItem + "'";
            ds4 = dc.getdata(j);

            GridView1.DataSource = ds4;
            GridView1.DataBind();

            Label1.Text = "List Of Delivery Area";
        }
        else
        {
            GridView1.DataSource = "";
            GridView1.DataBind();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //this is for remove area
        if (DropDownList2.SelectedIndex != 0)
        {
            DataSet ds7 = new DataSet();
            string n = "select * from delivery_area where area='" + TextBox1.Text + "'";
            ds7 = dc.getdata(n);

            if (ds7.Tables[0].Rows.Count != 0)
            {

                string j = "delete from delivery_area where area='" + TextBox1.Text + "' and city='" + DropDownList2.SelectedItem + "'";
                dc.setdata(j);
                TextBox1.Text = "";

                DataSet ds5 = new DataSet();
                string k = "select * from delivery_area where city='" + DropDownList2.SelectedItem + "'";
                ds5 = dc.getdata(k);

                GridView1.DataSource = ds5;
                GridView1.DataBind();
                GridView2.DataSource = ds5;
                GridView2.DataBind();

                Label1.Text = "List Of Delivery Area";
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Enter Valid Area Name');", true);
                //Response.Write("<script>alert('Please Select City')</script>");
                TextBox1.Text = "";
            }
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please Select City');", true);
            //Response.Write("<script>alert('Please Select City')</script>");
            TextBox1.Text = "";
        }
    }
    protected void EditArea(object sender, GridViewEditEventArgs e)
    {
        GridView2.EditIndex = e.NewEditIndex;
        BindData();
    }
    protected void CancelEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView2.EditIndex = -1;
        BindData();
    }
    protected void UpdateArea(object sender, GridViewUpdateEventArgs e)
    {
        string area = ((Label)GridView2.Rows[e.RowIndex]
                            .FindControl("Area_lbl")).Text;
        string stdu = ((TextBox)GridView2.Rows[e.RowIndex]
                            .FindControl("Std_tb")).Text;
        string avgu = ((TextBox)GridView2.Rows[e.RowIndex]
                            .FindControl("Avg_tb")).Text;
        string pooru = ((TextBox)GridView2.Rows[e.RowIndex]
                            .FindControl("Poor_tb")).Text;
        string is_ff = ((TextBox)GridView2.Rows[e.RowIndex]
                            .FindControl("is_fastfood_tb")).Text;

        string zk = "update delivery_area set standard='" + stdu + "',average='" + avgu + "',poor='" + pooru + "',is_fastfood='" + is_ff + "' where area='" + area + "'";
        dc.setdata(zk);
        GridView2.EditIndex = -1;
        BindData();
        
    }
    private void BindData()
    {
        string z = "select * from delivery_area";
        DataSet ds10 = new DataSet();
        ds10 = dc.getdata(z);
        GridView2.DataSource = ds10;
        GridView2.DataBind();
    }
}