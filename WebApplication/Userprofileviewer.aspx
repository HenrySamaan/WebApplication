<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Userprofileviewer.aspx.cs" Inherits="WebApplication.Userprofileviewer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceholder1" runat="server">
    <div class="container-fluid">
        
        <div class="row">
          <div class="col-md-5">
                
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center><img width="150px" src="imgs/generaluser.png" /></center>
                                <center><h5 class="card-title">your Profile</h5></center>
                                <center><p class="card-title">Account Status - <span class="badge badge-pill badge-success">Active</span> </p></center>
                             </div>
                       </div>
                        <div class="row">
                            <div class="col">
                                <br />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label><b>Contact Number</b></label>
                                <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="TBContact" runat="server" placeholder="Contact Number" TextMode="Number"></asp:TextBox>    
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label><b>Email ID</b></label>
                                <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="TBEmail" runat="server" placeholder="Email" TextMode="Email"></asp:TextBox>    
                                </div>
                            </div>
                      </div>
                        <div class="row">
                            <div class="col-md-4">
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
                            <div class="col-md-4">
                                <label><b>City</b></label>
                                <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="TBCity" runat="server" placeholder="City"></asp:TextBox>    
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label><b>Pin Code</b></label>
                                <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="TBPinCode" runat="server" placeholder="Pin Code" TextMode="Number"></asp:TextBox>    
                            </div>
                      </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <label><b>Address</b></label>
                                <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="TBAddress" runat="server" placeholder="Address" TextMode="MultiLine"></asp:TextBox>    
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label><b>Full Name</b></label>
                                <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="TBFullName" runat="server" placeholder="Full Name"></asp:TextBox>    
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label><b>Date of Birth</b></label>
                                <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="TBDob" runat="server" placeholder="dd-mm-yyyy" TextMode="Date"></asp:TextBox>    
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
                            <div class="col-md-4">
                                <label><b>Member ID</b></label>
                                <div class="form-group">
                                <asp:TextBox ID="TbMemberID" runat="server" CssClass="form-control" ReadOnly="True" placeholder="Membber ID"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label><b>Old Password</b></label>
                                <div class="form-group">
                                <asp:TextBox ID="TboldPasss" CssClass="form-control" runat="server" ReadOnly="True" placeholder="Old Password"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label><b>New Password</b></label>
                                <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="TbNewPass" runat="server" placeholder="New Password"></asp:TextBox>    
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-8 mx-auto">
                                <div class="form-group">
                                <center><asp:Button runat="server" id="btnsignup" class=" btn-info btn-block btn-lg" type="button" value="Update" Text="Sign Up" /></center>
                                </div>
                           </div>
                        </div>
                    </div>
                </div>
                <a href="Home.aspx"><< Back To HomePage</a><br /><br />
          </div>
          <div class="col-md-7">
              <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center><img width="150px" src="imgs/books.png" /></center>
                                <center><h5 class="card-title">Your Issued books</h5></center>
                                <center><p class="card-title"><span class="badge badge-pill badge-info">Your Info about book due date</span> </p></center>
                             </div>
                       </div>
                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr> 
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <asp:GridView ID="GridView1" class="table table-stripped table-bordered" runat="server"></asp:GridView>  
                            </div>
                        </div>
                        

                    </div>
              </div>
          </div>  
       </div>

    </div>
     

</asp:Content>
