<%@ Page Title="" Language="C#" MasterPageFile="~/provider/provider_highted_master.master" AutoEventWireup="true" CodeFile="View_simple_tiffin_order.aspx.cs" Inherits="provider_View_simple_tiffin_order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <title>View Simple Tiffin Order</title>
    <link href="assets/img/shortcut_icon.png" rel="shortcut icon">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>    
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>


       <div style="height:150px;">
    
        <div style="height:60px;width:1000px;border-bottom-style:dashed;border-bottom-width:1.5px;"><br />
                <font class="pagetitle">Order Details Of Simple Tiffin</font>
        </div>
        <div style="height:90px;margin-top:22px;" class="text-justify">
        
        <font class="myprofile-description">

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            From this page you can see order details of simple tiffin.you can check order of simple tiffin by different ways.
        
        </font>
        
        </div>
    
    </div>


    <br />
    <br />

    <div>
        <center>

            <asp:Wizard ID="Wizard1" runat="server" BackColor="#FFFBD6" 
                BorderColor="#FFDFAD" BorderWidth="1px" Font-Names="Verdana" Font-Size="1em" 
                 Width="1000px" ActiveStepIndex="3" Height="780px">
                <HeaderStyle BackColor="#FFCC66" BorderColor="#FFFBD6" BorderStyle="Solid" HorizontalAlign="Center" 
                    BorderWidth="2px" Font-Bold="True" Font-Size="1.0em" ForeColor="#333333" 
                    />
                <NavigationButtonStyle BackColor="White" BorderColor="#CC9966" 
                    BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="1.0em" 
                    ForeColor="#990000" />
                <SideBarButtonStyle ForeColor="White" />
                <SideBarStyle BackColor="#757575" Font-Size="1.0em" VerticalAlign="Middle" Width="190px" />
                <WizardSteps>
                    <asp:WizardStep ID="WizardStep1" runat="server" Title="Today's Order By Meal">
                    <center>
                        <table class="style3">
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
                            </tr>
                            <tr>
                                <td colspan="2" align="center">
                                    <asp:Button ID="Button4" runat="server" Text="Show" OnClick="Button4_Click" /></td>
                            </tr>
                        </table>
                        </center>
                        <br />
                        <asp:Label ID="Label4" CssClass="war" runat="server"></asp:Label>
                        <br />
                        <br />
                        <div style="width:800px;height:750px;overflow:auto;">
                        <asp:GridView ID="GridView4" runat="server" CellPadding="4" ForeColor="#333333" 
                                AutoGenerateColumns="False" BorderStyle="Outset" BorderWidth="5px" Width="1683px">
                            <AlternatingRowStyle BackColor="White" />

                                <Columns>
                                    <asp:TemplateField HeaderText="Order Id">
                                        <ItemTemplate>
                                            <%#Eval("order_id")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Book For">
                                        <ItemTemplate>
                                            <%#Eval("book_for")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Tiffin Id">
                                        <ItemTemplate>
                                            <%#Eval("tid")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="User Id">
                                        <ItemTemplate>
                                            <%#Eval("uid")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Name">
                                        <ItemTemplate>
                                            <%#Eval("uname")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Email Id">
                                        <ItemTemplate>
                                            <%#Eval("ueid")%>
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

                                    <asp:TemplateField HeaderText="Mobile No">
                                        <ItemTemplate>
                                            <%#Eval("umob_no")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Addres">
                                        <ItemTemplate>
                                            <%#Eval("uadd")%>
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
                            <HeaderStyle BackColor="#757575" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                            <SortedAscendingCellStyle BackColor="#FDF5AC" />
                            <SortedAscendingHeaderStyle BackColor="#4D0000" />
                            <SortedDescendingCellStyle BackColor="#FCF6C0" />
                            <SortedDescendingHeaderStyle BackColor="#820000" />
                        </asp:GridView>
                        </div>
                    </asp:WizardStep>
                    <asp:WizardStep ID="WizardStep2" runat="server" title="Today's Order">
                    <center>
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Show" />
                    </center>
                        <br />
                        <br />
                        <asp:Label ID="Label1" CssClass="war" runat="server"></asp:Label>
                        <br />
                        <br />
                        <div style="width:800px;height:750px;overflow:auto;">
                        <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" 
                                AutoGenerateColumns="False" CellSpacing="2" Width="1676px">
                            <AlternatingRowStyle BackColor="White" />

                                <Columns>
                                    <asp:TemplateField HeaderText="Order Id">
                                        <ItemTemplate>
                                            <%#Eval("order_id")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Book For">
                                        <ItemTemplate>
                                            <%#Eval("book_for")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Tiffin Id">
                                        <ItemTemplate>
                                            <%#Eval("tid")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="User Id">
                                        <ItemTemplate>
                                            <%#Eval("uid")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Name">
                                        <ItemTemplate>
                                            <%#Eval("uname")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Email Id">
                                        <ItemTemplate>
                                            <%#Eval("ueid")%>
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

                                    <asp:TemplateField HeaderText="Mobile No">
                                        <ItemTemplate>
                                            <%#Eval("umob_no")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Addres">
                                        <ItemTemplate>
                                            <%#Eval("uadd")%>
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
                            <HeaderStyle BackColor="#757575" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                            <SortedAscendingCellStyle BackColor="#FDF5AC" />
                            <SortedAscendingHeaderStyle BackColor="#4D0000" />
                            <SortedDescendingCellStyle BackColor="#FCF6C0" />
                            <SortedDescendingHeaderStyle BackColor="#820000" />
                        </asp:GridView>
                        </div>
                    </asp:WizardStep>
                    <asp:WizardStep ID="WizardStep3" runat="server" title="Search By Date">
                    <center>
                        <table class="style2">
                            <tr>
                                <td>
                                    <h3>Formate Of Date:-</h3></td>
                                <td>
                                    <h3>21 August 2016 </h3></td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    Enter Date</td>
                                <td>
                                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Date"
                                        Text="Enter Date" ControlToValidate="TextBox1" ValidationGroup="pvstod"></asp:RequiredFieldValidator></td>
                            </tr>
                            <tr>
                                <td colspan="3" align="center">
                                    <asp:Button ID="Button2" runat="server" Text="Show" ValidationGroup="pvstod" OnClick="Button2_Click" /></td>
                            </tr>
                        </table>
                        </center>
                        <br />
                        <asp:Label ID="Label2" CssClass="war" runat="server"></asp:Label>
                        <br />
                        <div style="width:800px;height:750px;overflow:auto;">
                        <asp:GridView ID="GridView2" runat="server" CellPadding="4" ForeColor="#333333" 
                                AutoGenerateColumns="False" CellSpacing="2" Width="1689px">
                            <AlternatingRowStyle BackColor="White" />

                                <Columns>
                                    <asp:TemplateField HeaderText="Order Id">
                                        <ItemTemplate>
                                            <%#Eval("order_id")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Book For">
                                        <ItemTemplate>
                                            <%#Eval("book_for")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Tiffin Id">
                                        <ItemTemplate>
                                            <%#Eval("tid")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="User Id">
                                        <ItemTemplate>
                                            <%#Eval("uid")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Name">
                                        <ItemTemplate>
                                            <%#Eval("uname")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Email Id">
                                        <ItemTemplate>
                                            <%#Eval("ueid")%>
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

                                    <asp:TemplateField HeaderText="Mobile No">
                                        <ItemTemplate>
                                            <%#Eval("umob_no")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Addres">
                                        <ItemTemplate>
                                            <%#Eval("uadd")%>
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
                            <HeaderStyle BackColor="#757575" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                            <SortedAscendingCellStyle BackColor="#FDF5AC" />
                            <SortedAscendingHeaderStyle BackColor="#4D0000" />
                            <SortedDescendingCellStyle BackColor="#FCF6C0" />
                            <SortedDescendingHeaderStyle BackColor="#820000" />
                        </asp:GridView>
                        </div>
                    </asp:WizardStep>
                    <asp:WizardStep ID="WizardStep4" runat="server" Title="All Orders">
                    <center>
                        <asp:Button ID="Button3" runat="server" Text="Show" OnClick="Button3_Click" />
                    </center>
                        <br />
                        <br />
                        <asp:Label ID="Label3" CssClass="war" runat="server"></asp:Label>
                        <br />
                        <div style="width:800px;height:750px;overflow:auto;">
                        <asp:GridView ID="GridView3" runat="server" CellPadding="4" ForeColor="#333333" 
                                AutoGenerateColumns="False" BorderStyle="Outset" CellSpacing="2" 
                                HorizontalAlign="Center" Width="1696px">
                            <AlternatingRowStyle BackColor="White" />

                                <Columns>
                                    <asp:TemplateField HeaderText="Order Id">
                                        <ItemTemplate>
                                            <%#Eval("order_id")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Book For">
                                        <ItemTemplate>
                                            <%#Eval("book_for")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Tiffin Id">
                                        <ItemTemplate>
                                            <%#Eval("tid")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="User Id">
                                        <ItemTemplate>
                                            <%#Eval("uid")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Name">
                                        <ItemTemplate>
                                            <%#Eval("uname")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Email Id">
                                        <ItemTemplate>
                                            <%#Eval("ueid")%>
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

                                    <asp:TemplateField HeaderText="Mobile No">
                                        <ItemTemplate>
                                            <%#Eval("umob_no")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Addres">
                                        <ItemTemplate>
                                            <%#Eval("uadd")%>
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
                            <HeaderStyle BackColor="#757575" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                            <SortedAscendingCellStyle BackColor="#FDF5AC" />
                            <SortedAscendingHeaderStyle BackColor="#4D0000" />
                            <SortedDescendingCellStyle BackColor="#FCF6C0" />
                            <SortedDescendingHeaderStyle BackColor="#820000" />
                        </asp:GridView>
                        </div>
                    </asp:WizardStep>
                </WizardSteps>
            </asp:Wizard>

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

