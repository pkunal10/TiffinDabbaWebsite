<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="Add_remove_fastfood_products.aspx.cs" Inherits="admin_Add_remove_fastfood_products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <center>
                <h2>Fast Food Products</h2><br />
                <table class="style1">

                    <tr>
                        <td>Select Category</td>
                        <td class="style2">
                            <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True">
                            </asp:DropDownList><asp:Label ID="cat_lbl" runat="server" Text=""></asp:Label>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>Select Provider City</td>
                        <td class="style2">
                            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True"
                                OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                            </asp:DropDownList><asp:Label ID="provider_city_lbl" runat="server" Text=""></asp:Label>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>Select Provider Id</td>
                        <td class="style2">
                            <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True"
                                OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                            </asp:DropDownList><asp:Label ID="provider_id_lbl" runat="server" Text=""></asp:Label>
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
                        <td>Product Name</td>
                        <td class="style2">
                            <asp:TextBox ID="ProductName_tb" runat="server"></asp:TextBox></td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Name"
                                Text="Enter Name" ValidationGroup="asta" ControlToValidate="ProductName_tb"></asp:RequiredFieldValidator><br />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Alphabates Only"
                                Text="Alphabates Only" ValidationExpression="[a-zA-Z ]*$"
                                ValidationGroup="asta" ControlToValidate="ProductName_tb"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Discription</td>
                        <td class="style2">
                            <asp:TextBox ID="ProductDisc_tb" runat="server"></asp:TextBox></td>
                        <td>
                           <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Discription"
                                Text="Enter Discription" ValidationGroup="asta" ControlToValidate="ProductDisc_tb"></asp:RequiredFieldValidator><br />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Alphabates Only"
                                Text="Alphabates Only" ValidationExpression="[a-zA-Z ]*$"
                                ValidationGroup="asta" ControlToValidate="ProductDisc_tb"></asp:RegularExpressionValidator>--%>
                        </td>
                    </tr>
                    <tr>
                        <td>Price</td>
                        <td class="style2">
                            <asp:TextBox ID="Price_tb" runat="server"></asp:TextBox></td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Enter Price"
                                Text="Enter Price" ValidationGroup="asta" ControlToValidate="Price_tb"></asp:RequiredFieldValidator><br />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="Numbers Only"
                                Text="Numbers Only" ValidationExpression="[0-9]*" ValidationGroup="asta" ControlToValidate="Price_tb"></asp:RegularExpressionValidator></td>
                    </tr>
                    <tr>
                        <td>Discounted Price</td>
                        <td class="style2">
                            <asp:TextBox ID="DiscountTb" runat="server"></asp:TextBox></td>
                        <td>    
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Numbers Only"
                                Text="Numbers Only" ValidationExpression="[0-9]*" ValidationGroup="asta" ControlToValidate="DiscountTb"></asp:RegularExpressionValidator></td>
                    </tr>
                    <tr>
                        <td>Start Order Time</td>
                        <td class="style2">
                            <asp:TextBox ID="StartOrderTimeTb" placeholder="Ex:- 09:30 AM" runat="server"></asp:TextBox></td>
                        <td>
                           <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter Time"
                                Text="Enter Time" ValidationGroup="asta" ControlToValidate="StartOrderTimeTb"></asp:RequiredFieldValidator>--%>
                        </td>
                    </tr>
                    <tr>
                        <td>End Order Time</td>
                        <td class="style2">
                            <asp:TextBox ID="EndOrderTimeTb" placeholder="Ex:- 07:30 PM" runat="server"></asp:TextBox></td>
                        <td>
                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Enter Time"
                                Text="Enter Time" ValidationGroup="asta" ControlToValidate="EndOrderTimeTb"></asp:RequiredFieldValidator>--%>
                        </td>
                    </tr>
                    <tr>
                        <td>Is Available
                        </td>
                        <td>
                            <asp:CheckBox ID="is_avai_chk" runat="server" />Available                        
                        </td>
                    </tr>
                    <tr>
                        <td>Is App Home
                        </td>
                        <td>
                            <asp:CheckBox ID="IsAppHomeChk" runat="server" />App Home                        
                        </td>
                    </tr>
                    <tr>
                        <td>Select Product Image </td>
                        <td class="style2">
                            <asp:FileUpload ID="FileUpload1" runat="server" /></td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="3" align="center">
                            <asp:Button ID="Button1" runat="server" Text="Add" ValidationGroup="asta" Style="height: 26px" OnClick="Button1_Click" />
                            <asp:Button ID="update_btn" runat="server" Text="Update" ValidationGroup="asta" Style="height: 26px" OnClick="update_btn_Click" />
                        </td>
                    </tr>
                </table>
            </center>
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
            <asp:PostBackTrigger ControlID="update_btn" />
        </Triggers>
    </asp:UpdatePanel>

</asp:Content>

