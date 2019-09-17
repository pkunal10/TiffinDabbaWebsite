<%@ Page Title="" Language="C#" MasterPageFile="~/user/user_without_slider.master" AutoEventWireup="true" CodeFile="Update_profile.aspx.cs" Inherits="user_Update_profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <title>Tiffin Dabba | Update Profile</title>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <section  class="homepage-slider" id="home-slider">
				<div class="flexslider">
					<ul class="slides">
						<!--<li>
							<img src="themes/images/carousel/salad_pasta.png" style="height:250px;width:1190px;" alt="" />
						</li>-->
						<li>
							<img src="themes/images/carousel/tiffinslider_small.png" style="height:250px;width:1190px;" alt="" />
							<div class="intro">
								<h1>TIFFIN DABBA</h1>
								<p><span>Update Profile</span></p>
							</div>
						</li>
					</ul>
				</div>			
			</section>
            
            <section class="header_text">
				 From this page you can update your profile.this page provide Dynamic behavior to your profile.from this page you can also change your password.to do so you 
                 can click Change Password link given below and change your password.
				<!--<br/>Don't miss to use our cheap abd best bootstrap templates.-->
			</section>
    
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
            
            <section class="main-content">
				<div class="row">
                       
                        <div class="row">
                            <div class="span12">						
					            <div class="span5"></div>
                                <div class="span3">
                                    <%--<div class="clearfix">
								    	<label for="name"><span><strong>Id:</strong></span></label>
									    <div class="input">
							                <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
									    </div>
								    </div>--%>

                                    <div class="clearfix">
								    	<label for="name"><span><strong>Name:</strong></span></label>
									    <div class="input">
							                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="text-warning" runat="server" SetFocusOnError="true" ErrorMessage="Enter Name"
                                            Text="Enter Name" ValidationGroup="uup" ControlToValidate="TextBox1"></asp:RequiredFieldValidator><br />
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" SetFocusOnError="true" CssClass="text-warning" runat="server" ErrorMessage="Alphabates Only"
                                            Text="Alphabates Only" ControlToValidate="TextBox1" ValidationExpression="[a-zA-Z ]*$" ValidationGroup="uup"></asp:RegularExpressionValidator>
									    </div>
								    </div>

                                    <div class="clearfix">
								    	<label for="name"><span><strong>Address:</strong></span></label>
									    <div class="input">
							                <asp:TextBox ID="TextBox4" runat="server" TextMode="MultiLine" Rows="4" Columns="27"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" SetFocusOnError="true" ErrorMessage="Enter Address"
                                            Text="Enter Address" ValidationGroup="uup" CssClass="text-warning" ControlToValidate="TextBox4"></asp:RequiredFieldValidator>
									    </div>
								    </div>

                                    <div class="clearfix">
								    	<label for="name"><span><strong>Mobile No:</strong></span></label>
									    <div class="input">
							                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" SetFocusOnError="true" ErrorMessage="Enter Mobile No"
                                            Text="Enter Mobile No" ValidationGroup="uup" CssClass="text-warning" ControlToValidate="TextBox2"></asp:RequiredFieldValidator><br />
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" SetFocusOnError="true" ErrorMessage="Numbers Only"
                                            Text="Enter 10 Digits" ControlToValidate="TextBox2" CssClass="text-warning" ValidationExpression="^[0-9]{10}$" ValidationGroup="uup"></asp:RegularExpressionValidator>
									    </div>
								    </div>

                                    <div class="clearfix">
								    	<label for="name"><span><strong>Email Id:</strong></span></label>
									    <div class="input">
							                <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
									    </div>
								    </div>

                                    <div class="clearfix">
								    	
									    <div class="input">
							                <asp:Button ID="Button1" CssClass="btn-inverse" runat="server" Text="Update" onclick="Button1_Click" ValidationGroup="uup" />
									    </div>
								    </div>
                                </div>
                                <div class="span4"></div>
					        </div>
				        </div><br />
                    <div class="row">
                        <div class="span12">
                            <div class="span5"></div>
                            <div class="span3">
                                <asp:LinkButton ID="LinkButton1" runat="server" CssClass="likbtn" onclick="LinkButton1_Click" >Change Password</asp:LinkButton>
                            </div>
                            <div class="span4"></div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="span12">
                            <div class="span5"></div>
                            <div class="span3">
                                <asp:Panel ID="Panel1" runat="server">
                                    <div class="clearfix">
								    	<label for="name"><span><strong>Enter Current Password:</strong></span></label>
									    <div class="input">
							                <asp:TextBox ID="TextBox5" runat="server" TextMode="Password"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Password"
                                            Text="Enter Password" ValidationGroup="ucpcp" CssClass="text-warning" Font-Bold="true" SetFocusOnError="true" ControlToValidate="TextBox5"></asp:RequiredFieldValidator>
									    </div>
								    </div>
                                    <div class="clearfix">
									    <div class="input">
							                <asp:Button ID="Button2" CssClass="btn-inverse" runat="server" Text="Submit" onclick="Button2_Click" ValidationGroup="ucpcp" />
									    </div>
								    </div>
                                </asp:Panel>
                            </div>
                            <div class="span4"></div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="span12">
                            <div class="span5"></div>
                            <div class="span3">
                                <asp:Panel ID="Panel2" runat="server">
                                    <div class="clearfix">
								    	<label for="name"><span><strong>Enter New Password:</strong></span></label>
									    <div class="input">
							                <asp:TextBox ID="TextBox6" runat="server" TextMode="Password"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" SetFocusOnError="true" CssClass="text-warning" runat="server" ErrorMessage="Enter Password"
                                            Text="Enter Password" ControlToValidate="TextBox6" ValidationGroup="ucp"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" CssClass="text-warning" SetFocusOnError="true" runat="server" ErrorMessage="Special Symbols Not Allowed"
                                            Text="Special Symbols Not Allowed" ControlToValidate="TextBox6" ValidationExpression="^[0-9A-Za-z]*$"
                                            ValidationGroup="ucp"></asp:RegularExpressionValidator>
                                            <%--<asp:PasswordStrength ID="TextBox6_PasswordStrength" runat="server" 
                                            Enabled="True" TargetControlID="TextBox6">
                                            </asp:PasswordStrength>--%>
									    </div>
								    </div>
                                    <div class="clearfix">
								    	<label for="name"><span><strong>Confirm New Password:</strong></span></label>
									    <div class="input">
							                <asp:TextBox ID="TextBox7" runat="server" TextMode="Password"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" CssClass="text-warning" SetFocusOnError="true" runat="server" ErrorMessage="Enter Confirm Password"
                                            Text="Enter Confirm Password" ControlToValidate="TextBox7" ValidationGroup="ucp"></asp:RequiredFieldValidator><br />
                                            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password Is Not Matched" CssClass="text-warning" SetFocusOnError="true"
                                            Text="Password Is Not Matched" ValidationGroup="ucp" ControlToCompare="TextBox6" ControlToValidate="TextBox7"></asp:CompareValidator>
									    </div>
								    </div>
                                    <div class="clearfix">
									    <div class="input">
							                <asp:Button ID="Button3" CssClass="btn-inverse" runat="server" Text="Change" ValidationGroup="ucp" onclick="Button3_Click" />
									    </div>
								    </div>
                                </asp:Panel>
                            </div>
                            <div class="span4"></div>
                        </div>
                    </div>
						<br/>					
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

