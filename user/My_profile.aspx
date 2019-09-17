<%@ Page Title="" Language="C#" MasterPageFile="~/user/user_without_slider.master" AutoEventWireup="true" CodeFile="My_profile.aspx.cs" Inherits="user_My_profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <title>Tiffin Dabba | My Profile</title>

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
								<p><span>My Profile</span></p>
							</div>
						</li>
					</ul>
				</div>			
			</section>
            
            <section class="header_text">
				 Here you can check your profile.
				<!--<br/>Don't miss to use our cheap abd best bootstrap templates.-->
			</section>
    
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
            
            <section class="main-content">
				<div class="row">
					<div class="span12 ">
                        <div class="span5"></div>
                        <div class="span3">
                            <fieldset>
								<div class="clearfix">									
									<div class="input">
							           <asp:Image ID="Image1" ImageUrl="~/user/themes/images/myprofile.gif" Height="100px" Width="150px" runat="server" /><br />
                                        <asp:Label ID="Label6" runat="server" CssClass="text-success" Font-Bold="true" Font-Size="17px" Text=""></asp:Label>			
									</div>
								</div>																
                         </fieldset>
                        </div>
                        <div class="span2"></div>
                    </div>
                       
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
							                <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
									    </div>
								    </div>

                                    <div class="clearfix">
								    	<label for="name"><span><strong>Address:</strong></span></label>
									    <div class="input">
							                <asp:Label ID="Label3" runat="server" style="word-break:break-all;" Text=""></asp:Label>
									    </div>
								    </div>

                                    <div class="clearfix">
								    	<label for="name"><span><strong>Mobile No:</strong></span></label>
									    <div class="input">
							                <asp:Label ID="Label4" runat="server" Text=""></asp:Label>
									    </div>
								    </div>

                                    <div class="clearfix">
								    	<label for="name"><span><strong>Email Id:</strong></span></label>
									    <div class="input">
							                <asp:Label ID="Label5" runat="server" Text=""></asp:Label>
									    </div>
								    </div>
                                </div>
                                <div class="span4"></div>
					        </div>
				        </div><br />
                    <div class="row">
                        <div class="span12">
                            <div class="span4"></div>
                            <div class="span4">
                                <font style="font-size:14px;font-weight:600">You want any changes in your profile..??</font>&nbsp;
                                <asp:LinkButton ID="LinkButton1" runat="server" CssClass="likbtn"  onclick="LinkButton1_Click">Click here</asp:LinkButton>
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

