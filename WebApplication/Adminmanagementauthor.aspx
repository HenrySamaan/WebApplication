<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Adminmanagementauthor.aspx.cs" Inherits="WebApplication.Aminmanagementauthor" %>
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
                            <center><h5 class="card-title">Author Details</h5></center>
                                <center><img width="100px" src="imgs/writer.png" /></center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <label><b>Author ID</b></label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="TBAuthorID" runat="server" placeholder="ID"></asp:TextBox>
                                        <asp:Button runat="server" id="btnGo" class=" btn-secondary" type="button" value="Go" Text="Go" OnClick="btnGo_Click" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <label><b>Author Name</b></label>
                                <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="TBAuthorName" runat="server" placeholder="Name"></asp:TextBox>    
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
                              <center><h5 class="card-title">Author List</h5></center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>
                        
                        <div class="row">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ELibraryConnectionString %>" SelectCommand="SELECT * FROM [AuthorMaster]"></asp:SqlDataSource>  
                            <div class="col">
                                <asp:GridView ID="GridView1" runat="server" class="table table-striped table-bordered" AutoGenerateColumns="False" DataKeyNames="AuthorID" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="AuthorID" HeaderText="AuthorID" ReadOnly="True" SortExpression="AuthorID" />
                                        <asp:BoundField DataField="AuthorName" HeaderText="AuthorName" SortExpression="AuthorName" />
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
