<%-- 
    Assignment 11
    Purpose - SQL Data Source with GridView Control
    Created By - Sweta Saurabh Gupta (8252397)
    Date Created - 6th July 2018
--%>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SurveyComplete.aspx.cs" MasterPageFile="~/MasterPage.Master" Title="Survey Complete | SportsPro Assignment" Inherits="Assignment_SportsPro.SurveyComplete" %>
<%-- 
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Survey Complete | SportsPro Assignment</title>
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
            <h1>SportsPro</h1>
            <h2>Sports management software for the sports enthusiast</h2>
        </header>
        <main>
            <form id="form1" runat="server">

    --%>
<asp:Content ID="CustomerSurveyContent" ContentPlaceHolderID="mainPlaceholder" runat="server">
    <br />
                <asp:Label ID="lblMessage" runat="server" CssClass="labelSize" Text=""></asp:Label>
                <br />
                <asp:Label ID="lblMessage2" runat="server" Text=""></asp:Label> 
                <br />
                <br />
                <div class="col-sm-2">
                    <asp:Button ID="btnReturnToSurvey" runat="server" Text="Return to Survey" OnClick="btnReturnToSurvey_Click" CssClass="btn-info" />
                </div>
                <br />
     </asp:Content>
               <%--  
            </form>
        </main>
    </div>
</body>
</html>

                   --%>

