<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="Orders_time.aspx.cs" Inherits="admin_Orders_time" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Change Order Time</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    
        <center>
            <asp:Panel ID="Panel1" runat="server">
                <table>
                    <tr>
                        <td>
                            Enter Security Key
                        </td>
                        <td>
                            <asp:TextBox ID="Security_Key_tb" TextMode="Password" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter Security Key"
                             Text="Enter Security Key" ValidationGroup="acotsk" ControlToValidate="Security_Key_tb"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" align="center">
                            <asp:Button ID="Security_Key_btn" ValidationGroup="acotsk" runat="server" Text="Submit" OnClick="Security_Key_btn_Click" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <br />
            <br />
            <asp:Panel ID="Panel2" runat="server">
                <h2>Tiffin Order Booking Times</h2>
                <table>
                    <tr>
                        <td>
                            Time For LUNCH
                        </td>
                        <td>
                            <asp:TextBox ID="Lunch_Time_tb" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Lunch Time"
                             Text="Enter Lunch Time" ValidationGroup="acot" ControlToValidate="Lunch_Time_tb"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Time For DINNER
                        </td>
                        <td>
                            <asp:TextBox ID="Dinner_Time_tb" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Dinner Time"
                             Text="Enter Dinner Time" ValidationGroup="acot" ControlToValidate="Dinner_Time_tb"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" align="center">
                            <asp:Button ID="Order_Time_btn" ValidationGroup="acot" runat="server" Text="Update" OnClick="Order_Time_btn_Click" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <br />
            <br />
            <asp:Panel ID="ff_order_time_pnl" runat="server">
                <h2>Fast Food Order Booking Times</h2>
                <table>
                    <tr>
                        <td>
                            Start Time
                        </td>
                        <td>
                            <asp:TextBox ID="ff_start_time_tb" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Enter Start Time"
                             Text="Enter Start Time" ValidationGroup="acotff" ControlToValidate="ff_start_time_tb"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            End Time
                        </td>
                        <td>
                            <asp:TextBox ID="ff_end_time_tb" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Enter End Time"
                             Text="Enter End Time" ValidationGroup="acotff" ControlToValidate="ff_end_time_tb"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" align="center">
                            <asp:Button ID="ff_order_time_btn" ValidationGroup="acotff" runat="server" Text="Update" OnClick="ff_order_time_btn_Click" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>

        </center>

<asp:UpdateProgress ID="UpdateProgress1" runat="server" class="loading" AssociatedUpdatePanelID="UpdatePanel1" DisplayAfter="0" DynamicLayout ="true">
            <ProgressTemplate>
                <center>
                    <font style="color:White;font-size:18px;">Please Wait....</font><br /><br />
                    <img id="Img1" src="~/user/assets/img/loader.gif" runat="server" />
                </center>
            </ProgressTemplate>
        </asp:UpdateProgress>
</ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>

