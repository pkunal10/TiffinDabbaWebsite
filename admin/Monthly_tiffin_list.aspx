﻿<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="Monthly_tiffin_list.aspx.cs" Inherits="admin_Monthly_tiffin_list" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Monthly Tiffin List</title>
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
            
            <table style="width:200px;">
                <tr>
                    <td style="width:100px;">                        
                        Select City</td>
                    <td style="width:100px;">
                        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <asp:Button ID="Button1" runat="server" Text="Show" OnClick="Button1_Click"/></td>
                </tr>
            </table>
            <br />
            <h3><asp:Label ID="Label1" runat="server" Text=""></asp:Label></h3>
             <div style="height:700px;overflow:auto;">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="931px"
                 onrowediting="EditTiffin" onrowupdating="UpdateTiffin"  onrowcancelingedit="CancelEdit">
                <AlternatingRowStyle BackColor="White" />

                    <Columns>

                        <asp:CommandField  ShowEditButton="true" HeaderText="Operation"/>

                        <asp:TemplateField HeaderText ="Tiffin Id">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" OnCommand="jk" CommandName='<%#Eval("tiffin_id")%>' Text='<%#Eval("tiffin_id") %>'></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText ="Tiffin Image"  >
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("image") %>' Height="200px" Width="200px" />
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText ="Provider Id">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton2" runat="server" OnCommand="abc" CommandName='<%#Eval("pid")%>'><%#Eval("pid") %></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText ="Provider City">
                            <ItemTemplate>
                                <%#Eval("p_city") %>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText ="No Of Roti">
                            <ItemTemplate>
                                <%#Eval("no_of_roti") %>
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

                        <asp:TemplateField HeaderText ="Price">
                            <ItemTemplate>
                                <%#Eval("price") %>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText ="Trial Price">
                            <ItemTemplate>
                                <%#Eval("trial_price") %>
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

