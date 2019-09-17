using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_Add_remove_fastfood_cat : System.Web.UI.Page
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

                string c = "select * from fast_food_categories";
                ds = dc.getdata(c);

                if(ds.Tables[0].Rows.Count!=0)
                {
                    ff_cat_gv.DataSource = ds;
                    ff_cat_gv.DataBind();
                }
            }
        }
    }


    protected void EditCat(object sender, GridViewEditEventArgs e)
    {
        ff_cat_gv.EditIndex = e.NewEditIndex;
        BindData();
    }
    protected void CancelEdit(object sender, GridViewCancelEditEventArgs e)
    {
        ff_cat_gv.EditIndex = -1;
        BindData();
    }
    protected void UpdateCat(object sender, GridViewUpdateEventArgs e)
    {
        string id = ((Label)ff_cat_gv.Rows[e.RowIndex]
                            .FindControl("cat_id_lbl")).Text;
        string name = ((TextBox)ff_cat_gv.Rows[e.RowIndex]
                            .FindControl("cat_name_tb")).Text;

        FileUpload catImage = ((FileUpload)ff_cat_gv.Rows[e.RowIndex].FindControl("CatImage"));

       if(catImage.HasFile)
       {
           string ext = System.IO.Path.GetExtension(catImage.FileName);

           if (ext == ".jpg" || ext == ".png" || ext == ".jpeg" || ext == ".gif" || ext == ".GIF" || ext == ".PNG" || ext == ".JPEG" || ext == ".JPG")
           { 
               catImage.SaveAs(Server.MapPath("~//admin//fast_food_image//FastFoodCatImage//" + catImage.FileName));
               string path = "~//admin//fast_food_image//FastFoodCatImage//" + catImage.FileName;

               string zk = "update fast_food_categories set name='" + name + "',Image='" + path + "' where cat_id='" + id + "'";
               dc.setdata(zk);
               ff_cat_gv.EditIndex = -1;
               BindData();
           }
           else
           {
               ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please select Image Only');", true);
           }        
       }
       else
       {
           string zk = "update fast_food_categories set name='" + name + "' where cat_id='" + id + "'";
           dc.setdata(zk);
           ff_cat_gv.EditIndex = -1;
           BindData();
       }        

    }


    protected void DeleteCat(object sender, GridViewDeleteEventArgs e)
    {
        string id = ((Label)ff_cat_gv.Rows[e.RowIndex]
                            .FindControl("cat_id_lbl")).Text;        

        string zk = "delete from fast_food_categories where cat_id='" + id + "'";
        dc.setdata(zk);        
        BindData();

    }

    private void BindData()
    {
        string z = "select * from fast_food_categories";
        DataSet ds10 = new DataSet();
        ds10 = dc.getdata(z);
        ff_cat_gv.DataSource = ds10;
        ff_cat_gv.DataBind();
    }

    protected void AddCatBtn_Click(object sender, EventArgs e)
    {
        string ext = System.IO.Path.GetExtension(CatImg.FileName);

        if (ext == ".jpg" || ext == ".png" || ext == ".jpeg" || ext == ".gif" || ext == ".GIF" || ext == ".PNG" || ext == ".JPEG" || ext == ".JPG")
        {
            CatImg.SaveAs(Server.MapPath("~//admin//fast_food_image//FastFoodCatImage//" + CatImg.FileName));
            string path = "~//admin//fast_food_image//FastFoodCatImage//" + CatImg.FileName;

            string jk = "insert into fast_food_categories (name,Image) values('" + Category_tb.Text + "','" + path + "')";
            dc.setdata(jk);
            Category_tb.Text = "";
            BindData();

            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Category Added.');", true);
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please select Image Only');", true);
        }
    }
}