<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="Today_readed_ff_orders.aspx.cs" Inherits="admin_Today_readed_ff_orders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Today Readed Fast Food Orders</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
        <h2>Readed Fast Food Order Of Today</h2>

        <h3><asp:Label ID="no_order_lbl" runat="server" Text=""></asp:Label></h3>

        <asp:GridView ID="new_ff_order_gv" runat="server" AutoGenerateColumns="False"
            CellPadding="4" ForeColor="#333333" GridLines="None" Width="850px">
            <AlternatingRowStyle BackColor="White" />

            <Columns>
                <asp:TemplateField HeaderText="Order Id">
                    <ItemTemplate>
                        <asp:LinkButton ID="order_id_lb" runat="server" OnCommand="FullDetilsOfFFOrder" CommandName='<%#Eval("order_id")%>'><%#Eval("order_id")%></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Date">
                    <ItemTemplate>
                        <%#Eval("date")%>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Time">
                    <ItemTemplate>
                        <%#Eval("time")%>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Delivery City">
                    <ItemTemplate>
                        <%#Eval("del_city")%>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Delivery Area">
                    <ItemTemplate>
                        <%#Eval("del_area")%>
                    </ItemTemplate>
                </asp:TemplateField>

                <%--<asp:TemplateField HeaderText="User Email Id">
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

            <SortedAscendingCellStyle BackColor="#FDF5AC"></SortedAscendingCellStyle>

            <SortedAscendingHeaderStyle BackColor="#4D0000"></SortedAscendingHeaderStyle>

            <SortedDescendingCellStyle BackColor="#FCF6C0"></SortedDescendingCellStyle>

            <SortedDescendingHeaderStyle BackColor="#820000"></SortedDescendingHeaderStyle>
        </asp:GridView>

    </center>
</asp:Content>

