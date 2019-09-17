<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="AddUpdateSpecialTiffin.aspx.cs" Inherits="admin_AddUpdateSpecialTiffin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Add Update Specal Tiffin</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

            <!-- Form -->
            <h3 class="tit">Add Update Special Tiffin</h3>
            <fieldset>
                <legend>Special Tiffin</legend>
                <table class="nostyle">
                    <tr>
                        <td style="width: 120px;">Provider Id:</td>
                        <td>
                            <asp:DropDownList ID="ProviderIdDD" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ProviderIdDD_SelectedIndexChanged" CssClass="input-text"></asp:DropDownList>
                            <asp:Label ID="ProviderIdLbl" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>Provider Name:</td>
                        <td>
                            <asp:Label ID="ProviderNameLbl" runat="server" Text=""></asp:Label></td>
                    </tr>
                    <tr>
                        <td>Provider City:</td>
                        <td>
                            <asp:Label ID="ProviderCityLbl" runat="server" Text=""></asp:Label></td>
                    </tr>
                    <tr>
                        <td>Tiffin Name:</td>
                        <td>
                            <asp:TextBox ID="TiffinNameTb" CssClass="input-text" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="warning" SetFocusOnError="true" runat="server" ErrorMessage="Enter Tiffin Name" Text="Enter Tiffin Name" ControlToValidate="TiffinNameTb" ValidationGroup="SPT"></asp:RequiredFieldValidator>
                        </td>
                    </tr>                   
                    <tr>
                        <td class="va-top">Description:</td>
                        <td>
                            <asp:TextBox ID="DescriptionTb" Columns="65" Rows="7" TextMode="MultiLine" CssClass="input-text" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Price:</td>
                        <td>
                            <asp:TextBox ID="PriceTb" CssClass="input-text" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="error" SetFocusOnError="true" runat="server" ErrorMessage="Enter Price" Text="Enter Price" ControlToValidate="PriceTb" ValidationGroup="SPT"></asp:RequiredFieldValidator>
                             <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="Numbers Only"
                                Text="Numbers Only" ValidationExpression="[0-9]*" SetFocusOnError="true" ValidationGroup="SPT" ControlToValidate="PriceTb"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="va-middle">Time:</td>
                        <td>
                            <asp:TextBox ID="StartTimeTb" CssClass="input-text" placeholder="Start Time eg:- 10:00AM" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" CssClass="error" SetFocusOnError="true" runat="server" ErrorMessage="Enter Start Time" Text="Enter Start Time" ControlToValidate="StartTimeTb" ValidationGroup="SPT"></asp:RequiredFieldValidator><br />
                            To <br />
                            <asp:TextBox ID="EndTimeTb" CssClass="input-text" placeholder="End Time eg:- 10:00 PM" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" CssClass="error" SetFocusOnError="true" runat="server" ErrorMessage="Enter End Time" Text="Enter End Time" ControlToValidate="EndTimeTb" ValidationGroup="SPT"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Is Available:</td>
                        <td>
                            <asp:CheckBox ID="IsAvailableChk" runat="server" /></td>
                    </tr>
                    <tr>
                        <td>Is AppHome:</td>
                        <td>
                            <asp:CheckBox ID="IsAppHome" runat="server" /></td>
                    </tr>
                    <tr>
                        <td>Image:</td>
                        <td>
                            <asp:FileUpload ID="Image" runat="server" /></td>
                    </tr>
                    <tr>
                        <td colspan="2" class="t-right">
                            <asp:Button ID="AddBtn" CssClass="input-submit" runat="server" ValidationGroup="SPT" OnClick="AddBtn_Click" Text="Add" />
                            <asp:Button ID="UpdateBtn" Visible="false" CssClass="input-submit" ValidationGroup="SPT" OnClick="UpdateBtn_Click" runat="server" Text="Update" />
                        </td>
                    </tr>
                </table>
            </fieldset>


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
            <asp:PostBackTrigger ControlID="AddBtn" />
            <asp:PostBackTrigger ControlID="UpdateBtn" />
        </Triggers>
    </asp:UpdatePanel>

</asp:Content>

