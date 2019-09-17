using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using System.Net;

public partial class admin_SendNotification : System.Web.UI.Page
{

    DataCon dc = new DataCon();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack != true)
        {
            string jk = "select * from user_accounts where DeviceToken IS NOT NULL";
            DataSet dsjk = new DataSet();
            dsjk = dc.getdata(jk);

            if (dsjk.Tables[0].Rows.Count != 0)
            {
                UserListGv.DataSource = dsjk;
                UserListGv.DataBind();
            }
            string jkp = "select * from fast_food_categories";
            DataSet dsjkp = new DataSet();
            dsjkp = dc.getdata(jkp);

            CatDD.DataSource = dsjkp;
            CatDD.DataTextField = "name";
            CatDD.DataValueField = "cat_id";
            CatDD.DataBind();
            CatDD.Items.Insert(0, "-- To Select --");
        }
    }
    protected void SendBtn_Click(object sender, EventArgs e)
    {
        List<string> list = new List<string>();

        for (int i = 0; i < UserListGv.Rows.Count; i++)
        {
            CheckBox chk = UserListGv.Rows[i].FindControl("CheckBox1") as CheckBox;

            if (chk.Checked)
            {
                Label lbl = UserListGv.Rows[i].FindControl("UserIdLbl") as Label;
                string id = lbl.Text;

                list.Add(id);
            }
        }

        SendNotifications(list);
    }

    private void SendNotifications(List<string> list)
    {
        if (OfferChk.Checked)
        {
            if (CatDD.SelectedIndex == 0)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please Select Category.');", true);
            }
            else if (ProductDD.SelectedIndex == 0)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please Select Product.');", true);
            }
            else
            {
                if (list.Count != 0)
                {
                    for (int i = 0; i < list.Count; i++)
                    {
                        string jk = "select DeviceToken from user_accounts where id='" + list[i] + "'";
                        DataSet dsjk = new DataSet();
                        dsjk = dc.getdata(jk);

                        SenNoti(TitleTb.Text, MsgTb.Text, dsjk.Tables[0].Rows[0][0].ToString());

                    }
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please Select Atleat One User.');", true);
                }
            }
        }
        else
        {
            if (list.Count != 0)
            {
                for (int i = 0; i < list.Count; i++)
                {
                    string jk = "select DeviceToken from user_accounts where id='" + list[i] + "'";
                    DataSet dsjk = new DataSet();
                    dsjk = dc.getdata(jk);

                    SenNoti(TitleTb.Text, MsgTb.Text, dsjk.Tables[0].Rows[0][0].ToString());

                }
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please Select Atleat One User.');", true);
            }
        }
    }

    public void SenNoti(string Title, string Msg, string DeviceToken)
    {
        string catId = "", prId = "", catName = "";
        //string serverKey = "KEY";
        string serverKey = "AAAA21iwkuo:APA91bEXBS41htHHlK4K7RrL_LnGX8JlwKrqWSUlezJ5X3KepZ0OE9kuHij9chJ4xSLboNbhaYGZNbzPaKKAi3imYmoasFPsNnYsC-nmlrAparEOqV-kIHfzJs5PydHyBxBSvRHSXBNq";
        string token = DeviceToken;
        string title = Title;
        string msg = Msg;
        if (OfferChk.Checked)
        {
            catId = CatDD.SelectedValue;
            prId = ProductDD.SelectedValue;
            catName = CatDD.SelectedItem.ToString();
        }

        try
        {
            var result = "-1";
            var webAddr = "https://fcm.googleapis.com/fcm/send";

            var httpWebRequest = (HttpWebRequest)WebRequest.Create(webAddr);
            httpWebRequest.ContentType = "application/json";
            httpWebRequest.Headers.Add("Authorization:key=" + serverKey);
            httpWebRequest.Method = "POST";

            using (var streamWriter = new StreamWriter(httpWebRequest.GetRequestStream()))
            {
                //string json = "{\"to\": \"Your device token\",\"data\": {\"message\": \"This is a Firebase Cloud Messaging Topic Message!\",}}";
                string json = "{\"to\": \"" + token + "\",\"data\": {\"title\":\"" + title + "\",\"message\": \"" + msg + "\",\"catId\": \"" + catId + "\",\"catName\": \"" + catName + "\",\"prId\": \"" + prId + "\"}}";
                streamWriter.Write(json);
                streamWriter.Flush();
            }

            var httpResponse = (HttpWebResponse)httpWebRequest.GetResponse();
            using (var streamReader = new StreamReader(httpResponse.GetResponseStream()))
            {
                result = streamReader.ReadToEnd();
            }
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Notification Send.');window.location='SendNotification.aspx';", true);
        }
        catch (Exception ex)
        {
            //  Response.Write(ex.Message);
            MsgTb.Text = ex.Message;

        }
    }
    protected void CatDD_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (CatDD.SelectedIndex != 0)
        {
            string jk = "select * from fast_food_products where cat_id='" + CatDD.SelectedValue + "'";
            DataSet dsjk = new DataSet();
            dsjk = dc.getdata(jk);

            ProductDD.DataSource = dsjk;
            ProductDD.DataValueField = "product_id";
            ProductDD.DataTextField = "product_name";
            ProductDD.DataBind();
            ProductDD.Items.Insert(0, "-- To Select --");
        }
        else
        {
            ProductDD.DataSource = "";
            ProductDD.DataBind();
        }
    }
    protected void OfferChk_CheckedChanged(object sender, EventArgs e)
    {
        if (OfferChk.Checked)
        {
            OfferPnl.Visible = true;
        }
        else
        {
            OfferPnl.Visible = false;
        }
    }
}