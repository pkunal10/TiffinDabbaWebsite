<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="Add_remove_fastfood_cat.aspx.cs" Inherits="admin_Add_remove_fastfood_cat" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <title>Add & Remove Fast Food Category</title>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>--%>

            <center>
                <h2>Add Remove Fast Food Category</h2>
                <table style="width: 450px;">
                    <tr>
                        <td style="width: 250px;">Enter Category</td>
                        <td>
                            <asp:TextBox ID="Category_tb" runat="server"></asp:TextBox>
                        </td>
                        <td style="width: 200px;">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Category"
                                Text="Enter Category" ControlToValidate="Category_tb" ValidationGroup="affc"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 250px;">Image</td>
                        <td>
                            <asp:FileUpload ID="CatImg" runat="server" />
                        </td>
                        <td style="width: 200px;">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Category"
                                Text="Enter Category" ControlToValidate="Category_tb" ValidationGroup="affc"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="AddCatBtn" runat="server" Text="Add" ValidationGroup="affc" OnClick="AddCatBtn_Click" /></td>

                    </tr>
                    <tr>
                        <td colspan="3" align="center">&nbsp;</td>
                    </tr>
                </table>
                <br />
                <h2>List Fast Food Category</h2>
                <br />
                <asp:GridView ID="ff_cat_gv" runat="server" CellPadding="4" ForeColor="#333333"
                    GridLines="None" Width="450px" Style="text-align: center" AutoGenerateColumns="false"
                    OnRowEditing="EditCat" OnRowUpdating="UpdateCat" OnRowCancelingEdit="CancelEdit" OnRowDeleting="DeleteCat">
                    <AlternatingRowStyle BackColor="White" />

                    <Columns>

                        <asp:TemplateField HeaderText="Id">
                            <ItemTemplate>
                                <asp:Label ID="cat_id_lbl" runat="server" Text='<%#Eval("cat_id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Name">
                            <ItemTemplate>
                                <%#Eval("name") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="cat_name_tb" runat="server" Text='<%#Eval("name") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Image">
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("Image") %>' Height="100px" Width="100px" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:FileUpload ID="CatImage" runat="server" />
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:CommandField ShowEditButton="true" ControlStyle-CssClass="likbtn" HeaderText="Operation" />
                        <asp:CommandField ShowDeleteButton="true" ControlStyle-CssClass="likbtn" HeaderText="Operation" />

                        <%--<asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkRemove" runat="server"
                                    CommandArgument = '<%# Eval("cat_id")%>'
                                    OnClientClick="return confirm('Do you want to delete?')"
                                    Text="Delete" OnClick="DeleteCat"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>--%>
                    </Columns>

                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />

                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <SortedAscendingCellStyle BackColor="#FDF5AC" />
                    <SortedAscendingHeaderStyle BackColor="#4D0000" />
                    <SortedDescendingCellStyle BackColor="#FCF6C0" />
                    <SortedDescendingHeaderStyle BackColor="#820000" />
                </asp:GridView>
            </center>
            <%--<asp:UpdateProgress ID="UpdateProgress1" runat="server" class="loading" AssociatedUpdatePanelID="UpdatePanel1" DisplayAfter="0" DynamicLayout="true">
                <ProgressTemplate>
                    <center>
                        <font style="color: White; font-size: 18px;">Please Wait....</font><br />
                        <br />
                        <img id="Img1" src="../user/themes/images/loader.gif" runat="server" />
                    </center>
                </ProgressTemplate>
            </asp:UpdateProgress>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger  ControlID="AddCatBtn"/>
        </Triggers>
    </asp:UpdatePanel>--%>

</asp:Content>

