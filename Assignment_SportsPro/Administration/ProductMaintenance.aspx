
<%-- 
    Assignment 11
    Purpose - SQL Data Source with GridView Control
    Created By - Sweta Saurabh Gupta (8252397)
    Date Created - 6th July 2018
--%>

<%@ Page Title="ProductMaintenance" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ProductMaintenance.aspx.cs" Inherits="Assignment_SportsPro.Administration.ProductMaintenance" %>

<asp:Content ID="Content2" ContentPlaceHolderID="mainPlaceholder" runat="server">

     <div class="form-group">
                        <div class="row">
                            <div class="col-md-12">
                            <%-- GridView  --%>
                         <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" 
                             AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" 
                             BorderWidth="3px" CellPadding="4" CellSpacing="2" DataKeyNames="ProductCode" 
                             DataSourceID="SqlDataSource1" ForeColor="Black" CssClass="table"
                             OnPreRender="GridView1_PreRender" OnRowDeleted="GridView1_RowDeleted" OnRowUpdated="GridView1_RowUpdated"
                             >
                             <Columns>
                                 <asp:BoundField DataField="ProductCode" HeaderText="ProductCode" ReadOnly="True" SortExpression="ProductCode" />  <%-- bound field for product code  --%>
                                
                                  <%-- template field for name  --%>

                                 <asp:TemplateField HeaderText="Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lblGrdName" runat="server"
                                        Text='<%# Bind("Name") %>'></asp:Label>
                                    </ItemTemplate>
                                      <%-- edit template for name  --%>

                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtGrdName" runat="server"
                                        Text='<%# Bind("Name") %>'></asp:TextBox>
                                         <%-- validation  --%>
                                        <asp:RequiredFieldValidator
                                        ID="rfvGridName" runat="server"
                                        ControlToValidate="txtGrdName"
                                        ErrorMessage="Name is a required field."
                                        ValidationGroup="ValidationSummary1" CssClass="text-danger">*</asp:RequiredFieldValidator>
                                    </EditItemTemplate>
                                 </asp:TemplateField>

                                  <%-- template field for Version  --%>
                                  <asp:TemplateField HeaderText="Version">
                                    <ItemTemplate>
                                        <asp:Label ID="lblGrdVersion" runat="server"
                                        Text='<%# Bind("Version") %>'></asp:Label>
                                    </ItemTemplate>
                                       <%-- edit template for Version  --%>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtGrdVersion" runat="server"
                                        Text='<%# Bind("Version") %>'></asp:TextBox>
                                         <%-- validation  --%>
                                        <asp:RequiredFieldValidator
                                        ID="rfvGridVersion" runat="server"
                                        ControlToValidate="txtGrdVersion"
                                        ErrorMessage="Version is a required field."
                                        ValidationGroup="ValidationSummary1" CssClass="text-danger">*</asp:RequiredFieldValidator>
                                    </EditItemTemplate>
                                 </asp:TemplateField>


                                  <%-- template field for Release Date  --%>
                                 <asp:TemplateField HeaderText="Release Date">
                                    <ItemTemplate>
                                        <asp:Label ID="lblGrdReleaseDate" runat="server"
                                        Text='<%# Bind("ReleaseDate", "{0:d}") %>'></asp:Label>
                                    </ItemTemplate>
                                      <%-- edit template for Release Date   --%>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtGrdReleaseDate" runat="server"
                                        Text='<%# Bind("ReleaseDate", "{0:d}") %>'></asp:TextBox>
                                         <%-- validation  --%>
                                        <asp:RequiredFieldValidator
                                        ID="rfvGridReleaseDate" runat="server"
                                        ControlToValidate="txtGrdReleaseDate"
                                        ErrorMessage="ReleaseDate is a required field."
                                        ValidationGroup="ValidationSummary1" CssClass="text-danger">*</asp:RequiredFieldValidator>
                                     <asp:RegularExpressionValidator ID="revGridReleaseDate" 
                                     runat="server" ControlToValidate="txtGrdReleaseDate" 
                                     ErrorMessage="Please Enter a valid date in the proper format (mm/dd/yyyy)." Text="*" 
                                     ValidationExpression="\d{1,2}/\d{1,2}/\d{4}" ValidationGroup="ValidationSummary1" CssClass="text-danger">
                                 </asp:RegularExpressionValidator>
                                    </EditItemTemplate>
                                 </asp:TemplateField>
                                  <%-- command buttons  --%>
                                 <asp:CommandField ShowEditButton="True" ValidationGroup="ValidationSummary1" />
                                 <asp:CommandField ShowDeleteButton="True" ValidationGroup="ValidationSummary1" />
                             </Columns>
                             <FooterStyle BackColor="#CCCCCC" />
                             <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                             <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                             <RowStyle BackColor="White" />
                             <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                             <SortedAscendingCellStyle BackColor="#F1F1F1" />
                             <SortedAscendingHeaderStyle BackColor="#808080" />
                             <SortedDescendingCellStyle BackColor="#CAC9C9" />
                             <SortedDescendingHeaderStyle BackColor="#383838" />
                         </asp:GridView>
                                 <%-- label for showing database/concurrency errors  --%>
                                <asp:Label ID="lblGridError" runat="server" Text="" EnableViewState="False"></asp:Label>
                             <%-- validation summary for grid view errors  --%>
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server"
                                    CssClass="summary text-danger"
                                    HeaderText="Please correct these entries:" ValidationGroup="ValidationSummary1" />
            
                         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Products] WHERE [ProductCode] = @original_ProductCode AND [Name] = @original_Name AND [Version] = @original_Version AND [ReleaseDate] = @original_ReleaseDate" InsertCommand="INSERT INTO [Products] ([ProductCode], [Name], [Version], [ReleaseDate]) VALUES (@ProductCode, @Name, @Version, @ReleaseDate)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Products] ORDER BY [ProductCode]" UpdateCommand="UPDATE [Products] SET [Name] = @Name, [Version] = @Version, [ReleaseDate] = @ReleaseDate WHERE [ProductCode] = @original_ProductCode AND [Name] = @original_Name AND [Version] = @original_Version AND [ReleaseDate] = @original_ReleaseDate">
                             <DeleteParameters>
                                 <asp:Parameter Name="original_ProductCode" Type="String" />
                                 <asp:Parameter Name="original_Name" Type="String" />
                                 <asp:Parameter Name="original_Version" Type="Decimal" />
                                 <asp:Parameter Name="original_ReleaseDate" Type="DateTime" />
                             </DeleteParameters>
                             <InsertParameters>
                                 <asp:Parameter Name="ProductCode" Type="String" />
                                 <asp:Parameter Name="Name" Type="String" />
                                 <asp:Parameter Name="Version" Type="Decimal" />
                                 <asp:Parameter Name="ReleaseDate" Type="DateTime" />
                             </InsertParameters>
                             <UpdateParameters>
                                 <asp:Parameter Name="Name" Type="String" />
                                 <asp:Parameter Name="Version" Type="Decimal" />
                                 <asp:Parameter Name="ReleaseDate" Type="DateTime" />
                                 <asp:Parameter Name="original_ProductCode" Type="String" />
                                 <asp:Parameter Name="original_Name" Type="String" />
                                 <asp:Parameter Name="original_Version" Type="Decimal" />
                                 <asp:Parameter Name="original_ReleaseDate" Type="DateTime" />
                             </UpdateParameters>
                         </asp:SqlDataSource>
                   
                            </div>
                        </div>
                    </div>
                     <%-- add new product form  --%>
                    <div class="container-fluid">
                            <div class="form-group">
                                <label>To add a product, enter product information and click Add Product</label>
                            </div>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-3">
                                        <label for="txtProductID" class="float-left">Product ID:</label>
                                </div>
                                
                                <div class="col-md-5">
                                    <asp:TextBox ID="txtProductID" runat="server" CssClass="form-control" /> 
                                    
                                </div>
                                <div class="col-md-4">
                                    <asp:RequiredFieldValidator ID="rfvProductID" runat="server" Display="Dynamic" 
                                    ControlToValidate="txtProductID" CssClass="text-danger"
                                    ErrorMessage="ProductID is a required field." Text="* ProductID is a required field.">
                                </asp:RequiredFieldValidator>
                                </div>
                                </div>
                                
                            </div>
                         <%-- name field input  --%>
                        <div class="form-group">

                              <div class="row">
                                    <div class="col-md-3">
                                       <label for="txtProductName" class="float-left">Name:</label>
                                </div>
                                
                                <div class="col-md-5">
                                     <asp:TextBox ID="txtProductName" runat="server" CssClass="form-control" /> 
                                </div>
                                <div class="col-md-4">
                                       <asp:RequiredFieldValidator ID="rfvProductName" runat="server" Display="Dynamic" 
                                    ControlToValidate="txtProductName" CssClass="text-danger"
                                    ErrorMessage="Product Name is a required field." Text="* Product Name is a required field.">
                                </asp:RequiredFieldValidator>
                                </div>
                                </div>
                                
                            </div>

                             <%-- version field input  --%>
                           
                       
                        <div class="form-group">

                              <div class="row">
                                    <div class="col-md-3">
                                        <label for="txtVersion" class="float-left">Version:</label>
                                </div>
                                
                                <div class="col-md-5">
                                     <asp:TextBox ID="txtVersion" runat="server" CssClass="form-control" />   
                                </div>
                                <div class="col-md-4">
                                       <asp:RequiredFieldValidator ID="rfvVersion" runat="server" Display="Dynamic" 
                                    ControlToValidate="txtVersion" CssClass="text-danger"
                                    ErrorMessage="Product Version is a required field." Text="* Product Version is a required field.">
                                </asp:RequiredFieldValidator>

                                </div>
                                </div>


                               
                               
                            </div>
                       
                         <%-- release date field input  --%>

                        <div class="form-group">


                             <div class="row">
                                    <div class="col-md-3">
                                        <label for="txtReleaseDate" class="float-left">Release Date:</label>
                                </div>
                                
                                <div class="col-md-5">
                                      <asp:TextBox ID="txtReleaseDate" runat="server" CssClass="form-control" Text="" />  
                                </div>
                                <div class="col-md-4">
                                       <asp:RequiredFieldValidator ID="rfvReleaseDate" runat="server" Display="Dynamic" 
                                    ControlToValidate="txtReleaseDate" CssClass="text-danger"
                                    ErrorMessage="Release Date is a required field." Text="* Release Date is a required field.">
                                 <asp:RegularExpressionValidator ID="dateValRegex" 
                                     runat="server" ControlToValidate="txtReleaseDate" 
                                     ErrorMessage="Please Enter a valid date in the proper format." Text="* Please Enter a valid date in the proper format (mm/dd/yyyy)." 
                                     ValidationExpression="\d{1,2}/\d{1,2}/\d{4}">
                                 </asp:RegularExpressionValidator>
                                </asp:RequiredFieldValidator>
                                </div>
                                </div>

                            </div>
                            
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-3">

                                    </div>
                                    <div class="col-md-5">
                                    <asp:LinkButton ID="btnAddProduct" runat="server" Text="Add Product" OnClick="btnAddProduct_Click" CssClass="btn-info p-2" />  <%-- add product button  --%>
                                    </div>

                                    <asp:Label ID="lblAddError" runat="server" EnableViewState="False"></asp:Label>  <%-- label for displaying database/concurrency errors  --%>
                                </div>
                                
                                
                            </div>
                        </div>
                    

</asp:Content>

