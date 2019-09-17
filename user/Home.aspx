<%@ Page Title="" Language="C#" MasterPageFile="~/user/user_withslider.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="user_Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <title>Tiffin Dabba</title>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <section class="header_text">
        <strong>-: ORDER TIMMING FOR TIFFIN :-</strong>  Lunch :- Same day before <strong>
            <asp:Label ID="Lunch_time_lbl" runat="server"></asp:Label>.  </strong>Dinner :- Same day before <strong>
                <asp:Label ID="Dinner_time_lbl" runat="server"></asp:Label>.</strong>
        <br />
        <%--<strong>-: ORDER TIMMING FOR FASTFOOD :-</strong>  You can book Fast Food From <strong>
            <asp:Label ID="StartFFTimeLbl" runat="server"></asp:Label>.  </strong>to <strong>
                <asp:Label ID="EndFFTimeLbl" runat="server"></asp:Label>.</strong>--%>
        <strong>-: ORDER TIMMING FOR FASTFOOD :-</strong>  It is mention with every products.
        <br />
        <hr>
        <strong>-: DELIVERY TIMMING :-</strong>  Lunch :- get your Lunch between <strong>12:00 PM </strong>to <strong>01:30 PM. </strong>Dinner :- get your Dinner between <strong>07:00 PM </strong>to <strong>08:30 PM.</strong>
    </section>

    <section class="main-content">
        <div class="row">
            <div class="span12">
                <div class="row">
                    <div class="span12">
                        <h4 class="title">
                            <span class="pull-left"><span class="text"><span class="line">Feature <strong>Products</strong></span></span></span>
                            <span class="pull-right">
                                <a class="left button" href="#myCarousel" data-slide="prev"></a><a class="right button" href="#myCarousel" data-slide="next"></a>
                            </span>
                        </h4>
                        <div id="myCarousel" class="myCarousel carousel slide">
                            <div class="carousel-inner">
                                <div class="active item">
                                    <ul class="thumbnails">

                                        <li class="span3">
                                            <a href="Simple_tiffin.aspx" class="title">
                                                <div class="product-box">
                                                    <span class="sale_tag"></span>
                                                    <p>
                                                        <img src="themes/images/home_images/khichdi-kadhi2.jpg" style="height: 270px; width: 300px;" alt="" />
                                                    </p>
                                                    <b>Vagareli Khichdi<br />
                                                        Kadhi OR Chas</b>
                                                    <p class="price">40 Rs.</p>
                                                </div>
                                            </a>
                                        </li>

                                        <a href="fast_food_products.aspx?cat_id=12" class="title">
                                            <li class="span3">
                                                <div class="product-box">
                                                    <span class="sale_tag"></span>
                                                    <p>
                                                        <img src="themes/images/home_images/FrenchFries.jpg" style="height: 270px; width: 300px;" alt="" />
                                                    </p>
                                                    <b>Small Eats</b><br />
                                                    <%--<p class="price">$32.50</p>--%>
                                                </div>
                                            </li>
                                        </a>
                                        <a href="fast_food_products.aspx?cat_id=5" class="title">
                                            <li class="span3">
                                                <div class="product-box">
                                                    <p>
                                                        <img src="themes/images/home_images/SpicyPannerPizza.jpg" style="height: 270px; width: 300px;" alt="" />
                                                    </p>
                                                    <b>Pizza</b>
                                                    <%--<a href="products.html" class="category">Quis nostrud</a>
														<p class="price">$14.20</p>--%>
                                                </div>
                                            </li>
                                        </a>
                                        <a href="fast_food_products.aspx?cat_id=10" class="title">
                                            <li class="span3">
                                                <div class="product-box">
                                                    <p>
                                                        <img src="themes/images/home_images/Cheese-Sandwich.jpg" style="height: 270px; width: 300px;" alt="" />
                                                    </p>
                                                    <b>Sandwiches</b>
                                                    <%--<a href="products.html" class="category">Quis nostrud</a>
														<p class="price">$14.20</p>--%>
                                                </div>
                                            </li>
                                        </a>
                                    </ul>
                                </div>
                                <div class="item">
                                    <ul class="thumbnails">

                                        <li class="span3">
                                            <a href="fast_food_products.aspx?cat_id=2" class="title">
                                                <div class="product-box">
                                                    <p>
                                                        <img src="themes/images/home_images/cafe_frappe.jpg" style="height: 270px; width: 300px;" alt="" />
                                                    </p>
                                                    <b>Cold Coffee</b>
                                                    <%--<a href="products.html" class="category">Quis nostrud</a>
														<p class="price">$14.20</p>--%>
                                                </div>
                                            </a>
                                        </li>

                                        <a href="fast_food_products.aspx?cat_id=1" class="title">
                                            <li class="span3">
                                                <div class="product-box">
                                                    <p>
                                                        <img src="themes/images/home_images/Cafe-Mocha.jpg" style="height: 270px; width: 300px;" alt="" />
                                                    </p>
                                                    <b>Hot Coffee</b>
                                                    <%--<a href="products.html" class="category">Quis nostrud</a>
														<p class="price">$14.20</p>--%>
                                                </div>
                                            </li>
                                        </a>
                                        <a href="fast_food_products.aspx?cat_id=3" class="title">
                                            <li class="span3">
                                                <div class="product-box">
                                                    <p>
                                                        <img src="themes/images/home_images/KitKatShake.jpg" style="height: 270px; width: 300px;" alt="" />
                                                    </p>
                                                    <b>Choco Shakes</b>
                                                    <%--<a href="products.html" class="category">Quis nostrud</a>
														<p class="price">$14.20</p>--%>
                                                </div>
                                            </li>
                                        </a>
                                        <a href="fast_food_products.aspx?cat_id=7" class="title">
                                            <li class="span3">
                                                <div class="product-box">
                                                    <p>
                                                        <img src="themes/images/home_images/veg-burger.png" style="height: 270px; width: 300px;" alt="" />
                                                    </p>
                                                    <b>Burger</b>
                                                    <%--<a href="products.html" class="category">Quis nostrud</a>
														<p class="price">$14.20</p>--%>
                                                </div>
                                            </li>
                                        </a>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <br />
                <!-- <div class="row">
							<div class="span12">
								<h4 class="title">
									<span class="pull-left"><span class="text"><span class="line">Latest <strong>Products</strong></span></span></span>
									<span class="pull-right">
										<a class="left button" href="#myCarousel-2" data-slide="prev"></a><a class="right button" href="#myCarousel-2" data-slide="next"></a>
									</span>
								</h4>
								<div id="myCarousel-2" class="myCarousel carousel slide">
									<div class="carousel-inner">
										<div class="active item">
											<ul class="thumbnails">												
												<li class="span3">
													<div class="product-box">
														<span class="sale_tag"></span>
														<p><a href="product_detail.html"><img src="themes/images/cloth/bootstrap-women-ware2.jpg" alt="" /></a></p>
														<a href="product_detail.html" class="title">Ut wisi enim ad</a><br/>
														<a href="products.html" class="category">Commodo consequat</a>
														<p class="price">$25.50</p>
													</div>
												</li>
												<li class="span3">
													<div class="product-box">
														<p><a href="product_detail.html"><img src="themes/images/cloth/bootstrap-women-ware1.jpg" alt="" /></a></p>
														<a href="product_detail.html" class="title">Quis nostrud exerci tation</a><br/>
														<a href="products.html" class="category">Quis nostrud</a>
														<p class="price">$17.55</p>
													</div>
												</li>
												<li class="span3">
													<div class="product-box">
														<p><a href="product_detail.html"><img src="themes/images/cloth/bootstrap-women-ware6.jpg" alt="" /></a></p>
														<a href="product_detail.html" class="title">Know exactly turned</a><br/>
														<a href="products.html" class="category">Quis nostrud</a>
														<p class="price">$25.30</p>
													</div>
												</li>
												<li class="span3">
													<div class="product-box">
														<p><a href="product_detail.html"><img src="themes/images/cloth/bootstrap-women-ware5.jpg" alt="" /></a></p>
														<a href="product_detail.html" class="title">You think fast</a><br/>
														<a href="products.html" class="category">World once</a>
														<p class="price">$25.60</p>
													</div>
												</li>
											</ul>
										</div>
										<div class="item">
											<ul class="thumbnails">
												<li class="span3">
													<div class="product-box">
														<p><a href="product_detail.html"><img src="themes/images/cloth/bootstrap-women-ware4.jpg" alt="" /></a></p>
														<a href="product_detail.html" class="title">Know exactly</a><br/>
														<a href="products.html" class="category">Quis nostrud</a>
														<p class="price">$45.50</p>
													</div>
												</li>
												<li class="span3">
													<div class="product-box">
														<p><a href="product_detail.html"><img src="themes/images/cloth/bootstrap-women-ware3.jpg" alt="" /></a></p>
														<a href="product_detail.html" class="title">Ut wisi enim ad</a><br/>
														<a href="products.html" class="category">Commodo consequat</a>
														<p class="price">$33.50</p>
													</div>
												</li>
												<li class="span3">
													<div class="product-box">
														<p><a href="product_detail.html"><img src="themes/images/cloth/bootstrap-women-ware2.jpg" alt="" /></a></p>
														<a href="product_detail.html" class="title">You think water</a><br/>
														<a href="products.html" class="category">World once</a>
														<p class="price">$45.30</p>
													</div>
												</li>
												<li class="span3">
													<div class="product-box">
														<p><a href="product_detail.html"><img src="themes/images/cloth/bootstrap-women-ware1.jpg" alt="" /></a></p>
														<a href="product_detail.html" class="title">Quis nostrud exerci</a><br/>
														<a href="products.html" class="category">Quis nostrud</a>
														<p class="price">$25.20</p>
													</div>
												</li>																																	
											</ul>
										</div>
									</div>							
								</div>
							</div>						
						</div> -->

                <%--Delivery Info Of Fast Food Start--%>

                <div class="row">
                    <div class="span12 text-center">
                        <h4>HOW WE WORK?? (For FastFood)</h4>
                    </div>
                </div>
                <div class="row feature_box">
                    <div class="span4">
                        <div class="service">
                            <div class="responsive">
                                <img src="themes/images/lock_small.png" alt="" />
                                <h4>PLACE <strong>ORDER</strong></h4>
                                <p style="font-size: 13px;">You can Place your Order Online via Website.</p>
                            </div>
                        </div>
                    </div>
                    <div class="span4">
                        <div class="service">
                            <div class="customize">
                                <img src="themes/images/indian-rupee-512.png" alt="" />
                                <h4>MAKE <strong>PAYMENT</strong></h4>
                                <p style="font-size: 13px;">Choose mode of payment (for now only COD).</p>
                            </div>
                        </div>
                    </div>
                    <div class="span4">
                        <div class="service">
                            <div class="support">
                                <img src="themes/images/feature_img_3.png" alt="" />
                                <h4>ENJOY <strong>FOOD</strong></h4>
                                <p style="font-size: 13px;">Time for delivery.You will get your order with in <strong>60 Minutes</strong> at your door step.</p>
                            </div>
                        </div>
                    </div>
                </div>

                <%--Delivery Info Of Fast Food End--%>


                <%--Delivery Info Of Tiffin Start--%>

                <div class="row">
                    <div class="span12 text-center">
                        <h4>HOW WE WORK?? (For Tiffins)</h4>
                    </div>
                </div>
                <div class="row feature_box">
                    <div class="span4">
                        <div class="service">
                            <div class="responsive">
                                <img src="themes/images/lock_small.png" alt="" />
                                <h4>PLACE <strong>ORDER</strong></h4>
                                <p style="font-size: 13px;">You can Place your Order Online via Website.</p>
                            </div>
                        </div>
                    </div>
                    <div class="span4">
                        <div class="service">
                            <div class="customize">
                                <img src="themes/images/indian-rupee-512.png" alt="" />
                                <h4>MAKE <strong>PAYMENT</strong></h4>
                                <p style="font-size: 13px;">Choose mode of payment (for now only COD).</p>
                            </div>
                        </div>
                    </div>
                    <div class="span4">
                        <div class="service">
                            <div class="support">
                                <img src="themes/images/feature_img_3.png" alt="" />
                                <h4>ENJOY <strong>FOOD</strong></h4>
                                <p style="font-size: 13px;">Time for delivery (Timming:-for Lunch <strong>12:00 PM to 01:30 PM </strong>& for Dinner <strong>07:00 PM to 08:30 PM</strong>).</p>
                            </div>
                        </div>
                    </div>
                </div>


                <%--Delivery Info Of Tiffin End--%>
            </div>
        </div>
    </section>
   <%-- <div class="example-modal" id="diwaliModal">
        <div class="modal">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Happy Diwali</h4>
              </div>
              <div class="modal-body">
                <div class="row">
                    <div class="span6">
                        <img src="themes/images/1-diwali-greetings.preview.jpg" style="height:380px;"/>
                    </div>
                </div>
                  <div class="row">
                      <div class="span6">
                            <p style="font-size:20px;margin-top:8px;">Happy Diwali Foodies.We are offline from 17/10/2017 to 21/10/2017.</p>
                      </div>
                  </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
              </div>
            </div>
            <!-- /.modal-content -->
          </div>
          <!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->
      </div>  
    
    <script type="text/javascript">
        $(window).on('load', function () {
            $('#diwaliModal').modal('show');
        });
</script>  --%>
</asp:Content>



