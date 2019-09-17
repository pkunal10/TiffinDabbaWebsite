<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="View_users.aspx.cs" Inherits="admin_View_users" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <title>View Users</title>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>    
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>

    <div>
        <center>
            <asp:Wizard ID="Wizard1" runat="server" BackColor="#FFFBD6" 
                BorderColor="#FFDFAD" BorderWidth="1px" Font-Names="Verdana" Font-Size="1em" 
                Height="850px" Width="1011px" ActiveStepIndex="1">
                <HeaderStyle BackColor="#FFCC66" BorderColor="#FFFBD6" BorderStyle="Solid" 
                    BorderWidth="2px" Font-Bold="True" Font-Size="1.0em" ForeColor="#333333" 
                    HorizontalAlign="Center" />
                <NavigationButtonStyle BackColor="White" BorderColor="#CC9966" 
                    BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="1.0em" 
                    ForeColor="#990000" />
                <SideBarButtonStyle ForeColor="White"  />
                <SideBarStyle BackColor="#0085cc" Font-Size="1.0em" Width="200px" VerticalAlign="Middle" />
                <WizardSteps>
                    <asp:WizardStep ID="WizardStep1" runat="server" Title="Search By Id">
                    <center>
                        <table style="width:400px;">
                            <tr>
                                <td style="width:200px;">
                                   Enter User Id</td>
                                <td >
                                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
                                <td style="width:200px;">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter User Id"
                                    Text="Enter User Id" ControlToValidate="TextBox1" ValidationGroup="vuid"></asp:RequiredFieldValidator>
                                    </td>
                            </tr>
                            <tr>
                                <td colspan="3" align="center">
                                    <asp:Button ID="Button1" runat="server" Text="Show" ValidationGroup="vuid" OnClick="Button1_Click"/></td>
                            </tr>
                        </table>
                    </center>
                        <br />
                        <h4><asp:Label ID="Label1" runat="server"></asp:Label></h4>
                        <div style="width:800px;overflow:auto;">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                            CellPadding="4" ForeColor="#333333" GridLines="None">
                            <AlternatingRowStyle BackColor="White" />

                                <Columns>
                                    <asp:TemplateField HeaderText="User Id">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server" OnCommand="fu" CommandName='<%#Eval("id")%>'><%#Eval("id")%></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Name">
                                        <ItemTemplate>
                                            <%#Eval("name")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Address">
                                        <ItemTemplate>
                                            <%#Eval("address")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Mobile No">
                                        <ItemTemplate>
                                            <%#Eval("mob_no")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Email Id">
                                        <ItemTemplate>
                                            <%#Eval("eid")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Status">
                                        <ItemTemplate>
                                            <%#Eval("status")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Password">
                                        <ItemTemplate>
                                            <%#Eval("pass")%>
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
                     </asp:WizardStep>
                     <asp:WizardStep ID="WizardStep2" runat="server" Title="All Users">
                     <center>
                        <asp:Button ID="Button3" runat="server" Text="Show" OnClick="Button3_Click"/><br />
                         <h3><asp:Label ID="Total_user_lbl" runat="server" Text=""></asp:Label></h3>
                    </center>
                        <br />
                        <h4>
                            <asp:Label ID="Label3" runat="server" Text=""></asp:Label></h4>
                            <div style="width:800px;height:800px;overflow:auto;">
                        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                            <AlternatingRowStyle BackColor="White" />

                                <Columns>
                                    <asp:TemplateField HeaderText="User Id">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server" OnCommand="fu" CommandName='<%#Eval("id")%>'><%#Eval("id")%></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Name">
                                        <ItemTemplate>
                                            <%#Eval("name")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Address">
                                        <ItemTemplate>
                                            <%#Eval("address")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Mobile No">
                                        <ItemTemplate>
                                            <%#Eval("mob_no")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Email Id">
                                        <ItemTemplate>
                                            <%#Eval("eid")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Status">
                                        <ItemTemplate>
                                            <%#Eval("status")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Password">
                                        <ItemTemplate>
                                            <%#Eval("pass")%>
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
                    </asp:WizardStep>

                    <asp:WizardStep ID="WizardStep3" runat="server" Title="Block Users">
                     <center>
                        <asp:Button ID="Button2" runat="server" Text="Show" OnClick="Button2_Click" />
                    </center>
                        <br />
                        <h4>
                            <asp:Label ID="Label2" runat="server" Text=""></asp:Label></h4>
                            <div style="width:800px;height:800px;overflow:auto;">
                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                            <AlternatingRowStyle BackColor="White" />

                                <Columns>
                                    <asp:TemplateField HeaderText="User Id">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server" OnCommand="fu" CommandName='<%#Eval("id")%>'><%#Eval("id")%></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Name">
                                        <ItemTemplate>
                                            <%#Eval("name")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Address">
                                        <ItemTemplate>
                                            <%#Eval("address")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Mobile No">
                                        <ItemTemplate>
                                            <%#Eval("mob_no")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Email Id">
                                        <ItemTemplate>
                                            <%#Eval("eid")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Status">
                                        <ItemTemplate>
                                            <%#Eval("status")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Password">
                                        <ItemTemplate>
                                            <%#Eval("pass")%>
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

