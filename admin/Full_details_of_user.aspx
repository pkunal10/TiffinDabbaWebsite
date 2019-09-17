<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="Full_details_of_user.aspx.cs" Inherits="admin_Full_details_of_user" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <title>Full Details Of User</title>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
<br />
<br />
    <div>
        <center>
            <table style="width:400px;">
            <tr>
                <td style="width:200px;">
                    User Id</td>
                <td style="width:200px;">
                    <asp:Label ID="Label1" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr>
                <td>
                    Name</td>
                <td>
                    <asp:Label ID="Label2" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr>
                <td>
                    Address</td>
                <td>
                    <asp:Label ID="Label3" runat="server" Width="200px" style="word-wrap:normal;word-break:break-all;" Text=""></asp:Label></td>
            </tr>
            <tr>
                <td>
                    Mobile No</td>
                <td>
                    <asp:Label ID="Label4" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr>
                <td>
                    Email Id</td>
                <td>
                    <asp:Label ID="Label5" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr>
                <td>
                    Status</td>
                <td>
                    <asp:Label ID="Label7" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr>
                <td>
                    Password</td>
                <td>
                    <asp:Label ID="Label6" runat="server" Text=""></asp:Label></td>
            </tr>
            
                <tr>
                    <td colspan="2">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="Button1" runat="server" Text="Delete User" 
                            onclick="Button1_Click" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="Button2" runat="server" Text="Allowed User" 
                            onclick="Button2_Click" />
                    </td>
                    
                </tr>
            </table>
        </center>
    </div>
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

