<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminbookissuing.aspx.cs" Inherits="WebApplication.adminbookissuing" %>
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
                            <center><h5 class="card-title">Book Issuing</h5></center>
                            <center><img width="100px" src="imgs/Books.png" /></center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label><b>Member ID</b></label>
                                <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="TBMemberID" runat="server" placeholder="MemberID"></asp:TextBox>    
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label><b>Book ID</b></label>
                                <div class="form-group">
                                    <div class="input-group">
                                    <asp:TextBox CssClass="form-control" ID="TBBookID" runat="server" placeholder="BookID"></asp:TextBox>
                                    <asp:Button runat="server" id="btnGo" class=" btn-secondary" type="button" value="Go" Text="Go" OnClick="btnGo_Click" />    
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label><b>Member Name</b></label>
                                <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="TBMemberName" runat="server" placeholder="Member Name"></asp:TextBox>    
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label><b>Book Name</b></label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TBBookName" runat="server" placeholder="Book Name"></asp:TextBox>     
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label><b>Start Date</b></label>
                                <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="TBStartDate" runat="server" TextMode="Date" placeholder="dd-mm-yyyy"></asp:TextBox>    
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label><b>End Date</b></label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TBEndDate" runat="server" TextMode="Date" placeholder="dd-mm-yyyy"></asp:TextBox>     
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                <asp:Button runat="server" id="BtnIssue" class=" btn-info btn-block btn-lg" type="button" value="Issue" Text="Rent" OnClick="BtnIssue_Click" />
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <asp:Button runat="server" id="BtnReturn" class=" btn-success btn-block btn-lg" type="button" value="Return" Text="Return" OnClick="BtnReturn_Click" />
                                </div>
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
            <div class="col-md-7">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                            <center><h5 class="card-title">Issued Book List</h5></center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col">
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ELibraryConnectionString %>" SelectCommand="SELECT * FROM [BookIssue]"></asp:SqlDataSource>
                                <asp:GridView ID="GridView1" runat="server" class="table table-striped table-bordered" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnRowDataBound="GridView1_RowDataBound">
                                    <Columns>
                                       
                                        <asp:BoundField DataField="bookID" HeaderText="bookID" SortExpression="bookID" />
                                        <asp:BoundField DataField="bookname" HeaderText="book name" SortExpression="bookname" />
                                        <asp:BoundField DataField="issuedate" HeaderText="issue date" SortExpression="issuedate" />
                                        <asp:BoundField DataField="duedate" HeaderText="due date" SortExpression="duedate" />
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                   </div>
               </div>
            </div>
        </div>
    </div>
    
</asp:Content>
