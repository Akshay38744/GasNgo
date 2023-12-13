<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="View_bookings.aspx.cs" Inherits="Online_cab_rental_system.View_bookings" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<style>

#book
{
    margin-left:200px;
    margin-right:200px;
    border:double;
    padding:40px;
}

</style>

    <form id="bookings" runat="server">

        <div id="book">
          <asp:GridView ID="gr_bookings" runat="server" DataKeyNames="Bid" AutoGenerateColumns="false" OnRowDeleting="gr_bookings_RowDeleting">
              <Columns>
                  <asp:TemplateField HeaderText="Cabno">
                      <ItemTemplate>
                          <asp:Label ID="lblcabno" runat="server" Text='<%#Eval("Cabno") %>'></asp:Label>
                      </ItemTemplate>
                      <EditItemTemplate>
                          <asp:TextBox ID="txtcabno" Text='<%#Eval("Cabno") %>' runat="server"></asp:TextBox>
                      </EditItemTemplate>
                  </asp:TemplateField>

                    <asp:TemplateField HeaderText="Pickup">
                      <ItemTemplate>
                          <asp:Label ID="lblploc" runat="server" Text='<%#Eval("Ploc") %>'></asp:Label>
                      </ItemTemplate>
                      <EditItemTemplate>
                          <asp:TextBox ID="txtploc" Text='<%#Eval("Ploc") %>' runat="server"></asp:TextBox>
                      </EditItemTemplate>
                  </asp:TemplateField>


                    <asp:TemplateField HeaderText="Drop">
                      <ItemTemplate>
                          <asp:Label ID="lbldloc" runat="server" Text='<%#Eval("Dloc") %>'></asp:Label>
                      </ItemTemplate>
                      <EditItemTemplate>
                          <asp:TextBox ID="txtdloc" Text='<%#Eval("Dloc") %>' runat="server"></asp:TextBox>
                      </EditItemTemplate>
                  </asp:TemplateField>

                    <asp:TemplateField HeaderText="Time">
                      <ItemTemplate>
                          <asp:Label ID="lblptime" runat="server" Text='<%#Eval("Ptime") %>'></asp:Label>
                      </ItemTemplate>
                      <EditItemTemplate>
                          <asp:TextBox ID="txtptime" Text='<%#Eval("Ptime") %>' runat="server"></asp:TextBox>
                      </EditItemTemplate>
                  </asp:TemplateField>
                    <asp:TemplateField HeaderText="Action">
                      <ItemTemplate>
                           <asp:Button ID="btndelete" CommandName="Delete" runat="server" Text="Cancel" />
                      </ItemTemplate>
                      <EditItemTemplate>
                      </EditItemTemplate>
                  </asp:TemplateField>
              </Columns>
        
    </asp:GridView>
            </div>
    </form>
  


</asp:Content>
