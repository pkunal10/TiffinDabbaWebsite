<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="Tiffin_with_sweet_menu.aspx.cs" Inherits="admin_Tiffin_with_sweet_menu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <title>Tiffin With Sweet Menu</title>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

   <%-- <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>--%>

<br />
<br />    
    <div>
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
                        Sabji</td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
                    <td>
                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Sabji"
                     Text="Enter Sabji" ValidationGroup="atwsm" ControlToValidate="TextBox1"></asp:RequiredFieldValidator><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Alphabates Only"
                     Text="Alphabates Only" ValidationExpression="[a-zA-Z ]*$" ValidationGroup="atwsm" 
                            ControlToValidate="TextBox1"></asp:RegularExpressionValidator>--%></td>
                </tr>
                <tr>
                    <td>
                        Roti</td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></td>
                    <td>
                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Roti"
                     Text="Enter Roti" ValidationGroup="atwsm" ControlToValidate="TextBox2"></asp:RequiredFieldValidator><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Alphabates Only"
                     Text="Alphabates Only" ValidationExpression="[a-zA-Z ]*$" ValidationGroup="atwsm" 
                            ControlToValidate="TextBox2"></asp:RegularExpressionValidator>--%></td>
                </tr>
                <tr>
                    <td>
                        Dal</td>
                    <td>
                        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox></td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter Dal"
                     Text="Enter Dal" ValidationGroup="atwsm" ControlToValidate="TextBox3"></asp:RequiredFieldValidator><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Alphabates Only"
                     Text="Alphabates Only" ValidationExpression="[a-zA-Z ]*$" ValidationGroup="atwsm" 
                            ControlToValidate="TextBox3"></asp:RegularExpressionValidator></td>
                </tr>
                <tr>
                    <td>
                        Chawal</td>
                    <td>
                        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox></td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Enter Chawal"
                     Text="Enter Chawal" ValidationGroup="atwsm" ControlToValidate="TextBox4"></asp:RequiredFieldValidator><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Alphabates Only"
                     Text="Alphabates Only" ValidationExpression="[a-zA-Z ]*$" ValidationGroup="atwsm" 
                            ControlToValidate="TextBox4"></asp:RegularExpressionValidator></td>
                </tr>
                <tr>
                    <td>
                        Sweet</td>
                    <td>
                        <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox></td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Enter Sweet"
                     Text="Enter Sweet" ValidationGroup="atwsm" ControlToValidate="TextBox5"></asp:RequiredFieldValidator><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="Alphabates Only"
                     Text="Alphabates Only" ValidationExpression="[a-zA-Z ]*$" ValidationGroup="atwsm" 
                            ControlToValidate="TextBox5"></asp:RegularExpressionValidator></td>
                </tr>
                <tr>
                    <td>
                        Other</td>
                    <td>
                        <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox></td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Enter Other"
                     Text="Enter Other" ValidationGroup="astm" ControlToValidate="TextBox7"></asp:RequiredFieldValidator><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ErrorMessage="Alphabates Only"
                     Text="Alphabates Only" ValidationExpression="[a-zA-Z ]*$" ValidationGroup="astm" 
                            ControlToValidate="TextBox7"></asp:RegularExpressionValidator></td>
                </tr>
                <tr>
                    <td>
                        Price</td>
                    <td>
                        <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox></td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Enter Price"
                     Text="Enter Price" ValidationGroup="atwsm" ControlToValidate="TextBox6"></asp:RequiredFieldValidator><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ErrorMessage="Numbers Only"
                     Text="Numbers Only" ValidationExpression="[0-9]*" ValidationGroup="atwsm" ControlToValidate="TextBox6"></asp:RegularExpressionValidator></td>
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
    </div>
 <%--   </ContentTemplate>
    <Triggers>
        <asp:PostBackTrigger ControlID="Button3" />
    </Triggers>
</asp:UpdatePanel>--%>
</asp:Content>

