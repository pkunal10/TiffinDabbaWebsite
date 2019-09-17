<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="Change_password.aspx.cs" Inherits="admin_Change_password" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<title>Change Password</title>
    <style type="text/css">
        .style2
        {
            width: 131px;
        }
        .style3
        {
            width: 196px;
        }
    .style4
    {
        width: 175px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>    

            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
    <br />
<br />
    <center>
        <asp:Panel ID="Panel1" runat="server">
        
        <table class="style1">
            <tr>
                <td class="style3">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Enter Security Key</td>
                <td class="style2">
                    <asp:TextBox ID="TextBox1" runat="server" TextMode="Password"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Security Key"
                     Text="Enter Security Key" ValidationGroup="acps" ControlToValidate="TextBox1"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td colspan="3">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button1" runat="server" Text="Submit" onclick="Button1_Click" ValidationGroup="acps" /></td>
            </tr>
        </table>
       </asp:Panel> 
    </center>
    <br />
    <br />
    <center>
        <asp:Panel ID="Panel2" runat="server">
            <table class="style1">
                <tr>
                    <td class="style4">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Enter New Password</td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox></td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Password"
                         Text="Enter Password" ControlToValidate="TextBox2" ValidationGroup="acpnp"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td class="style4">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Confirm New Password</td>
                    <td>
                        <asp:TextBox ID="TextBox3" runat="server" TextMode="Password"></asp:TextBox></td>
                    <td>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password Is Not Matched"
                         Text="Password Is Not Matched" ControlToCompare="TextBox2" ControlToValidate="TextBox3" ValidationGroup="acpnp"></asp:CompareValidator></td>
                </tr>
                <tr>
                    <td colspan="3">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="Button2" runat="server" Text="Update" ValidationGroup="acpnp" 
                            onclick="Button2_Click" /></td>
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

