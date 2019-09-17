<%@ Page Title="" Language="C#" MasterPageFile="~/user/user_without_slider.master" AutoEventWireup="true" CodeFile="Book_trial_tiffin.aspx.cs" Inherits="user_Book_trial_tiffin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <title>Tiffin Dabba | Book Trial Tiffin</title>

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
								<p><span>Trial Tiffin Order Details</span></p>
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
    

    <section class="main-content">				
				<div class="row">						
					<div class="span9">
						<div class="row">
							<div class="span4">
                                <asp:Image ID="Tiffin_Image" runat="server" CssClass="thumbnail" Height="342px" Width="342px" />
							</div>
							<div class="span5">
								<address>
									<strong>Order Id:</strong> <span><asp:Label ID="Trial_tiffin_order_id_lbl" runat="server" Text=""></asp:Label></span><br>
									<strong>Book For:</strong> <span><asp:DropDownList ID="DropDownList1" CssClass="form-control" Width="150px" runat="server" AutoPostBack="True" 
                                                                    onselectedindexchanged="DropDownList1_SelectedIndexChanged">
                                                                    <asp:ListItem>--To Select--</asp:ListItem>
                                                                    <asp:ListItem>Lunch</asp:ListItem>
                                                                    <asp:ListItem>Dinner</asp:ListItem>
                                                                    </asp:DropDownList>
									                           </span><br>
									<strong>Name:</strong> <span><asp:Label ID="Trial_tiffin_name_lbl" runat="server" Text=""></asp:Label></span><br>
									
                                    <strong>Mobile No:</strong> <span><asp:TextBox ID="Trial_tiffin_mobile_tb" CssClass="form-control" runat="server"></asp:TextBox></span>&nbsp;&nbsp;<strong><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" SetFocusOnError="true" ErrorMessage="Enter Mobile No"
                                    Text="Enter Mobile No" ValidationGroup="usto" CssClass="label-warning" ControlToValidate="Trial_tiffin_mobile_tb"></asp:RequiredFieldValidator>&nbsp;&nbsp;&nbsp;
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" SetFocusOnError="true" runat="server" ErrorMessage="Numbers Only"
                            Text="Enter 10 Digits" ControlToValidate="Trial_tiffin_mobile_tb" CssClass="label-warning" ValidationExpression="^[0-9]{10}$" ValidationGroup="usto"></asp:RegularExpressionValidator></strong><br>								
                                    
                                    <strong>Delivery Address:</strong> <span><asp:TextBox ID="Trial_tiffin_address_tb" runat="server" Width="200px" CssClass="form-control" TextMode="MultiLine" Rows="4"></asp:TextBox></span>&nbsp;&nbsp;<strong><asp:RequiredFieldValidator ID="RequiredFieldValidator3" SetFocusOnError="true" runat="server" ErrorMessage="Enter Address"
                                    Text="Enter Address" ValidationGroup="usto" CssClass="label-warning" ControlToValidate="Trial_tiffin_address_tb"></asp:RequiredFieldValidator></strong><br>

                                    <strong>Email Id:</strong> <span><asp:Label ID="Trial_tiffin_email_lbl" runat="server" Text=""></asp:Label></span><br>

                                    <strong>Date:</strong> <span><asp:Label ID="Trial_tiffin_date_lbl" runat="server" Text=""></asp:Label></span><br>

                                    <strong>Time:</strong> <span><asp:Label ID="Trial_tiffin_time_lbl" runat="server" Text=""></asp:Label></span><br>
								
                                </address>									

                                <%--if i put h4 istead of h5 so menu go in left side below the image--%>
								<h5><strong>Price: <asp:Label ID="Trial_tiffin_price_lbl" runat="server" Text=""></asp:Label><font style="font-size:13px"> Rs.(Inclusive Of All Charges)</font></strong></h5>
							</div>
							<div class="span5">

                                <h4><b>Menu Of This Simple Tiffin</b></h4><br />

								<strong>Sabji</strong><br>

                                <strong>Roti</strong> <span><asp:Label ID="Trial_tiffin_roti_lbl" runat="server" Text=""></asp:Label>(5 Pc.)</span><br>

                                <strong>Dal/Kadi</strong><br>

                                <strong>Chawal/Khichdi</strong><br>

                                <strong>Salad/Pickle</strong><br>

                                I have read and agreed to the <a href="Terms_and_conditions.aspx" class="likbtn">Terms & Conditions</a>&nbsp;
                                <asp:CheckBox ID="CheckBox1" runat="server" /> <br />
                    
                                <asp:Label ID="Label11" runat="server" CssClass="label-warning" Text=""></asp:Label><br />

                                <asp:Button ID="Button1" runat="server" CssClass="btn-inverse" Text="Confirm Order" 
                                onclick="Button1_Click" ValidationGroup="usto" />
							</div>							
						</div>
						
					</div>
					
				</div>
			</section>

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

