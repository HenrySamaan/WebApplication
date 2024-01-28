<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminlogin.aspx.cs" Inherits="WebApplication.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceholder1" runat="server">
    <div class="contaier">
        <div class="row">
            <div class="col-md-6 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <center><img width="150px" src="imgs/adminuser.png" /></center>
                        <center><h5 class="card-title">Admin Login</h5></center>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6 mx-auto">
              <div class="row">
                 <div class="col">
                     <label><b>Admin ID</b></label>
                     <div class="form-group">
                    <asp:TextBox CssClass="form-control" ID="TBUser" runat="server" placeholder="Admin ID"></asp:TextBox>    
                     </div>
                    <label><b>Password</b></label>
                     <div class="form-group">
                    <asp:TextBox CssClass="form-control" ID="TBPass" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>    
                     </div>
                     <div class="form-group">
                         <asp:Button runat="server" id="Btnlogin" class="btn btn-success btn-block btn-lg"  type="button" value="button" Text="login" OnClick="Btnlogin_Click" />
                     </div>
                     
                 </div>
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
    </div>
</asp:Content>
