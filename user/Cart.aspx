<%@ Page Title="" Language="C#" MasterPageFile="~/user/user_without_slider.master" AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="user_Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Tiffin Dabba | Cart</title>
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
                            <span>Cart
                            </span>
                        </p>
                    </div>
                </li>
            </ul>
        </div>
    </section>

    <section class="header_text sub">
        <h4><span>Shopping Cart</span></h4>
    </section>

    <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">
        <ContentTemplate>
            <section class="main-content">
                <div class="row">
                    <div class="span9">
                        <h4 class="title"><span class="text"><strong>Your</strong> Cart</span></h4>
                        <h3 class="title text-center">
                            <asp:Label ID="empty_cart_lbl" runat="server" Text="Your Cart Is Empty"></asp:Label></h3>
                        <table class="table table-striped" id="cart_tbl">
                            <thead>
                                <tr>
                                    <th>Remove</th>
                                    <th>Image</th>
                                    <th>Product Name</th>
                                    <th>Quantity</th>
                                    <th>Unit Price</th>
                                    <th>Total</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%--<asp:Repeater ID="cart_rptr" runat="server" OnItemDataBound="rptItem_ItemDataBound">--%>
                                <asp:Repeater ID="cart_rptr" runat="server">

                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                <asp:Button ID="delete_btn" runat="server" Text="Delete" CssClass="btn-danger" OnCommand="delete_product_from_cart" CommandName='<%#Eval("product_id") %>' />
                                                <asp:Label ID="productId_lbl" runat="server" Text='<%#Eval("product_id") %>' Visible="false"></asp:Label>
                                                <asp:Label ID="ProviderIdLbl" runat="server" Text='<%#Eval("provider_id") %>' Visible="false"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Image ID="Image1" runat="server" Height="120px" Width="120px" ImageUrl='<%#Eval("image") %>' CssClass="img-circle" />
                                            </td>
                                            <td>
                                                <%#Eval("product_name") %>
                                                <asp:Label ID="ProductLbl" runat="server" Text='<%#Eval("product_name") %>' Visible="false"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="quntity_tb" CssClass="input-mini" Text="1" AutoPostBack="true" OnTextChanged="get_total_price" runat="server"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:Label ID="price_lbl" runat="server" Text='<%#Eval("DiscountedPrice").ToString()!=""?Eval("DiscountedPrice"):Eval("price") %>'></asp:Label> <%#Eval("DiscountedPrice").ToString()!=""?"<strike>"+"   "+Eval("price")+"  Rs."+"</strike> ("+(100-((Convert.ToInt32(Eval("DiscountedPrice"))*100)/Convert.ToInt32(Eval("price"))))+" % off )" :"" %> </td>
                                            <td>
                                                <asp:Label ID="total_lbl" runat="server" Text='<%#Eval("DiscountedPrice").ToString()!=""?Eval("DiscountedPrice"):Eval("price") %>'></asp:Label>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td><strong>
                                        <asp:Label ID="grand_total_lbl" runat="server" Text=""></asp:Label></strong></td>
                                </tr>
                            </tbody>
                        </table>
                        <p class="cart-total right">
                            <%-- <strong>Sub-Total</strong>:	$100.00<br>
                            <strong>Eco Tax (-2.00)</strong>: $2.00<br>--%>
                            <strong>Delivery Charge</strong>:
                            <asp:Label ID="del_charge_lbl" runat="server" Text=""></asp:Label><br>
                            <strong>Total</strong>:
                            <asp:Label ID="fin_total_lbl" runat="server" Text=""></asp:Label><br>
                        </p>
                        <p class="buttons center">
                            <%--<button class="btn" type="button">Update</button>
                            <button class="btn" type="button">Continue</button>--%>
                            <asp:Label ID="time_limit_warning_lbl" CssClass="label-warning blink_me" Font-Bold="true" Font-Size="Medium" runat="server" Text=""></asp:Label><br />
                            <asp:Button ID="checkout_btn" runat="server" CssClass="btn btn-inverse" Text="Checkout" OnClick="checkout_btn_Click"></asp:Button>
                        </p>
                    </div>
                </div>

                <asp:Panel ID="order_details_pnl" runat="server">
                    <div class="accordion-inner">
                        <center><h4 class="">Your Personal Details</h4></center>
                        <div class="row-fluid">
                            <div class="span1"></div>
                            <div class="span5">
                                <div class="control-group">
                                    <label class="control-label">Order Id</label>
                                    <div class="controls">
                                        <asp:Label ID="orderId_lbl" runat="server" CssClass="input-xlarge" Text=""></asp:Label>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">Mobile</label>
                                    <div class="controls">
                                        <asp:Label ID="mobile_lbl" runat="server" CssClass="input-xlarge" Text=""></asp:Label>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">Date</label>
                                    <div class="controls">
                                        <asp:Label ID="date_lbl" runat="server" CssClass="input-xlarge" Text=""></asp:Label>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">Select City</label>
                                    <div class="controls">
                                        <asp:DropDownList ID="city_dd" runat="server" AutoPostBack="true" OnSelectedIndexChanged="city_dd_SelectedIndexChanged"></asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <div class="span5">
                                <%--<h4>Your Address</h4>--%>
                                <div class="control-group">
                                    <label class="control-label">Name</label>
                                    <div class="controls">
                                        <asp:Label ID="name_lbl" runat="server" CssClass="input-xlarge" Text=""></asp:Label>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">Email ID:</label>
                                    <div class="controls">
                                        <asp:Label ID="email_lbl" runat="server" CssClass="input-xlarge" Text=""></asp:Label>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">Time</label>
                                    <div class="controls">
                                        <asp:Label ID="time_lbl" runat="server" CssClass="input-xlarge" Text=""></asp:Label>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">Select Area</label>
                                    <div class="controls">
                                        <asp:DropDownList ID="area_dd" runat="server" AutoPostBacktrue="true"></asp:DropDownList>
                                    </div>
                                </div>
                                <%--<div class="control-group">
                                    <label class="control-label"><span class="required">*</span> City:</label>
                                    <div class="controls">
                                        <input type="text" placeholder="" class="input-xlarge">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label"><span class="required">*</span> Post Code:</label>
                                    <div class="controls">
                                        <input type="text" placeholder="" class="input-xlarge">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label"><span class="required">*</span> Country:</label>
                                    <div class="controls">
                                        <select class="input-xlarge">
                                            <option value="1">Afghanistan</option>
                                            <option value="2">Albania</option>
                                            <option value="3">Algeria</option>
                                            <option value="4">American Samoa</option>
                                            <option value="5">Andorra</option>
                                            <option value="6">Angola</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label"><span class="required">*</span> Region / State:</label>
                                    <div class="controls">
                                        <select name="zone_id" class="input-xlarge">
                                            <option value="">--- Please Select --- </option>
                                            <option value="3513">Aberdeen</option>
                                            <option value="3514">Aberdeenshire</option>
                                            <option value="3515">Anglesey</option>
                                            <option value="3516">Angus</option>
                                            <option value="3517">Argyll and Bute</option>
                                        </select>
                                    </div>
                                </div>--%>
                            </div>
                            <div class="span1"></div>
                        </div>
                        <div class="row-fluid">
                            <div class="span4"></div>
                            <div class="span4">
                                <label class="control-label">Delivery Address</label>
                                <div class="controls">
                                    <asp:TextBox ID="address_tb" CssClass="input-xlarge" TextMode="MultiLine" runat="server"></asp:TextBox><br />
                                    <asp:LinkButton ID="ch_address_lb" runat="server" OnClick="ch_address_lb_Click" CssClass="likbtn">Change Address</asp:LinkButton>
                                </div>
                            </div>
                            <div class="span4"></div>
                        </div>
                        <div class="row-fluid">
                            <div class="span12 text-center">
                                <div class="controls">
                                    <asp:Button ID="cnfirmOrder_btn" CssClass="btn-inverse" runat="server" Text="Confirm Order" OnClick="cnfirmOrder_btn_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </asp:Panel>

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

