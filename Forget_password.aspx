<%@ Page Title="" Language="C#" MasterPageFile="~/user/user_with_out_links.master" AutoEventWireup="true" CodeFile="Forget_password.aspx.cs" Inherits="Forget_password" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <title>Tiffin Dabba | Forget Pssword</title>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <section class="header_text sub">
				<h4><span>Forget Password</span></h4>
               Enter the e-mail address associated with your account. Click submit to have your password e-mailed to you.
    </section>
    
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <section class="main-content">
                <div class="row">
                    <div class="span5"></div>
                    <div class="span2">
                        <fieldset>
								<div class="control-group">
									<label class="control-label">Email Id</label>
									<div class="controls">
										<asp:TextBox ID="TextBox1" runat="server" CssClass="txtbox"></asp:TextBox>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" SetFocusOnError="true" Font-Bold="true" ErrorMessage="Enter Email Id"
                                                                                                                        Text="Enter Email Id" CssClass="text-warning" ControlToValidate="TextBox1" ValidationGroup="forget"></asp:RequiredFieldValidator>
									</div>
								</div>

                                <div class="control-group">
                                      <asp:Button ID="Button1" CssClass="btn-inverse" runat="server" ValidationGroup="forget" 
                                      Text="Submit" onclick="Button1_Click" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="Button2" CssClass="btn-inverse" runat="server" Text="Log In" 
                                    onclick="Button2_Click" />
								</div>
                        </fieldset>
                    </div>
                    <div class="span5"></div>
                </div>
            </section>

    <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <asp:UpdateProgress ID="UpdateProgress1" runat="server" class="loading" AssociatedUpdatePanelID="UpdatePanel1" DisplayAfter="0" DynamicLayout ="true">
            <ProgressTemplate>
                <center>
                    <font style="color:White;font-size:18px;">Please Wait....</font><br /><br />
                    <img id="Img1" src="~/user/themes/images/loader.gif" runat="server" />
                </center>
            </ProgressTemplate>
        </asp:UpdateProgress>
        </ContentTemplate>
        </asp:UpdatePanel> 

</asp:Content>

