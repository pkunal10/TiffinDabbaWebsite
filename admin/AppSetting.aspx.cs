using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_Default : System.Web.UI.Page
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
            if(IsPostBack!=true)
            {
                BindData();
                BindDataVacation();
            }
        }
    }
    protected void ProfileImgSaveBtn_Click(object sender, EventArgs e)
    {
        string jk = "select * from app_setting";
        DataSet ds = new DataSet();
        ds = dc.getdata(jk);

        if(ds.Tables[0].Rows.Count==0)
        {
            string ext = System.IO.Path.GetExtension(ProfileImg.FileName);
            if (ext == ".jpg" || ext == ".png" || ext == ".jpeg" || ext == ".gif" || ext == ".GIF" || ext == ".PNG" || ext == ".JPEG" || ext == ".JPG")
            {
                ProfileImg.SaveAs(Server.MapPath("~//admin//AppSetting//ProfileImage//" + ProfileImg.FileName));
                string path = "~//admin//AppSetting//ProfileImage//" + ProfileImg.FileName;

                string jkp = "insert into app_setting values('App1','"+path+"')";
                dc.setdata(jkp);
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Image Added.');", true);
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please select Image Only');", true);
            }
        }
        else
        {
            string ext = System.IO.Path.GetExtension(ProfileImg.FileName);
            if (ext == ".jpg" || ext == ".png" || ext == ".jpeg" || ext == ".gif" || ext == ".GIF" || ext == ".PNG" || ext == ".JPEG" || ext == ".JPG")
            {
                ProfileImg.SaveAs(Server.MapPath("~//admin//AppSetting//ProfileImage//" + ProfileImg.FileName));
                string path = "~//admin//AppSetting//ProfileImage//" + ProfileImg.FileName;

                string jkp = "update app_setting set ProfileImg='" + path + "' where Id='App1'";
                dc.setdata(jkp);

                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Image Updated.');", true);
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please select Image Only');", true);
            }
        }
    }
    protected void EditAppHomeImg(object sender, GridViewEditEventArgs e)
    {
        AppHomeImgGv.EditIndex = e.NewEditIndex;
        BindData();
    }
    protected void CancelEdit(object sender, GridViewCancelEditEventArgs e)
    {
        AppHomeImgGv.EditIndex = -1;
        BindData();
    }
    protected void UpdateAppHomeImg(object sender, GridViewUpdateEventArgs e)
    {
        string id = ((Label)AppHomeImgGv.Rows[e.RowIndex]
                            .FindControl("AppHomeImgIdLbl")).Text;

        FileUpload appHomeImage = ((FileUpload)AppHomeImgGv.Rows[e.RowIndex].FindControl("AppHomeEditImage"));

        if (appHomeImage.HasFile)
        {
            string ext = System.IO.Path.GetExtension(appHomeImage.FileName);

            if (ext == ".jpg" || ext == ".png" || ext == ".jpeg" || ext == ".gif" || ext == ".GIF" || ext == ".PNG" || ext == ".JPEG" || ext == ".JPG")
            {
                appHomeImage.SaveAs(Server.MapPath("~//admin//AppSetting//HomeImages//" + appHomeImage.FileName));
                string path = "~//admin//AppSetting//HomeImages//" + appHomeImage.FileName;

                string zk = "update app_home_images set Image='" + path + "' where Id='" + id + "'";
                dc.setdata(zk);
                AppHomeImgGv.EditIndex = -1;
                BindData();
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please select Image Only');", true);
            }
        }       
    }


    protected void DeleteAppHomeImg(object sender, GridViewDeleteEventArgs e)
    {
        string id = ((Label)AppHomeImgGv.Rows[e.RowIndex]
                            .FindControl("AppHomeImgIdLbl")).Text;

        string zk = "delete from app_home_images where Id='" + id + "'";
        dc.setdata(zk);
        BindData();

    }

    private void BindData()
    {
        string z = "select * from app_home_images";
        DataSet ds10 = new DataSet();
        ds10 = dc.getdata(z);
        AppHomeImgGv.DataSource = ds10;
        AppHomeImgGv.DataBind();
    }
    protected void AppHomeImgSaveBtn_Click(object sender, EventArgs e)
    {
        string ext = System.IO.Path.GetExtension(AppHomeImage.FileName);

        if (ext == ".jpg" || ext == ".png" || ext == ".jpeg" || ext == ".gif" || ext == ".GIF" || ext == ".PNG" || ext == ".JPEG" || ext == ".JPG")
        {
            AppHomeImage.SaveAs(Server.MapPath("~//admin//AppSetting//HomeImages//" + AppHomeImage.FileName));
            string path = "~//admin//AppSetting//HomeImages//" + AppHomeImage.FileName;

            string zk = "insert into app_home_images (Image) values('" + path + "')";
            dc.setdata(zk);           
            BindData();
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please select Image Only');", true);
        }
    }

    protected void EditVacation(object sender, GridViewEditEventArgs e)
    {
        VacationDetailsGv.EditIndex = e.NewEditIndex;
        BindDataVacation();
    }    
    protected void CancelEditVacation(object sender, GridViewCancelEditEventArgs e)
    {
        VacationDetailsGv.EditIndex = -1;
        BindDataVacation();
    }
    protected void UpdateVacation(object sender, GridViewUpdateEventArgs e)
    {
        string id = ((Label)VacationDetailsGv.Rows[e.RowIndex]
                            .FindControl("VacFTIdLbl")).Text;
        bool isVacation = ((CheckBox)VacationDetailsGv.Rows[e.RowIndex].FindControl("IsVactionChk")).Checked;
        string btntxt = ((TextBox)VacationDetailsGv.Rows[e.RowIndex].FindControl("BtnTxtTb")).Text;

        string jkp = "update vacation_details set IsVacation=" + isVacation + ",BtnTxt='" + btntxt + "' where Id='" + id + "'";
        dc.setdata(jkp);

        VacationDetailsGv.EditIndex = -1;
        BindDataVacation();       
        
    }

    private void BindDataVacation()
    {
        string jk = "select * from vacation_details";
        DataSet dsjk = new DataSet();
        dsjk = dc.getdata(jk);

        VacationDetailsGv.DataSource = dsjk;
        VacationDetailsGv.DataBind();
    }

}