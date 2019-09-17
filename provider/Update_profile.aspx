<%@ Page Title="" Language="C#" MasterPageFile="~/provider/provider.master" AutoEventWireup="true" CodeFile="Update_profile.aspx.cs" Inherits="provider_Update_profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <title>Update Profile</title>
    <link href="assets/img/shortcut_icon.png" rel="shortcut icon">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>    
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>


      <div style="height:150px;">
    
        <div style="height:60px;width:1000px;border-bottom-style:dashed;border-bottom-width:1.5px;"><br />
                <font class="pagetitle">Update Profile</font>
        </div>
        <div style="height:90px;margin-top:22px;" class="text-justify">
        
        <font class="myprofile-description">

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            From this page you can update your profile.this page provide Dynamic behavior to your profile.from this page you can also change your password.to do so you 
            can click Change Password link given below and change your password.
        
        </font>
        
        </div>
    
    </div>


    <br />
    <br />

    <div>
        <center>
            
            <table style="width:400px;height:300px;">
                    <%--<tr style="height:50px;">
                        <td style="width:200px;">
                            Id</td>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text=""></asp:Label></td>
                        <td style="width:200px;">
                            &nbsp;</td>
                    </tr>--%>
                    <tr style="height:50px;">
                        <td>
                            Name</td>
                        <td>
                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Name"
                            Text="Enter Name" ControlToValidate="TextBox1" ValidationGroup="pup"></asp:RequiredFieldValidator><br />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Alphabates Only"
                                Text="Alphabates Only" ControlToValidate="TextBox1" ValidationExpression="[a-zA-Z ]*$" ValidationGroup="pup"></asp:RegularExpressionValidator>
                            
                            </td>
                    </tr>
                    <tr style="height:50px;">
                        <td>
                            City</td>
                        <td>
                            <asp:Label ID="Label2" runat="server" Text=""></asp:Label></td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr style="height:50px;">
                        <td> 
                            Mobile No</td>
                        <td>
                            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Number"
                            Text="Enter Number" ControlToValidate="TextBox1" ValidationGroup="pup"></asp:RequiredFieldValidator><br />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Numbers Only"
                                Text="Enter 10 Digits" ControlToValidate="TextBox2" ValidationExpression="^[0-9]{10}$" ValidationGroup="pup"></asp:RegularExpressionValidator>
                            </td>
                    </tr>
                    <tr style="height:50px;">
                        <td>
                            Email Id</td>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text=""></asp:Label></td>
                        <td>
                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter Email"
                            Text="Enter Email" ControlToValidate="TextBox3" ValidationGroup="pup"></asp:RequiredFieldValidator><br />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Enter Correct Email"
                                Text="Enter Correct Email" ControlToValidate="TextBox3" 
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                ValidationGroup="pup"></asp:RegularExpressionValidator>--%></td>
                    </tr>
                    <tr style="height:50px;">
                        <td>
                            Address</td>
                        <td>
                            <asp:TextBox ID="TextBox4" runat="server" TextMode="MultiLine"></asp:TextBox></td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Enter Address"
                            Text="Enter Address" ControlToValidate="TextBox4" ValidationGroup="pup"></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr style="height:50px;">
                        <td colspan="2" align="center">
                            <asp:Button ID="Button1" runat="server" Text="Update" ValidationGroup="pup" onclick="Button1_Click" /></td>
                        <td align="center">
                            &nbsp;</td>
                    </tr>
                </table>

            <br />
            <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">Change Password</asp:LinkButton>

        </center>
        <br />
        <asp:Panel ID="Panel1" runat="server">
        <center>
            <table style="width:500px;">
                <tr>
                    <td style="width:250px;">
                        Enter Current Password</td>
                    <td>
                        <asp:TextBox ID="TextBox5" runat="server" TextMode="Password"></asp:TextBox></td>
                    <td style="width:250px;">
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Enter Current Password"
                            Text="Enter Current Password" ControlToValidate="TextBox5" ValidationGroup="pcpcp"></asp:RequiredFieldValidator>  </td>
                </tr>
                <tr>
                    <td colspan="3" align="center">
                        <asp:Button ID="Button2" runat="server" ValidationGroup="pcpcp" Text="Submit" onclick="Button2_Click" /></td>
                </tr>
            </table>

         </center>   

        </asp:Panel>
        <br />
        <asp:Panel ID="Panel2" runat="server">

            <center>
            
                
            
                <table style="width:500px;">
                    <tr>
                        <td style="width:250px;">
                            Enter New Password</td>
                        <td>
                            <asp:TextBox ID="TextBox6" runat="server" TextMode="Password"></asp:TextBox></td>
                        <td style="width:250px;">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Enter New Password"
                            Text="Enter New Password" ControlToValidate="TextBox6" ValidationGroup="pcp"></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td>
                            Confirm New Password</td>
                        <td>
                            <asp:TextBox ID="TextBox7" runat="server" TextMode="Password"></asp:TextBox></td>
                        <td>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password Is Not Matched"
                             Text="Password Is Not Matched" ValidationGroup="pcp" ControlToCompare="TextBox6" ControlToValidate="TextBox7"></asp:CompareValidator></td>
                    </tr>
                    <tr>
                        <td colspan="3" align="center">
                            <asp:Button ID="Button3" runat="server" Text="Change" ValidationGroup="pcp" 
                                onclick="Button3_Click" /></td>
                    </tr>
                </table>
            
                
            
            </center>

        </asp:Panel>
    </div>
    <asp:UpdateProgress ID="UpdateProgress1" runat="server" class="loading" AssociatedUpdatePanelID="UpdatePanel1" DisplayAfter="0" DynamicLayout ="true">
            <ProgressTemplate>
                <center>
                    <font style="color:White;font-size:18px;">Please Wait....</font><br /><br />
                    <img id="Img1" src="~/user/assets/img/loader.gif" runat="server" />
                </center>
            </ProgressTemplate>
        </asp:UpdateProgress>
    </ContentTemplate>
</asp:UpdatePanel>
</asp:Content>

