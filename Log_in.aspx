<%@ Page Title="" Language="C#" MasterPageFile="~/user/user_with_out_links.master" AutoEventWireup="true" CodeFile="Log_in.aspx.cs" Inherits="Log_in" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <title>Tiffin Dabba | Login or Register</title>
    
    <script>
        window.fbAsyncInit = function () {
            FB.init({
                appId: '314922985609435',
                xfbml: true,
                version: 'v2.9'
            });
            FB.AppEvents.logPageView();
        };

        (function (d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) { return; }
            js = d.createElement(s); js.id = id;
            js.src = "//connect.facebook.net/en_US/sdk.js";
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));

        window.fbAsyncInit = function () {
            FB.init({
                appId: '314922985609435',
                xfbml: true,
                version: 'v2.8'
            });
            FB.AppEvents.logPageView();
        };

        (function (d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) { return; }
            js = d.createElement(s); js.id = id;
            js.src = "//connect.facebook.net/en_US/sdk.js";
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));
    </script>    

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <section class="header_text sub">
				<h4><span>Login or Register</span></h4>
    </section>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

    <section class="main-content">				
				<div class="row">
					<div class="span5">					
						<h4 class="title"><span class="text"><strong>Login</strong> Form</span></h4>
						
							
							<fieldset>
								<div class="control-group">
									<label class="control-label">Email Id</label>
									<div class="controls">
										<asp:TextBox ID="Email_login_tb" runat="server"></asp:TextBox>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Email Id"
                                                                                                                         Text="Enter Email Id" CssClass="text-error" Font-Bold="true" SetFocusOnError="true" ControlToValidate="Email_login_tb" ValidationGroup="login"></asp:RequiredFieldValidator>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Password</label>
									<div class="controls">
										<asp:TextBox ID="Password_login_tb" runat="server" TextMode="Password"></asp:TextBox>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Password"
                                                                                                                           Text="Enter Password" CssClass="text-error" SetFocusOnError="true" Font-Bold="true" ControlToValidate="Password_login_tb" ValidationGroup="login"></asp:RequiredFieldValidator>
                                                                                                                           <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Special Symbols Not Allowed"
                                                                                                                           Text="Special Symbols Not Allowed" ControlToValidate="Password_login_tb" ValidationExpression="^[0-9A-Za-z]*$"
                                                                                                                           CssClass="text-error" Font-Bold="true" SetFocusOnError="true"  ValidationGroup="login"></asp:RegularExpressionValidator>
									</div>
								</div>
								<div class="control-group">
                                        <asp:Label ID="Label1" runat="server" Text="" CssClass="text-warning" Font-Bold="true"></asp:Label><br />
									    <asp:Button ID="Login_btn" CssClass="btn-inverse btn-large" runat="server" ValidationGroup="login" 
                                        Text="Log In" OnClick="Login_btn_Click" />
									
									<p class="reset"><a tabindex="4" href="Forget_password.aspx" title="Recover your username or password" class="likbtn">Forget Password??</a></p>
								</div>
							</fieldset>
									
					</div>
                    <div class="span7">					
						<h4 class="title"><span class="text"><strong>Registration</strong> Form</span></h4>
						
							<fieldset>
								<div class="control-group">
									<label class="control-label">Name</label>
									<div class="controls">
										<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" SetFocusOnError="true" runat="server" Font-Bold="true" CssClass="text-warning" ErrorMessage="Enter Name"
                                                                                                      Text="Enter Name" ValidationGroup="ur" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
                                                                                                      <asp:RegularExpressionValidator ID="RegularExpressionValidator2" SetFocusOnError="true" runat="server" CssClass="text-warning" ErrorMessage="Alphabates Only"
                                                                                                      Text="Alphabates only" ValidationExpression="[a-zA-Z ]*$" ValidationGroup="ur" Font-Bold="true" ControlToValidate="TextBox1"></asp:RegularExpressionValidator>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Address:</label>
									<div class="controls">
										<asp:TextBox ID="TextBox2" runat="server" TextMode="MultiLine" Rows="4" Columns="27"></asp:TextBox>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" SetFocusOnError="true" ErrorMessage="Enter Address"
                                                                                                                                                 Text="Enter Address" CssClass="text-warning" Font-Bold="true" ValidationGroup="ur" ControlToValidate="TextBox2"></asp:RequiredFieldValidator>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label">Mobile No:</label>
									<div class="controls">
										<asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator5" Font-Bold="true" CssClass="text-warning" runat="server" SetFocusOnError="true" ErrorMessage="Enter Mobile No"
                                                                                                      Text="Enter Mobile No" ValidationGroup="ur" ControlToValidate="TextBox3"></asp:RequiredFieldValidator><br />
                                                                                                      <asp:RegularExpressionValidator ID="RegularExpressionValidator3" Font-Bold="true" CssClass="text-warning" runat="server" SetFocusOnError="true" ErrorMessage="Numbers Only"
                                                                                                      Text="Enter 10 Digit" ValidationExpression="^[0-9]{10}$" ValidationGroup="ur" ControlToValidate="TextBox3"></asp:RegularExpressionValidator>
									</div>
								</div>
                                <div class="control-group">
									<label class="control-label">Email Id:</label>
									<div class="controls">
										<asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" SetFocusOnError="true" ErrorMessage="Enter Email"
                                                                                                      Text="Enter Email" ValidationGroup="ur" ControlToValidate="TextBox4"></asp:RequiredFieldValidator><br />
                                                                                                      <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" SetFocusOnError="true" ErrorMessage="Enter Proper Email"
                                                                                                      Text="Enter Proper Email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="ur" ControlToValidate="TextBox4"></asp:RegularExpressionValidator>
									</div>
								</div>
                                <div class="control-group">
									<label class="control-label">Password:</label>
									<div class="controls">
										<asp:TextBox ID="TextBox5" runat="server" TextMode="Password"></asp:TextBox>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" Font-Bold="true" CssClass="text-warning" SetFocusOnError="true" ErrorMessage="Enter Password"
                                                                                                                          Text="Enter Password" ValidationGroup="ur" ControlToValidate="TextBox5"></asp:RequiredFieldValidator>
                                                                                                                          <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" 
                                                                                                                          ErrorMessage="Enter Alphabate & Numbers Only" Text="Enter Alphabate & Numbers Only" SetFocusOnError="true" Font-Bold="true" CssClass="text-warning" ValidationExpression="^[0-9A-Za-z]*$" 
                                                                                                                          ControlToValidate="TextBox5" ValidationGroup="ur"></asp:RegularExpressionValidator>
									</div>
								</div>
                                <div class="control-group">
									<label class="control-label">Confirm Password:</label>
									<div class="controls">
										<asp:TextBox ID="TextBox9" runat="server" TextMode="Password"></asp:TextBox>&nbsp;<asp:CompareValidator ID="CompareValidator1" runat="server" SetFocusOnError="true" ErrorMessage="Password Does't Match"
                                                                                                                          Text="Password Does't Match" Font-Bold="true" CssClass="text-warning" ControlToCompare="TextBox5" ControlToValidate="TextBox9" ValidationGroup="ur"></asp:CompareValidator>
									</div>
								</div>							                            
								
								<hr>
								<div class="actions">
                                    <%--<asp:Button ID="fb_login_btn" CssClass="loginBtn loginBtn--facebook" runat="server" Text="Register with facebook" OnClick="fb_login_btn_Click" />--%>
                                    <asp:Button ID="Button2" runat="server" Text="Register"
                                     ValidationGroup="ur" CssClass="btn-inverse btn-large" OnClick="Button2_Click" />
								</div>
							</fieldset>
										
					</div>				
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

