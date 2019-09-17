<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="Full_details_of_tiffin_with_sweet_order.aspx.cs" Inherits="Full_details_of_tiffin_with_swwet_order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <title>Full Details Of Tiffin With Sweet Order</title>

    <style type="text/css">
        .style2
        {
            width: 208px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <center>
    
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>    
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>    
        
        <table cellspacing="5">
        <caption>
            <asp:Label ID="Label4" runat="server" Font-Bold="true" Font-Size="18px" Text=""></asp:Label>
        </caption>
            <tr>
                <td class="style2">
                    Order Id</td>
                <td>
                    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                 </td>
            </tr>
            <tr>
                <td class="style2">
                    Book For</td>
                <td>
                    <asp:Label ID="Label2" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr>
                <td class="style2">
                    Tiffin Id</td>
                <td>
                    <asp:Label ID="Label3" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr>
                <td class="style2">
                    Provider Id</td>
                <td>
                    <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click"></asp:LinkButton>
                    </td>
            </tr>
            <tr>
                <td class="style2">
                    User Id</td>
                <td>
                    <asp:LinkButton ID="LinkButton2" runat="server" onclick="LinkButton2_Click"></asp:LinkButton>
                    </td>
            </tr>
            <tr>
                <td class="style2">
                    User Name</td>
                <td>
                    <asp:Label ID="Label6" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr>
                <td class="style2">
                    User Email Id</td>
                <td>
                    <asp:Label ID="Label7" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr>
                <td class="style2">
                    TIme</td>
                <td>
                    <asp:Label ID="Label8" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr>
                <td class="style2">
                    Date</td>
                <td>
                    <asp:Label ID="Label9" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr>
                <td class="style2">
                    Mobile No</td>
                <td>
                    <asp:Label ID="Label10" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr>
                <td class="style2">
                    Delivery Area</td>
                <td>
                    <asp:Label ID="Label18" runat="server"  Text=""></asp:Label></td>
            </tr>
            <tr>
                <td class="style2">
                    Delivery Address</td>
                <td>
                    <asp:Label ID="Label11" runat="server" Width="200px" style="word-wrap:normal;word-break:break-all;" Text=""></asp:Label></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                   <h3> Menu Of This Order</h3>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    Sabji</td>
                <td>
                    <asp:Label ID="Label12" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr>
                <td class="style2">
                    Roti</td>
                <td>
                    <asp:Label ID="Label13" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr>
                <td class="style2">
                    Dal</td>
                <td>
                    <asp:Label ID="Label14" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr>
                <td class="style2">
                    Chawal</td>
                <td>
                    <asp:Label ID="Label15" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr>
                <td class="style2">
                    Sweet</td>
                <td>
                    <asp:Label ID="Label5" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr>
                <td class="style2">
                    Other</td>
                <td>
                    <asp:Label ID="Other_lbl" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr>
                <td class="style2">
                    Price</td>
                <td>
                    <asp:Label ID="Label16" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr>
                <td class="style2">
                    Tiffin Image</td>
                <td>
                    <asp:Image ID="Image1" runat="server" Height="100px" Width="100px" /></td>
            </tr>
            <tr>
                <td class="style2">
                    Status</td>
                <td>
                    <asp:Label ID="Label17" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr>
                <td colspan="2">
                    
                    &nbsp;&nbsp;&nbsp;
                    
                    <asp:Button ID="Button1" runat="server" Text="Generate Invoice" 
                        onclick="Button1_Click" />
                    &nbsp;&nbsp;
                    <asp:Button ID="Button2" runat="server" Text="Departure Email" 
                        onclick="Button2_Click"  />
                        &nbsp;&nbsp;
                    <asp:Button ID="Button3" runat="server" Text="Delivered" 
                        onclick="Button3_Click"  />
                        &nbsp;&nbsp;
                            <asp:Button ID="Button4" runat="server" Text="Cancelled" 
                        onclick="Button4_Click" />    

                        <br />
                        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label19" runat="server" Text="" CssClass="time_war"></asp:Label>
                        </td>
            </tr>
        </table>
    
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
    
    </center>

</asp:Content>

