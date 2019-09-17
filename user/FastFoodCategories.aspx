<%@ Page Title="" Language="C#" MasterPageFile="~/user/user_without_slider.master" AutoEventWireup="true" CodeFile="FastFoodCategories.aspx.cs" Inherits="user_FastFoodCategories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <title>Tiffin Dabba | Fast Food Categories</title>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <section class="homepage-slider" id="home-slider">
        <div class="flexslider">
            <ul class="slides">
                <!--<li>
							<img src="themes/images/carousel/salad_pasta.png" style="height:250px;width:1190px;" alt="" />
						</li>-->
                <li>
                    <img src="themes/images/carousel/tiffinslider_small.png" style="height: 250px; width: 1190px;" alt="" />
                    <div class="intro">
                        <h1>TIFFIN DABBA</h1>
                        <p><span>Fast Food Categories</span></p>
                    </div>
                </li>
            </ul>
        </div>
    </section>


    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <section class="main-content">
                <center><h3><asp:Label ID="InfoLbl" runat="server" Text=""></asp:Label></h3></center>
                <br />
                <div class="row">
                    <div class="span12">
                        <div class="span9">
                            <ul class="thumbnails listing-products">
                                <asp:Repeater ID="FFCategoryRptr" runat="server">
                                    <ItemTemplate>
                                        <li class="span3">
                                            <asp:LinkButton ID="FFCatLb" OnCommand="FFCatLb_Command" CommandName='<%#Eval("CategoryId") %>' runat="server">
                                                <div class="product-box">
                                                    <span class="sale_tag"></span>
                                                    <span>
                                                        <asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("Image") %>' Height="242px" Width="242px" /></span><br />
                                                    <font><strong><%#Eval("CategoryName") %></strong></font>
                                                    <br />
                                                    <font><strong><%#"("+Eval("NoOfDishes")+" Dishes)" %></strong></font>
                                                    <br />
                                                </div>
                                            </asp:LinkButton>
                                        </li>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </ul>
                        </div>
                    </div>
                </div>

            </section>


            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <asp:UpdateProgress ID="UpdateProgress1" runat="server" class="loading" AssociatedUpdatePanelID="UpdatePanel1" DisplayAfter="0" DynamicLayout="true">
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

