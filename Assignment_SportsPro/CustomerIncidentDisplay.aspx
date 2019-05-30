<%-- 
    Assignment 11
    Purpose - SQL Data Source with GridView Control
    Created By - Sweta Saurabh Gupta (8252397)
    Date Created - 6th July 2018
--%>


<%@ Page Title="CustomerIncidentDisplay" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="CustomerIncidentDisplay.aspx.cs" Inherits="Assignment_SportsPro.CustomerIncidentDisplay" %>

<asp:Content ID="Content2" ContentPlaceHolderID="mainPlaceholder" runat="server">
     <br />
                     <div class="form-group">
                      <div class=" container row">
                          
                <label id="lblCategory" for="ddlCategory" 
                    class="col-md-4 control-label">
                    Select a customer:</label> <%-- Select Customer --%>

                          <div class="col-md-5">
                    <%-- Drop down list for select customer --%>
                    <asp:DropDownList ID="ddlCategory" runat="server" AutoPostBack="True"
                        DataSourceID="SqlDataSource1" DataTextField="Name" 
                        DataValueField="CustomerID" CssClass="form-control">
                    </asp:DropDownList>
                    <asp:SqlDataSource runat="server" ID="SqlDataSource1" 
                        ConnectionString='<%$ ConnectionStrings:ConnectionString %>' 
                        SelectCommand="SELECT * FROM [Customers] ORDER BY [Name]">
                    </asp:SqlDataSource>
                    <br />
                   
                   
                </div>
                      </div>

                
            </div>

     <div class="form-group">
                <div class="col-xs-12 col-sm-offset-1 col-sm-12">
                    <%-- table header --%>
                     <div class="container">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="row bg-dark text-white font-weight-bold text-uppercase p-2">
                                            <div class="col-md-3">
                                               Product/Incident
                                            </div>
                                            <div class="col-md-3">
                                                Tech Name
                                            </div>
                                            <div class="col-md-3">
                                                Opened
                                            </div>
                                            <div class="col-md-3">
                                                 Closed
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                    <%-- datalist to display incidents --%>
                     <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource2" CssClass="table table-bordered table-striped">
                          
                        <ItemTemplate>
                            <%--  incidents display --%>
                           
                             <div class="container">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' /> <%-- product name --%>
                                                
                                            </div>
                                            <div class="col-md-3">
                                                <asp:Label ID="TechNameLabel" runat="server" Text='<%# Eval("TechName") %>' /> <%-- technician name --%>
                                            </div>
                                             <div class="col-md-3">
                                                <asp:Label ID="DateOpenedLabel" runat="server" Text='<%# Eval("DateOpened", "{0:dd/MM/yyyy}") %>'  /> <%-- date opened --%>
                                            </div>
                                            <div class="col-md-3">
                                                   <asp:Label ID="DateClosedLabel" runat="server" Text='<%# Eval("DateClosed", "{0:dd/MM/yyyy}") %>'/> <%-- date closed --%>
                                            </div>
                                           
                                           
                                        </div>
                                        
                                    </div>
                                </div>
                                 <div class="row">
                                     <div class="col-md-12">
                                         <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' /> <%-- incident description --%>
                                     </div>
                                 </div>
                            </div>
                        </ItemTemplate>
                        
                    </asp:DataList>

<asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        SelectCommand="SELECT Products.Name, Incidents.Description, Technicians.Name AS TechName, Incidents.DateOpened, Incidents.DateClosed FROM Incidents INNER JOIN Products ON Incidents.ProductCode = Products.ProductCode INNER JOIN Technicians ON Incidents.TechID = Technicians.TechID WHERE (Incidents.CustomerID = @customerID)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlCategory" Name="customerID" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>  
            </div>

    

    
</asp:Content>
