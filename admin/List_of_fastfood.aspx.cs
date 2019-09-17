using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_List_of_fastfood : System.Web.UI.Page
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
                DataSet ds1 = new DataSet();
                string j = "select * from  fast_food_categories";
                ds1 = dc.getdata(j);


                Cat_dd.DataSource = ds1;
                Cat_dd.DataBind();
                Cat_dd.DataTextField = "name";
                Cat_dd.DataValueField = "cat_id";
                Cat_dd.DataBind();
                Cat_dd.Items.Insert(0, "--To Select--");
                //for (int z = 0; z < ds1.Tables[0].Rows.Count; z++)
                //{
                //    DropDownList3.Items.Add(ds1.Tables[0].Rows[z][1].ToString());
                //}                
            }
        }
    }
    protected void Go_btn_Click(object sender, EventArgs e)
    {
        if(Cat_dd.SelectedIndex!=0)
        {
            DataSet ds = new DataSet();
            string zk = "select * from fast_food_products where cat_id=" + Cat_dd.SelectedValue;
            ds = dc.getdata(zk);
            if (ds.Tables[0].Rows.Count != 0)
            {
                ff_gv.DataSource = ds;
                ff_gv.DataBind();
                info_lbl.Text = "List Of " + Cat_dd.SelectedItem;
            }
            else
            {
                ff_gv.DataSource = "";
                ff_gv.DataBind();
                info_lbl.Text = "No " + Cat_dd.SelectedItem + " Available";
            }
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please select Category');", true);            
        }
    }
    public void UpdateProduct(object sender,CommandEventArgs e)
    {
        string id = e.CommandName.ToString();
        Response.Redirect("~/admin/Add_remove_fastfood_products.aspx?product_id=" + id + "&cat='" + Cat_dd.SelectedItem + "'");
    }

    protected void DeleteProduct(object sender, GridViewDeleteEventArgs e)
    {
        string id = ((Label)ff_gv.Rows[e.RowIndex]
                            .FindControl("product_id_lbl")).Text;

        string zk = "delete from fast_food_products where product_id='" + id + "'";
        dc.setdata(zk);
        BindData();

    }

    private void BindData()
    {
        DataSet ds4 = new DataSet();
        string jk = "select * from fast_food_products where cat_id=" + Cat_dd.SelectedValue;
        ds4 = dc.getdata(jk);
        ff_gv.DataSource = ds4;
        ff_gv.DataBind();
    }
}