<%@ Page Title="" Language="C#" MasterPageFile="~/user/user_without_slider.master" AutoEventWireup="true" CodeFile="SpecialTiffin.aspx.cs" Inherits="user_SpecialTiffin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <title>Tiffin Dabba | Simple Tiffin</title> 

    <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
    <script>
        (adsbygoogle = window.adsbygoogle || []).push({
            google_ad_client: "ca-pub-5876502495073440",
            enable_page_level_ads: true
        });
    </script>

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
								<p><span>Special Tiffin List</span></p>
							</div>
						</li>
					</ul>
				</div>			
			</section>
            
            <section class="header_text">
				 CHECK AVAILAIBLITY..?? if you come under our service area only then you can get your TIFFIN at your doorsteps...
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
									<label for="name"><span><strong>Select City:</strong></span></label>
									<div class="input">
							            <asp:DropDownList ID="CityDD" runat="server" CssClass="form-control" Width="150px" AutoPostBack="True" 
                                        OnSelectedIndexChanged="CityDD_SelectedIndexChanged"></asp:DropDownList>			
									</div>
								</div>
								
								<div class="clearfix">
									<label for="email"><span><strong>Select Area:</strong></span></label>
									<div class="input">
										<asp:DropDownList ID="AreaDD" runat="server" CssClass="form-control" Width="150px" AutoPostBack="True" 
                                        OnSelectedIndexChanged="AreaDD_SelectedIndexChanged"></asp:DropDownList>
									</div>
								</div>
								
								<div class="clearfix">
									<div class="input">
										<asp:Button ID="GoBtn" runat="server" OnClick="GoBtn_Click" CssClass="btn-inverse" Text="Go" />
									</div>
								</div>
                         </fieldset>
                        </div>
                        <div class="span2"></div>
                    </div>
                    <div class="row">
                        <div class="span12 text-center">
                            <h3><b><asp:Label ID="InfoLbl" runat="server" Text=""></asp:Label></b></h3>
                        </div>
                    </div>   
                        <div class="row">
                            <div class="span12">						
					            <div class="span9">								
						            <ul class="thumbnails listing-products">
                                        <asp:Repeater ID="SpecialTiffinRptr" runat="server">
                                            <ItemTemplate>
                                                <li class="span3">
								                    <div class="product-box">
									                    <span class="sale_tag"></span>												
									                    <span>
                                                            <asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("Image") %>' Height="242px" Width="342px" /></span><br/>
									                    <font><%#Eval("TiffinName") %></font><br /> 
                                                        <font style="font-size:12px;">Booking Time:- (<%#Eval("StartTime") %> to <%#Eval("EndTime") %>)</font> <br />
                                                        <font><asp:Label ID="Label2" runat="server" Visible='<%#(Eval("Description"))!="" %>' Font-Bold="true" Text='<%#Eval("Description") %>'></asp:Label><%#(Eval("Description"))!=""?"<br />":"" %></font>                                                        
									                    <p class="price">Price:- <%#Eval("Price") %></p>
                                                        <%--<asp:LinkButton ID="linkb1" runat="server" OnCommand ="kj" CssClass="btn_own_order" Height="20px" Width="90px" CommandName='<%#Eval("available") + ";" + Eval("t_id") %>'><%#Eval("available")%> </asp:LinkButton>--%>
                                                        <asp:LinkButton ID="BookBtn" OnCommand="BookBtn_Command" runat="server" CssClass="btn_own_order" Height="25px" Width="90px" CommandArgument='<%#Eval("TiffinId")%>'>Book</asp:LinkButton>
								                    </div>
							                    </li>
                                            </ItemTemplate>
                                        </asp:Repeater>       
						            </ul>								
					            </div>
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

