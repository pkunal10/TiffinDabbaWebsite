<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="View_providers.aspx.cs" Inherits="admin_View_providers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <title>View Providers</title>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>


            <br />
            <br />
            <div>
                <center>
                    <asp:Wizard ID="Wizard1" runat="server" BackColor="#FFFBD6"
                        BorderColor="#FFDFAD" BorderWidth="1px" Font-Names="Verdana" Font-Size="1em"
                        Height="850px" Width="992px" ActiveStepIndex="1">
                        <HeaderStyle BackColor="#FFCC66" BorderColor="#FFFBD6" BorderStyle="Solid"
                            BorderWidth="2px" Font-Bold="True" Font-Size="1.0em" ForeColor="#333333"
                            HorizontalAlign="Center" />
                        <NavigationButtonStyle BackColor="White" BorderColor="#CC9966"
                            BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="1.0em"
                            ForeColor="#990000" />
                        <SideBarButtonStyle ForeColor="White" />
                        <SideBarStyle BackColor="#0085cc" Font-Size="1.0em" Width="200px" VerticalAlign="NotSet" />
                        <WizardSteps>
                            <asp:WizardStep ID="WizardStep10" runat="server" Title="Search By Id">
                                <center>
                                    <table style="width: 440px;">
                                        <tr>
                                            <td style="width: 220px;">Enter Provider Id</td>
                                            <td>
                                                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
                                            <td style="width: 220px;">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Provider Id"
                                                    Text="Enter Provider Id" ControlToValidate="TextBox1" ValidationGroup="vpid"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3" align="center">
                                                <asp:Button ID="Button1" runat="server" Text="Show" ValidationGroup="vpid" OnClick="Button1_Click" /></td>
                                        </tr>
                                    </table>
                                </center>
                                <br />
                                <h4>
                                    <asp:Label ID="Label1" runat="server"></asp:Label></h4>
                                <div style="width: 800px; overflow: auto;">
                                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                                        CellPadding="4" ForeColor="#333333" GridLines="None">
                                        <AlternatingRowStyle BackColor="White" />

                                        <Columns>
                                            <asp:TemplateField HeaderText="Id">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="LinkButton1" runat="server" OnCommand="fp" CommandName='<%#Eval("pid")%>'><%#Eval("pid")%></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Name">
                                                <ItemTemplate>
                                                    <%#Eval("name")%>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="City">
                                                <ItemTemplate>
                                                    <%#Eval("city")%>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Mobile No">
                                                <ItemTemplate>
                                                    <%#Eval("mob_no")%>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Email Id">
                                                <ItemTemplate>
                                                    <%#Eval("e_id")%>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Address">
                                                <ItemTemplate>
                                                    <%#Eval("address")%>
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
                                <br />
                                <br />
                                <center>
                                    <asp:Button ID="Button4" runat="server" Text="Delete" OnClick="Button4_Click" />
                                </center>
                            </asp:WizardStep>
                            <asp:WizardStep ID="WizardStep2" runat="server" Title="Search By City">
                                <center>
                                    <table class="style3">
                                        <tr>
                                            <td>Select City</td>
                                            <td>
                                                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" align="center">
                                                <asp:Button ID="Button2" runat="server" Text="Show" OnClick="Button2_Click" /></td>
                                        </tr>
                                    </table>
                                </center>
                                <br />
                                <h4>
                                    <asp:Label ID="Label2" runat="server" Text=""></asp:Label></h4>
                                <div style="width: 800px; height: 800px; overflow: auto;">
                                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                                        <AlternatingRowStyle BackColor="White" />

                                        <Columns>
                                            <asp:TemplateField HeaderText="Id">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="LinkButton2" runat="server" OnCommand="fp" CommandName='<%#Eval("pid")%>'><%#Eval("pid")%></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Name">
                                                <ItemTemplate>
                                                    <%#Eval("name")%>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="City">
                                                <ItemTemplate>
                                                    <%#Eval("city")%>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Mobile No">
                                                <ItemTemplate>
                                                    <%#Eval("mob_no")%>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Email Id">
                                                <ItemTemplate>
                                                    <%#Eval("e_id")%>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Address">
                                                <ItemTemplate>
                                                    <%#Eval("address")%>
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
                            <asp:WizardStep ID="WizardStep1" runat="server" Title="All Providers">
                                <center>
                                    <asp:Button ID="Button3" runat="server" Text="Show" OnClick="Button3_Click" />
                                </center>
                                <br />
                                <h4>
                                    <asp:Label ID="Label3" runat="server" Text=""></asp:Label></h4>
                                <div style="width: 800px; height: 800px; overflow: auto;">
                                    <asp:GridView ID="GridView3" runat="server" OnRowEditing="EditProvider" OnRowUpdating="UpdateProvider" OnRowCancelingEdit="CancelEdit" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                                        <AlternatingRowStyle BackColor="White" />

                                        <Columns>

                                            <asp:CommandField ShowEditButton="true" ControlStyle-CssClass="likbtn" HeaderText="Operation" />
                                            <asp:TemplateField HeaderText="Id">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="LinkButton3" runat="server" OnCommand="fp" Text='<%#Eval("pid")%>' CommandName='<%#Eval("pid")%>'><%#Eval("pid")%></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Name">
                                                <ItemTemplate>
                                                    <%#Eval("name")%>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="City">
                                                <ItemTemplate>
                                                    <%#Eval("city")%>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Mobile No">
                                                <ItemTemplate>
                                                    <%#Eval("mob_no")%>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Is FastFood">
                                                <ItemTemplate>
                                                    <%#Eval("is_fastfood") %>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="is_ff_tb" runat="server" Text='<%#Eval("is_fastfood") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>

                                            <%--<asp:TemplateField HeaderText="Email Id">
                                        <ItemTemplate>
                                            <%#Eval("e_id")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>--%>

                                            <asp:TemplateField HeaderText="Address">
                                                <ItemTemplate>
                                                    <%#Eval("address")%>
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

