<%@ Page Title="" Language="C#" MasterPageFile="~/user/user_without_slider.master" AutoEventWireup="true" CodeFile="fast_food_products.aspx.cs" Inherits="user_fast_food_products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Tiffin Dabba | Fast Food Products</title>

    <%--<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>--%>
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
                        <p>
                            <span>
                                <asp:Label ID="product_name_lbl" runat="server" Text=""></asp:Label>List</span>
                        </p>
                    </div>
                </li>
            </ul>
        </div>
    </section>

    <section class="header_text">
        <center><h2><asp:Label ID="product_name_lbl2" runat="server" Text=""></asp:Label></h2></center>
        CHECK AVAILAIBLITY..?? if you come under our service area only then you can get your Order at your doorsteps...
				<!--<br/>Don't miss to use our cheap abd best bootstrap templates.-->
    </section>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <section class="main-content">
                <%--<div class="row">
                    <div class="span12 ">
                        <div class="span5"></div>
                        <div class="span3">
                            <fieldset>
                                <div class="clearfix">
                                    <label for="name"><span><strong>Select City:</strong></span></label>
                                    <div class="input">
                                        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" Width="150px" AutoPostBack="True"
                                            OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </div>
                                </div>

                                <div class="clearfix">
                                    <label for="email"><span><strong>Select Area:</strong></span></label>
                                    <div class="input">
                                        <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control" Width="150px" AutoPostBack="True"
                                            OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </div>
                                </div>

                                <div class="clearfix">
                                    <div class="input">
                                        <asp:Button ID="Button1" runat="server" CssClass="btn-inverse" Text="Go" OnClick="Button1_Click" />
                                    </div>
                                </div>
                            </fieldset>
                        </div>
                        <div class="span2"></div>
                    </div>--%>
                <div class="row">
                    <div class="span12 text-center">
                        <h3><b>
                            <asp:Label ID="Label1" runat="server" Text=""></asp:Label></b></h3>
                        <asp:Label ID="time_limit_warning_lbl" CssClass="label-warning blink_me" Font-Bold="true" Font-Size="Medium" runat="server" Text=""></asp:Label><br />
                    </div>
                </div>
                <div class="row">
                    <div class="span12">
                        <div class="span9"></div>
                        <div class="span2">
                            <%--<script type="text/javascript">
                                $(function () {
                                    $('.search_textbox').each(function (i) {
                                        $(this).quicksearch("[id*=fast_food_products_list_rptr] ", {
                                            'testQuery': function (query, txt, row) {
                                                return $(row).children(":eq(" + i + ")").text().toLowerCase().indexOf(query[0].toLowerCase()) != -1;
                                            }
                                        });
                                    });
                                });
                                </script>--%>
                            <asp:TextBox ID="SearchTb" placeholder="Search" runat="server"></asp:TextBox>
                            <asp:Button ID="SearchBtn" CssClass="btn-inverse" OnClick="SearchBtn_ServerClick" runat="server" Text="Search" />
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="span12">
                        <div class="span9">
                            <ul class="thumbnails listing-products">
                                <asp:Repeater ID="fast_food_products_list_rptr" runat="server">
                                    <ItemTemplate>
                                        <li class="span3">
                                            <div class="product-box">
                                                <span class="sale_tag"></span>
                                                <span>
                                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("Image") %>' Height="342px" Width="342px" /></span><br />
                                                <font> <i> Booking Time:- <%#Eval("StartTime") %> to <%#Eval("EndTime") %></i> </font><br />
                                                <font><strong>Name:- <%#Eval("ProductName") %></strong></font>
                                                <br />
                                                <font style="word-break: break-all;"><%#Eval("Description")!=""?"Description:- "+Eval("Description"):"" %></font>
                                                <%#Eval("Description")!=""?"<br>":"" %>
                                                <%--<font><strong>Dal/Kadi:- <%#Eval("dal") %></strong></font>
                                                    <br />
                                                    <font><strong>Chawal/Khichdi:- <%#Eval("chawal") %></strong></font>
                                                    <br />
                                                    <font><strong>Other:- <%#Eval("other") %></strong></font>
                                                    <br />--%>
                                                <p class="price">Price:- <%#Eval("DiscountedPrice").ToString()!="" ? Eval("DiscountedPrice")+" Rs." : Eval("Price")+" Rs." %>  <%#Eval("DiscountedPrice").ToString()!=""?"<strike>"+"   "+Eval("Price")+"  Rs."+"</strike> ("+(100-((Convert.ToInt32(Eval("DiscountedPrice"))*100)/Convert.ToInt32(Eval("Price"))))+" % off )" :"" %></p>
                                                <asp:LinkButton ID="linkb1" runat="server" CssClass="btn_own_order" Height="20px" CommandName='<%#Eval("ProductId") %>' OnCommand="AddToCart" Width="90px">Add To Cart</asp:LinkButton>
                                                <%--<asp:LinkButton ID="linkb1" runat="server" Enabled="false" CssClass="btn_own_order" Height="20px" CommandName='<%#Eval("product_id") %>' OnCommand="AddToCart" Width="90px">Diwali Vacation</asp:LinkButton>--%>
                                            </div>
                                        </li>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </ul>
                        </div>
                    </div>
                </div>
                <br />
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

