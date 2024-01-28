<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="WebApplication.SignUp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceholder1" runat="server">
     <div class="contaier">
        <div class="row">
            <div class="col-md-6 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <center><img width="150px" src="imgs/generaluser.png" /></center>
                        <center><h5 class="card-title">User Registration</h5></center>
                    </div>
                </div>
            </div>
        </div>
         <div class="row">
             <div class="col-md-6 mx-auto">
                 <div class="row">
                     <div class="col">
                        <label><b>Full Name</b></label>
                           <div class="form-group">
                          <asp:TextBox CssClass="form-control" ID="TBFullName" runat="server" placeholder="Full Name"></asp:TextBox>    
                           </div>
                      </div>
                     <div class="col">
                        <label><b>Date of Birth</b></label>
                           <div class="form-group">
                          <asp:TextBox CssClass="form-control" ID="TBDob" runat="server" placeholder="dd-mm-yyyy" TextMode="Date"></asp:TextBox>    
                           </div>
                      </div>
                 </div>
             </div>
          </div>
         <div class="row">
             <div class="col-md-6 mx-auto">
                 <div class="row">
                     <div class="col">
                        <label><b>Contact Number</b></label>
                           <div class="form-group">
                          <asp:TextBox CssClass="form-control" ID="TBContact" runat="server" placeholder="Contact Number" TextMode="Number"></asp:TextBox>    
                           </div>
                      </div>
                     <div class="col">
                        <label><b>Email ID</b></label>
                           <div class="form-group">
                          <asp:TextBox CssClass="form-control" ID="TBEmail" runat="server" placeholder="Email" TextMode="Email"></asp:TextBox>    
                           </div>
                      </div>
                 </div>
             </div>
          </div>
         <div class="row">
             <div class="col-md-6 mx-auto">
                 <div class="row">
                     <div class="col">
                        <label><b>State</b></label>
                           <div class="form-group">
                               <asp:DropDownList ID="DDListState" CssClass="form-control" runat="server">
                                   <asp:ListItem Text="Select" Value="Select"></asp:ListItem>
                                   <asp:ListItem Text="Jbeil" Value="Jbeil"></asp:ListItem>
                                   <asp:ListItem Text="Beirut" Value="Beirut"></asp:ListItem>
                                   <asp:ListItem Text="Tripoli" Value="Tripoli"></asp:ListItem>
                                   <asp:ListItem Text="Batroun" Value="Batroun"></asp:ListItem>
                               </asp:DropDownList>    
                           </div>
                      </div>
                     <div class="col">
                        <label><b>City</b></label>
                           <div class="form-group">
                          <asp:TextBox CssClass="form-control" ID="TBCity" runat="server" placeholder="City"></asp:TextBox>    
                           </div>
                      </div>
                     <div class="col">
                        <label><b>Pin Code</b></label>
                           <div class="form-group">
                          <asp:TextBox CssClass="form-control" ID="TBPinCode" runat="server" placeholder="Pin Code" TextMode="Number"></asp:TextBox>    
                           </div>
                      </div>
                 </div>
             </div>
          </div>
         <div class="row">
             <div class="col-md-6 mx-auto">
                 <div class="row">
                     <div class="col">
                        <label><b>Address</b></label>
                           <div class="form-group">
                          <asp:TextBox CssClass="form-control" ID="TBAddress" runat="server" placeholder="Address" TextMode="MultiLine"></asp:TextBox>    
                           </div>
                      </div>
                     <div class="col">
                     </div>
                 </div>
             </div>
          </div>
      </div>
    <div class="row">
             <div class="col">
                <center>
                    <span class="badge badge-pill badge-info">Login Credentiel</span>
                </center>
             </div>
          </div>
    <div class="row">
             <div class="col">
                <br />
             </div>
          </div>
    <div class="row">
             <div class="col-md-6 mx-auto">
                 <div class="row">
                     <div class="col">
                        <label><b>User ID</b></label>
                           <div class="form-group">
                          <asp:TextBox CssClass="form-control" ID="TBUserID" runat="server" placeholder="Username"></asp:TextBox>    
                           </div>
                      </div>
                     <div class="col">
                        <label><b>Password</b></label>
                           <div class="form-group">
                          <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>    
                           </div>
                      </div>
                 </div>
             </div>
          </div>
    
    
    <div class="row">
             <div class="col-md-6 mx-auto">
                     <div class="form-group">
                        <a href="SignUp.aspx">
                            <asp:Button ID="btnsignup" runat="server" Text="Sign Up" class="btn-success btn-block btn-lg" OnClick="btnsignup_Click" />
                     </div>
                 
             </div>
          </div>
     <div>


        </div>
        <div class="row">
            <div class="col-md-6 mx-auto">
                <a href="Home.aspx"><< Back To HomePage</a><br /><br />
            </div>
        </div>
    
         
        
   
</asp:Content>
