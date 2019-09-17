using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_SpecialTiffinOrder : System.Web.UI.Page
{
    DataCon dc = new DataCon();
    DateTime current_time = TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.Local, TimeZoneInfo.FindSystemTimeZoneById("India Standard Time"));
    protected void Page_Load(object sender, EventArgs e)
    {
        if(IsPostBack!=true)
        {
            BindData();
        }
    }

    private void BindData()
    {
        #region Fetch New Order

        string newOdr = "select SpecialTiffinOrder.OrderId,SpecialTiffinOrder.UserId,SpecialTiffinOrder.DelCity,SpecialTiffinOrder.DelArea,SpecialTiffinOrder.DelAddress,SpecialTiffinOrder.BookDate,SpecialTiffinOrder.BookTime,SpecialTiffinOrder.IsRead,SpecialTiffinOrder.IsDelivered,SpecialTiffinOrder.IsCancelled,SpecialTiffin.TiffinName,SpecialTiffin.Description,SpecialTiffin.ProviderId,SpecialTiffin.Price,user_accounts.mob_no from SpecialTiffinOrder JOIN SpecialTiffin ON SpecialTiffinOrder.TiffinId=SpecialTiffin.TiffinId JOIN user_accounts ON SpecialTiffinOrder.UserId=user_accounts.id where SpecialTiffinOrder.BookDate='" + current_time.ToLongDateString() + "' and SpecialTiffinOrder.BookTime<='" + current_time.ToLongTimeString() + "' and SpecialTiffinOrder.IsRead = 0 and SpecialTiffinOrder.IsDelivered = 0 and SpecialTiffinOrder.IsCancelled = 0";
        DataSet dsnewOdr = new DataSet();
        dsnewOdr = dc.getdata(newOdr);

        if (dsnewOdr.Tables[0].Rows.Count == 0)
        {
            NewOdrGv.DataSource = "";
            NewOdrGv.DataBind();
            NewOdrInfoLbl.Text = "No New Special Tiffin Order";
        }
        else
        {
            NewOdrGv.DataSource = dsnewOdr;
            NewOdrGv.DataBind();
            NewOdrInfoLbl.Text = "New Special Tiffin Order";
        }

        #endregion

        #region Fetch Readed Order

        string readOdr = "select SpecialTiffinOrder.OrderId,SpecialTiffinOrder.UserId,SpecialTiffinOrder.DelCity,SpecialTiffinOrder.DelArea,SpecialTiffinOrder.DelAddress,SpecialTiffinOrder.BookDate,SpecialTiffinOrder.BookTime,SpecialTiffinOrder.IsRead,SpecialTiffinOrder.IsDelivered,SpecialTiffinOrder.IsCancelled,SpecialTiffin.TiffinName,SpecialTiffin.Description,SpecialTiffin.ProviderId,SpecialTiffin.Price,user_accounts.mob_no from SpecialTiffinOrder JOIN SpecialTiffin ON SpecialTiffinOrder.TiffinId=SpecialTiffin.TiffinId JOIN user_accounts ON SpecialTiffinOrder.UserId=user_accounts.id where SpecialTiffinOrder.BookDate='" + current_time.ToLongDateString() + "' and SpecialTiffinOrder.BookTime<='" + current_time.ToLongTimeString() + "' and SpecialTiffinOrder.IsRead = 1";
        DataSet dsreadOdr = new DataSet();
        dsreadOdr = dc.getdata(readOdr);

        if (dsreadOdr.Tables[0].Rows.Count == 0)
        {
            ReadOdrGv.DataSource = "";
            ReadOdrGv.DataBind();
            ReadOdrLbl.Text = "No Today's Readed Special Tiffin Order";
        }
        else
        {
            ReadOdrGv.DataSource = dsreadOdr;
            ReadOdrGv.DataBind();
            ReadOdrLbl.Text = "Today's Readed Special Tiffin Order";
        }

        #endregion

        #region Fetch Delivered Order

        string DeliveredOdr = "select SpecialTiffinOrder.OrderId,SpecialTiffinOrder.UserId,SpecialTiffinOrder.DelCity,SpecialTiffinOrder.DelArea,SpecialTiffinOrder.DelAddress,SpecialTiffinOrder.BookDate,SpecialTiffinOrder.BookTime,SpecialTiffinOrder.IsRead,SpecialTiffinOrder.IsDelivered,SpecialTiffinOrder.IsCancelled,SpecialTiffin.TiffinName,SpecialTiffin.Description,SpecialTiffin.ProviderId,SpecialTiffin.Price,user_accounts.mob_no from SpecialTiffinOrder JOIN SpecialTiffin ON SpecialTiffinOrder.TiffinId=SpecialTiffin.TiffinId JOIN user_accounts ON SpecialTiffinOrder.UserId=user_accounts.id where SpecialTiffinOrder.BookDate='" + current_time.ToLongDateString() + "' and SpecialTiffinOrder.BookTime<='" + current_time.ToLongTimeString() + "' and SpecialTiffinOrder.IsDelivered = 1";
        DataSet dsdeliveredOdr = new DataSet();
        dsdeliveredOdr = dc.getdata(DeliveredOdr);

        if (dsdeliveredOdr.Tables[0].Rows.Count == 0)
        {
            DeliveredOdrGv.DataSource = "";
            DeliveredOdrGv.DataBind();
            DeliveredOdrInfoLbl.Text = "No Today's Delivered Special Tiffin Order";
        }
        else
        {
            DeliveredOdrGv.DataSource = dsdeliveredOdr;
            DeliveredOdrGv.DataBind();
            DeliveredOdrInfoLbl.Text = "Today's Delivered Special Tiffin Order";
        }

        #endregion

        #region Fetch Cancelled Order

        string CancelledOdr = "select SpecialTiffinOrder.OrderId,SpecialTiffinOrder.UserId,SpecialTiffinOrder.DelCity,SpecialTiffinOrder.DelArea,SpecialTiffinOrder.DelAddress,SpecialTiffinOrder.BookDate,SpecialTiffinOrder.BookTime,SpecialTiffinOrder.IsRead,SpecialTiffinOrder.IsDelivered,SpecialTiffinOrder.IsCancelled,SpecialTiffin.TiffinName,SpecialTiffin.Description,SpecialTiffin.ProviderId,SpecialTiffin.Price,user_accounts.mob_no from SpecialTiffinOrder JOIN SpecialTiffin ON SpecialTiffinOrder.TiffinId=SpecialTiffin.TiffinId JOIN user_accounts ON SpecialTiffinOrder.UserId=user_accounts.id where SpecialTiffinOrder.BookDate='" + current_time.ToLongDateString() + "' and SpecialTiffinOrder.BookTime<='" + current_time.ToLongTimeString() + "' and SpecialTiffinOrder.IsCancelled = 1";
        DataSet dscancelledOdr = new DataSet();
        dscancelledOdr = dc.getdata(CancelledOdr);

        if (dscancelledOdr.Tables[0].Rows.Count == 0)
        {
            CancelledOdrGv.DataSource = "";
            CancelledOdrGv.DataBind();
            CacelledOdrInfoLbl.Text = "No Today's Cancelled Special Tiffin Order";
        }
        else
        {
            CancelledOdrGv.DataSource = dscancelledOdr;
            CancelledOdrGv.DataBind();
            CacelledOdrInfoLbl.Text = "Today's Cancelled Special Tiffin Order";
        }

        #endregion

        #region Fetch All Order

        string AllOdr = "select SpecialTiffinOrder.OrderId,SpecialTiffinOrder.UserId,SpecialTiffinOrder.DelCity,SpecialTiffinOrder.DelArea,SpecialTiffinOrder.DelAddress,SpecialTiffinOrder.BookDate,SpecialTiffinOrder.BookTime,SpecialTiffinOrder.IsRead,SpecialTiffinOrder.IsDelivered,SpecialTiffinOrder.IsCancelled,SpecialTiffin.TiffinName,SpecialTiffin.Description,SpecialTiffin.ProviderId,SpecialTiffin.Price,user_accounts.mob_no from SpecialTiffinOrder JOIN SpecialTiffin ON SpecialTiffinOrder.TiffinId=SpecialTiffin.TiffinId JOIN user_accounts ON SpecialTiffinOrder.UserId=user_accounts.id";
        DataSet dsAllOdr = new DataSet();
        dsAllOdr = dc.getdata(AllOdr);

        if (dsAllOdr.Tables[0].Rows.Count == 0)
        {
            AllOdrGv.DataSource = "";
            AllOdrGv.DataBind();
            AllOdrInfoLbl.Text = "No Special Tiffin Order Yet";
        }
        else
        {
            AllOdrGv.DataSource = dsAllOdr;
            AllOdrGv.DataBind();
            AllOdrInfoLbl.Text = "All Special Tiffin Order";
        }

        #endregion

    }
    protected void ProviderIdLb_Command(object sender, CommandEventArgs e)
    {
        string j = e.CommandName.ToString();
        Session["pid"] = j;
        Response.Redirect("~/admin/Full_details_of_provider.aspx");
    }
    protected void UserIdLb_Command(object sender, CommandEventArgs e)
    {
        string k = e.CommandName.ToString();
        Session["uid"] = k;
        Response.Redirect("~/admin/Full_details_of_user.aspx");
    }
    protected void ReadLb_Command(object sender, CommandEventArgs e)
    {
        string jk = "update SpecialTiffinOrder set IsRead=1 where OrderId='" + e.CommandArgument.ToString() + "'";
        dc.setdata(jk);
        BindData();
    }
    protected void CancelledLb_Command(object sender, CommandEventArgs e)
    {
        string jk = "update SpecialTiffinOrder set IsCancelled=1 where OrderId='" + e.CommandArgument.ToString() + "'";
        dc.setdata(jk);
        BindData();
    }
    protected void DeliveredLb_Command(object sender, CommandEventArgs e)
    {
        string jk = "update SpecialTiffinOrder set IsDelivered=1 where OrderId='" + e.CommandArgument.ToString() + "'";
        dc.setdata(jk);
        BindData();
    }
}