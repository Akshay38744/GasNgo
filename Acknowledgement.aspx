<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Acknowledgement.aspx.cs" Inherits="Online_cab_rental_system.Acknowledgement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

  
<html runat="server">
<head>
	<title>Acknowledgment Page</title>
	<style type="text/css">
		body {
			font-family: Arial, sans-serif;
			margin: 0;
			padding: 0;
		}

		header {
			background-color: #808080;
			color: #fff;
			padding: 20px;
			text-align: center;
            margin:60px;
		}

		h1 {
			margin: 0;
			font-size: 36px;
		}

		.container {
			max-width: 1200px;
			margin: 0 auto;
			padding: 20px;
		}

		p {
			font-size: 18px;
			line-height: 1.5;
		}

		.success {
			color: green;
			font-weight: bold;
		}

		.error {
			color: red;
			font-weight: bold;
		}
	</style>
</head>
<body>
	<header>
		<h1>Acknowledgment Page</h1>
	</header>
	<div class="container">
		<p class="success">Thank you for your submission!</p>
		<p>Sucessfully booked your cab Your cab no. is <bold><asp:Label ID="lblcabno" runat="server" Text=""></asp:Label></bold></p>
	<p> Your Cab driver number is :	<bold><asp:Label ID="lbldriverno" runat="server" Text=""></asp:Label></bold></p>
	</div>
</body>
</html>


</asp:Content>
