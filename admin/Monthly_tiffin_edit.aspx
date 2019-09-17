<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="Monthly_tiffin_edit.aspx.cs" Inherits="admin_Monthly_tiffin_edit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Monthly Tiffin Edit</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <center>
            
            <table style="width:400px;">
                <tr>
                    <td style="width:200px;">
                        Tiffin Id</td>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text=""></asp:Label></td>
                    <td style="width:200px;">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        Provider Id</td>
                    <td>
                        <asp:LinkButton ID="LinkButton2" runat="server" onclick="LinkButton2_Click" ></asp:LinkButton></td>
                    <td>
                        &nbsp;</td>
                </tr>
                
                <tr>
                    <td>
                       No Of Roti</td>
                    <td>
                        <asp:TextBox ID="No_of_roti_tb" runat="server"></asp:TextBox></td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Roti"
                     Text="Enter Roti" ValidationGroup="atwsm" ControlToValidate="No_of_roti_tb"></asp:RequiredFieldValidator><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Numbers Only"
                     Text="Numbers Only" ValidationExpression="[0-9]*" ValidationGroup="atwsm" 
                            ControlToValidate="No_of_roti_tb"></asp:RegularExpressionValidator></td>
                </tr>
                
                
                <tr>
                    <td>
                        Price</td>
                    <td>
                        <asp:TextBox ID="Price_tb" runat="server"></asp:TextBox></td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Enter Price"
                     Text="Enter Price" ValidationGroup="atwsm" ControlToValidate="Price_tb"></asp:RequiredFieldValidator><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ErrorMessage="Numbers Only"
                     Text="Numbers Only" ValidationExpression="[0-9]*" ValidationGroup="atwsm" ControlToValidate="Price_tb"></asp:RegularExpressionValidator></td>
                </tr>

                <tr>
                    <td>
                       Trial Price</td>
                    <td>
                        <asp:TextBox ID="Trial_price_tb" runat="server"></asp:TextBox></td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter trial Price"
                     Text="Enter trial Price" ValidationGroup="atwsm" ControlToValidate="Trial_price_tb"></asp:RequiredFieldValidator><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Numbers Only"
                     Text="Numbers Only" ValidationExpression="[0-9]*" ValidationGroup="atwsm" ControlToValidate="Trial_price_tb"></asp:RegularExpressionValidator></td>
                </tr>

                <tr>
                    <td colspan="3">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="Button1" runat="server" Text="Update" onclick="Button1_Click" ValidationGroup="atwsm"/>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="Button2" runat="server" Text="Delete" onclick="Button2_Click" />
                        </td>
                    
                </tr>

                <tr>
                    <td>
                        Image</td>
                    <td>
                        <asp:Image ID="Image1" runat="server" Height="100px" Width="100px" />
                        <br />
                        <asp:LinkButton ID="LinkButton14" runat="server" onclick="LinkButton14_Click">Change Image</asp:LinkButton>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>

            <asp:Panel ID="Panel1" runat="server">
            
                <table style="width:550px;">
                <tr>
                    <td style="width:350px;">
                        Select Tiffin's Image</td>
                    <td>
                        <asp:FileUpload ID="FileUpload1" runat="server" /><br /><br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="Button3" runat="server" Text="Upload" onclick="Button3_Click" />
                        </td>
                    <td style="width:200px;">
                        &nbsp;</td>
                </tr>
                </table>

        </asp:Panel>
           
            
        </center>


</asp:Content>

