<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="View_tiffin_with_sweet_order.aspx.cs" Inherits="admin_View_tiffin_with_sweet_order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <title>View Tiffin With Sweet Order</title>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>    
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>--%>

    <div>
        <center>
        <h2><font style="color:Black;">Order Details Of Tiffin With Sweet</font></h2>
            <asp:Wizard ID="Wizard1" runat="server" BackColor="#FFFBD6" 
                BorderColor="#FFDFAD" BorderWidth="1px" Font-Names="Verdana" Font-Size="1em" 
                Height="850px" Width="1037px" ActiveStepIndex="4">
                <HeaderStyle BackColor="#FFCC66" BorderColor="#FFFBD6" BorderStyle="Solid" 
                    BorderWidth="2px" Font-Bold="True" Font-Size="1.0em" ForeColor="#333333" 
                    HorizontalAlign="Justify" />
                <NavigationButtonStyle BackColor="White" BorderColor="#CC9966" 
                    BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="1.0em" 
                    ForeColor="#990000" />
                <SideBarButtonStyle ForeColor="White" />
                <SideBarStyle BackColor="#0085cc" Width="220px" Font-Size="1.0em" VerticalAlign="Middle" />
                <WizardSteps>
                    <asp:WizardStep ID="WizardStep7" runat="server" Title="By Order Id">
                    <center>
                        <table style="width:400px;">
                            <tr>
                                <td style="width:200px;">
                                    Enter Order Id</td>
                                <td>
                                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
                                <td style="width:200px;">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Order Id"
                                    Text="Enter Order Id" ControlToValidate="TextBox1" ValidationGroup="otwsoid"></asp:RequiredFieldValidator></td>
                            </tr>
                            <tr>
                                <td colspan="3" align="center">
                                    <asp:Button ID="Button1" runat="server" Text="Show" ValidationGroup="otwsoid" OnClick="Button1_Click" /></td>
                            </tr>
                        </table>
                    </center>
                        <br />
                        <h4><asp:Label ID="Label1" runat="server" Text=""></asp:Label></h4>
                        <div style="width:800px;overflow:auto;">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                            CellPadding="4" ForeColor="#333333" GridLines="None" Width="2000px">
                            <AlternatingRowStyle BackColor="White" />

                                <Columns>
                                    <asp:TemplateField HeaderText="Order Id">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton11" runat="server" OnCommand="full_details_of_order" CommandName='<%#Eval("order_id")%>'><%#Eval("order_id")%></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Order For">
                                        <ItemTemplate>
                                            <%#Eval("book_for")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Provider Id">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server" OnCommand="fp" CommandName='<%#Eval("pid")%>'><%#Eval("pid")%></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="User Id">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton2" runat="server" OnCommand="fu" CommandName='<%#Eval("uid")%>'><%#Eval("uid")%></asp:LinkButton>
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
                                            <%#Eval("uadd")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="User Mobile No">
                                        <ItemTemplate>
                                            <%#Eval("umob_no")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Time">
                                        <ItemTemplate>
                                            <%#Eval("time")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Date">
                                        <ItemTemplate>
                                            <%#Eval("date")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Sabji">
                                        <ItemTemplate>
                                            <%#Eval("sabji")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Roti">
                                        <ItemTemplate>
                                            <%#Eval("roti")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Dal">
                                        <ItemTemplate>
                                            <%#Eval("dal")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Chawal">
                                        <ItemTemplate>
                                            <%#Eval("chawal")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Sweet">
                                        <ItemTemplate>
                                            <%#Eval("sweet")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Other">
                                        <ItemTemplate>
                                            <%#Eval("other")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Price">
                                        <ItemTemplate>
                                            <%#Eval("price")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Status">
                                        <ItemTemplate>
                                            <%#Eval("status")%>
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
                    <asp:WizardStep ID="WizardStep8" runat="server" Title="By Provider Id">
                    <center>
                        <table style="width:440px;">
                            <tr>
                                <td style="width:220px;">
                                    Enter Provider Id</td>
                                <td>
                                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></td>
                                <td style="width:220px;">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Provider Id"
                                    Text="Enter Provider Id" ControlToValidate="TextBox2" ValidationGroup="otwspid"></asp:RequiredFieldValidator></td>
                            </tr>
                            <tr>
                                <td>
                                    Order Of</td>
                                <td>
                                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
                                        <asp:ListItem>--To Select--</asp:ListItem>
                                        <asp:ListItem>Lunch</asp:ListItem>
                                        <asp:ListItem>Dinner</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="3" align="center">
                                    <asp:Button ID="Button2" runat="server" Text="Show" ValidationGroup="otwspid" OnClick="Button2_Click" /></td>
                            </tr>
                        </table>
                    </center>
                        <br />
                        <h4><asp:Label ID="Label2" runat="server" Text=""></asp:Label></h4>
                        <div style="width:800px;height:800px;overflow:auto;">
                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="2000px">
                            <AlternatingRowStyle BackColor="White" />

                                <Columns>
                                    <asp:TemplateField HeaderText="Order Id">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton12" runat="server" OnCommand="full_details_of_order" CommandName='<%#Eval("order_id")%>'><%#Eval("order_id")%></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Order For">
                                        <ItemTemplate>
                                            <%#Eval("book_for")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Provider Id">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton3" runat="server" OnCommand="fp" CommandName='<%#Eval("pid")%>'><%#Eval("pid")%></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="User Id">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton4" runat="server" OnCommand="fu" CommandName='<%#Eval("uid")%>'><%#Eval("uid")%></asp:LinkButton>
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
                                            <%#Eval("uadd")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="User Mobile No">
                                        <ItemTemplate>
                                            <%#Eval("umob_no")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Time">
                                        <ItemTemplate>
                                            <%#Eval("time")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Date">
                                        <ItemTemplate>
                                            <%#Eval("date")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Sabji">
                                        <ItemTemplate>
                                            <%#Eval("sabji")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Roti">
                                        <ItemTemplate>
                                            <%#Eval("roti")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Dal">
                                        <ItemTemplate>
                                            <%#Eval("dal")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Chawal">
                                        <ItemTemplate>
                                            <%#Eval("chawal")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Sweet">
                                        <ItemTemplate>
                                            <%#Eval("sweet")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Other">
                                        <ItemTemplate>
                                            <%#Eval("other")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Price">
                                        <ItemTemplate>
                                            <%#Eval("price")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Status">
                                        <ItemTemplate>
                                            <%#Eval("status")%>
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
                    <asp:WizardStep ID="WizardStep9" runat="server" Title="By Date">
                    <center>
                        <table style="width:620px;">
                            <tr>
                                <td style="width:250px;">
                                    <h3>Formate Of Date:-</h3></td>
                                <td style="width:220px;">
                                    <h3>21 August 2016 </h3></td>
                                <td style="width:150px;">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    Enter Date</td>
                                <td>
                                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox></td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter Date"
                                    Text="Enter Date" ControlToValidate="TextBox3" ValidationGroup="otwsdate"></asp:RequiredFieldValidator></td>
                            </tr>
                            <tr>
                                <td>
                                    Order Of</td>
                                <td>
                                    <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True">
                                        <asp:ListItem>--To Select--</asp:ListItem>
                                        <asp:ListItem>Lunch</asp:ListItem>
                                        <asp:ListItem>Dinner</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="3" align="center">
                                    <asp:Button ID="Button3" runat="server" Text="Show" ValidationGroup="otwsdate" OnClick="Button3_Click" /></td>
                            </tr>
                        </table>
                    </center>
                        <br />
                        <h4><asp:Label ID="Label3" runat="server" Text=""></asp:Label></h4>
                        <div style="width:800px;height:800px;overflow:auto;">
                        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="2000px">
                            <AlternatingRowStyle BackColor="White" />

                                <Columns>
                                    <asp:TemplateField HeaderText="Order Id">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton13" runat="server" OnCommand="full_details_of_order" CommandName='<%#Eval("order_id")%>'><%#Eval("order_id")%></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Order For">
                                        <ItemTemplate>
                                            <%#Eval("book_for")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Provider Id">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton5" runat="server" OnCommand="fp" CommandName='<%#Eval("pid")%>'><%#Eval("pid")%></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="User Id">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton6" runat="server" OnCommand="fu" CommandName='<%#Eval("uid")%>'><%#Eval("uid")%></asp:LinkButton>
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
                                            <%#Eval("uadd")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="User Mobile No">
                                        <ItemTemplate>
                                            <%#Eval("umob_no")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Time">
                                        <ItemTemplate>
                                            <%#Eval("time")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Date">
                                        <ItemTemplate>
                                            <%#Eval("date")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Sabji">
                                        <ItemTemplate>
                                            <%#Eval("sabji")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Roti">
                                        <ItemTemplate>
                                            <%#Eval("roti")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Dal">
                                        <ItemTemplate>
                                            <%#Eval("dal")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Chawal">
                                        <ItemTemplate>
                                            <%#Eval("chawal")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Sweet">
                                        <ItemTemplate>
                                            <%#Eval("sweet")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Other">
                                        <ItemTemplate>
                                            <%#Eval("other")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Price">
                                        <ItemTemplate>
                                            <%#Eval("price")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Status">
                                        <ItemTemplate>
                                            <%#Eval("status")%>
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
                    <asp:WizardStep ID="WizardStep10" runat="server" Title="Today's Order">
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
                                            <asp:LinkButton ID="LinkButton14" runat="server" OnCommand="full_details_of_order" Text='<%#Eval("order_id")%>' CommandName='<%#Eval("order_id")%>'></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Order For">
                                        <ItemTemplate>
                                            <%#Eval("book_for")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Provider Id">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton7" runat="server" OnCommand="fp" CommandName='<%#Eval("pid")%>'><%#Eval("pid")%></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="User Id">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton8" runat="server" OnCommand="fu" CommandName='<%#Eval("uid")%>'><%#Eval("uid")%></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="User Name">
                                        <ItemTemplate>
                                            <asp:Label ID="name_lbl" runat="server" Text='<%#Eval("uname")%>'></asp:Label>
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
                                            <asp:Label ID="del_add_lbl" runat="server" Text='<%#Eval("uadd")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="User Mobile No">
                                        <ItemTemplate>
                                            <asp:Label ID="mob_lbl" runat="server" Text='<%#Eval("umob_no")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Time">
                                        <ItemTemplate>
                                            <%#Eval("time")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Date">
                                        <ItemTemplate>
                                            <%#Eval("date")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Sabji">
                                        <ItemTemplate>
                                            <asp:Label ID="sabji_lbl" runat="server" Text='<%#Eval("sabji")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Roti">
                                        <ItemTemplate>
                                            <asp:Label ID="roti_lbl" runat="server" Text='<%#Eval("roti")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Dal">
                                        <ItemTemplate>
                                            <asp:Label ID="dal_lbl" runat="server" Text='<%#Eval("dal")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Chawal">
                                        <ItemTemplate>
                                            <asp:Label ID="chawal_lbl" runat="server" Text='<%#Eval("chawal")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Sweet">
                                        <ItemTemplate>
                                            <asp:Label ID="sweet_lbl" runat="server" Text='<%#Eval("sweet")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Other">
                                        <ItemTemplate>
                                            <%#Eval("other")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Price">
                                        <ItemTemplate>
                                            <asp:Label ID="price_lbl" runat="server" Text='<%#Eval("price")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Status">
                                        <ItemTemplate>
                                            <%#Eval("status")%>
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
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="Button8" runat="server" Text="Generate Sheet" 
                            OnClick="Button8_Click" />
                        </div>
                    </asp:WizardStep>
                    <asp:WizardStep ID="WizardStep15" runat="server" Title="By Delivery Area">
                    <center>
                        <table style="width: 244px">
                        <caption><h2>Today's Order By Delivery Area</h2></caption>
                            <tr>
                                <td>
                                    Order Of
                                </td>
                                <td>
                                    <asp:DropDownList ID="DropDownList5" runat="server" AutoPostBack="True">
                                        <asp:ListItem>--To Select--</asp:ListItem>
                                        <asp:ListItem>Lunch</asp:ListItem>
                                        <asp:ListItem>Dinner</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Select City
                                </td>
                                <td>
                                    <asp:DropDownList ID="DropDownList6" runat="server" AutoPostBack="True" 
                                        OnSelectedIndexChanged="DropDownList6_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Select Area
                                </td>
                                <td>
                                    <asp:DropDownList ID="DropDownList7" runat="server" AutoPostBack="True" 
                                        OnSelectedIndexChanged="DropDownList7_SelectedIndexChanged">
                                        
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center">
                                    <asp:Button ID="Button6" runat="server" Text="Show" OnClick="Button6_Click"/>
                                </td>
                            </tr>
                        </table>
                    </center>
                        <br />
                        <h4><asp:Label ID="Label6" runat="server" Text=""></asp:Label></h4>
                        <div style="width:800px;height:800px;overflow:auto;">
                        <asp:GridView ID="GridView6" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="2000px">
                            <AlternatingRowStyle BackColor="White" />

                                <Columns>
                                    <asp:TemplateField HeaderText="Order Id">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton14" runat="server" OnCommand="full_details_of_order" CommandName='<%#Eval("order_id")%>'><%#Eval("order_id")%></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Order For">
                                        <ItemTemplate>
                                            <%#Eval("book_for")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Provider Id">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton7" runat="server" OnCommand="fp" CommandName='<%#Eval("pid")%>'><%#Eval("pid")%></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="User Id">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton8" runat="server" OnCommand="fu" CommandName='<%#Eval("uid")%>'><%#Eval("uid")%></asp:LinkButton>
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
                                            <%#Eval("uadd")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="User Mobile No">
                                        <ItemTemplate>
                                            <%#Eval("umob_no")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Time">
                                        <ItemTemplate>
                                            <%#Eval("time")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Date">
                                        <ItemTemplate>
                                            <%#Eval("date")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Sabji">
                                        <ItemTemplate>
                                            <%#Eval("sabji")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Roti">
                                        <ItemTemplate>
                                            <%#Eval("roti")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Dal">
                                        <ItemTemplate>
                                            <%#Eval("dal")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Chawal">
                                        <ItemTemplate>
                                            <%#Eval("chawal")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Sweet">
                                        <ItemTemplate>
                                            <%#Eval("sweet")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Other">
                                        <ItemTemplate>
                                            <%#Eval("other")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Price">
                                        <ItemTemplate>
                                            <%#Eval("price")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Status">
                                        <ItemTemplate>
                                            <%#Eval("status")%>
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
                    
                    <asp:WizardStep ID="WizardStep11" runat="server" Title="All Order">
                    <center>
                        <table style="width: 226px">
                            <tr>
                                <td>
                                    Order Of
                                </td>
                                <td>
                                    <asp:DropDownList ID="DropDownList4" runat="server" AutoPostBack="True">
                                        <asp:ListItem>--To Select--</asp:ListItem>
                                        <asp:ListItem>Lunch</asp:ListItem>
                                        <asp:ListItem>Dinner</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center">
                                    <asp:Button ID="Button5" runat="server" Text="Show" OnClick="Button5_Click"/>
                                </td>
                            </tr>
                        </table>
                    </center>
                        <br />
                        <h4><asp:Label ID="Label5" runat="server" Text=""></asp:Label></h4>
                        <div style="width:800px;height:800px;overflow:auto;">
                        <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" 
                                CellPadding="4" ForeColor="#333333" GridLines="None" Width="2000px">
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
                                            <%#Eval("uadd")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="User Mobile No">
                                        <ItemTemplate>
                                            <%#Eval("umob_no")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Time">
                                        <ItemTemplate>
                                            <%#Eval("time")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Date">
                                        <ItemTemplate>
                                            <%#Eval("date")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Sabji">
                                        <ItemTemplate>
                                            <%#Eval("sabji")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Roti">
                                        <ItemTemplate>
                                            <%#Eval("roti")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Dal">
                                        <ItemTemplate>
                                            <%#Eval("dal")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Chawal">
                                        <ItemTemplate>
                                            <%#Eval("chawal")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Sweet">
                                        <ItemTemplate>
                                            <%#Eval("sweet")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Other">
                                        <ItemTemplate>
                                            <%#Eval("other")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Price">
                                        <ItemTemplate>
                                            <%#Eval("price")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Status">
                                        <ItemTemplate>
                                            <%#Eval("status")%>
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
                    <asp:WizardStep ID="WizardStep16" runat="server" Title="All Order By Del. Area">
                    <center>
                        <table style="width: 244px">
                        <caption><h2>All Order By Delivery Area</h2></caption>
                            <tr>
                                <td>
                                    Order Of
                                </td>
                                <td>
                                    <asp:DropDownList ID="DropDownList8" runat="server" AutoPostBack="True">
                                        <asp:ListItem>--To Select--</asp:ListItem>
                                        <asp:ListItem>Lunch</asp:ListItem>
                                        <asp:ListItem>Dinner</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Select City
                                </td>
                                <td>
                                    <asp:DropDownList ID="DropDownList9" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList9_SelectedIndexChanged" 
                                        >
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Select Area
                                </td>
                                <td>
                                    <asp:DropDownList ID="DropDownList10" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList10_SelectedIndexChanged" 
                                        >
                                        
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center">
                                    <asp:Button ID="Button7" runat="server" Text="Show" OnClick="Button7_Click" />
                                </td>
                            </tr>
                        </table>
                    </center>
                        <br />
                        <h4><asp:Label ID="Label7" runat="server" Text=""></asp:Label></h4>
                        <div style="width:800px;height:800px;overflow:auto;">
                        <asp:GridView ID="GridView7" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="2000px">
                            <AlternatingRowStyle BackColor="White" />

                                <Columns>
                                    <asp:TemplateField HeaderText="Order Id">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton14" runat="server" OnCommand="full_details_of_order" CommandName='<%#Eval("order_id")%>'><%#Eval("order_id")%></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Order For">
                                        <ItemTemplate>
                                            <%#Eval("book_for")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Provider Id">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton7" runat="server" OnCommand="fp" CommandName='<%#Eval("pid")%>'><%#Eval("pid")%></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="User Id">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton8" runat="server" OnCommand="fu" CommandName='<%#Eval("uid")%>'><%#Eval("uid")%></asp:LinkButton>
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
                                            <%#Eval("uadd")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="User Mobile No">
                                        <ItemTemplate>
                                            <%#Eval("umob_no")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Time">
                                        <ItemTemplate>
                                            <%#Eval("time")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Date">
                                        <ItemTemplate>
                                            <%#Eval("date")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Sabji">
                                        <ItemTemplate>
                                            <%#Eval("sabji")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Roti">
                                        <ItemTemplate>
                                            <%#Eval("roti")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Dal">
                                        <ItemTemplate>
                                            <%#Eval("dal")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Chawal">
                                        <ItemTemplate>
                                            <%#Eval("chawal")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Sweet">
                                        <ItemTemplate>
                                            <%#Eval("sweet")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Other">
                                        <ItemTemplate>
                                            <%#Eval("other")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Price">
                                        <ItemTemplate>
                                            <%#Eval("price")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Status">
                                        <ItemTemplate>
                                            <%#Eval("status")%>
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
    </div>

<%--    </ContentTemplate>
</asp:UpdatePanel>--%>
</asp:Content>

