<%-- 
    Assignment 11
    Purpose - SQL Data Source with GridView Control
    Created By - Sweta Saurabh Gupta (8252397)
    Date Created - 6th July 2018
--%>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerDisplay.aspx.cs" MasterPageFile="~/MasterPage.Master" Title="Customer Display | SportsPro Assignment" Inherits="Assignment_SportsPro.CustomerDisplay" %>
<%--
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Customer Display | SportsPro Assignment</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/style.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.0.0.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</head>
--%>


<%--
<body>
    
  <div class="container">
    
    <main>
        <form id="form1" runat="server" class="form-horizontal">
            <header class="jumbotron container">
				<h1 class="margin font_h1">SportsPro</h1>
				<h2 class="margin font_h2">Sports management software for the sports enthusiast</h2>
			</header>
            --%>      


                
<asp:Content ID="ContactUsContent" ContentPlaceHolderID="mainPlaceholder" runat="server">
    <br />
                <div class="form-group ">
                    <div class="col-sm-12 row">
                        <label class="col-sm-5">Select a customer:</label>
                        <div class="col-sm-6">
                            <asp:DropDownList ID="ddlCustomer" runat="server" AutoPostBack="True" 
                                DataSourceID="SqlDataSource1" DataTextField="Name" 
                                DataValueField="CustomerID" CssClass="form-control">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT [CustomerID], [Name], [Address], [City], [State], [ZipCode], [Phone], [Email] FROM [Customers] ORDER BY [Name]"></asp:SqlDataSource>
                        </div>
                    </div>
                </div>
           
            <div class="form-group">
                <div class="col-sm-12">
                    <label class="col-sm-5">Address: </label><asp:Label ID="lblAddress" runat="server" CssClass="col-sm-6"></asp:Label>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-12">
                    <label class="col-sm-5">Phone: </label><asp:Label ID="lblPhone" runat="server" CssClass="col-sm-6"></asp:Label>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-12">
                    <label class="col-sm-5">Email: </label><asp:Label ID="lblEmail" runat="server" CssClass="col-sm-6"></asp:Label>
                </div>
            </div>
            <div class="btn">
                <div class="col-sm-5">
                    <asp:Button ID="btnAdd" runat="server" Text="Add to Contact List" CssClass="btn-info padding-5" OnClick="btnAdd_Click" />
                </div>
            </div>
            <div class="btn">
                <div class="col-sm-5">
                    <asp:Button ID="btnDisplay" runat="server" Text="Display Contact List" CssClass="btn-info padding-5" PostBackUrl="~/Administration/ContactDisplay"/> <%-- used friendly URL --%>
                </div>
            </div>
            <div class="col-sm-6">
                <asp:Label ID="lblMessage" runat="server" EnableViewState="false" CssClass="text-info col-sm-12"></asp:Label>
            </div>
    </asp:Content>
          <%--  
        </form>
    </main>
</div>
</body>
</html>

              --%>      


             