<%@ Page Title="" Language="C#" MasterPageFile="~/provider/provider.master" AutoEventWireup="true" CodeFile="Tiffin_with_sweet_list.aspx.cs" Inherits="provider_Tiffin_with_sweet_list" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <title>Tiffin With Sweet List</title>
    <link href="assets/img/shortcut_icon.png" rel="shortcut icon">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>    
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>



     <div style="height:150px;">
    
        <div style="height:60px;width:1000px;border-bottom-style:dashed;border-bottom-width:1.5px;"><br />
                <font class="pagetitle">Tiffin With Sweet List</font>
        </div>
        <div style="height:90px;margin-top:22px;" class="text-justify">
        
        <font class="myprofile-description">

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            From this page you can see list of TIFFIN WITH SWEET you provide to our user.and you can update price and availability of perticular tiffin by clicking on tiffin id.
        
        </font>
        
        </div>
    
    </div>


    <div>
        <center>                
                <br />
                <br />

                <div style="height:650px;overflow:auto;padding:16px;">
                <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" 
                    GridLines="None" Width="795px" AutoGenerateColumns="False">
                    <AlternatingRowStyle BackColor="White" />

                        <Columns>

                        <asp:TemplateField HeaderText ="Tiffin Id">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" OnCommand="kj" CssClass="likbtn" CommandName='<%#Eval("t_id")%>'><%#Eval("t_id") %></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText ="Your City">
                            <ItemTemplate>
                                <%#Eval("p_city") %>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText ="Your Id">
                            <ItemTemplate>
                                <%#Eval("p_id") %>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText ="Your Name">
                            <ItemTemplate>
                                <%#Eval("p_name") %>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText ="Sabji">
                            <ItemTemplate>
                                <%#Eval("sabji") %>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText ="Roti">
                            <ItemTemplate>
                                <%#Eval("roti") %>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText ="Dal">
                            <ItemTemplate>
                                <%#Eval("dal") %>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText ="Chawal">
                            <ItemTemplate>
                                <%#Eval("chawal") %>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText ="Sweet">
                            <ItemTemplate>
                                <%#Eval("sweet") %>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText ="Price">
                            <ItemTemplate>
                                <%#Eval("price") %>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText ="Available">
                            <ItemTemplate>
                                <%#Eval("available") %>
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

