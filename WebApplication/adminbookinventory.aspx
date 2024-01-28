<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminbookinventory.aspx.cs" Inherits="WebApplication.adminbookinventory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function readURL(input) {

            if (input.files && input.files[0])
            {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#imgview').attr('src', e.target.result);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
        $(document).ready(
            function () {
                $('.table').prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
            }
        );
            
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceholder1" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-5">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                            <center><h5 class="card-title">Book Details</h5></center>
                                <center><img id="imgview" width="100px" src="bookinventory/books.png" /></center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <asp:FileUpload onchange="readURL(this);" class="form-control" ID="FileUpload1" runat="server" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3">
                                <label><b>book ID</b></label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control mr-1" ID="TBBBookID" runat="server" placeholder="ID"></asp:TextBox>
                                        <asp:Button runat="server" id="btnGo" class=" btn-info" type="button" value="Go" Text="Go" OnClick="btnGo_Click" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-9">
                                <label><b>Book Name</b></label>
                                <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="TBBookName" runat="server" placeholder="Name"></asp:TextBox>    
                                </div>
                            </div>
                        </div>
                        <div class="row">
                           <div class="col-md-4">
                              <label><b>Language</b></label>
                              <div class="form-group">
                               <asp:DropDownList ID="DDLLanguage" CssClass="form-control" runat="server">
                               <asp:ListItem Text="English" Value="English"></asp:ListItem>
                               <asp:ListItem Text="French" Value="French"></asp:ListItem>
                               <asp:ListItem Text="Arabic" Value="Arabic"></asp:ListItem>
                               <asp:ListItem Text="Espagnol" Value="Espagnol"></asp:ListItem>
                               <asp:ListItem Text="Italien" Value="Italien"></asp:ListItem>
                               </asp:DropDownList>    
                              </div>
                           </div>
                           <div class="col-md-4">
                              <label><b>Author Name</b></label>
                              <div class="form-group">
                               <asp:DropDownList ID="DDLAuthorName" CssClass="form-control" runat="server">
                               <asp:ListItem Text="Select" Value="Select"></asp:ListItem>
                               </asp:DropDownList>    
                              </div>
                           </div>
                           <div class="col-md-4">
                              <label><b>Genre</b></label>
                              <div class="form-group">
                                  <asp:ListBox ID="LBGenre" CssClass="form-control" runat="server" SelectionMode="Multiple">
                                   <asp:ListItem Text="Action" Value="English"></asp:ListItem>
                                   <asp:ListItem Text="thriller" Value="French"></asp:ListItem>
                                   <asp:ListItem Text="motivation" Value="Arabic"></asp:ListItem>
                                   <asp:ListItem Text="sci-fi" Value="Espagnol"></asp:ListItem>
                                   <asp:ListItem Text="comedy" Value="Italien"></asp:ListItem>
                               </asp:ListBox>
                              </div>
                           </div>
                         </div>
                        <div class="row">
                            <div class="col-md-4">
                                <label><b>Publisher Name</b></label>
                                <div class="form-group">
                                 <asp:DropDownList ID="DDLPublisherName" CssClass="form-control" runat="server">
                               <asp:ListItem Text="Select" Value="Select"></asp:ListItem>
                               </asp:DropDownList>    
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label><b>Publisher Date</b></label>
                                <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="TPublisherDate" runat="server" placeholder="dd-mm-yyyy" TextMode="Date"></asp:TextBox>    
                                </div>
                            </div>  
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <label><b>Edition</b></label>
                                <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="TEdition" runat="server" placeholder="Edition"></asp:TextBox>    
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label><b>Book Cost</b></label>
                                <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="TBookCost" runat="server" placeholder="BookCost" TextMode="Number"></asp:TextBox>    
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label><b>Pages</b></label>
                                <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="TPages" runat="server" placeholder="Pages" TextMode="Number"></asp:TextBox>    
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <label><b>Actual Stock</b></label>
                                <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="TAStock" runat="server" placeholder="stock" TextMode="Number"></asp:TextBox>    
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label><b>Current Stock</b></label>
                                <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="TCstock" runat="server" placeholder="stock" TextMode="Number" ReadOnly="true"></asp:TextBox>    
                                </div>
                            </div>  
                            <div class="col-md-4">
                                <label><b>Issued Books</b></label>
                                <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="TIssuedbooks" runat="server" TextMode="Number" ReadOnly="true" placeholder="Issued books"></asp:TextBox>    
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <label><b>Book Description</b></label>
                                <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="TBookDescription" runat="server" TextMode="MultiLine" placeholder="book Description"></asp:TextBox>    
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
                              <center><h5 class="card-title">Book Inventory List</h5></center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
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
                        
                     </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
