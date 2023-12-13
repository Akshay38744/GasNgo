<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Book_now.aspx.cs" Inherits="Online_cab_rental_system.Book_now" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form id="Book_cab" runat="server">
       <div class="container-fluid pb-5">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
               
                    <h2 class="mb-4">Booking Now</h2>
                    <div class="mb-5">
                        <div class="row">
                            <div class="col-6 form-group">
                          
                                <asp:DropDownList ID="ddlploc" CssClass="custom-select px-4" runat="server">   
                                </asp:DropDownList>

                            </div>
                            <div class="col-6 form-group">
                                  <asp:DropDownList ID="ddldloc" CssClass="custom-select px-4" runat="server">
                                     <asp:ListItem Value="1">select</asp:ListItem>
                                          </asp:DropDownList>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6 form-group">
                                <div class="date" id="date2" data-target-input="nearest">
                                    <input id="Pdate" runat="server" type="text" class="form-control p-4 datetimepicker-input" placeholder="Pickup Date"
                                        data-target="#date2" data-toggle="datetimepicker" />
                                </div>
                            </div>
                            <div class="col-6 form-group">
                                <div class="time" id="time2" data-target-input="nearest">
                                    <input type="text" id="ptime" runat="server" class="form-control p-4 datetimepicker-input" placeholder="Pickup Time"
                                        data-target="#time2" data-toggle="datetimepicker" />
                                </div>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <textarea class="form-control py-3 px-4" rows="3" id="Sreq" runat="server" placeholder="Special Request" required="required"></textarea>
                        </div>
                    </div>
                </div>
              <%--  <div class="col-lg-4">
                    <div class="bg-secondary p-5 mb-5">
                        <h2 class="text-primary mb-4">Payment</h2>
                        <div class="form-group">
                            <div class="custom-control custom-radio">
                                <input type="radio" class="custom-control-input" name="payment" id="paypal">
                                <label class="custom-control-label" for="paypal">Paypal</label>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="custom-control custom-radio">
                                <input type="radio" class="custom-control-input" name="payment" id="directcheck">
                                <label class="custom-control-label" for="directcheck">Direct Check</label>
                            </div>
                        </div>
                        <div class="form-group mb-4">
                            <div class="custom-control custom-radio">
                                <input type="radio" class="custom-control-input" name="payment" id="banktransfer">
                                <label class="custom-control-label" for="banktransfer">Bank Transfer</label>
                            </div>
                        </div>
                     
                        
                    </div>
                </div>--%>
            </div>
                <asp:Button ID="btnbook" class="btn btn-block btn-primary py-3" runat="server" Text="Book Now" OnClick="Button1_Click" />
        </div>
    </div>
        </form>

</asp:Content>
