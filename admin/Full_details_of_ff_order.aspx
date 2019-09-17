<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="Full_details_of_ff_order.aspx.cs" Inherits="admin_Full_details_of_ff_order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Full Details FastFood Orders</title>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <center>
        <table style="width: 800px;">
            <caption>
                <h3>Your Personal Details</h3>
            </caption>
            <tr>
                <td style="width: 200px;">
                    <div class="control-group">
                        <label class="control-label">Order Id</label>
                        <div class="controls">
                            <asp:Label ID="order_id_lbl" runat="server" CssClass="input-xlarge" Text=""></asp:Label>
                        </div>
                    </div>
                </td>
                <td style="width: 200px;">
                    <div class="control-group">
                        <label class="control-label">Mobile</label>
                        <div class="controls">
                            <asp:Label ID="mobile_lbl" runat="server" CssClass="input-xlarge" Text=""></asp:Label>
                        </div>
                    </div>
                </td>
                <td style="width: 200px;">
                    <div class="control-group">
                        <label class="control-label">Name</label>
                        <div class="controls">
                            <asp:Label ID="name_lbl" runat="server" CssClass="input-xlarge" Text=""></asp:Label>
                        </div>
                    </div>
                </td>
                <td style="width: 200px;">
                    <div class="control-group">
                        <label class="control-label">Email ID:</label>
                        <div class="controls">
                            <asp:Label ID="email_lbl" runat="server" CssClass="input-xlarge" Text=""></asp:Label>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="control-group">
                        <label class="control-label">Provider Id</label>
                        <div class="controls">
                            <asp:LinkButton ID="providerId_lb" runat="server" OnClick="providerId_lb_Click"></asp:LinkButton>
                        </div>
                    </div>
                </td>
                <td>
                    <div class="control-group">
                        <label class="control-label">User Id</label>
                        <div class="controls">
                            <asp:LinkButton ID="user_id_lb" runat="server" OnClick="user_id_lb_Click"></asp:LinkButton>
                        </div>
                    </div>
                </td>
                <td>
                    <div class="control-group">
                        <label class="control-label">Date</label>
                        <div class="controls">
                            <asp:Label ID="date_lbl" runat="server" CssClass="input-xlarge" Text=""></asp:Label>
                        </div>
                    </div>
                </td>
                <td>
                    <div class="control-group">
                        <label class="control-label">Time</label>
                        <div class="controls">
                            <asp:Label ID="time_lbl" runat="server" CssClass="input-xlarge" Text=""></asp:Label>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="control-group">
                        <label class="control-label">Delivery City</label>
                        <div class="controls">
                            <asp:Label ID="del_city_lbl" runat="server" Text=""></asp:Label>
                        </div>
                    </div>
                </td>
                <td>
                    <div class="control-group">
                        <label class="control-label">Delivery Area</label>
                        <div class="controls">
                            <asp:Label ID="del_area_lbl" runat="server" Text=""></asp:Label>
                        </div>
                    </div>
                </td>
                <td>
                    <div class="span4">
                        <label class="control-label">Delivery Address</label>
                        <div class="controls">
                            <asp:Label ID="address_lbl" CssClass="input-xlarge" runat="server"></asp:Label>
                        </div>
                    </div>
                </td>
                <td>
                    <div class="span4">
                        <label class="control-label">Total Bill</label>
                        <div class="controls">
                            <asp:Label ID="fin_total_bill_2_lbl" CssClass="input-xlarge" runat="server"></asp:Label>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="control-group">
                        <label class="control-label">Read</label>
                        <div class="controls">
                            <asp:Label ID="is_read_lbl" runat="server" Text=""></asp:Label>
                        </div>
                    </div>
                </td>
                <td>
                    <div class="control-group">
                        <label class="control-label">Delivered</label>
                        <div class="controls">
                            <asp:Label ID="is_delivered_lbl" runat="server" Text=""></asp:Label>
                        </div>
                    </div>
                </td>
                <td>
                    <div class="span4">
                        <label class="control-label">Cancelled</label>
                        <div class="controls">
                            <asp:Label ID="is_cancelled_lbl" CssClass="input-xlarge" runat="server"></asp:Label>
                        </div>
                    </div>
                </td>
                <%--<td>
                    <div class="span4">
                        <label class="control-label">Total Bill</label>
                        <div class="controls">
                            <asp:Label ID="Label4" CssClass="input-xlarge" runat="server"></asp:Label>
                        </div>
                    </div>
                </td>--%>
            </tr>
        </table>
        <br />
        <table class="table table-striped" id="cart_tbl">
            <thead>
                <tr>
                    <th>Image</th>
                    <th>Provider</th>
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
                            <%--<td>                                                
                                                <asp:Label ID="productId_lbl" runat="server" Text='<%#Eval("product_id") %>' Visible="false"></asp:Label>
                                            </td>--%>
                            <td>
                                <asp:Image ID="Image1" runat="server" Height="120px" Width="120px" ImageUrl='<%#Eval("image") %>' CssClass="img-circle" />
                            </td>
                            <td>
                                <asp:LinkButton ID="ProviderIdLb" OnCommand="ProviderIdLb_Command" CommandArgument='<%#Eval("provider_id") %>' runat="server"><%#Eval("provider_id") %></asp:LinkButton></td>
                            <td><%#Eval("product_name") %></td>
                            <td>
                                <asp:Label ID="quantity_lbl" runat="server" Text='<%#Eval("quantity") %>'></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="price_lbl" runat="server" Text='<%#Eval("unit_price") %>'></asp:Label></td>
                            <td>
                                <asp:Label ID="total_lbl" runat="server" Text='<%#Eval("total_price") %>'></asp:Label>
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

            <strong>Delivery Charge</strong>:
                            <asp:Label ID="del_charge_lbl" runat="server" Text=""></asp:Label><br>
            <strong>Total</strong>:
                            <asp:Label ID="fin_total_lbl" runat="server" Text=""></asp:Label><br>
        </p>


        <table>
            <tr>
                <td>
                    <asp:Button ID="read_btn" runat="server" Text="Read" OnClick="read_btn_Click" />
                </td>
                <td>
                    <asp:Button ID="delivered_btn" runat="server" Text="Delivered" OnClick="delivered_btn_Click" />
                </td>
                <td>
                    <asp:Button ID="cancelled_btn" runat="server" Text="Cancelled" OnClick="cancelled_btn_Click" />
                </td>
            </tr>
        </table>


    </center>

</asp:Content>

