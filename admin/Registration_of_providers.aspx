<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="Registration_of_providers.aspx.cs" Inherits="admin_Registration_of_providers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <title>Registration Of Providers</title>

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
        <table class="style1">
            <%--<tr>
                <td class="style2">
                    Id</td>
                <td>
                    <asp:Label ID="Label1" runat="server" Text=""></asp:Label></td>
                <td>
                    &nbsp;</td>
            </tr>--%>
            <tr>
                <td class="style2">
                    Name</td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Name"
                     ValidationGroup="apr" Text="Enter Name" ControlToValidate="TextBox1"></asp:RequiredFieldValidator><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Alphabates Only"
                     Text="Alphabates Only" ControlToValidate="TextBox1" ValidationGroup="apr" ValidationExpression="[a-zA-Z ]*$"></asp:RegularExpressionValidator>
                     </td>
            </tr>
            <tr>
                <td class="style2">
                    City</td>
                <td>
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
                    </asp:DropDownList>
                </td>
                <td>
                    </td>
            </tr>
            <tr>
                <td class="style2">
                   Mobile No</td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Mobile No"
                     ValidationGroup="apr" Text="Enter Mobile No" ControlToValidate="TextBox2"></asp:RequiredFieldValidator><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Numbers Only"
                     Text="Enter 10 Digits" ControlToValidate="TextBox2" ValidationGroup="apr" ValidationExpression="^[0-9]{10}$"></asp:RegularExpressionValidator></td>
            </tr>
            <tr>
                <td class="style2">
                    Email Id</td>
                <td>
                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter Email"
                     ValidationGroup="apr" Text="Enter Email" ControlToValidate="TextBox3"></asp:RequiredFieldValidator><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Enter Correct Email"
                     Text="Enter Correct Email" ControlToValidate="TextBox3" ValidationGroup="apr" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator></td>
            </tr>
            <tr>
                <td class="style2">
                    Address</td>
                <td>
                    <asp:TextBox ID="TextBox4" runat="server" TextMode="MultiLine"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Enter Address"
                     Text="Enter Address" ValidationGroup="apr" ControlToValidate="TextBox4"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td class="style2">
                    Is Fast Food</td>
                <td>
                    <asp:CheckBox ID="is_ff_chk" runat="server" />Is FastFood
                <td>
                    </td>
            </tr>
            <tr>
                <td class="style2">
                    Password</td>
                <td>
                    <asp:TextBox ID="TextBox5" runat="server" TextMode="Password"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Enter Password"
                     Text="Enter Password" ValidationGroup="apr" ControlToValidate="TextBox5"></asp:RequiredFieldValidator></td>
            </tr>
            
            
            <tr>
                <td colspan="3" align="center">
                    <asp:Button ID="Button1" runat="server" Text="Submit" onclick="Button1_Click" ValidationGroup="apr" /></td>
                
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

