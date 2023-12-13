<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Online_cab_rental_system.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <link href="css/Register.css" rel="stylesheet" />

	<form id="form" runat="server">
	
   <div id="Register" class="main-w3layouts wrapper">
		<h1>SignUp Form</h1>
		<div class="main-agileinfo">
			<div class="agileits-top">
			
					
					<asp:TextBox ID="txtusername" class="text" runat="server" placeholder="Username" required=""></asp:TextBox>
					<br />
					<asp:TextBox ID="txtmobile" class="text" runat="server" placeholder="Mobile" required=""></asp:TextBox>
					<br />

					<asp:TextBox ID="txtpassword" class="text" type="password" runat="server" placeholder="Password" required=""></asp:TextBox>

					<asp:TextBox ID="txtconfpwd" class="text w3lpass" type="password" runat="server" placeholder="confirm password" required=""></asp:TextBox>

					<asp:Label ID="Label1" CssClass="text" runat="server" Text="Gender" ForeColor="Black"></asp:Label> 
					<asp:RadioButtonList ID="rdagender" runat="server" RepeatDirection="Horizontal" ForeColor="Black" RepeatLayout="Flow">
                        <asp:ListItem Selected="True">Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                    </asp:RadioButtonList>
					<br />
					<br />

					<div class="wthree-text">
						<label class="anim">
							<input type="checkbox" id="chksignup" runat="server" class="checkbox" required="">							
							<span>I Agree To The Terms & Conditions</span>
						</label>
							<asp:Button ID="btnsubmit" runat="server" Text="Submit" OnClick="btnsubmit_Click" />
						<div class="clear"> </div>
						</div>
				
					
					</div>
			
			</div>
	   </div>
		
		</form>
</asp:Content>
