<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Cars.aspx.cs" Inherits="Online_cab_rental_system.Cars" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">



</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <h1 class="display-4 text-uppercase text-center mb-5">Find Your Car</h1>
     <form id="form1" runat="server">
         <asp:DataList ID="DataList1" runat="server" DataKeyField="Cid" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#CCCCCC" BorderWidth="1px" CellPadding="3" HorizontalAlign="Center" RepeatDirection="Horizontal" BorderStyle="None" GridLines="Both" RepeatColumns="2" OnItemCommand="DataList1_ItemCommand">
             <FooterStyle BackColor="White" ForeColor="#000066" />
             <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
             <ItemStyle ForeColor="#000066" />
             <ItemTemplate>

    <div class="container-fluid py-5">
        <div class="container pt-5 pb-3">
            <h1 class="display-4 text-uppercase text-center mb-5">Find Your Car</h1>
            <div class="row">
                <div class="col-lg-4 col-md-6 mb-2">
                    <div class="rent-item mb-4" style="width: 600px">
                        <img class="img-fluid mb-4" src=<%#Eval("Cimg") %> alt="">
 
                        <h4 class="text-uppercase mb-4"><%#Eval("model") %></h4>
                        <div class="d-flex justify-content-center mb-4">
                            <div class="px-2">
                                <i class="fa fa-car text-primary mr-1"></i>
                                <span><%#Eval("Cabno") %></span>
                            </div>
                            <div class="px-2 border-left border-right">
                                <i class="fa fa-cogs text-primary mr-1"></i>
                                <span><%#Eval("Gtype") %></span>
                            </div>
                            <div class="px-2">
                                <i class="fa fa-road text-primary mr-1"></i>
                                <span><%#Eval("Average") %>/KM Per Ltr.</span>
                            </div>

                              <div class="px-2">
                                <i class="fa fa-road text-primary mr-1"></i>
                                <span><%#Eval("Rate") %>/KM Per Ltr.</span>
                            </div>
                        </div>
                        <asp:Button ID="btnbook" CommandName="Book" CssClass="btn btn-primary px-3"  CommandArgument='<%# String.Join(",", new string[] { Eval("Cabno").ToString(), Eval("Driverno").ToString() }) %>' runat="server" Text="Book Now" />
                        <asp:Button ID="btndetails" CommandName="Viewdetails" CssClass="btn btn-primary px-3"  CommandArgument='<%# Eval("Cid")%>' runat="server" Text="View Details" />
                    </div>
                </div>
                 </div>
             </div>
         </div>                        
             </ItemTemplate>
             <SelectedItemStyle BackColor="#669999" ForeColor="White" Font-Bold="True" />
         </asp:DataList>
         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbConnection %>"  SelectCommand="SELECT * FROM [Cabs]"></asp:SqlDataSource>
    </form>

</asp:Content>

