<%@ Page Title="" Language="C#" MasterPageFile="~/provider/provider_highted_master.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="provider_Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <title>Home</title>
    <link href="assets/img/shortcut_icon.png" rel="shortcut icon">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div style="height:1180px;width:1020px;">
    
        <div style="height:400px;width:1020px;">
        
            <div style="height:60px;width:1020px;">
                <marquee style="font-size:22px;" scroll-amount="10">We provides Tiffin for lunch and dinner accross the udaipur.</marquee>
            </div>
            <center><h3>Following ORDER TIMMINGS are of customer can book their tiffins not for you (PROVIDERS).</h3></center>
            <div style="height:240px;width:300px;margin-left:360px;margin-top:15px;border-style:solid;border-width:2px;border-shadow:5px 5px 5px #cec8ba;">
                        <div style="height:40px;width:300px;">
                            <center><b><font style="font-size:25px;">ORDER TIMMING</font></b></center>
                        </div>
                        <div style="height:200px;width:300px;">
                            <div style="height:80px;width:300px;">
                                <div style="height:80px;width:80px;float:left;">
                                    <img style="height:50px;width:50px;margin-left:15px;"  src="assets/img/lunch.png" />
                                </div>
                                <div style="height:80px;width:220px;float:right;">
                                    <font style="font-size:14px;">LUNCH</font><br />
                                    <font style="font-size:12px;">Same day before <b><asp:Label ID="Lunch_time_lbl" runat="server"></asp:Label></b></font>
                                </div>
                            </div>
                            <div style="height:80px;width:300px;">
                                <div style="height:80px;width:80px;float:left;">
                                    <img style="height:50px;width:50px;margin-left:15px;"  src="assets/img/dinner.png" />
                                </div>
                                <div style="height:80px;width:220px;float:right;">
                                    <font style="font-size:14px;">DINNER</font><br />
                                    <font style="font-size:12px;">Same day before <b><asp:Label ID="Dinner_time_lbl" runat="server"></asp:Label></b></font>
                                </div>
                            </div>
                        </div>
            </div>

            <div style="height:60px;width:1020px;">
                <div class="notice_arrow" style="margin-left:163px;">
                       <img src="assets/img/arrow.png" style="height:30px;width:50px;margin-top:20px;" />
               </div>
              <div style="height:40px;width:730px;float:right;margin-left:20px;margin-top:24px;">
                   <font style="font-size:19px;"><b>You have to complete your before order completing time.</b></font>
              </div>
            </div>
        </div>
        <div style="height:550px;width:1020px;">
        
            <div style="height:75px;width:1020px;">
                <div style="height:60px;width:60px;float:left;margin-left:215px;">
                    <img src="assets/img/notice.png" height="60px;" width="60px;" />
                </div>
                <div style="height:75px;width:720px;float:right;margin-left:0px;">
                    <font class="dlytimming">Order Completing Timming:-</font><br />
                    <ul>
                        <li class="L_D"><b>Lunch:-</b>You have to complete your orders for LUNCH before <b>12:00 PM</b>.</li>
                        <li class="L_D"><b>Dinner:-</b>You have to complete your orders for DINNER before <b>07:30 PM</b>.</li>
                    </ul>
                </div>
            </div>

            <div style="height:330px;width:1020px;margin-top:40px;">

                <div style="height:60px;width:1020px;"><br />
                    <font class="howwork">HOW WE WORK</font>
                </div>
                <div style="height:280px;width:1020px;">
                
                     <div style="height:280px;width:250px;float:left;border-style:solid;border-width:1px;">
                        <div style="height:50px;width:250px;" 
                             class="text-center">
                            <font class="stepno">1.</font><font class="stepname">User Book Tiffin</font>
                        </div>
                        <div style="height:110px;width:250px;">
                            <img src="assets/img/tiffin.png" height="80px;" width="80px;" 
                                style="margin-left:85px;" />
                        </div>
                        <div style="height:120px;width:250px; border-top-style:solid;border-top-width:1px;" class="text-center">
                            <font class="stepdetail">Firstly Customers will book their tiffins(SIMPLE TIFFIN or TIFFIN WITH SWEET).</font>
                        </div>
                     </div>
                    <div style="height:280px;width:250px;float:right;border-style:solid;border-width:1px;float:left;margin-left:5px;">
                    
                        <div style="height:50px;width:250px;" 
                             class="text-center">
                            <font class="stepno">2.</font><font class="stepname">View Your Orders</font>
                        </div>
                        <div style="height:110px;width:250px;">
                            <img src="assets/img/view_order.png" height="80px;" width="80px;" 
                                style="margin-left:85px;" />
                        </div>
                        <div style="height:120px;width:250px; border-top-style:solid;border-top-width:1px;" class="text-center">
                            <font class="stepdetail">Now you can see your orders (SIMPLE TIFFIN & TIFFIN WITH SWEET) from view order page.</font>
                        </div>
                    
                    </div>
                    <div style="height:280px;width:250px;float:right;float:left;border-style:solid;border-width:1px;margin-left:5px;">
                    
                        <div style="height:50px;width:250px;" 
                             class="text-center">
                            <font class="stepno">3.</font><font class="stepname">Cook Food</font>
                        </div>
                        <div style="height:110px;width:250px;">
                            <img src="assets/img/cook_food.png" height="80px;" width="80px;" 
                                style="margin-left:85px;" />
                        </div>
                        <div style="height:120px;width:250px; border-top-style:solid;border-top-width:1px;" class="text-center">
                            <font class="stepdetail">Now you have to cook food before(Timming:-for Lunch <b>12:00 PM</b> & for Dinner <b>07:30 PM</b>).</font>
                        </div>

                    </div>
                    <div style="height:280px;width:250px;float:right;border-style:solid;border-width:1px;margin-right:5px;">
                    
                        <div style="height:50px;width:250px;" 
                             class="text-center">
                            <font class="stepno">4.</font><font class="stepname">Delivery Time</font>
                        </div>
                        <div style="height:110px;width:250px;">
                            <img src="assets/img/delivery.png" height="80px;" width="80px;" 
                                style="margin-left:85px;" />
                        </div>
                        <div style="height:120px;width:250px; border-top-style:solid;border-top-width:1px;" class="text-center">
                            <font class="stepdetail">Now We Delevered The Orders.</font>
                        </div>

                    </div>
                
                </div>

            </div>
            <br />
            <%--<font style="font-size:15.5px;color:Red;">The orders which are ordered after given timming(For Lunch:- Same Day after <b>10:30 AM</b> AND For Dinner:- Same Day after <b>04:30 PM</b>) you don't need to 
                make their food.</font>--%>
        
        </div>
        <div style="height:230px;width:1020px;">
        
            <marquee scroll-amount="15">
            
                <img src="assets/img/tiffin/alubangan_dal_bhat.jpg" height="200px;" width="200px;" style="border-style:outset;border-color:white;border-width:2px;" />
                <img src="assets/img/tiffin/alumatar_bhat_kadi.JPG" height="200px;" width="200px;" style="border-style:outset;border-color:white;border-width:2px;" />
                <img src="assets/img/tiffin/aalupyaz_khichdi.jpg" height="200px;" width="200px;" style="border-style:outset;border-color:white;border-width:2px;" />
                <img src="assets/img/tiffin/alumatar_khichdi.JPG" height="200px;" width="200px;" style="border-style:outset;border-color:white;border-width:2px;" /> 
                <img src="assets/img/tiffin/bharwabhindi_dal_bhat.JPG" height="200px;" width="200px;" style="border-style:outset;border-color:white;border-width:2px;" />
                <img src="assets/img/tiffin/chori_khichdi.JPG" height="200px;" width="200px;" style="border-style:outset;border-color:white;border-width:2px;" />
                <img src="assets/img/tiffin/dudhichana_khichdi.JPG" height="200px;" width="200px;" style="border-style:outset;border-color:white;border-width:2px;" />
                <img src="assets/img/tiffin/flawaermatar_bhat_kadi.JPG" height="200px;" width="200px;" style="border-style:outset;border-color:white;border-width:2px;" />
                <img src="assets/img/tiffin/guwar_khichdi.JPG" height="200px;" width="200px;" style="border-style:outset;border-color:white;border-width:2px;" />
                <img src="assets/img/tiffin/papdi_khichdi.JPG" height="200px;" width="200px;" style="border-style:outset;border-color:white;border-width:2px;" />
                <img src="assets/img/tiffin/savetamatar_dal_bhat.JPG" height="200px;" width="200px;" style="border-style:outset;border-color:white;border-width:2px;" />

            </marquee>
        
        </div>
    
    </div>

</asp:Content>

