<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Details.aspx.cs" Inherits="Online_cab_rental_system.Details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <form id="details" runat="server">

        <div class="text-left">
    <asp:DataList ID="DataList1" DataKeyField="Cid" runat="server" OnItemCommand="DataList1_ItemCommand">
        <ItemTemplate>

                <div class="col-lg-8 mb-5" style="margin-left: 150px; margin-top:30px;">
                    <h1 class="display-4 text-uppercase mb-5">Mercedes Benz R3</h1>
                   <center> <div>
                        <div>
                            <img class="img-fluid w-100" height="800" runat="server" width="800" src='<%#Eval("Cimg")%>' alt="">
                    </div>
                       <br />
                       <br />
                    <p><%#Eval("CDesc")%></p>
                       <br />
                    <div class="row pt-2">
                        <div class="col-md-3 col-6 mb-2">
                            <i class="fa fa-car text-primary mr-2"></i>
                            <span>Model: 2015</span>
                        </div>
                        <div class="col-md-3 col-6 mb-2">
                            <i class="fa fa-cogs text-primary mr-2"></i>
                            <span>Automatic</span>
                        </div>
                        <div class="col-md-3 col-6 mb-2">
                            <i class="fa fa-road text-primary mr-2"></i>
                            <span>20km/liter</span>
                        </div>
                        <div class="col-md-3 col-6 mb-2">
                            <i class="fa fa-eye text-primary mr-2"></i>
                            <span>GPS Navigation</span>
                        </div>  
                    </div>
                       <br />  <br />
                     <asp:Button ID="btnbook" CommandName="Book" CssClass="btn btn-primary px-3" CommandArgument='<%# String.Join(",", new string[] { Eval("Cabno").ToString(), Eval("Driverno").ToString() }) %>' runat="server" Text="Book Now" />

               </div></center>
                   
        </ItemTemplate>
    </asp:DataList>
            
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>

        </div>

        </form>
</asp:Content>
