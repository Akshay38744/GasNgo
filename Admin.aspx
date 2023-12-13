<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="Online_cab_rental_system.Admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
</asp:Content>
  
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   
    <script src="js/jquery.min.js"></script>



	<form id="Cabs" runat="server">

		<div style="border-style: groove">
		<asp:GridView ID="Grid_cabs" runat="server" DataKeyNames="Cid" AutoGenerateColumns="False" OnRowCommand="Grid_cabs_RowCommand" ShowFooter="True" OnRowEditing="Grid_cabs_RowEditing" OnRowUpdating="Grid_cabs_RowUpdating" OnRowCancelingEdit="Grid_cabs_RowCancelingEdit" OnRowDeleting="Grid_cabs_RowDeleting">
			<Columns>
				<asp:TemplateField HeaderText="Cabno">
					<ItemTemplate>
						<asp:Label ID="lblcabno" runat="server" Text='<%#Eval("Cabno") %>'></asp:Label>				
					</ItemTemplate>
					<EditItemTemplate>
						<asp:TextBox ID="txtcabno" Text='<%#Eval("Cabno")%>' runat="server"></asp:TextBox>
					</EditItemTemplate>
					<FooterTemplate>
						<asp:TextBox ID="txtfootercabno" runat="server"></asp:TextBox>
					</FooterTemplate>
				</asp:TemplateField>

				<asp:TemplateField HeaderText="Descripiton">
					<ItemTemplate>
						<asp:Label ID="lbldesc" runat="server" Text='<%#Eval("CDesc")%>'></asp:Label>
					</ItemTemplate>
					<EditItemTemplate>
						<asp:TextBox ID="txtdesc" Text='<%#Eval("CDesc")%>' runat="server"></asp:TextBox>
					</EditItemTemplate>
					<FooterTemplate>
						<asp:TextBox ID="txtfooterdesc" runat="server"></asp:TextBox>
					</FooterTemplate>
				</asp:TemplateField>


					<asp:TemplateField HeaderText="Image">
					<ItemTemplate>
						<asp:Image ID="Image1" ImageUrl='<%#Eval("Cimg") %>' Height="100px" Width="100px" runat="server" />
					</ItemTemplate>
					<EditItemTemplate>
						<asp:Image ID="Image1" ImageUrl='<%#Eval("Cimg") %>' Height="100px" Width="100px" runat="server" />
						<asp:FileUpload ID="FileUpload1" runat="server" />
					</EditItemTemplate>
					<FooterTemplate>
							<asp:FileUpload ID="FileUpload2" runat="server"  />
					</FooterTemplate>
				</asp:TemplateField>
					<asp:TemplateField>
				
				</asp:TemplateField>
					<asp:TemplateField HeaderText="Average">
					<ItemTemplate>
						<asp:Label ID="lblaveg" runat="server" Text='<%#Eval("Average")%>'></asp:Label>
					</ItemTemplate>
					<EditItemTemplate>
						<asp:TextBox ID="txtaveg" Text='<%#Eval("Average")%>' runat="server"></asp:TextBox>
					</EditItemTemplate>
					<FooterTemplate>
						<asp:TextBox ID="txtfooteravg" runat="server"></asp:TextBox>
					</FooterTemplate>
				</asp:TemplateField>

					<asp:TemplateField HeaderText="model">
					<ItemTemplate>
						<asp:Label ID="lblmodel" runat="server" Text='<%#Eval("model")%>'></asp:Label>
					</ItemTemplate>
					<EditItemTemplate>
						<asp:TextBox ID="txtmodel" Text='<%#Eval("model")%>' runat="server"></asp:TextBox>
					</EditItemTemplate>
					<FooterTemplate>
						<asp:TextBox ID="txtfootermodel" runat="server"></asp:TextBox>
					</FooterTemplate>
				</asp:TemplateField>

					<asp:TemplateField HeaderText="Gtype">
					<ItemTemplate>
						<asp:Label ID="lblgtype" runat="server" Text='<%#Eval("Gtype")%>'></asp:Label>
					</ItemTemplate>
					<EditItemTemplate>
						<asp:TextBox ID="txtgtype" Text='<%#Eval("Gtype")%>' runat="server"></asp:TextBox>
					</EditItemTemplate>
					<FooterTemplate>
						<asp:TextBox ID="txtfootergear" runat="server"></asp:TextBox>
					</FooterTemplate>
				</asp:TemplateField>
				 
					<asp:TemplateField HeaderText="Navigation">
					<ItemTemplate>
						<asp:Label ID="lblnav" runat="server" Text='<%#Eval("Navigation")%>'></asp:Label>
					</ItemTemplate>
					<EditItemTemplate>
						<asp:TextBox ID="txtnav" Text='<%#Eval("Navigation")%>' runat="server"></asp:TextBox>
					</EditItemTemplate>
					<FooterTemplate>
						<asp:TextBox ID="txtfooternav" runat="server"></asp:TextBox>
					</FooterTemplate>
				</asp:TemplateField>


					<asp:TemplateField HeaderText="Rate">
					<ItemTemplate>
						<asp:Label ID="lblrate" runat="server" Text='<%#Eval("Rate")%>'></asp:Label>
					</ItemTemplate>
					<EditItemTemplate>
						<asp:TextBox ID="txtrate" Text='<%#Eval("Rate")%>' runat="server"></asp:TextBox>
					</EditItemTemplate>
					<FooterTemplate>
						<asp:TextBox ID="txtfooterrate" runat="server"></asp:TextBox>
					</FooterTemplate>
				</asp:TemplateField>

					<asp:TemplateField HeaderText="Driverno">
					<ItemTemplate>
						<asp:Label ID="lbldriverno" runat="server" Text='<%#Eval("Driverno")%>'></asp:Label>
					</ItemTemplate>
					<EditItemTemplate>
						<asp:TextBox ID="txtdriverno" Text='<%#Eval("Driverno")%>' runat="server"></asp:TextBox>
					</EditItemTemplate>
					<FooterTemplate>
						<asp:TextBox ID="txtfooterdriverno" runat="server"></asp:TextBox>
					</FooterTemplate>
				</asp:TemplateField>

					<asp:TemplateField HeaderText="Action">
					<ItemTemplate>
						<asp:Button ID="btnedit" CommandName="Edit" runat="server" Text="Edit" />
						<asp:Button ID="btndelete" CommandName="delete" runat="server" Text="Delete" />
					</ItemTemplate>
					<EditItemTemplate>
					<asp:Button ID="btnupdate" CommandName="Update" runat="server" Text="Update" />
						<asp:Button ID="btncancel" CommandName="Cancel" runat="server" Text="Cancel" />
					</EditItemTemplate>
					<FooterTemplate>
						<asp:Button ID="btninsert" CommandName="Insert" runat="server" Text="Insert" />					
					</FooterTemplate>
				</asp:TemplateField>
			</Columns>
		</asp:GridView>		
			</div>
	</form>
</asp:Content>
