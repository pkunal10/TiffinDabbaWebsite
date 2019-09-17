<%@ Page Title="" Language="C#" MasterPageFile="~/user/user_without_slider.master" AutoEventWireup="true" CodeFile="Book_monthly_order.aspx.cs" Inherits="user_Book_monthly_order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <title>Tiffin Dabba | Book Monthly Order</title>

    <style>
        .txt
        {
            font-size:15px;
        }
    </style>

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
								<p><span>Monthly Tiffin Order Details</span></p>
							</div>
						</li>
					</ul>
				</div>			
	</section>

    <section class="header_text sub">
		<h4><span>Order Detail</span></h4>
	</section>

<asp:ScriptManager ID="ScriptManager1" runat="server">
      </asp:ScriptManager>
      <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

    <asp:Panel ID="Order_details_panel" runat="server">
        <div class="row">
            <div class="span12">
                <font class="txt">Dear <asp:Label ID="Already_book_name_lbl" Font-Bold="true" CssClass="txt" runat="server"></asp:Label>, you have already booked tiffin for <asp:Label ID="No_of_days_already_book_lbl" CssClass="txt" Font-Bold="true" runat="server"></asp:Label> that is from <asp:Label ID="Start_date_already_book_lbl" Font-Bold="true" CssClass="label-warning" runat="server"></asp:Label> to <asp:Label ID="Finish_date_already_book_lbl" CssClass="label-warning" Font-Bold="true" runat="server"></asp:Label>.now you can book tiffin after <asp:Label ID="Finish_date_already_book_lbl2" CssClass="txt" Font-Bold="true" runat="server"></asp:Label>.Till then enjoy the real taste. </font><br /><br />
            </div>
        </div>
        <div class="row">
            <div class="span12">
                <div class="span3">
                    <asp:Image ID="Tiffin_image" runat="server" CssClass="thumbnail" />
                </div>
                <div class="span9">
                    <h4><b>Menu Of Tiffin</b></h4>

				    <strong>Sabji</strong><br>

                    <strong>Roti<span>(<asp:Label ID="Label2" runat="server" Text=""></asp:Label> Pc.)</span></strong><br>

                    <strong>Dal/Kadi</strong><br>

                    <strong>Chawal/Khichdi</strong><br>

                    <strong>Salad/Pickle</strong><br>

                    <h5><strong>Price: <asp:Label ID="Label3" runat="server" Text=""></asp:Label><font style="font-size:13px"> Rs.(Inclusive Of All Charges)</font></strong></h5>

                </div>
            </div>
        </div>
    </asp:Panel>


<asp:Panel ID="Fill_order_details_panel" runat="server">
    <section class="main-content">				
				<div class="row">						
					<div class="span9">
						<div class="row">
							<div class="span4">
                                <asp:Image ID="Tiffin_image2" runat="server" CssClass="thumbnail" Height="342px" Width="342px" />
							</div>
							<div class="span5">
								<address>
									<strong>Order Id:</strong> <span><asp:Label ID="Label1" runat="server" Text=""></asp:Label></span><br>
									
                                    <strong>Book For:</strong> <span><asp:DropDownList ID="DropDownList1" CssClass="form-control" Width="150px" runat="server" AutoPostBack="True" 
                                                                    >
                                                                    <asp:ListItem>--To Select--</asp:ListItem>
                                                                    <asp:ListItem>Lunch</asp:ListItem>
                                                                    <asp:ListItem>Dinner</asp:ListItem>
                                                                    <asp:ListItem>Both</asp:ListItem>
                                                                    </asp:DropDownList>
									                           </span><br>

                                    <strong>Select No Of Days:</strong> <span><asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" CssClass="form-control" Width="150px" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                                                                              <asp:ListItem>--To Select--</asp:ListItem>
                                                                              <asp:ListItem>15 Days</asp:ListItem>
                                                                              <asp:ListItem>30 Days</asp:ListItem>
                                                                              </asp:DropDownList>
									                           </span><br>

									<strong>Name:</strong> <span><asp:Label ID="Name_lbl" runat="server" Text=""></asp:Label></span><br>
									
                                    <strong>Mobile No:</strong> <span><asp:TextBox ID="TextBox1" CssClass="form-control" runat="server"></asp:TextBox></span>&nbsp;&nbsp;<strong><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" SetFocusOnError="true" ErrorMessage="Enter Mobile No"
                                    Text="Enter Mobile No" ValidationGroup="usto" CssClass="label-warning" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>&nbsp;&nbsp;&nbsp;
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" SetFocusOnError="true" runat="server" ErrorMessage="Numbers Only"
                            Text="Enter 10 Digits" ControlToValidate="TextBox1" CssClass="label-warning" ValidationExpression="^[0-9]{10}$" ValidationGroup="usto"></asp:RegularExpressionValidator></strong><br>								
                                    
                                    <strong>Delivery Address:</strong> <span><asp:TextBox ID="TextBox2" runat="server" Width="200px" CssClass="form-control" TextMode="MultiLine" Rows="4"></asp:TextBox></span>&nbsp;&nbsp;<strong><asp:RequiredFieldValidator ID="RequiredFieldValidator3" SetFocusOnError="true" runat="server" ErrorMessage="Enter Address"
                                    Text="Enter Address" ValidationGroup="usto" CssClass="label-warning" ControlToValidate="TextBox2"></asp:RequiredFieldValidator></strong><br>

                                    <strong>Email Id:</strong> <span><asp:Label ID="Email_id_lbl" runat="server" Text=""></asp:Label></span><br>

                                    <strong>Start Date:</strong> <span><asp:Label ID="Start_date_lbl" runat="server" Text=""></asp:Label></span><br>

                                    <strong>Finish Date:</strong> <span><asp:Label ID="Finish_date_lbl" runat="server" Text=""></asp:Label></span><br>
								
                                </address>									

                                <%--if i put h4 istead of h5 so menu go in left side below the image--%>
								<h5><strong>Price: <asp:Label ID="Price_lbl" runat="server" Text=""></asp:Label><font style="font-size:13px"> Rs.(Inclusive Of All Charges)</font></strong></h5>
							</div>
							<div class="span5">

                                <h4><b>Menu Of This Simple Tiffin</b></h4><br />

								<strong>Sabji</strong><br>

                                <strong>Roti(<asp:Label ID="No_of_roti_lbl" runat="server" Text=""></asp:Label> Pc.)</strong><br>

                                <strong>Dal/Kadi</strong><br>

                                <strong>Chawal/Khichdi</strong><br>

                                <strong>Salad/Pickle</strong><br>

                                I have read and agreed to the <a href="Terms_and_conditions.aspx" class="likbtn">Terms & Conditions</a>&nbsp;
                                <asp:CheckBox ID="CheckBox1" runat="server" /> <br />

                                <asp:Button ID="Button1" runat="server" CssClass="btn-inverse" Text="Confirm Order" 
                                onclick="Button1_Click" ValidationGroup="usto" />
							</div>							
						</div>
						
					</div>
					
				</div>
			</section>
</asp:Panel>
    <asp:UpdateProgress ID="UpdateProgress1" runat="server" class="loading" AssociatedUpdatePanelID="UpdatePanel1" DisplayAfter="0" DynamicLayout ="true">
            <ProgressTemplate>
                <center>
                    <font style="color:White;font-size:18px;">Booking Your Order....<br />Please Wait....</font><br /> <br />
                    <img id="Img1" src="~/user/themes/images/loader.gif" runat="server" />
                </center>
            </ProgressTemplate>
        </asp:UpdateProgress>
    </ContentTemplate>    
</asp:UpdatePanel>

</asp:Content>

