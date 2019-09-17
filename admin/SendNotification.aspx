<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="SendNotification.aspx.cs" Inherits="admin_SendNotification" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <title>Add Update Specal Tiffin</title>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

            <!-- Form -->
            <h3 class="tit">Send Notification</h3>
            <fieldset>
                <legend>Send Notification</legend>
                <table class="nostyle">
                    <tr>
                        <td style="width: 120px;">Title:</td>
                        <td>
                            <asp:TextBox ID="TitleTb" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Message:</td>
                        <td>
                            <asp:TextBox ID="MsgTb" Columns="65" Rows="7" TextMode="MultiLine" CssClass="input-text" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Offer:</td>
                        <td>
                            <asp:CheckBox ID="OfferChk" AutoPostBack="true" OnCheckedChanged="OfferChk_CheckedChanged" runat="server" />
                        </td>
                    </tr>
                    <asp:Panel ID="OfferPnl" Visible="false" runat="server">
                        <tr>
                            <td>Category:</td>
                            <td>
                                <asp:DropDownList ID="CatDD" OnSelectedIndexChanged="CatDD_SelectedIndexChanged" AutoPostBack="true" runat="server"></asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>Product:</td>
                            <td>
                                <asp:DropDownList ID="ProductDD" runat="server"></asp:DropDownList>
                            </td>
                        </tr>
                    </asp:Panel>                   
                    <tr>
                        <td colspan="2" class="t-right">
                            <asp:Button ID="SendBtn" CssClass="input-submit" OnClick="SendBtn_Click" runat="server" ValidationGroup="SPT" Text="Send" />
                        </td>
                    </tr>
                </table>

                <div style="height: 600px; overflow: auto">
                    <center>
                        <asp:GridView ID="UserListGv" runat="server" CellPadding="4" ForeColor="#333333"
                            GridLines="None" Width="200px" Style="text-align: center" AutoGenerateColumns="false">
                            <AlternatingRowStyle BackColor="White" />

                            <Columns>
                                <asp:TemplateField HeaderText="User Id" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="UserIdLbl" runat="server" Text='<%#Eval("id") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Name">
                                    <ItemTemplate>
                                        <%#Eval("name") %>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        <asp:CheckBox ID="checkAll" runat="server" onclick="checkAll(this);" />
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="CheckBox1" runat="server" onclick="Check_Click(this)" />
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

                    </center>
                </div>
            </fieldset>


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

    <script type="text/javascript">
        function checkAll(objRef) {
            var GridView = objRef.parentNode.parentNode.parentNode;
            var inputList = GridView.getElementsByTagName("input");
            for (var i = 0; i < inputList.length; i++) {
                //Get the Cell To find out ColumnIndex
                var row = inputList[i].parentNode.parentNode;
                if (inputList[i].type == "checkbox" && objRef != inputList[i]) {
                    if (objRef.checked) {
                        //If the header checkbox is checked
                        //check all checkboxes
                        //and highlight all rows
                        row.style.backgroundColor = "aqua";
                        inputList[i].checked = true;
                    }
                    else {
                        //If the header checkbox is checked
                        //uncheck all checkboxes
                        //and change rowcolor back to original
                        if (row.rowIndex % 2 == 0) {
                            //Alternating Row Color
                            row.style.backgroundColor = "#C2D69B";
                        }
                        else {
                            row.style.backgroundColor = "white";
                        }
                        inputList[i].checked = false;
                    }
                }
            }
        }
    </script>

</asp:Content>

