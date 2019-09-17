using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_Simple_tiffin_add : System.Web.UI.Page
{
    DataCon dc = new DataCon();
    string tid;
    string std, avg, poor;
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
                //DataSet ds3 = new DataSet();
                //string ui = "select t_id from simple_tiffin order by t_id DESC";
                //ds3 = dc.getdata(ui);

                //if (ds3.Tables[0].Rows.Count == 0)
                //{
                //    tid = "ST1";
                //}
                //else
                //{
                //    String s = ds3.Tables[0].Rows[0][0].ToString();

                //    string t = s.Substring(2, s.Length - 2);
                //    int n = Convert.ToInt32(t);
                //    n = n + 1;


                //    tid = "ST" + n.ToString();
                //}

                //Label1.Text = tid;

                DataSet ds = new DataSet();
                string p = "select city from city";
                ds = dc.getdata(p);

                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    DropDownList1.Items.Add(ds.Tables[0].Rows[i][0].ToString());
                }
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedIndex != 0)
        {
            if (DropDownList2.SelectedIndex != 0)
            {

                string ext = System.IO.Path.GetExtension(FileUpload1.FileName);

                if (ext == ".jpg" || ext == ".png" || ext == ".jpeg" || ext == ".gif" || ext == ".GIF" || ext == ".PNG" || ext == ".JPEG" || ext == ".JPG")
                {
                    FileUpload1.SaveAs(Server.MapPath("~//admin//simple_tiffin_image//" + FileUpload1.FileName));
                    string path = "~//admin//simple_tiffin_image//" + FileUpload1.FileName;

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

                            string q = "insert into simple_tiffin values('" + TextBox6.Text + "','" + DropDownList1.Text + "','" + DropDownList2.Text + "','" + Label2.Text + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "','" + TextBox4.Text + "','" + TextBox7.Text + "','" + TextBox5.Text + "','" + std + "','" + avg + "','" + poor + "','" + TextBox8.Text + "','1','" + path + "','Order Now'," + IsAppHomeChk.Checked + ")";
                            dc.setdata(q);

                            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('" + TextBox6.Text + "' Simple Tiffin Added');", true);

                            TextBox1.Text = "";
                            TextBox2.Text = "";
                            TextBox3.Text = "";
                            TextBox4.Text = "";
                            TextBox5.Text = "";
                            TextBox6.Text = "";
                            TextBox7.Text = "";
                            TextBox8.Text = "";
                            Std_chk.Checked = false;
                            avg_chk.Checked = false;
                            poor_chk.Checked = false;
                            IsAppHomeChk.Checked = false;
                            DropDownList1.SelectedIndex = 0;
                            DropDownList2.Items.Clear();
                            Label2.Text = "";
                        }
                        else if(Rmd_no_rb.Checked==true)
                        {
                            string q = "insert into simple_tiffin values('" + TextBox6.Text + "','" + DropDownList1.Text + "','" + DropDownList2.Text + "','" + Label2.Text + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "','" + TextBox4.Text + "','" + TextBox7.Text + "','" + TextBox5.Text + "','" + std + "','" + avg + "','" + poor + "','" + TextBox8.Text + "','0','" + path + "','Order Now'," + IsAppHomeChk.Checked + ")";
                            dc.setdata(q);

                            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('" + TextBox6.Text + "' Simple Tiffin Added');", true);

                            TextBox1.Text = "";
                            TextBox2.Text = "";
                            TextBox3.Text = "";
                            TextBox4.Text = "";
                            TextBox5.Text = "";
                            TextBox6.Text = "";
                            TextBox7.Text = "";
                            TextBox8.Text = "";
                            Std_chk.Checked = false;
                            avg_chk.Checked = false;
                            poor_chk.Checked = false;
                            IsAppHomeChk.Checked = false;
                            DropDownList1.SelectedIndex = 0;
                            DropDownList2.Items.Clear();
                            Label2.Text = "";
                        }
                    }
                    catch (Exception ex)
                    {
                        string try_msg = ex.Message;
                        //Label2.Text = try_msg;
                        ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('This Tiffin Id Already Exist.');", true);
                        
                        TextBox6.Text = "";
                        TextBox6.Focus();
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
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataSet ds1 = new DataSet();
        string j = "select pid from providers where city='" + DropDownList1.SelectedItem + "'";
        ds1 = dc.getdata(j);
        if (DropDownList1.SelectedIndex == 0)
        {
            DropDownList2.Items.Clear();
            Label2.Text = "";
        }
        else
        {
            DropDownList2.Items.Clear();
            DropDownList2.Items.Insert(0, "--To Select--");
            for (int k = 0; k < ds1.Tables[0].Rows.Count; k++)
            {
                DropDownList2.Items.Add(ds1.Tables[0].Rows[k][0].ToString());
            }
        }
    }
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList2.SelectedIndex == 0)
        {
            Label2.Text = "";
        }
        else
        {
            DataSet ds2 = new DataSet();
            string l = "select name from providers where pid='" + DropDownList2.SelectedItem + "'";
            ds2 = dc.getdata(l);
            Label2.Text = ds2.Tables[0].Rows[0][0].ToString();
        }
    }
    
}