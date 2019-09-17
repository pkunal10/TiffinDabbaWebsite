<%@ Page Title="" Language="C#" MasterPageFile="~/user/user_without_slider.master" AutoEventWireup="true" CodeFile="Monthly_order.aspx.cs" Inherits="user_Monthly_order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <title>Tiffin Dabba | Monthly Order</title>

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
								<p><span>Monthly Order</span></p>
							</div>
						</li>
					</ul>
				</div>			
			</section>
            
            <section class="header_text">
				 CHECK AVAILAIBLITY..?? if you come under our service area only then you can get your TIFFIN at your doorsteps.Here you can book tiffin for 15 days or 30 days for lunch,dinner or both...so book your tiffin today and you will be served from tomorrow....what are you waiting for ??? HURRY UP !!! and book it now...
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
							            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" Width="150px" AutoPostBack="True" 
                                        onselectedindexchanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList>			
									</div>
								</div>
								
								<div class="clearfix">
									<label for="email"><span><strong>Select Area:</strong></span></label>
									<div class="input">
										<asp:DropDownList ID="DropDownList2" CssClass="form-control" Width="150px" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged1">
                                        </asp:DropDownList>
									</div>
								</div>
                         </fieldset>
                        </div>
                        <div class="span2"></div>
                    </div>
                    <div class="row">
                        <div class="span12 text-center">

                        </div>
                    </div>   
                        <div class="row">
                            <div class="span12">						
					            <div class="span9">								
						            <ul class="thumbnails listing-products">
                                        <asp:Repeater ID="Repeater1" runat="server">
                                            <ItemTemplate>
                                                <li class="span3">
								                    <div class="product-box">
									                    <span class="sale_tag"></span>												
									                    <span>
                                                            <asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("image") %>' Height="342px" Width="342px" /></span><br/>
									                    <font><strong>Sabji</strong></font><br/>
									                    <font><strong>Roti (<asp:Label ID="No_of_roti_lbl" runat="server" Text='<%#Eval("no_of_roti") %>'></asp:Label> Pc.)</strong></font><br />
                                                        <font><strong>Dal/Kadi</strong></font><br />
                                                        <font><strong>Chawal/Khichdi</strong></font><br />
                                                        <font><strong>Salad/Pickle</strong></font><br />
									                    <p class="price">Monthly Tiffin Price:- <asp:Label ID="Price_lbl"  runat="server" Text='<%#Eval("price") %>'></asp:Label> Rs.</p>
                                                        <p class="price">Trial Tiffin Price:- <asp:Label ID="Trial_price_lbl" runat="server" Text='<%#Eval("trial_price") %>'></asp:Label> Rs.</p>
                                                        <asp:Button ID="Book_now_btn" runat="server" CssClass="btn_own_order" Text="Book Monthly" OnCommand="Book_now_btn_Command" CommandName='<%#Eval("tiffin_id") %>'/>
                                                        <asp:Button ID="Book_trial_btn" runat="server" CssClass="btn_own_order" Text="Book Trial" OnCommand="Book_trial_btn_Command" CommandName='<%#Eval("tiffin_id") %>'/>
                                                        <%--<asp:Button ID="Book_now_btn" runat="server" CssClass="btn_own_order" Text="Diwali Vacation" Enabled="false" OnCommand="Book_now_btn_Command" CommandName='<%#Eval("tiffin_id") %>'/>
                                                        <asp:Button ID="Book_trial_btn" runat="server" CssClass="btn_own_order" Text="Diwali Vacation" Enabled="false" OnCommand="Book_trial_btn_Command" CommandName='<%#Eval("tiffin_id") %>'/>--%>
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

