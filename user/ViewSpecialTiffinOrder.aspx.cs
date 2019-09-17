using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class user_ViewSpecialTiffinOrder : System.Web.UI.Page
{
    DataCon dc = new DataCon();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToString(Session["uid"]) == "")
        {
            Session["msg"] = "Please Log In First";
            Response.Redirect("~/Log_in.aspx");
        }
        else
        {
            if (IsPostBack != true)
            {

                DataSet ds = new DataSet();
                string s = "select SpecialTiffinOrder.OrderId,SpecialTiffinOrder.UserId,SpecialTiffinOrder.DelCity,SpecialTiffinOrder.DelArea,SpecialTiffinOrder.DelAddress,SpecialTiffinOrder.BookDate,SpecialTiffinOrder.BookTime,SpecialTiffinOrder.IsRead,SpecialTiffinOrder.IsDelivered,SpecialTiffinOrder.IsCancelled,SpecialTiffin.TiffinName,SpecialTiffin.Description,SpecialTiffin.ProviderId,SpecialTiffin.Image,SpecialTiffin.Price from SpecialTiffinOrder JOIN SpecialTiffin ON SpecialTiffinOrder.TiffinId=SpecialTiffin.TiffinId where SpecialTiffinOrder.UserId='" + Convert.ToString(Session["uid"]) + "'";
                ds = dc.getdata(s);

                if (ds.Tables[0].Rows.Count != 0)
                {
                    InfoLbl.Text = "You Booked Special Tiffin From Tiffin Dabba As Details Are Given Below";
                    SpecialTiffinOdrHisRptr.DataSource = ds;
                    SpecialTiffinOdrHisRptr.DataBind();
                }
                else
                {
                    InfoLbl.Text = "You Did Not Book Special Tiffin From Tiffin Dabba.";
                    SpecialTiffinOdrHisRptr.DataSource = "";
                    SpecialTiffinOdrHisRptr.DataBind();

                }
            }
        }
    }
}