<%@ Page Title="" Language="C#" MasterPageFile="~/provider/provider.master" AutoEventWireup="true" CodeFile="My_profile.aspx.cs" Inherits="provider_My_profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <title>My Profile</title>
    <link href="assets/img/shortcut_icon.png" rel="shortcut icon">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>    
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>


        <div style="height:150px;">
    
        <div style="height:60px;width:1000px;border-bottom-style:dashed;border-bottom-width:1.5px;"><br />
                <font class="pagetitle">My Profile</font>
        </div>
        <div style="height:90px;margin-top:22px;" class="text-justify">
        
        <font class="myprofile-description">

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            From this page you can see your profile.on this page you can get link for update your profile.by clicking on that link you will redirect to update profile page and you can update your profile.
        
        </font>
        
        </div>
    
    </div>

    <div>
        

            <center><br /><br /><br /><br />
                
 
                <asp:Panel ID="Panel1" runat="server">
                
                <table style="width:350px;height:350px;">
                    <%--<tr style="height:50px;">
                        <td style="width:175px;">
                            Id</td>
                        <td style="width:175px;">
                            <asp:Label ID="Label1" runat="server" Text=""></asp:Label></td>
                    </tr>--%>
                    <tr style="height:50px;">
                        <td>
                            Name</td>
                        <td>
                            <asp:Label ID="Label2" runat="server" Text=""></asp:Label></td>
                    </tr>
                    <tr style="height:50px;">
                        <td>
                            City</td>
                        <td>
                            <asp:Label ID="Label3" runat="server" Text=""></asp:Label></td>
                    </tr>
                    <tr style="height:50px;">
                        <td>
                            Mobile No</td>
                        <td>
                            <asp:Label ID="Label4" runat="server" Text=""></asp:Label></td>
                    </tr>
                    <tr style="height:50px;">
                        <td>
                            Email Id</td>
                        <td>
                            <asp:Label ID="Label5" runat="server" Text=""></asp:Label></td>
                    </tr>
                    <tr style="height:50px;">
                        <td>
                            Address</td>
                        <td>
                            <asp:Label ID="Label6" runat="server" Width="200px" style="word-wrap:normal;word-break:break-all;" Text=""></asp:Label></td>
                    </tr>
                    <tr style="height:50px;">
                        
                        <td colspan="2">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                           <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">Update Profile</asp:LinkButton></td>
                    </tr >
                </table>
                
                </asp:Panel>
                </center>
                

    </div>
    </ContentTemplate>
</asp:UpdatePanel>
</asp:Content>

