<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="Simple_tiffin_add.aspx.cs" Inherits="admin_Simple_tiffin_add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <title>Simple TIffin Add</title>

    <style type="text/css">
        .style2 {
            width: 123px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>

            <br />
            <br />
            <div>
                <center>
                    <table class="style1">
                        <tr>
                            <td>Tiffin Id</td>
                            <td class="style2">
                                <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox></td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Enter Tiffin Id"
                                    Text="Enter Tiffin Id" ValidationGroup="asta" ControlToValidate="TextBox6"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td>Select Provider City</td>
                            <td class="style2">
                                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True"
                                    OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                </asp:DropDownList>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>Select Provider Id</td>
                            <td class="style2">
                                <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True"
                                    OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                                </asp:DropDownList>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>Provider Name</td>
                            <td class="style2">
                                <asp:Label ID="Label2" runat="server" Text=""></asp:Label></td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>Sabji</td>
                            <td class="style2">
                                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
                            <td>
                                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Sabji"
                     Text="Enter Sabji" ValidationGroup="asta" ControlToValidate="TextBox1"></asp:RequiredFieldValidator><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Alphabates Only"
                     Text="Alphabates Only" ValidationExpression="[a-zA-Z ]*$" 
                        ValidationGroup="asta" ControlToValidate="TextBox1"></asp:RegularExpressionValidator>--%>
                            </td>
                        </tr>
                        <tr>
                            <td>Roti</td>
                            <td class="style2">
                                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></td>
                            <td>
                                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Roti"
                     Text="Enter Roti" ValidationGroup="asta" ControlToValidate="TextBox2"></asp:RequiredFieldValidator><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Alphabates Only"
                     Text="Alphabates Only" ValidationExpression="[a-zA-Z ]*$" 
                        ValidationGroup="asta" ControlToValidate="TextBox2"></asp:RegularExpressionValidator>--%></td>
                        </tr>
                        <tr>
                            <td>Dal</td>
                            <td class="style2">
                                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox></td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter Dal"
                                    Text="Enter Dal" ValidationGroup="asta" ControlToValidate="TextBox3"></asp:RequiredFieldValidator><br />
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Alphabates Only"
                                    Text="Alphabates Only" ValidationExpression="[a-zA-Z ]*$"
                                    ValidationGroup="asta" ControlToValidate="TextBox3"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td>Chawal</td>
                            <td class="style2">
                                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox></td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Enter Chawal"
                                    Text="Enter Chawal" ValidationGroup="asta" ControlToValidate="TextBox4"></asp:RequiredFieldValidator><br />
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Alphabates Only"
                                    Text="Alphabates Only" ValidationExpression="[a-zA-Z ]*$"
                                    ValidationGroup="asta" ControlToValidate="TextBox4"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td>Other</td>
                            <td class="style2">
                                <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox></td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Enter Other"
                                    Text="Enter Other" ValidationGroup="asta" ControlToValidate="TextBox7"></asp:RequiredFieldValidator><br />
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ErrorMessage="Alphabates Only"
                                    Text="Alphabates Only" ValidationExpression="[a-zA-Z ]*$"
                                    ValidationGroup="asta" ControlToValidate="TextBox7"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td>Price</td>
                            <td class="style2">
                                <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox></td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Enter Price"
                                    Text="Enter Price" ValidationGroup="asta" ControlToValidate="TextBox5"></asp:RequiredFieldValidator><br />
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="Numbers Only"
                                    Text="Numbers Only" ValidationExpression="[0-9]*" ValidationGroup="asta" ControlToValidate="TextBox5"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td>Select Type
                            </td>
                            <td>
                                <asp:CheckBox ID="Std_chk" runat="server" AutoPostBack="true" />Standard
                        <asp:CheckBox ID="avg_chk" runat="server" AutoPostBack="true" />Average
                        <asp:CheckBox ID="poor_chk" runat="server" AutoPostBack="true" />Poor
                            </td>
                        </tr>
                        <tr>
                            <td>TagLine</td>
                            <td class="style2">
                                <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>Recommend</td>
                            <td class="style2">
                                <asp:RadioButton ID="Rmd_yes_rb" runat="server" AutoPostBack="true" GroupName="rmd" />Yes 
                    <asp:RadioButton ID="Rmd_no_rb" runat="server" AutoPostBack="true" GroupName="rmd" Checked="true" />No
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>Is App Home
                            </td>
                            <td>
                                <asp:CheckBox ID="IsAppHomeChk" runat="server" />App Home                        
                            </td>
                        </tr>
                        <tr>
                            <td>Select Tiffin's Image </td>
                            <td class="style2">
                                <asp:FileUpload ID="FileUpload1" runat="server" /></td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="3" align="center">
                                <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" ValidationGroup="asta" Style="height: 26px" /></td>
                        </tr>
                    </table>

                </center>
            </div>
            <asp:UpdateProgress ID="UpdateProgress1" runat="server" class="loading" AssociatedUpdatePanelID="UpdatePanel1" DisplayAfter="0" DynamicLayout="true">
                <ProgressTemplate>
                    <center>
                        <font style="color: White; font-size: 18px;">Please Wait....</font><br />
                        <br />
                        <img id="Img1" src="~/user/assets/img/loader.gif" runat="server" />
                    </center>
                </ProgressTemplate>
            </asp:UpdateProgress>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="Button1" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>

