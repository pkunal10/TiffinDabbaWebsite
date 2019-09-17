<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="List_of_fastfood.aspx.cs" Inherits="admin_List_of_fastfood" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>List Of Fast Food</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <center>
                <h2>List Of Fast Food</h2>
                <table style="width: 220px;">
                    <tr>
                        <td style="width: 120px;">Select Category</td>
                        <td style="width: 100px;">
                            <asp:DropDownList ID="Cat_dd" runat="server" AutoPostBack="true"></asp:DropDownList>
                        </td>                        
                    </tr>

                    <tr>
                        <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="Go_btn" runat="server" Text="Go" OnClick="Go_btn_Click"/></td>

                    </tr>
                    
                </table>
                <br />
                <h2>
                    <asp:Label ID="info_lbl" runat="server" Text=""></asp:Label></h2>
                <br />
                <asp:GridView ID="ff_gv" runat="server" CellPadding="4" ForeColor="#333333"
                    GridLines="None" Width="900px" Style="text-align: center" AutoGenerateColumns="false" OnRowDeleting="DeleteProduct">
                    <AlternatingRowStyle BackColor="White" />

                    <Columns>

                        <asp:TemplateField HeaderText="Product Id" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="product_id_lbl" runat="server" Text='<%#Eval("product_id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Provider City">
                            <ItemTemplate>
                                <%#Eval("provider_city") %>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Provider Id">
                            <ItemTemplate>
                                <%#Eval("provider_id") %>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Name">
                            <ItemTemplate>
                                <%#Eval("product_name") %>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Description">
                            <ItemTemplate>
                                <%#Eval("description") %>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Price">
                            <ItemTemplate>
                                <%#Eval("price") %>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Discounted Price">
                            <ItemTemplate>
                                <%#Eval("DiscountedPrice") %>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Start Time">
                            <ItemTemplate>
                                <%#Eval("start_time") %>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="End Time">
                            <ItemTemplate>
                                <%#Eval("end_time") %>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Available">
                            <ItemTemplate>
                                <%#Eval("is_available") %>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="App Home">
                            <ItemTemplate>
                                <%#Eval("IsAppHome") %>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Image">
                            <ItemTemplate>
                                <asp:Image ID="Image1" Height="100px" Width="100px" ImageUrl='<%#("image") %>' runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Operation">
                            <ItemTemplate>
                                <asp:LinkButton ID="edit_lb" CommandName='<%#Eval("product_id") %>' OnCommand="UpdateProduct" runat="server">Edit</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        
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
    </asp:UpdatePanel>

</asp:Content>

