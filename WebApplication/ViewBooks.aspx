<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ViewBooks.aspx.cs" Inherits="WebApplication.ViewBooks" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(
            function () {
                $('.table').prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
            }
        );

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceholder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col mx-auto">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                            <center><h5 class="card-title">Book Issuing</h5></center>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col mx-auto">
                
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ELibraryConnectionString %>" SelectCommand="SELECT * FROM [BookMaster]"></asp:SqlDataSource>
                                <asp:GridView ID="GridView1"  runat="server" class="table table-striped table-bordered" AutoGenerateColumns="False" DataKeyNames="bookId" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="bookId" HeaderText="ID" ReadOnly="True" SortExpression="bookId" >
                                        <HeaderStyle Font-Bold="True" />
                                        <ItemStyle Font-Bold="True" />
                                        </asp:BoundField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                 <div class="container-fluid">
                                                    <div class="row">
                                                        <div class="col-lg-10">
                                                            <div class="row">
                                                                <div class="col-12">
                                                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("BookName") %>' Font-Bold="True" Font-Size="X-Large"></asp:Label>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-12">
                                                                    Author-<asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Small" Text='<%# Eval("authorName") %>'></asp:Label>
                                                                    &nbsp;| Genre-<asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Small" Text='<%# Eval("genre") %>'></asp:Label>
                                                                    &nbsp;| Language-
                                                                    <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="Small" Text='<%# Eval("language") %>'></asp:Label>
                                                                    
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-12">

                                                                    Publisher-<asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="Small" Text='<%# Eval("publisherName") %>'></asp:Label>
                                                                    &nbsp;| Publisher Date-<asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="Small" Text='<%# Eval("publishDate") %>'></asp:Label>
                                                                    &nbsp;| Pages-<asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Size="Small" Text='<%# Eval("noofpages") %>'></asp:Label>
                                                                    &nbsp;| Edition
                                                                    <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Size="Small" Text='<%# Eval("edition") %>'></asp:Label>

                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-12">

                                                                    Cost-<asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Size="Small" Text='<%# Eval("bookCost") %>'></asp:Label>
                                                                    &nbsp;| Actual Stock-<asp:Label ID="Label10" runat="server" Font-Bold="True" Font-Size="Small" Text='<%# Eval("actualstock") %>'></asp:Label>
                                                                    &nbsp;| Available-<asp:Label ID="Label11" runat="server" Font-Bold="True" Font-Size="Small" Text='<%# Eval("currentstock") %>'></asp:Label>

                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-12">

                                                                    Description-<asp:Label ID="Label12" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="Small" Text='<%# Eval("bookdescription") %>'></asp:Label>

                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-2">
                                                            <asp:Image ID="Image1" class="img-fluid" runat="server" ImageUrl='<%# Eval("bookimglink") %>' />
                                                        </div>

                                                    </div>
                                                </div>                                                
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            
            </div>
        </div>
        <div class="row">
            <div class="col mx-auto">
                <hr />
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
              <a href="Home.aspx"><< Back To HomePage</a><br /><br />
            </div>
        </div>
    </div>
</asp:Content>
