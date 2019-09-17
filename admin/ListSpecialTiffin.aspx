<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="ListSpecialTiffin.aspx.cs" Inherits="admin_ListSpecialTiffin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>List Of Special Tiffin</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <h3 class="tit">List Of Special Tiffin</h3>
    <fieldset>
        <legend>Special Tiffin</legend>

        <asp:GridView ID="SpecialTiffinGv" runat="server" CellPadding="4" ForeColor="#333333"
            GridLines="None" Width="1100px" Style="text-align: center" AutoGenerateColumns="false">
            <AlternatingRowStyle BackColor="White" />

            <Columns>
                <asp:TemplateField HeaderText="Provider Id">
                    <ItemTemplate>
                        <asp:LinkButton ID="ProviderIdLb" OnCommand="ProviderIdLb_Command" CommandArgument='<%#Eval("ProviderId") %>' runat="server"><%#Eval("ProviderId") %></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Provider City">
                    <ItemTemplate>
                        <%#Eval("ProviderCity") %>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Tiffin Name">
                    <ItemTemplate>
                        <%#Eval("TiffinName") %>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Description">
                    <ItemTemplate>
                        <asp:Label ID="DescriptionLbl" runat="server" Text='<%#Eval("Description") %>' Width="230px"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Price">
                    <ItemTemplate>
                        <%#Eval("Price") %>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Start Time">
                    <ItemTemplate>
                        <%#Eval("StartTime") %>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="End Time">
                    <ItemTemplate>
                        <%#Eval("EndTime") %>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Is Available">
                    <ItemTemplate>
                        <%#Eval("IsAvailable") %>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Is AppHome">
                    <ItemTemplate>
                        <%#Eval("IsAppHome") %>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Image">
                    <ItemTemplate>
                        <asp:Image ID="Image1" runat="server" Height="100px" Width="100px" ImageUrl='<%#Eval("Image") %>' />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Operation">
                    <ItemTemplate>
                        <asp:LinkButton ID="EditLb" OnCommand="EditLb_Command" CommandArgument='<%#Eval("TiffinId") %>' runat="server">Edit</asp:LinkButton>   <asp:LinkButton ID="DeleteLb" OnCommand="DeleteLb_Command" CommandArgument='<%#Eval("TiffinId") %>' runat="server">Delete</asp:LinkButton>
                        
                    </ItemTemplate>
                </asp:TemplateField>

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

    </fieldset>

</asp:Content>

