using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_Add_monthly_tiffin : System.Web.UI.Page
{
    DataCon dc = new DataCon();
    string std, avg, poor;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToString(Session["aid"]) == "")
        {
            Session["msg"] = "please log in first";
            Response.Redirect("~/log_in.aspx");
        }
        else
        {
            if(IsPostBack!=true)
            {
                DataSet ds = new DataSet();
                string s = "select * from city";
                ds = dc.getdata(s);
                if (ds.Tables[0].Rows.Count != 0)
                {
                    for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                    {
                        Provider_city_dropdown.Items.Add(ds.Tables[0].Rows[i][0].ToString());
                    }

                }
            }
            
        }
    }
    protected void Add_tiffin_btn_Click(object sender, EventArgs e)
    {
        if (Provider_city_dropdown.SelectedIndex != 0)
        {
            if (Provider_id_dropdown.SelectedIndex != 0)
            {

                string ext = System.IO.Path.GetExtension(FileUpload1.FileName);

                if (ext == ".jpg" || ext == ".png" || ext == ".jpeg" || ext == ".gif" || ext == ".GIF" || ext == ".PNG" || ext == ".JPEG" || ext == ".JPG")
                {
                    FileUpload1.SaveAs(Server.MapPath("~//admin//monthly_tiffin_image//" + FileUpload1.FileName));
                    string path = "~//admin//monthly_tiffin_image//" + FileUpload1.FileName;

                    try
                    {

                        if (Std_chk.Checked == true)
                        {
                            std = "1";
                        }
                        else
                        {
                            std = "0";
                        }

                        if (avg_chk.Checked == true)
                        {
                            avg = "1";
                        }
                        else
                        {
                            avg = "0";
                        }

                        if (poor_chk.Checked == true)
                        {
                            poor = "1";
                        }
                        else
                        {
                            poor = "0";
                        }

                        if (Rmd_yes_rb.Checked == true)
                        {

                            string q = "insert into monthly_tiffin_menu values('" + Tiffin_id_tb.Text + "','" + No_of_roti_tb.Text + "','" + Provider_id_dropdown.SelectedItem + "','" + Provider_city_dropdown.SelectedItem + "','" + Price_tb.Text + "','" + Trial_price_tb.Text + "','" + std + "','" + avg + "','" + poor + "','" + TextBox8.Text + "','1','" + path + "')";
                            dc.setdata(q);

                            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('" + Tiffin_id_tb.Text + "' Tiffin Added');", true);

                            Tiffin_id_tb.Text = "";
                            No_of_roti_tb.Text = "";
                            Price_tb.Text = "";
                            Trial_price_tb.Text = "";
                            Std_chk.Checked = false;
                            avg_chk.Checked = false;
                            poor_chk.Checked = false;
                            TextBox8.Text = "";
                            Provider_city_dropdown.SelectedIndex = 0;
                            Provider_id_dropdown.SelectedIndex = 0;
                            Provider_name_lbl.Text = "";
                        }
                        else if (Rmd_no_rb.Checked == true)
                        {
                            string q = "insert into monthly_tiffin_menu values('" + Tiffin_id_tb.Text + "','" + No_of_roti_tb.Text + "','" + Provider_id_dropdown.SelectedItem + "','" + Provider_city_dropdown.SelectedItem + "','" + Price_tb.Text + "','" + Trial_price_tb.Text + "','" + std + "','" + avg + "','" + poor + "','" + TextBox8.Text + "','0','" + path + "')";
                            dc.setdata(q);

                            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('" + Tiffin_id_tb.Text + "' Tiffin Added');", true);

                            Tiffin_id_tb.Text = "";
                            No_of_roti_tb.Text = "";
                            Price_tb.Text = "";
                            Trial_price_tb.Text = "";
                            Std_chk.Checked = false;
                            avg_chk.Checked = false;
                            poor_chk.Checked = false;
                            TextBox8.Text = "";
                            Provider_city_dropdown.SelectedIndex = 0;
                            Provider_id_dropdown.SelectedIndex = 0;
                            Provider_name_lbl.Text = "";
                        }
                    }
                    catch (Exception ex)
                    {
                        string try_msg = ex.Message;
                        //Label2.Text = try_msg;
                        ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('This Tiffin Id Already Exist.');", true);

                        Tiffin_id_tb.Text = "";
                        Tiffin_id_tb.Focus();
                    }
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please select Image Only');", true);
                }
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please select provider');", true);
                //Response.Write("<script>alert('Please select provider')</script>");
            }
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please Select City');", true);
            //Response.Write("<script>alert('Please select city')</script>");
        }
    }
    protected void Provider_id_dropdown_SelectedIndexChanged(object sender, EventArgs e)
    {
        if(Provider_id_dropdown.SelectedIndex!=0)
        {
            DataSet ds3=new DataSet();
            string kj = "select name from providers where pid='" + Provider_id_dropdown.SelectedItem + "'";
            ds3=dc.getdata(kj);
            Provider_name_lbl.Text = ds3.Tables[0].Rows[0][0].ToString();
        }
        else
        {
            Provider_name_lbl.Text = "";
        }
    }
    protected void Provider_city_dropdown_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataSet ds2 = new DataSet();
        string j = "select pid from providers where city='" + Provider_city_dropdown.SelectedItem + "'";
        ds2 = dc.getdata(j);
        if (Provider_city_dropdown.SelectedIndex == 0)
        {
            Provider_id_dropdown.Items.Clear();
            Provider_name_lbl.Text = "";
        }
        else
        {
            Provider_id_dropdown.Items.Clear();
            Provider_id_dropdown.Items.Insert(0, "--To Select--");
            for (int k = 0; k < ds2.Tables[0].Rows.Count; k++)
            {
                Provider_id_dropdown.Items.Add(ds2.Tables[0].Rows[k][0].ToString());
            }
        }
    }
}