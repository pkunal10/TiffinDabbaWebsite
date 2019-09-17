<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="View_monthly_order.aspx.cs" Inherits="admin_View_monthly_order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>View Monthly Orders</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <center>
        <h2><font style="color:Black;">Details Of Monthly Orders</font></h2> 
                   <asp:Wizard ID="Wizard1" runat="server" BackColor="#FFFBD6" 
                BorderColor="#FFDFAD" BorderWidth="1px" Font-Names="Verdana" Font-Size="1em" 
                Height="850px" Width="1037px" ActiveStepIndex="3">
                <HeaderStyle BackColor="#FFCC66" BorderColor="#FFFBD6" BorderStyle="Solid" 
                    BorderWidth="2px" Font-Bold="True" Font-Size="1.0em" ForeColor="#333333" 
                    HorizontalAlign="Justify" />
                <NavigationButtonStyle BackColor="White" BorderColor="#CC9966" 
                    BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="1.0em" 
                    ForeColor="#990000" />
                <SideBarButtonStyle ForeColor="White" />
                <SideBarStyle BackColor="#0085cc" Width="200px" Font-Size="1.0em" VerticalAlign="Middle" />
                <WizardSteps>
                    <asp:WizardStep ID="WizardStep11" runat="server" Title="By Order Id">
                    <center>
                        <table style="width:400px;">
                            <tr>
                                <td style="width:200px;">
                                    Enter Order Id</td>
                                <td>
                                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
                                <td style="width:200px;">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Order Id"
                                    Text="Enter Order Id" ControlToValidate="TextBox1" ValidationGroup="ostoid"></asp:RequiredFieldValidator>
                                    </td>
                            </tr>
                            <tr>
                                <td colspan="3" align="center">
                                    <asp:Button ID="Button1" runat="server" Text="Show" ValidationGroup="ostoid" OnClick="Button1_Click"  /></td>
                            </tr>
                        </table>
                     </center>
                        <br />
                        <h4><asp:Label ID="Label1" runat="server" Text=""></asp:Label></h4>
                        <div style="width:800px;overflow:auto;">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                            CellPadding="4" ForeColor="#333333" GridLines="None" Width="1750px">
                            <AlternatingRowStyle BackColor="White" />

                                <Columns>
                                    <asp:TemplateField HeaderText="Order Id">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton15" runat="server" OnCommand="full_details_of_order" CommandName='<%#Eval("order_id")%>'><%#Eval("order_id")%></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Order For">
                                        <ItemTemplate>
                                            <%#Eval("book_for")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Provider Id">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton9" runat="server" OnCommand="fp" CommandName='<%#Eval("pid")%>'><%#Eval("pid")%></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="User Id">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton10" runat="server" OnCommand="fu" CommandName='<%#Eval("uid")%>'><%#Eval("uid")%></asp:LinkButton>
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
                    <asp:WizardStep ID="WizardStep12" runat="server" Title="By Provider Id">
                        <center>
                        <table style="width:440px;">
                            <tr>
                                <td style="width:220px;">
                                    Enter Provider Id</td>
                                <td>
                                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></td>
                                <td style="width:220px;">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Provider Id"
                                    Text="Enter Provider Id" ControlToValidate="TextBox2" ValidationGroup="ostpid"></asp:RequiredFieldValidator></td>
                            </tr>
                            <tr>
                                <td>
                                    Order Of</td>
                                <td>
                                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
                                        <asp:ListItem>--To Select--</asp:ListItem>
                                        <asp:ListItem>Lunch</asp:ListItem>
                                        <asp:ListItem>Dinner</asp:ListItem>
                                        <asp:ListItem>Both</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="3" align="center">
                                    <asp:Button ID="Button2" runat="server" Text="Show" ValidationGroup="ostpid" OnClick="Button2_Click" /></td>
                            </tr>
                        </table>
                    </center>
                        <br />
                        <h4><asp:Label ID="Label2" runat="server" Text=""></asp:Label></h4>
                        <div style="width:800px;height:800px;overflow:auto;">
                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                            CellPadding="4" ForeColor="#333333" GridLines="None" Width="1750px">
                            <AlternatingRowStyle BackColor="White" />

                                <Columns>
                                    <asp:TemplateField HeaderText="Order Id">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton15" runat="server" OnCommand="full_details_of_order" CommandName='<%#Eval("order_id")%>'><%#Eval("order_id")%></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Order For">
                                        <ItemTemplate>
                                            <%#Eval("book_for")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Provider Id">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton9" runat="server" OnCommand="fp" CommandName='<%#Eval("pid")%>'><%#Eval("pid")%></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="User Id">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton10" runat="server" OnCommand="fu" CommandName='<%#Eval("uid")%>'><%#Eval("uid")%></asp:LinkButton>
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
                    <asp:WizardStep ID="WizardStep1" runat="server" Title="Today's Booked Orders">
                    <center>
                        <table style="width:620px;">
                            
                            <tr>
                                <td>
                                    Order Of</td>
                                <td>
                                    <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True">
                                        <asp:ListItem>--To Select--</asp:ListItem>
                                        <asp:ListItem>Lunch</asp:ListItem>
                                        <asp:ListItem>Dinner</asp:ListItem>
                                        <asp:ListItem>Both</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="3" align="center">
                                    <asp:Button ID="Button3" runat="server" ValidationGroup="ostdate" Text="Show" OnClick="Button3_Click"/></td>
                            </tr>
                        </table>
                    </center>
                        <br />
                        <h4><asp:Label ID="Label3" runat="server" Text=""></asp:Label></h4>
                        <div style="width:800px;height:800px;overflow:auto;">
                        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="1750px">
                            <AlternatingRowStyle BackColor="White" />

                                <Columns>
                                    <asp:TemplateField HeaderText="Order Id">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton15" runat="server" OnCommand="full_details_of_order" CommandName='<%#Eval("order_id")%>'><%#Eval("order_id")%></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Order For">
                                        <ItemTemplate>
                                            <%#Eval("book_for")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Provider Id">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton9" runat="server" OnCommand="fp" CommandName='<%#Eval("pid")%>'><%#Eval("pid")%></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="User Id">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton10" runat="server" OnCommand="fu" CommandName='<%#Eval("uid")%>'><%#Eval("uid")%></asp:LinkButton>
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
                    <asp:WizardStep ID="WizardStep2" runat="server" Title="Today's Order">
                       <center>
                        <table style="width: 244px">
                            <tr>
                                <td>
                                    Order Of
                                </td>
                                <td>
                                    <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True">
                                        <asp:ListItem>--To Select--</asp:ListItem>
                                        <asp:ListItem>Lunch</asp:ListItem>
                                        <asp:ListItem>Dinner</asp:ListItem>
                                        <asp:ListItem>Both</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center">
                                    <asp:Button ID="Button4" runat="server" Text="Show" OnClick="Button4_Click" />
                                </td>
                            </tr>
                        </table>
                    </center>
                        <br />
                        <h4><asp:Label ID="Label4" runat="server" Text=""></asp:Label></h4>
                        <div style="width:800px;height:600px;overflow:auto;">
                        <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="1750px">
                            <AlternatingRowStyle BackColor="White" />

                                <Columns>
                                    <asp:TemplateField HeaderText="Order Id">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton15" runat="server" OnCommand="full_details_of_order" CommandName='<%#Eval("order_id")%>'><%#Eval("order_id")%></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Order For">
                                        <ItemTemplate>
                                            <%#Eval("book_for")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Provider Id">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton9" runat="server" OnCommand="fp" CommandName='<%#Eval("pid")%>'><%#Eval("pid")%></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="User Id">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton10" runat="server" OnCommand="fu" CommandName='<%#Eval("uid")%>'><%#Eval("uid")%></asp:LinkButton>
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
                        </div><br /><br />
                        <center>
                            
                        </center>
                    </asp:WizardStep>
                   
                    <asp:WizardStep ID="WizardStep3" runat="server" Title="All Order">
                    <center>
                        <table style="width: 226px">
                            <tr>
                                <td>
                                    Order Of
                                </td>
                                <td>
                                    <asp:DropDownList ID="DropDownList4" runat="server" AutoPostBack="True" >
                                        <asp:ListItem>--To Select--</asp:ListItem>
                                        <asp:ListItem>Lunch</asp:ListItem>
                                        <asp:ListItem>Dinner</asp:ListItem>
                                        <asp:ListItem>Both</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center">
                                    <asp:Button ID="Button5" runat="server" Text="Show" OnClick="Button5_Click" />
                                </td>
                            </tr>
                        </table>
                    </center>
                        <br />
                        <h4><asp:Label ID="Label5" runat="server" Text=""></asp:Label></h4>
                        <div style="width:800px;height:800px;overflow:auto;">
                        <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="1750px">
                            <AlternatingRowStyle BackColor="White" />

                                <Columns>
                                    <asp:TemplateField HeaderText="Order Id">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton15" runat="server" OnCommand="full_details_of_order" CommandName='<%#Eval("order_id")%>'><%#Eval("order_id")%></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Order For">
                                        <ItemTemplate>
                                            <%#Eval("book_for")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Provider Id">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton9" runat="server" OnCommand="fp" CommandName='<%#Eval("pid")%>'><%#Eval("pid")%></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="User Id">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton10" runat="server" OnCommand="fu" CommandName='<%#Eval("uid")%>'><%#Eval("uid")%></asp:LinkButton>
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
        </center>

    </center>

</asp:Content>

