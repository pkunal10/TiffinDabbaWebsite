﻿<%@ Page Title="" Language="C#" MasterPageFile="~/user/user_without_slider.master" AutoEventWireup="true" CodeFile="View_tiffin_with_sweet_order.aspx.cs" Inherits="user_View_tiffin_with_sweet_order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <title>Tiffin Dabba | View Tiffin With Sweet Order</title>

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
								<p><span>Order Details Of Tiffin With Sweet</span></p>
							</div>
						</li>
					</ul>
				</div>			
			</section>
            
            <section class="header_text">
				 Below are your today's order details of Tiffin With Sweet....
				<!--<br/>Don't miss to use our cheap abd best bootstrap templates.-->
			</section>
    
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
            
            <section class="main-content">
				<div class="row">					
                    <div class="row">
                        <div class="span12 text-center">
                            <h3><b><asp:Label ID="Label1" runat="server" Text=""></asp:Label></b></h3>
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
                                                            <asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("tws_image") %>' Height="342px" Width="342px" /></span><br/>
									                    <font><strong>Order Id:- <asp:Label ID="Label8" runat="server" Text='<%#Eval("order_id")%>'></asp:Label></strong></font><br/>
                                                        <font><strong>Book For:- <%#Eval("book_for") %></strong></font><br/>
                                                        <font><strong>Date:- <%#Eval("date") %></strong></font><br/>
                                                        <font><strong>Time:- <%#Eval("time") %></strong></font><br/>
                                                        <font style="word-break:break-all;"><strong>Address:- <%#Eval("uadd") %></strong></font><br/>
                                                        <font><strong>Sabji:- <%#Eval("sabji") %></strong></font><br/>
									                    <font><strong>Roti:- <%#Eval("roti") %></strong></font><br />
                                                        <font><strong>Dal/Kadi:- <%#Eval("dal") %></strong></font><br />
                                                        <font><strong>Chawal/Khichdi:- <%#Eval("chawal") %></strong></font><br />
                                                        <font><strong>Sweet:- <%#Eval("sweet") %></strong></font><br />
                                                        <font><strong>Other:- <%#Eval("other") %></strong></font><br />
									                    <p class="price">Price:- <%#Eval("price") %></p>
                                                        <font><strong>Status:- <%#Eval("status") %></strong></font><br/>
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
