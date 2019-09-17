<%@ Page Title="" Language="C#" MasterPageFile="~/user/user_without_slider.master" AutoEventWireup="true" CodeFile="Terms_and_conditions.aspx.cs" Inherits="user_Terms_and_conditions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <title>Tiffin Dabba | Terms & Conditions</title>

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
                        <p><span>Terms & Conditions</span></p>
                    </div>
                </li>
            </ul>
        </div>
    </section>

    <section class="main-content">
        <div class="row">
            <div class="span12">
                <h3>Terms of Services on the Tiffin Dabba website:</h3>
                <br />

                <font class="T_and_C_header">1. ABOUT US</font>
                <br />
                <font class="T_and_C_data">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.1  We take the orders, collect payments and deliver the food at the doorstep of the User.</font>
                <br />
                <br />

                <font class="T_and_C_header">2. PAYMENT & PRICE</font>
                <br />
                <font class="T_and_C_data">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.1  You can make your payment by only cash on delivery for now on Tiffin Dabba.Prices showing on Tiffin Dabba are inclusive of all charges no extra 
                    delivery charge.
                    </font>
                <br />
                <br />

                <font class="T_and_C_header">3. DELIVERY</font>
                <br />
                <font class="T_and_C_data">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.1 Delivery time of Lunch is 12:00 PM to 01:30 PM.Delivery time of Dinner is 07:30 PM to 08:30 PM.<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.2 The Tiffin will be delivered to the address given at the time of giving the order of Tiffin.<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.3 The Fast Food order will be delivered to the address given at the time of giving the order of Fast Food with in <b>60 Minutes</b>.<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.4 No responsibility is taken by the Website in case of late delivery by us.<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.5 It may not be possible for Us to deliver to some locations.you have to select your delivery area from our area of services at order booking time.<br />
                    </font>
                <br />
                <br />

                <font class="T_and_C_header">4. CASH ON DELIVERY</font>
                <br />
                <font class="T_and_C_data">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4.1  Your delivery address should be under our serviceable areas.<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4.2  Payment to the courier boy should be done in cash. Cheque or DD is not acceptable. The invoice amount will be inclusive of all charges.<br />
                    </font>
                <br />
                <br />

                <font class="T_and_C_header">5. CANCELLATION POLICY</font>
                <br />
                <font class="T_and_C_data">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5.1  Once tiffin is booked it can not be canceled.<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5.2  If the delivery is defaulted twice, your Tiffin Dabba account will be blocked without any prior notice for indefinite time.<br />
                    </font>
                <br />
                <br />

                <font class="T_and_C_header">6. ORDER TIMMING</font>
                <br />
                <font class="T_and_C_data">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;6.1  you can book yout tiffin for Lunch same day before <asp:Label ID="Lunch_time_lbl" Font-Bold="true" runat="server" Text=""></asp:Label> and for dinner same day before <asp:Label ID="Dinner_time_lbl" runat="server" Font-Bold="true" Text=""></asp:Label>.<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;6.2  You can book Fast Food From <strong><asp:Label ID="StartFFTimeLbl" runat="server"></asp:Label>.  </strong>to <strong><asp:Label ID="EndFFTimeLbl" runat="server"></asp:Label>.</strong>
                    </font>
            </div>
        </div>
    </section>

</asp:Content>

