using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class user_FastFoodCategories : System.Web.UI.Page
{
    DataCon dc = new DataCon();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(IsPostBack!=true)
        {
            string jk = "select * from fast_food_categories";
            DataSet ds = new DataSet();
            ds = dc.getdata(jk);

            if(ds.Tables[0].Rows.Count==0)
            {
                InfoLbl.Text = "No Fast Food Available";
            }
            else
            {
                InfoLbl.Text = "List Of Fast Food Categories";

                List<FastFoodCategory> FFCatList = new List<FastFoodCategory>();
                for(int i=0;i<ds.Tables[0].Rows.Count;i++)
                {
                    string jkp = "select * from fast_food_products where cat_id='" + ds.Tables[0].Rows[i][0].ToString() + "'";
                    DataSet dsjkp = new DataSet();
                    dsjkp = dc.getdata(jkp);

                    FastFoodCategory fastFoodCategory = new FastFoodCategory();

                    fastFoodCategory.CategoryId = ds.Tables[0].Rows[i][0].ToString();
                    fastFoodCategory.CategoryName = ds.Tables[0].Rows[i][1].ToString();
                    fastFoodCategory.Image = ds.Tables[0].Rows[i][2].ToString();
                    fastFoodCategory.NoOfDishes = dsjkp.Tables[0].Rows.Count.ToString();

                    FFCatList.Add(fastFoodCategory);
                }
                FFCategoryRptr.DataSource = FFCatList;
                FFCategoryRptr.DataBind();
            }
        }
    }
    protected void FFCatLb_Command(object sender, CommandEventArgs e)
    {
        string id = e.CommandName.ToString();
        Response.Redirect("fast_food_products.aspx?cat_id=" + id);
    }
}