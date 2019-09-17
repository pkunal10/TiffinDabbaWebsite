<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="Full_details_of_monthly_order.aspx.cs" Inherits="admin_Full_details_of_monthly_order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Full Details Of Monthly Order</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <center>
        <table><caption><h2>
            <asp:Label ID="Caption_lbl" runat="server" Text=""></asp:Label></h2></caption>
            <tr>
                <td>
                    Order Id
                </td>
                <td>
                    <asp:Label ID="Order_id_lbl" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    Book For
                </td>
                <td>
                    <asp:Label ID="Book_for_lbl" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    Tiffin Id
                </td>
                <td>
                    <asp:Label ID="Tiffin_id_lbl" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    Provider Id
                </td>
                <td>
                    <asp:LinkButton ID="Provider_id_lb" runat="server" OnClick="Provider_id_lb_Click">LinkButton</asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td>
                    User Id
                </td>
                <td>
                    <asp:LinkButton ID="User_id_lb" runat="server" OnClick="User_id_lb_Click">LinkButton</asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td>
                    User Name
                </td>
                <td>
                    <asp:Label ID="Uname_lbl" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    User Email Id
                </td>
                <td>
                    <asp:Label ID="Ueid_lbl" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    Mobile No
                </td>
                <td>
                    <asp:Label ID="Mobile_no_lbl" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    Delivery Area
                </td>
                <td>
                    <asp:Label ID="Delivery_area_lbl" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    Delivery Address
                </td>
                <td>
                    <asp:Label ID="Delivery_address_lbl" Width="200px" style="word-wrap:normal;word-break:break-all;" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    Booking Date
                </td>
                <td>
                    <asp:Label ID="Booking_date_lbl" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    No Of Days
                </td>
                <td>
                    <asp:Label ID="No_of_days_lbl" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    Start Date
                </td>
                <td>
                    <asp:Label ID="Start_date_lbl" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    Finish Date
                </td>
                <td>
                    <asp:Label ID="Finish_date_lbl" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    No Of Roti
                </td>
                <td>
                    <asp:Label ID="No_of_roti_lbl" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    Price
                </td>
                <td>
                    <asp:Label ID="Price_lbl" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <asp:Button ID="Delete_order_btn" runat="server" Text="Delete Order" OnClick="Delete_order_btn_Click" />
                </td>
            </tr>
        </table>
    </center>

</asp:Content>

