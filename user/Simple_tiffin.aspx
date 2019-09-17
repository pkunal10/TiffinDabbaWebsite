<%@ Page Title="" Language="C#" MasterPageFile="~/user/user_without_slider.master" AutoEventWireup="true" CodeFile="Simple_tiffin.aspx.cs" Inherits="user_Simple_tiffin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <title>Tiffin Dabba | Simple Tiffin</title>
    <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
    <script>
        (adsbygoogle = window.adsbygoogle || []).push({
            google_ad_client: "ca-pub-5876502495073440",
            enable_page_level_ads: true
        });
    </script>

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
                        <p><span>Simple Tiffin List</span></p>
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
                                        <asp:Button ID="Button1" runat="server" CssClass="btn-inverse" OnClick="Button1_Click" Text="Go" />
                                    </div>
                                </div>
                            </fieldset>
                        </div>
                        <div class="span2"></div>
                    </div>
                    <div class="row">
                        <div class="span12 text-center">
                            <h3><b>
                                <asp:Label ID="Label1" runat="server" Text=""></asp:Label></b></h3>
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
                                                        <asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("st_image") %>' Height="342px" Width="342px" /></span><br />
                                                    <font><asp:Label ID="Label3" runat="server" Visible='<%#(Eval("sabji"))!="" %>' Font-Bold="true" Text='<%# "Sabji:- "+ Eval("sabji") %>'></asp:Label><%#(Eval("sabji"))!=""?"<br />":"" %> </font>
                                                    <font><asp:Label ID="Label2" runat="server" Visible='<%#(Eval("roti"))!="" %>' Font-Bold="true" Text='<%# "Roti:- "+ Eval("roti") %>'></asp:Label><%#(Eval("roti"))!=""?"<br />":"" %></font>
                                                    <font><strong>Dal/Kadi:- <%#Eval("dal") %></strong></font>
                                                    <br />
                                                    <font><strong>Chawal/Khichdi:- <%#Eval("chawal") %></strong></font>
                                                    <br />
                                                    <font><strong>Other:- <%#Eval("other") %></strong></font>
                                                    <br />
                                                    <p class="price">Price:- <%#Eval("price") %></p>
                                                    <asp:LinkButton ID="linkb1" runat="server" OnCommand="kj" CssClass="btn_own_order" Height="20px" Width="90px" CommandName='<%#Eval("available") + ";" + Eval("t_id") %>'><%#Eval("available")%> </asp:LinkButton>
                                                    <%--<asp:LinkButton ID="linkb1" runat="server" OnCommand ="kj" Enabled="false" CssClass="btn_own_order" Height="20px" Width="90px" CommandName='<%#Eval("available") + ";" + Eval("t_id") %>'>Diwali Vacation</asp:LinkButton>--%>
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

