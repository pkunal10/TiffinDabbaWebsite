<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="Add_remove_area.aspx.cs" Inherits="admin_Add_remove_area" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <title>Add & Remove Area</title>

    <style>
        .likbtn {
            color: blue;
        }

            .likbtn:hover {
                text-decoration: none;
            }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>

            <center>
                <table style="width: 450px;">
                    <tr>
                        <td style="width: 250px;">Select City</td>
                        <td>
                            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True"
                                OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                            </asp:DropDownList>
                        </td>
                        <td style="width: 200px;">&nbsp;</td>
                    </tr>
                    <tr>
                        <td>Enter Delivery Area</td>
                        <td>
                            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Area"
                                Text="Enter Area" ControlToValidate="TextBox2" ValidationGroup="aaa"></asp:RequiredFieldValidator></td>
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
                        <td>Is Fast Food
                        </td>
                        <td>
                            <asp:CheckBox ID="is_ff_chk" runat="server" AutoPostBack="true" />Fast Food                        
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="Button2" runat="server" Text="Add" ValidationGroup="aaa" OnClick="Button2_Click" /></td>

                    </tr>
                    <tr>
                        <td colspan="3" align="center">&nbsp;</td>

                    </tr>

                </table>
                <br />
                <b>
                    <asp:Label ID="Label2" runat="server" Text=""></asp:Label></b>
                <br />

                <asp:GridView ID="GridView2" runat="server" CellPadding="4" ForeColor="#333333"
                    GridLines="None" Width="350px" Style="text-align: center" AutoGenerateColumns="false"
                    OnRowEditing="EditArea" OnRowUpdating="UpdateArea" OnRowCancelingEdit="CancelEdit">
                    <AlternatingRowStyle BackColor="White" />

                    <Columns>

                        <asp:TemplateField HeaderText="City">
                            <ItemTemplate>
                                <%#Eval("city") %>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Area">
                            <ItemTemplate>
                                <asp:Label ID="Area_lbl" runat="server" Text='<%#Eval("area") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Standard">
                            <ItemTemplate>
                                <asp:Label ID="Std_lbl" runat="server" Text='<%#Eval("standard") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="Std_tb" runat="server" Text='<%#Eval("standard") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Average">
                            <ItemTemplate>
                                <asp:Label ID="Avg_lbl" runat="server" Text='<%#Eval("average") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="Avg_tb" runat="server" Text='<%#Eval("average") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Poor">
                            <ItemTemplate>
                                <asp:Label ID="Poor_lbl" runat="server" Text='<%#Eval("poor") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="Poor_tb" runat="server" Text='<%#Eval("poor") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Is Fastfood">
                            <ItemTemplate>
                                <asp:Label ID="is_fastfood_lbl" runat="server" Text='<%#Eval("is_fastfood") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="is_fastfood_tb" runat="server" Text='<%#Eval("is_fastfood") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:CommandField ShowEditButton="true" ControlStyle-CssClass="likbtn" HeaderText="Operation" />
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


                <br />
                <br />
                <br />
                <br />

                <table style="width: 400px;">
                    <tr>
                        <td style="width: 200px;">Select City</td>
                        <td>
                            <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True"
                                OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                            </asp:DropDownList>
                        </td>
                        <td style="width: 200px;">&nbsp;</td>
                    </tr>
                    <tr>
                        <td>Enter Area</td>
                        <td>
                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Area"
                                Text="Enter Area" ControlToValidate="TextBox1" ValidationGroup="ara"></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td colspan="3" align="center">
                            <asp:Button ID="Button1" runat="server" Text="Remove" OnClick="Button1_Click" ValidationGroup="ara" /></td>

                    </tr>
                </table>
                <br />
                <b>
                    <asp:Label ID="Label1" runat="server" Text=""></asp:Label></b>
                <br />


                <div style="height: 300px; width: 300px; overflow: auto;">
                    <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333"
                        GridLines="None" Width="350px" Style="text-align: center">
                        <AlternatingRowStyle BackColor="White" />
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

