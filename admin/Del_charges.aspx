<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="Del_charges.aspx.cs" Inherits="admin_Del_charges" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Delivery Charges</title>
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
                <table>
                    <tr>
                        <td>
                            Delivery Charge Limit
                        </td>
                        <td>
                            <asp:TextBox ID="del_charge_limit_tb" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Charge Limit"
                             Text="Enter Charge Limit" ValidationGroup="adcl" ControlToValidate="del_charge_limit_tb"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Delivery Charges
                        </td>
                        <td>
                            <asp:TextBox ID="del_charge_tb" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Delivery Charges"
                             Text="Enter Delivery Charges" ValidationGroup="adcl" ControlToValidate="del_charge_tb"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" align="center">
                            <asp:Button ID="del_charge_btn" ValidationGroup="adcl" runat="server" Text="Update" OnClick="del_charge_btn_Click" />
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

