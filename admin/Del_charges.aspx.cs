using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_Del_charges : System.Web.UI.Page
{
    DataCon dc = new DataCon();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack != true)
        {
            Panel2.Visible = false;
            DataSet ds = new DataSet();
            string s = "select * from delivery_charges";
            ds = dc.getdata(s);
            del_charge_limit_tb.Text = ds.Tables[0].Rows[0][1].ToString();
            del_charge_tb.Text = ds.Tables[0].Rows[0][2].ToString();
        }
    }
    protected void Security_Key_btn_Click(object sender, EventArgs e)
    {
        if (Security_Key_tb.Text == "102515209")
        {
            Panel1.Visible = false;
            Panel2.Visible = true;
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Invalid Security Key');", true);
            Security_Key_tb.Text = "";
            Security_Key_tb.Focus();
        }
    }
    protected void del_charge_btn_Click(object sender, EventArgs e)
    {
        string j = "update delivery_charges set del_charge_limit='" + del_charge_limit_tb.Text + "', del_charge='" + del_charge_tb.Text + "' where charges_id=1";
        dc.setdata(j);        

        ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Charges are updated');", true);
        Panel2.Visible = false;
        Panel1.Visible = true;
    }
}