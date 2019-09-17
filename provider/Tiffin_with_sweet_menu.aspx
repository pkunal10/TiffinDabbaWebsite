<%@ Page Title="" Language="C#" MasterPageFile="~/provider/provider.master" AutoEventWireup="true" CodeFile="Tiffin_with_sweet_menu.aspx.cs" Inherits="provider_Tiffin_with_sweet_menu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <title>Tiffin With Sweet Menu</title>
    <link href="assets/img/shortcut_icon.png" rel="shortcut icon">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>    
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>



      <div style="height:150px;">
    
        <div style="height:60px;width:1000px;border-bottom-style:dashed;border-bottom-width:1.5px;"><br />
                <font class="pagetitle">Tiffin With Sweet Menu</font>
        </div>
        <div style="height:90px;margin-top:22px;" class="text-justify">
        
        <font class="myprofile-description">

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            From this page you can see menu of perticular TIFFIN WITH SWEET you provide to our user.and you can update 
            price and availability of perticular tiffin.
        
        </font>
        
        </div>
    
    </div>


<br />
<br />
    <div>
        <center>
            
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <table style="width:400px;height:350px;">
                <tr style="height:50px;">
                    <td style="width:200px;">
                        Sabji</td>
                    <td >
                        <asp:Label ID="Label1" runat="server" Text=""></asp:Label></td>
                    <td style="width:200px;">
                        &nbsp;</td>
                </tr>
                <tr style="height:50px;">
                    <td>
                        Roti</td>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text=""></asp:Label></td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr style="height:50px;">
                    <td>
                        Dal</td>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text=""></asp:Label></td>
                    <td>
                        &nbsp;</td>
                </tr> 
                <tr style="height:50px;">
                    <td>
                        Chawal</td>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text=""></asp:Label></td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr style="height:50px;">
                    <td>
                        Sweet</td>
                    <td>
                        <asp:Label ID="Label5" runat="server" Text=""></asp:Label></td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr style="height:50px;">
                    <td>
                        Price</td>
                    <td>
                        <asp:Label ID="Label6" runat="server" Text=""></asp:Label></td>
                    <td>
                        </td>
                </tr>
                <tr style="height:50px;">
                    <td>
                        Available</td>
                    <td>
                        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
                            <asp:ListItem>--To Select--</asp:ListItem>
                            <asp:ListItem>yes</asp:ListItem>
                            <asp:ListItem>no</asp:ListItem>
                            
                        </asp:DropDownList>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr style="height:50px;">
                    <td colspan="3" align="center">
                        <asp:Button ID="Button1" runat="server" Text="Update" onclick="Button1_Click"/></td>
                    
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

