<%-- 
    Assignment 11
    Purpose - SQL Data Source with GridView Control
    Created By - Sweta Saurabh Gupta (8252397)
    Date Created - 6th July 2018
--%>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContactDisplay.aspx.cs" MasterPageFile="~/MasterPage.Master" Title="Contact Display | SportsPro Assignment" Inherits="Assignment_SportsPro.ContactDisplay" %>
<%-- 
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Contact Display | SportsPro Assignment</title>
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
        <header class="jumbotron">
            <h1>Sports Pro</h1>
            <h3>Sports management software for the sports enthusiast</h3>
        </header>
        <main>
            <form id="form1" runat="server" class="form-horizontal">

    --%>

<asp:Content ID="ContactDisplayContent" ContentPlaceHolderID="mainPlaceholder" runat="server">
                <br />
                    <label class="col-sm-12">Contact List:</label>
                    <div class="form-group">
                        <div class="col-sm-12 row">
                                <asp:ListBox ID="lstCustomers" runat="server" CssClass="col-sm-9"></asp:ListBox>
                            <div class="col-sm-3">
                                <div><asp:Button ID="btnRemoveContact" runat="server" Text="Remove Contact" OnClick="btnRemove_Click" CssClass="btn-info col-sm-9 padding-5" /></div><br />
                                <div><asp:Button ID="btnEmptyList" runat="server" Text="Empty List" OnClick="btnClear_Click" CssClass="btn-info col-sm-9 padding-5" /></div>
                            </div>
                            <asp:Label ID="lblRemove" runat="server" EnableViewState="False" CssClass="text-info col-sm-12"></asp:Label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <div class="col-sm-12">
                                    <asp:Button ID="btnSelect" runat="server" Text="Select Additional Customers" PostBackUrl="/Administration/CustomerDisplay" CssClass="btn-info padding-5" /> <%-- used friendly URL --%>
                                </div>
                            </div>
                        </div>
                    </div>
                </asp:Content>
<%-- 
            </form>
        </main>
    </div>
</body>
</html>

    --%>
