<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="PublisherManagement.aspx.cs" Inherits="WebApplication.PublisherManagement" %>
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
        <div class="container">
        <div class="row">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                            <center><h5 class="card-title">Publisher details</h5></center>
                                <center><img width="100px" src="imgs/publisher.png" /></center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <label><b>Publisher ID</b></label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="TBPublisherID" runat="server" placeholder="ID"></asp:TextBox>
                                        <asp:Button runat="server" id="btnGo" class=" btn-secondary" type="button" value="Go" Text="Go" OnClick="btnGo_Click" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <label><b>Publisher Name</b></label>
                                <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="TBPublisherName" runat="server" placeholder="Name"></asp:TextBox>    
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <asp:Button runat="server" id="BtnAdd" class=" btn-success btn-block btn-lg" type="button" value="Add" Text="Add" OnClick="BtnAdd_Click" />
                            </div>
                            <div class="col-md-4">
                                <asp:Button runat="server" id="BtnUpdate" class=" btn-primary btn-block btn-lg" type="button" value="Update" Text="Update" OnClick="BtnUpdate_Click" />
                            </div>
                            <div class="col-md-4">
                                <asp:Button runat="server" id="BtnDelete" class=" btn-danger btn-block btn-lg" type="button" value="Delete" Text="Delete" OnClick="BtnDelete_Click" />
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
                              <center><h5 class="card-title">Publisher List</h5></center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>
                        
                        <div class="row">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ELibraryConnectionString %>" SelectCommand="SELECT * FROM [PulisherMaster]"></asp:SqlDataSource>  
                            <div class="col">
                                <asp:GridView ID="GridView1" runat="server" class="table table-striped table-bordered" AutoGenerateColumns="False" DataKeyNames="publisherID" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="publisherID" HeaderText="publisherID" ReadOnly="True" SortExpression="publisherID" />
                                        <asp:BoundField DataField="publisherName" HeaderText="publisherName" SortExpression="publisherName" />
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

