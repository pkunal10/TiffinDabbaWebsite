<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="ViewSpecialTiffinOrder.aspx.cs" Inherits="admin_SpecialTiffinOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <title>View Special Tiffin Order</title>

    <style>
        .jk{
            width:260px;
word-break:break-all        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <h3 class="tit">List Of Special Tiffin Order</h3>
    <fieldset>
        <legend>Special Tiffin Order</legend>

        <asp:Wizard ID="Wizard1" runat="server" BackColor="#EFF3FB" BorderColor="#B5C7DE" BorderWidth="1px" Font-Names="Verdana" Font-Size="1.0em" Width="1100px">
            <HeaderStyle BackColor="#284E98" BorderColor="#EFF3FB" BorderStyle="Solid" BorderWidth="2px" Font-Bold="True" Font-Size="0.9em" ForeColor="White" HorizontalAlign="Center" />
            <NavigationButtonStyle BackColor="White" BorderColor="#507CD1" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284E98" />
            <SideBarButtonStyle BackColor="#507CD1" Font-Names="Verdana" ForeColor="White" />
            <SideBarStyle BackColor="#0085cc" Width="150px" Font-Size="1.0em" VerticalAlign="Top" />
            <StepStyle Font-Size="1.0em" ForeColor="#333333" />
            <WizardSteps>
                <asp:WizardStep ID="WizardStep1" runat="server" Title="New Order">

                    <center><h4><asp:Label ID="NewOdrInfoLbl" runat="server" Text=""></asp:Label></h4></center>

                    <div style="width:1000px;overflow:auto;">
                        <asp:GridView ID="NewOdrGv" runat="server" AutoGenerateColumns="False" 
                            CellPadding="4" ForeColor="#333333" GridLines="None" Width="1750px">
                            <AlternatingRowStyle BackColor="White" />

                                <Columns>
                                    <asp:TemplateField HeaderText="Order Id">
                                        <ItemTemplate>
                                            <%#Eval("OrderId") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Provider Id">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="ProviderIdLb" runat="server" OnCommand="ProviderIdLb_Command" CommandName='<%#Eval("ProviderId")%>'><%#Eval("ProviderId")%></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Tiffin Name">
                                        <ItemTemplate>
                                            <%#Eval("TiffinName") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Description" ItemStyle-CssClass="jk">
                                        <ItemTemplate>
                                            <font style="width:150px;word-break:break-all;"><%#Eval("Description") %></font>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Price">
                                        <ItemTemplate>
                                            <%#Eval("Price") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="User Id">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="UserIdLb" runat="server" OnCommand="UserIdLb_Command" CommandName='<%#Eval("UserId")%>'><%#Eval("UserId")%></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Mobile">
                                        <ItemTemplate>
                                            <%#Eval("mob_no")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Delivery City">
                                        <ItemTemplate>
                                            <%#Eval("DelCity")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Delivery Area">
                                        <ItemTemplate>
                                            <%#Eval("DelArea")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Delivery Address">
                                        <ItemTemplate>
                                            <%#Eval("DelAddress")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Book Date">
                                        <ItemTemplate>
                                            <%#Eval("BookDate")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Book Time">
                                        <ItemTemplate>
                                            <%#Eval("BookTime")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Readed">
                                        <ItemTemplate>
                                            <%#Eval("IsRead")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Delivered">
                                        <ItemTemplate>
                                            <%#Eval("IsDelivered")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Cancelled">
                                        <ItemTemplate>
                                            <%#Eval("IsCancelled")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Operation">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="ReadLb" Visible='<%#!Convert.ToBoolean(Eval("IsRead")) %>' runat="server" CommandArgument='<%#Eval("OrderId") %>' OnCommand="ReadLb_Command">Read</asp:LinkButton>
                                            <asp:LinkButton ID="DeliveredLb" Visible='<%#!Convert.ToBoolean(Eval("IsDelivered")) %>' runat="server" CommandArgument='<%#Eval("OrderId") %>' OnCommand="DeliveredLb_Command">Delivered</asp:LinkButton>
                                            <asp:LinkButton ID="CancelledLb" Visible='<%#!Convert.ToBoolean(Eval("IsCancelled")) %>' runat="server" CommandArgument='<%#Eval("OrderId") %>' OnCommand="CancelledLb_Command">Canceled</asp:LinkButton>
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

<SortedAscendingCellStyle BackColor="#FDF5AC"></SortedAscendingCellStyle>

<SortedAscendingHeaderStyle BackColor="#4D0000"></SortedAscendingHeaderStyle>

<SortedDescendingCellStyle BackColor="#FCF6C0"></SortedDescendingCellStyle>

<SortedDescendingHeaderStyle BackColor="#820000"></SortedDescendingHeaderStyle>
                        </asp:GridView>
                        </div>

                </asp:WizardStep>
                <asp:WizardStep ID="WizardStep2" runat="server" Title="Today's Readed Order">


                    <center><h4><asp:Label ID="ReadOdrLbl" runat="server" Text=""></asp:Label></h4></center>

                    <div style="width:1000px;overflow:auto;">
                        <asp:GridView ID="ReadOdrGv" runat="server" AutoGenerateColumns="False" 
                            CellPadding="4" ForeColor="#333333" GridLines="None" Width="1750px">
                            <AlternatingRowStyle BackColor="White" />

                                <Columns>
                                    <asp:TemplateField HeaderText="Order Id">
                                        <ItemTemplate>
                                            <%#Eval("OrderId") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Provider Id">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="ProviderIdLb" runat="server" OnCommand="ProviderIdLb_Command" CommandName='<%#Eval("ProviderId")%>'><%#Eval("ProviderId")%></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Tiffin Name">
                                        <ItemTemplate>
                                            <%#Eval("TiffinName") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Description" ItemStyle-CssClass="jk">
                                        <ItemTemplate>
                                            <font style="width:150px;word-break:break-all;"><%#Eval("Description") %></font>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Price">
                                        <ItemTemplate>
                                            <%#Eval("Price") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="User Id">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="UserIdLb" runat="server" OnCommand="UserIdLb_Command" CommandName='<%#Eval("UserId")%>'><%#Eval("UserId")%></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Mobile">
                                        <ItemTemplate>
                                            <%#Eval("mob_no")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Delivery City">
                                        <ItemTemplate>
                                            <%#Eval("DelCity")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Delivery Area">
                                        <ItemTemplate>
                                            <%#Eval("DelArea")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Delivery Address">
                                        <ItemTemplate>
                                            <%#Eval("DelAddress")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Book Date">
                                        <ItemTemplate>
                                            <%#Eval("BookDate")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Book Time">
                                        <ItemTemplate>
                                            <%#Eval("BookTime")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Readed">
                                        <ItemTemplate>
                                            <%#Eval("IsRead")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Delivered">
                                        <ItemTemplate>
                                            <%#Eval("IsDelivered")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Cancelled">
                                        <ItemTemplate>
                                            <%#Eval("IsCancelled")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Operation">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="ReadLb" Visible='<%#!Convert.ToBoolean(Eval("IsRead")) %>' runat="server" CommandArgument='<%#Eval("OrderId") %>' OnCommand="ReadLb_Command">Read</asp:LinkButton>
                                            <asp:LinkButton ID="DeliveredLb" Visible='<%#!Convert.ToBoolean(Eval("IsDelivered")) %>' runat="server" CommandArgument='<%#Eval("OrderId") %>' OnCommand="DeliveredLb_Command">Delivered</asp:LinkButton>
                                            <asp:LinkButton ID="CancelledLb" Visible='<%#!Convert.ToBoolean(Eval("IsCancelled")) %>' runat="server" CommandArgument='<%#Eval("OrderId") %>' OnCommand="CancelledLb_Command">Canceled</asp:LinkButton>
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

<SortedAscendingCellStyle BackColor="#FDF5AC"></SortedAscendingCellStyle>

<SortedAscendingHeaderStyle BackColor="#4D0000"></SortedAscendingHeaderStyle>

<SortedDescendingCellStyle BackColor="#FCF6C0"></SortedDescendingCellStyle>

<SortedDescendingHeaderStyle BackColor="#820000"></SortedDescendingHeaderStyle>
                        </asp:GridView>
                        </div>


                </asp:WizardStep>
                <asp:WizardStep runat="server" Title="Today's Delivered Order">


                    <center><h4><asp:Label ID="DeliveredOdrInfoLbl" runat="server" Text=""></asp:Label></h4></center>

                    <div style="width:1000px;overflow:auto;">
                        <asp:GridView ID="DeliveredOdrGv" runat="server" AutoGenerateColumns="False" 
                            CellPadding="4" ForeColor="#333333" GridLines="None" Width="1750px">
                            <AlternatingRowStyle BackColor="White" />

                                <Columns>
                                    <asp:TemplateField HeaderText="Order Id">
                                        <ItemTemplate>
                                            <%#Eval("OrderId") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Provider Id">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="ProviderIdLb" runat="server" OnCommand="ProviderIdLb_Command" CommandName='<%#Eval("ProviderId")%>'><%#Eval("ProviderId")%></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Tiffin Name">
                                        <ItemTemplate>
                                            <%#Eval("TiffinName") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Description" ItemStyle-CssClass="jk">
                                        <ItemTemplate>
                                            <font style="width:150px;word-break:break-all;"><%#Eval("Description") %></font>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Price">
                                        <ItemTemplate>
                                            <%#Eval("Price") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="User Id">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="UserIdLb" runat="server" OnCommand="UserIdLb_Command" CommandName='<%#Eval("UserId")%>'><%#Eval("UserId")%></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Mobile">
                                        <ItemTemplate>
                                            <%#Eval("mob_no")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Delivery City">
                                        <ItemTemplate>
                                            <%#Eval("DelCity")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Delivery Area">
                                        <ItemTemplate>
                                            <%#Eval("DelArea")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Delivery Address">
                                        <ItemTemplate>
                                            <%#Eval("DelAddress")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Book Date">
                                        <ItemTemplate>
                                            <%#Eval("BookDate")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Book Time">
                                        <ItemTemplate>
                                            <%#Eval("BookTime")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Readed">
                                        <ItemTemplate>
                                            <%#Eval("IsRead")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Delivered">
                                        <ItemTemplate>
                                            <%#Eval("IsDelivered")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Cancelled">
                                        <ItemTemplate>
                                            <%#Eval("IsCancelled")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Operation">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="ReadLb" Visible='<%#!Convert.ToBoolean(Eval("IsRead")) %>' runat="server" CommandArgument='<%#Eval("OrderId") %>' OnCommand="ReadLb_Command">Read</asp:LinkButton>
                                            <asp:LinkButton ID="DeliveredLb" Visible='<%#!Convert.ToBoolean(Eval("IsDelivered")) %>' runat="server" CommandArgument='<%#Eval("OrderId") %>' OnCommand="DeliveredLb_Command">Delivered</asp:LinkButton>
                                            <asp:LinkButton ID="CancelledLb" Visible='<%#!Convert.ToBoolean(Eval("IsCancelled")) %>' runat="server" CommandArgument='<%#Eval("OrderId") %>' OnCommand="CancelledLb_Command">Canceled</asp:LinkButton>
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

<SortedAscendingCellStyle BackColor="#FDF5AC"></SortedAscendingCellStyle>

<SortedAscendingHeaderStyle BackColor="#4D0000"></SortedAscendingHeaderStyle>

<SortedDescendingCellStyle BackColor="#FCF6C0"></SortedDescendingCellStyle>

<SortedDescendingHeaderStyle BackColor="#820000"></SortedDescendingHeaderStyle>
                        </asp:GridView>
                        </div>


                </asp:WizardStep>
                <asp:WizardStep runat="server" Title="Today's Cancelled Order">


                    <center><h4><asp:Label ID="CacelledOdrInfoLbl" runat="server" Text=""></asp:Label></h4></center>

                    <div style="width:1000px;overflow:auto;">
                        <asp:GridView ID="CancelledOdrGv" runat="server" AutoGenerateColumns="False" 
                            CellPadding="4" ForeColor="#333333" GridLines="None" Width="1750px">
                            <AlternatingRowStyle BackColor="White" />

                                <Columns>
                                    <asp:TemplateField HeaderText="Order Id">
                                        <ItemTemplate>
                                            <%#Eval("OrderId") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Provider Id">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="ProviderIdLb" runat="server" OnCommand="ProviderIdLb_Command" CommandName='<%#Eval("ProviderId")%>'><%#Eval("ProviderId")%></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Tiffin Name">
                                        <ItemTemplate>
                                            <%#Eval("TiffinName") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Description" ItemStyle-CssClass="jk">
                                        <ItemTemplate>
                                            <font style="width:150px;word-break:break-all;"><%#Eval("Description") %></font>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Price">
                                        <ItemTemplate>
                                            <%#Eval("Price") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="User Id">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="UserIdLb" runat="server" OnCommand="UserIdLb_Command" CommandName='<%#Eval("UserId")%>'><%#Eval("UserId")%></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Mobile">
                                        <ItemTemplate>
                                            <%#Eval("mob_no")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Delivery City">
                                        <ItemTemplate>
                                            <%#Eval("DelCity")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Delivery Area">
                                        <ItemTemplate>
                                            <%#Eval("DelArea")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Delivery Address">
                                        <ItemTemplate>
                                            <%#Eval("DelAddress")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Book Date">
                                        <ItemTemplate>
                                            <%#Eval("BookDate")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Book Time">
                                        <ItemTemplate>
                                            <%#Eval("BookTime")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Readed">
                                        <ItemTemplate>
                                            <%#Eval("IsRead")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Delivered">
                                        <ItemTemplate>
                                            <%#Eval("IsDelivered")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Cancelled">
                                        <ItemTemplate>
                                            <%#Eval("IsCancelled")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Operation">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="ReadLb" Visible='<%#!Convert.ToBoolean(Eval("IsRead")) %>' runat="server" CommandArgument='<%#Eval("OrderId") %>' OnCommand="ReadLb_Command">Read</asp:LinkButton>
                                            <asp:LinkButton ID="DeliveredLb" Visible='<%#!Convert.ToBoolean(Eval("IsDelivered")) %>' runat="server" CommandArgument='<%#Eval("OrderId") %>' OnCommand="DeliveredLb_Command">Delivered</asp:LinkButton>
                                            <asp:LinkButton ID="CancelledLb" Visible='<%#!Convert.ToBoolean(Eval("IsCancelled")) %>' runat="server" CommandArgument='<%#Eval("OrderId") %>' OnCommand="CancelledLb_Command">Canceled</asp:LinkButton>
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

<SortedAscendingCellStyle BackColor="#FDF5AC"></SortedAscendingCellStyle>

<SortedAscendingHeaderStyle BackColor="#4D0000"></SortedAscendingHeaderStyle>

<SortedDescendingCellStyle BackColor="#FCF6C0"></SortedDescendingCellStyle>

<SortedDescendingHeaderStyle BackColor="#820000"></SortedDescendingHeaderStyle>
                        </asp:GridView>
                        </div>


                </asp:WizardStep>
                <asp:WizardStep runat="server" Title="All Order">


                    <center><h4><asp:Label ID="AllOdrInfoLbl" runat="server" Text=""></asp:Label></h4></center>

                    <div style="width:1000px;overflow:auto;">
                        <asp:GridView ID="AllOdrGv" runat="server" AutoGenerateColumns="False" 
                            CellPadding="4" ForeColor="#333333" GridLines="None" Width="1750px">
                            <AlternatingRowStyle BackColor="White" />

                                <Columns>
                                    <asp:TemplateField HeaderText="Order Id">
                                        <ItemTemplate>
                                            <%#Eval("OrderId") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Provider Id">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="ProviderIdLb" runat="server" OnCommand="ProviderIdLb_Command" CommandName='<%#Eval("ProviderId")%>'><%#Eval("ProviderId")%></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Tiffin Name">
                                        <ItemTemplate>
                                            <%#Eval("TiffinName") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Description" ItemStyle-CssClass="jk">
                                        <ItemTemplate>
                                            <font style="width:150px;word-break:break-all;"><%#Eval("Description") %></font>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Price">
                                        <ItemTemplate>
                                            <%#Eval("Price") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="User Id">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="UserIdLb" runat="server" OnCommand="UserIdLb_Command" CommandName='<%#Eval("UserId")%>'><%#Eval("UserId")%></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Mobile">
                                        <ItemTemplate>
                                            <%#Eval("mob_no")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Delivery City">
                                        <ItemTemplate>
                                            <%#Eval("DelCity")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Delivery Area">
                                        <ItemTemplate>
                                            <%#Eval("DelArea")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Delivery Address">
                                        <ItemTemplate>
                                            <%#Eval("DelAddress")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Book Date">
                                        <ItemTemplate>
                                            <%#Eval("BookDate")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Book Time">
                                        <ItemTemplate>
                                            <%#Eval("BookTime")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Readed">
                                        <ItemTemplate>
                                            <%#Eval("IsRead")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Delivered">
                                        <ItemTemplate>
                                            <%#Eval("IsDelivered")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Cancelled">
                                        <ItemTemplate>
                                            <%#Eval("IsCancelled")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Operation">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="ReadLb" Visible='<%#!Convert.ToBoolean(Eval("IsRead")) %>' runat="server" CommandArgument='<%#Eval("OrderId") %>' OnCommand="ReadLb_Command">Read</asp:LinkButton>
                                            <asp:LinkButton ID="DeliveredLb" Visible='<%#!Convert.ToBoolean(Eval("IsDelivered")) %>' runat="server" CommandArgument='<%#Eval("OrderId") %>' OnCommand="DeliveredLb_Command">Delivered</asp:LinkButton>
                                            <asp:LinkButton ID="CancelledLb" Visible='<%#!Convert.ToBoolean(Eval("IsCancelled")) %>' runat="server" CommandArgument='<%#Eval("OrderId") %>' OnCommand="CancelledLb_Command">Canceled</asp:LinkButton>
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

<SortedAscendingCellStyle BackColor="#FDF5AC"></SortedAscendingCellStyle>

<SortedAscendingHeaderStyle BackColor="#4D0000"></SortedAscendingHeaderStyle>

<SortedDescendingCellStyle BackColor="#FCF6C0"></SortedDescendingCellStyle>

<SortedDescendingHeaderStyle BackColor="#820000"></SortedDescendingHeaderStyle>
                        </asp:GridView>
                        </div>


                </asp:WizardStep>
            </WizardSteps>
        </asp:Wizard>


    </fieldset>

</asp:Content>

