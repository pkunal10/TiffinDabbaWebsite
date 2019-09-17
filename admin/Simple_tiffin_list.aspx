<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="Simple_tiffin_list.aspx.cs" Inherits="admin_Simple_tiffin_list" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <title>Simple Tiffin List</title>

    <style type="text/css">
        .style2
        {
            width: 320px;
        }
        .style3
        {
            width: 250px;
        }
    </style>

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
                <tr>
                    <td class="style3">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        Select City</td>
                    <td class="style2">
                        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" >
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="Button1" runat="server" Text="Show" onclick="Button1_Click" /></td>
                </tr>
            </table>
            <br />
            <h3><asp:Label ID="Label1" runat="server" Text=""></asp:Label></h3>
            <div style="height:700px;overflow:auto;">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="Horizontal" Width="928px"
                onrowediting="EditTiffin" onrowupdating="UpdateTiffin"  onrowcancelingedit="CancelEdit">
                <AlternatingRowStyle BackColor="White" />

                    <Columns>

                        <asp:CommandField ShowEditButton="true" HeaderText="Operation" />

                        <asp:TemplateField HeaderText ="Tiffin Id" ItemStyle-VerticalAlign="Middle" >
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" OnCommand="jk" CommandName='<%#Eval("t_id")%>' Text='<%#Eval("t_id") %>'></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText ="Tiffin Image" ItemStyle-VerticalAlign="Middle" >
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("st_image") %>' Height="120px" Width="120px" />
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText ="Provider Id" ItemStyle-VerticalAlign="Middle">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton2" runat="server" OnCommand="abc" CommandName='<%#Eval("p_id")%>'><%#Eval("p_id") %></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText ="Provider City" ItemStyle-VerticalAlign="Middle">
                            <ItemTemplate>
                                <%#Eval("p_city") %>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText ="Provider Name" ItemStyle-VerticalAlign="Middle">
                            <ItemTemplate>
                                <%#Eval("p_name") %>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText ="Sabji" ItemStyle-VerticalAlign="Middle" >
                            <ItemTemplate>
                                <%#Eval("sabji") %>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText ="Roti" ItemStyle-VerticalAlign="Middle">
                            <ItemTemplate>
                                <%#Eval("roti") %>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText ="Dal" ItemStyle-VerticalAlign="Middle">
                            <ItemTemplate>
                                <%#Eval("dal") %>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText ="Chawal" ItemStyle-VerticalAlign="Middle" >
                            <ItemTemplate>
                                <%#Eval("chawal") %>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText ="Other">
                            <ItemTemplate>
                                <%#Eval("other") %>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Standard">
                            <ItemTemplate>
                                <asp:Label ID="Std_lbl" runat="server" Text='<%#Eval("standard") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="Std_tb" Width="10px" runat="server" Text='<%#Eval("standard") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Average">
                            <ItemTemplate>
                                <asp:Label ID="Avg_lbl" runat="server" Text='<%#Eval("average") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="Avg_tb" Width="10px" runat="server" Text='<%#Eval("average") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Poor">
                            <ItemTemplate>
                                <asp:Label ID="Poor_lbl" runat="server" Text='<%#Eval("poor") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="Poor_tb" Width="10px" runat="server" Text='<%#Eval("poor") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Tagline">
                            <ItemTemplate>
                                <asp:Label ID="Tagline_lbl" runat="server" Text='<%#Eval("tagline") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="Tagline_tb"  runat="server" Text='<%#Eval("tagline") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Recommend">
                            <ItemTemplate>
                                <asp:Label ID="Recommend_lbl" runat="server" Text='<%#Eval("recommend") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="Recommend_tb"  runat="server" Text='<%#Eval("recommend") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="AppHome">
                            <ItemTemplate>
                                <asp:CheckBox ID="AppHome" Checked='<%#Eval("IsAppHome") %>' runat="server" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:CheckBox ID="IsAppHomeEditChk" runat="server" Checked='<%#Eval("IsAppHome") %>' />
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText ="Price" ItemStyle-VerticalAlign="Middle" >
                            <ItemTemplate>
                                <%#Eval("price") %>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText ="Available" ItemStyle-VerticalAlign="Middle">
                            <ItemTemplate>
                                <%#Eval("available") %>
                            </ItemTemplate>
                        </asp:TemplateField>

                        </Columns>

                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#990000" Font-Bold="True"  ForeColor="White" />
                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                <SortedAscendingCellStyle BackColor="#FDF5AC" />
                <SortedAscendingHeaderStyle BackColor="#4D0000" />
                <SortedDescendingCellStyle BackColor="#FCF6C0" />
                <SortedDescendingHeaderStyle BackColor="#820000" />
            </asp:GridView>
            </div>
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

