<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="AppSetting.aspx.cs" Inherits="admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>App Setting</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>--%>


    <center>
        <h2>App Setting</h2>
        <br />
        <table class="style1">
            <tr>
                <td>Select Profile Image</td>
                <td class="style2">
                    <asp:FileUpload ID="ProfileImg" runat="server" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="3" align="center">
                    <asp:Button ID="ProfileImgSaveBtn" runat="server" Text="Save" OnClick="ProfileImgSaveBtn_Click" Style="height: 26px" />
                </td>
            </tr>
        </table>
        <br />
        <br />
        <h2>Application Home Images</h2>

        <table class="style1">
            <tr>
                <td>Select Home Image</td>
                <td class="style2">
                    <asp:FileUpload ID="AppHomeImage" runat="server" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="3" align="center">
                    <asp:Button ID="AppHomeImgSaveBtn" OnClick="AppHomeImgSaveBtn_Click" runat="server" Text="Save" Style="height: 26px" />
                </td>
            </tr>
        </table>
        <br />
        <div style="height: 300px; overflow: auto">
            <asp:GridView ID="AppHomeImgGv" runat="server" CellPadding="4" ForeColor="#333333"
                GridLines="None" Width="450px" Style="text-align: center" AutoGenerateColumns="false"
                OnRowEditing="EditAppHomeImg" OnRowUpdating="UpdateAppHomeImg" OnRowCancelingEdit="CancelEdit" OnRowDeleting="DeleteAppHomeImg">
                <AlternatingRowStyle BackColor="White" />

                <Columns>

                    <asp:TemplateField HeaderText="Id">
                        <ItemTemplate>
                            <asp:Label ID="AppHomeImgIdLbl" runat="server" Text='<%#Eval("Id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Image">
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("Image") %>' Height="100px" Width="100px" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:FileUpload ID="AppHomeEditImage" runat="server" />
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:CommandField ShowEditButton="true" ControlStyle-CssClass="likbtn" HeaderText="Operation" />
                    <asp:CommandField ShowDeleteButton="true" ControlStyle-CssClass="likbtn" HeaderText="Operation" />

                    <%--<asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkRemove" runat="server"
                                    CommandArgument = '<%# Eval("cat_id")%>'
                                    OnClientClick="return confirm('Do you want to delete?')"
                                    Text="Delete" OnClick="DeleteCat"></asp:LinkButton>
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
            </asp:GridView>
        </div>

        <br />
        <br />
        <h2>Vacation Details</h2>

        <asp:GridView ID="VacationDetailsGv" runat="server" CellPadding="4" ForeColor="#333333"
                GridLines="None" Width="450px" Style="text-align: center" AutoGenerateColumns="false"
                OnRowEditing="EditVacation" OnRowUpdating="UpdateVacation" OnRowCancelingEdit="CancelEditVacation">
                <AlternatingRowStyle BackColor="White" />

                <Columns>

                    <asp:TemplateField HeaderText="Id">
                        <ItemTemplate>
                            <asp:Label ID="VacFTIdLbl" runat="server" Text='<%#Eval("Id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>                   

                    <asp:TemplateField HeaderText="FoodType">
                        <ItemTemplate>
                            <%#Eval("IsVacation") %>
                        </ItemTemplate> 
                        <EditItemTemplate>
                            <asp:CheckBox ID="IsVactionChk" Checked='<%#Eval("IsVacation") %>' runat="server" />
                        </EditItemTemplate>                       
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="FoodType">
                        <ItemTemplate>
                            <%#Eval("BtnTxt") %>
                        </ItemTemplate>   
                        <EditItemTemplate>
                            <asp:TextBox ID="BtnTxtTb" Text='<%#Eval("BtnTxt") %>' runat="server"></asp:TextBox>
                        </EditItemTemplate>                     
                    </asp:TemplateField>

                    <asp:CommandField ShowEditButton="true" ControlStyle-CssClass="likbtn" HeaderText="Operation" />                   

                    <%--<asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkRemove" runat="server"
                                    CommandArgument = '<%# Eval("cat_id")%>'
                                    OnClientClick="return confirm('Do you want to delete?')"
                                    Text="Delete" OnClick="DeleteCat"></asp:LinkButton>
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
            </asp:GridView>

    </center>


    <%--            <asp:UpdateProgress ID="UpdateProgress1" runat="server" class="loading" AssociatedUpdatePanelID="UpdatePanel1" DisplayAfter="0" DynamicLayout="true">
                <ProgressTemplate>
                    <center>
                        <font style="color: White; font-size: 18px;">Please Wait....</font><br />
                        <br />
                        <img id="Img1" src="~/user/assets/img/loader.gif" runat="server" />
                    </center>
                </ProgressTemplate>
            </asp:UpdateProgress>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="ProfileImgSaveBtn" />            
        </Triggers>
    </asp:UpdatePanel>--%>
</asp:Content>

