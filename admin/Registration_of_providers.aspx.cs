using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_Registration_of_providers : System.Web.UI.Page
{
    DataCon dc = new DataCon();
    string pid;
    int is_ff;
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

            //    DataSet ds1 = new DataSet();
            //    string pi = "select pid from providers order by pid DESC";
            //    ds1 = dc.getdata(pi);

            //    if (ds1.Tables[0].Rows.Count == 0)
            //    {
            //        pid = "P1";
            //    }
            //    else
            //    {
            //        String j = ds1.Tables[0].Rows[0][0].ToString();

            //        string t = j.Substring(1, j.Length - 1);
            //        int n = Convert.ToInt32(t);
            //        n = n + 1;


            //        pid = "P" + n.ToString();
            //        //rid = Convert.ToString(Convert.ToInt32(ds3.Tables[0].Rows[0][0].ToString()) + 1);
            //    }

            //    Label1.Text = pid;
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedIndex == 0)
        {
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please Select City');", true);
            //Response.Write("<script>alert('Please Select City')</script>");
        }
        else
        {
            if(is_ff_chk.Checked==true)
            {
                is_ff = 1;
            }
            else
            {
                is_ff = 0;
            }
            string k = "insert into providers values('" + TextBox3.Text + "','" + TextBox1.Text + "','" + DropDownList1.SelectedItem + "','" + TextBox2.Text + "','" + TextBox3.Text + "','" + TextBox4.Text + "'," + is_ff + ",'" + TextBox5.Text + "')";
            dc.setdata(k);
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Provider is Registered');", true);
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox5.Text = "";
            
            TextBox1.Focus();
        }
    }
    
}