<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Adminusermanagement.aspx.cs" Inherits="WebApplication.Adminusermanagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script type="text/javascript">
        $(document).ready(
            function ()
            {
                $('.table').prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
            }
        );
     </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceholder1" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                            <center><h5 class="card-title">Member Details</h5></center>
                            <center><img width="100px" src="imgs/generaluser.png" /></center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3">
                                <label><b>Member ID</b></label>
                                <div class="form-group">
                                    <div class="input-group">
                                    <asp:TextBox CssClass="form-control mr-1" ID="TBMemberID" runat="server" placeholder="ID"></asp:TextBox>
                                    <asp:Button OnClick="BtnGo_Click" runat="server" id="BtnGo" class=" btn-info" type="button" value="Go" Text="Go" />    
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <label><b>Full Name</b></label>
                                <div class="form-group">
                                    <div class="input-group">
                                    <asp:TextBox CssClass="form-control" ID="TBFullName" runat="server" placeholder="Member Name" ReadOnly="true"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label><b>Account status</b></label>
                                <div class="form-group">
                                    <div class="input-group">
                                    <asp:TextBox CssClass="form-control mr-1" ID="TAccountStatus" runat="server" placeholder="Account status"></asp:TextBox>
                                        <asp:LinkButton OnClick="activebtn_Click" ID="activebtn" class="btn btn-success mr-1" runat="server"><i class="fas fa-check-circle"></i></asp:LinkButton>
                                        <asp:LinkButton OnClick="pendingbtn_Click" ID="pendingbtn" class="btn btn-warning mr-1" runat="server"><i class="far fa-pause-circle"></i></asp:LinkButton>
                                        <asp:LinkButton OnClick="inactivebtn_Click" ID="inactivebtn" class="btn btn-danger mr-1" runat="server"><i class="fas fa-times-circle"></i></asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <label><b>DOB</b></label>
                                <div class="form-group">
                                <asp:TextBox CssClass="form-control" ReadOnly="true" ID="TBDOB" runat="server" placeholder="Member Name" TextMode="Date"></asp:TextBox>    
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label><b>Contact No</b></label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ReadOnly="true" ID="TBContactNo" runat="server" placeholder="888888" TextMode="Number"></asp:TextBox>     
                                </div>
                            </div>
                            
                            <div class="col-md-4">
                                <label><b>Email ID</b></label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ReadOnly="true" ID="TBEmailID" runat="server" placeholder="Email@g.com" TextMode="Email"></asp:TextBox>     
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <label><b>State</b></label>
                                <div class="form-group">
                                <asp:TextBox CssClass="form-control" ReadOnly="true" ID="TState" runat="server" placeholder="State" ></asp:TextBox>    
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label><b>City</b></label>
                                <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="TCity" ReadOnly="true" runat="server" placeholder="City" ></asp:TextBox>    
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label><b>Pin Code</b></label>
                                <div class="form-group">
                                <asp:TextBox CssClass="form-control" ReadOnly="true" ID="TPinCode" runat="server" placeholder="Pin Code" TextMode="Number" ></asp:TextBox>    
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <label><b>Full Postal Address</b></label>
                                <div class="form-group">
                                <asp:TextBox CssClass="form-control" ReadOnly="true" ID="TAddress" runat="server" placeholder="Address" TextMode="MultiLine" ></asp:TextBox>    
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <asp:Button OnClick="BtnDelete_Click" runat="server" ReadOnly="true" id="BtnDelete" class=" btn-danger btn-block btn-lg" type="button" value="Delete" Text="Delete" />    
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                            <a href="Home.aspx"><< Back To HomePage</a><br /><br />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                            <center><h5 class="card-title">Member List</h5></center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col">
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ELibraryConnectionString %>" SelectCommand="SELECT * FROM [MemberMaster]"></asp:SqlDataSource>
                                <asp:GridView ID="GridView1" runat="server" class="table table-striped table-bordered" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="MemberID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>
                                        <asp:BoundField DataField="MemberID" HeaderText="Member ID" ReadOnly="True" SortExpression="MemberID" />
                                        <asp:BoundField DataField="FullName" HeaderText="Name" SortExpression="FullName" />
                                        <asp:BoundField DataField="accountstatus" HeaderText="Account Status" SortExpression="accountstatus" />
                                        <asp:BoundField DataField="contact" HeaderText="Contact" SortExpression="contact" />
                                        <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                                        <asp:BoundField DataField="state" HeaderText="State" SortExpression="state" />
                                        <asp:BoundField DataField="city" HeaderText="City" SortExpression="city" />
                                     </Columns>
                                    <EditRowStyle BackColor="#2461BF" />
                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#EFF3FB" />
                                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                </asp:GridView>
                            </div>
                        </div>
                   </div>
               </div>
            </div>
        </div>
    </div>
</asp:Content>
