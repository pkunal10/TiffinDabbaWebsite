<%@ Page Title="" Language="C#" MasterPageFile="~/provider/provider.master" AutoEventWireup="true" CodeFile="View_monthly_order.aspx.cs" Inherits="provider_View_monthly_order_aspx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>View Monthly Order</title>
    <link href="assets/img/shortcut_icon.png" rel="shortcut icon">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>    
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>

    <center>
        <table style="width: 200px">
                            <tr>
                                <td style="width: 100px">
                                    Order Of
                                </td>
                                <td style="width: 100px">
                                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
                                        <asp:ListItem>--To Select--</asp:ListItem>
                                        <asp:ListItem>Lunch</asp:ListItem>
                                        <asp:ListItem>Dinner</asp:ListItem>
                                        <asp:ListItem>Both</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center">
                                    <asp:Button ID="Button1" runat="server" Text="Show" OnClick="Button1_Click"  />
                                </td>
                            </tr>
                        </table>
                    </center>
    <center>
                        <br />
                        <h4><asp:Label ID="Label1" runat="server" Text=""></asp:Label></h4>
                        <div style="width:800px;height:600px;overflow:auto;">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="1750px">
                            <AlternatingRowStyle BackColor="White" />

                                <Columns>
                                    <asp:TemplateField HeaderText="Order Id">
                                        <ItemTemplate>
                                            <%#Eval("order_id")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Order For">
                                        <ItemTemplate>
                                            <%#Eval("book_for")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>


                                    <asp:TemplateField HeaderText="User Name">
                                        <ItemTemplate>
                                            <%#Eval("uname")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="User Email Id">
                                        <ItemTemplate>
                                            <%#Eval("ueid")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Delivery Area">
                                        <ItemTemplate>
                                            <%#Eval("delivery_area")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Delivery Address">
                                        <ItemTemplate>
                                            <%#Eval("delivery_add")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="User Mobile No">
                                        <ItemTemplate>
                                            <%#Eval("mobile_no")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Booking Date">
                                        <ItemTemplate>
                                            <%#Eval("booking_date")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="No Of Days">
                                        <ItemTemplate>
                                            <%#Eval("no_of_days")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Start Date">
                                        <ItemTemplate>
                                            <%#Eval("start_date")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Finish Date">
                                        <ItemTemplate>
                                            <%#Eval("finish_date")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="No Of Roti">
                                        <ItemTemplate>
                                            <%#Eval("no_of_roti")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Price">
                                        <ItemTemplate>
                                            <%#Eval("price")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    
                                </Columns>

                            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="silver" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                            <SortedAscendingCellStyle BackColor="#FDF5AC" />
                            <SortedAscendingHeaderStyle BackColor="#4D0000" />
                            <SortedDescendingCellStyle BackColor="#FCF6C0" />
                            <SortedDescendingHeaderStyle BackColor="#820000" />

<SortedAscendingCellStyle BackColor="#FDF5AC"></SortedAscendingCellStyle>

<SortedAscendingHeaderStyle BackColor="#4D0000"></SortedAscendingHeaderStyle>

<SortedDescendingCellStyle BackColor="#FCF6C0"></SortedDescendingCellStyle>

<SortedDescendingHeaderStyle BackColor="#820000"></SortedDescendingHeaderStyle>
                        </asp:GridView>
                        </div><br /><br />
   
    
    </center>
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

