<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Online_cab_rental_system.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <link href="css/Register.css" rel="stylesheet" />

	<form id="form" runat="server">

      <div  id="login" runat="server" class="main-w3layouts wrapper">
		<h1>Login</h1>
		<div class="main-agileinfo">
			<div class="agileits-top">
				<asp:Label ID="lblerror" ForeColor="Red" runat="server" Text=""></asp:Label>
				<br />
					<asp:TextBox ID="txtuser" class="text" runat="server" placeholder="Username" required=""></asp:TextBox>
					<br />				
					<asp:TextBox ID="txtpwd" class="text" type="password" runat="server" placeholder="Password" required=""></asp:TextBox>
				<br />		
					<div class="wthree-text">
						<label class="anim">
							<input type="checkbox" id="chklogin" runat="server" class="checkbox" required="">							
							<span>I Agree To The Terms & Conditions</span>
						</label>
						</div>
						<asp:Button ID="btnlogin" runat="server" Text="Login" OnClick="btnlogin_Click"  />
								
					<div class="clear"> </div>
			</div>
			</div>
	   </div>	
		</form>

</asp:Content>

