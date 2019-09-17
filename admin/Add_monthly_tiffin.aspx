<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="Add_monthly_tiffin.aspx.cs" Inherits="admin_Add_monthly_tiffin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Add Monthly Tiffin</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    
    
<center>
    <table>
        <tr>
            <td>
                Tiffin Id
            </td>
            <td>
                <asp:TextBox ID="Tiffin_id_tb" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Tiffin Id" Text="Enter Tiffin Id" ControlToValidate="Tiffin_id_tb"
                    ValidationGroup="aamt" ></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                No Of Roti
            </td>
            <td>
                <asp:TextBox ID="No_of_roti_tb" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter no of roti" Text="Enter no of roti" ControlToValidate="No_of_roti_tb"
                    ValidationGroup="aamt"></asp:RequiredFieldValidator><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Enter no only" ControlToValidate="No_of_roti_tb" Text="Enter no only"
                     ValidationExpression="[0-9]*" ValidationGroup="aamt"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>
                Select Provider City
            </td>
            <td>
                <asp:DropDownList ID="Provider_city_dropdown" runat="server" AutoPostBack="True" OnSelectedIndexChanged="Provider_city_dropdown_SelectedIndexChanged"></asp:DropDownList>
            </td>
            <td>
                
            </td>
        </tr>
        <tr>
            <td>
                Select Provider Id
            </td>
            <td>
                <asp:DropDownList ID="Provider_id_dropdown" runat="server" OnSelectedIndexChanged="Provider_id_dropdown_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
            </td>
            <td>
                
            </td>
        </tr>
        <tr>
            <td>
                Provider Name
            </td>
            <td>
                <asp:Label ID="Provider_name_lbl" runat="server" Text=""></asp:Label>
            </td>
            <td>

            </td>
        </tr>
        <tr>
            <td>
                Enter Monthly Price
            </td>
            <td>
                <asp:TextBox ID="Price_tb" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter price" Text="Enter price" ControlToValidate="Price_tb"
                    ValidationGroup="aamt"></asp:RequiredFieldValidator><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Enter no only" ControlToValidate="Price_tb" Text="Enter no only"
                     ValidationExpression="[0-9]*" ValidationGroup="aamt"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>
                Enter Trial Price
            </td>
            <td>
                <asp:TextBox ID="Trial_price_tb" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Enter trial price" Text="Enter trial price" ControlToValidate="Trial_price_tb"
                    ValidationGroup="aamt"></asp:RequiredFieldValidator><br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Enter no only" ControlToValidate="Trial_price_tb" Text="Enter no only"
                     ValidationExpression="[0-9]*" ValidationGroup="aamt"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
                    <td>
                        Select Type
                    </td>
                    <td>
                        <asp:CheckBox ID="Std_chk" runat="server" AutoPostBack="true"/>Standard
                        <asp:CheckBox ID="avg_chk" runat="server" AutoPostBack="true"/>Average
                        <asp:CheckBox ID="poor_chk" runat="server" AutoPostBack="true"/>Poor
                    </td>
            </tr>
            <tr>
                <td>
                    TagLine</td>
                <td class="style2">
                    <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox></td>
                <td>
                    
                </td>
            </tr>
            <tr>
                <td>
                    Recommend</td>
                <td class="style2">
                    <asp:RadioButton ID="Rmd_yes_rb" runat="server" AutoPostBack="true" GroupName="rmd" />Yes 
                    <asp:RadioButton ID="Rmd_no_rb" runat="server" AutoPostBack="true" GroupName="rmd" Checked="true" />No
                </td>
                <td>
                    
                </td>
            </tr>
        <tr>
            <td>
                Select Image
            </td>
            <td>
                <asp:FileUpload ID="FileUpload1" runat="server" />
            </td>
            <td>

            </td>
        </tr>
        <tr>
            <td colspan="3" align="center">
                <asp:Button ID="Add_tiffin_btn" runat="server" Text="Add" OnClick="Add_tiffin_btn_Click" ValidationGroup="aamt" />
            </td>
        </tr>
    </table>
</center>


</asp:Content>

