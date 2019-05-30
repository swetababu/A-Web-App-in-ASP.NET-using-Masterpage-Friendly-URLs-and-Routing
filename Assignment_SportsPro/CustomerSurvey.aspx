<%-- 
    Assignment 11
    Purpose - SQL Data Source with GridView Control
    Created By - Sweta Saurabh Gupta (8252397)
    Date Created - 6th July 2018
--%>
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerSurvey.aspx.cs" MasterPageFile="~/MasterPage.Master" Title="Customer Survery | SportsPro Assignment" Inherits="Assignment_SportsPro.CustomerSurvey" %>

<%--
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Customer Survery | SportsPro Assignment</title>
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

  --%>
<asp:Content ID="CustomerSurveyContent" ContentPlaceHolderID="mainPlaceholder" runat="server">
            <br />
                <div class="row">
                    <div class="col-sm-3">
                        <asp:Label ID="lblCustID" CssClass="customWidth" runat="server" Text="Enter your customer ID: "></asp:Label>
                    </div>
                    <div class="col-sm-3">
                        <asp:TextBox ID="txtCustID" CssClass="customWidth" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-sm-2"> 
                        <asp:Button ID="btnGetIncidents" CssClass="btn-info customWidth" runat="server" Text="Get Incidents" OnClick="btnGetIncidents_Click" ValidationGroup="valGrpCustId" />
                    </div>
                </div>
                <asp:RequiredFieldValidator ID="rfvCustomerId" runat="server" ControlToValidate="txtCustID" Display="Dynamic" ErrorMessage="Customer ID is required" ForeColor="Red" ValidationGroup="valGrpCustId"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="compValidCustId" runat="server" ControlToValidate="txtCustID" Display="Dynamic" ErrorMessage="Data entered should be Integer only." ForeColor="Red" Operator="GreaterThan" Type="Integer" ValidationGroup="valGrpCustId" ValueToCompare="0"></asp:CompareValidator>
                <asp:Label ID="lblErrorNoIncidents" runat="server" ForeColor="Red" Text="No Incidents Found !" Visible="False"></asp:Label>
                <br />
                <div class="row">
                    <div class="col-sm-10">
                        <asp:ListBox ID="listBoxIncident" CssClass="customWidth" runat="server" OnSelectedIndexChanged="listBoxIncident_SelectedIndexChanged" Enabled="False" ></asp:ListBox>
                    </div>
                </div>
                <asp:SqlDataSource ID="SqlDataSourceIncident" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [DateClosed], [CustomerID], [IncidentID], [Title], [DateOpened], [TechID], [ProductCode] FROM [Incidents] ORDER BY [DateClosed]"></asp:SqlDataSource>
                <asp:RequiredFieldValidator ID="rfvIncident" runat="server" ControlToValidate="listBoxIncident" Display="Dynamic" ErrorMessage="Please select Incident." ForeColor="Red" ValidationGroup="valGrpIncident" InitialValue="0"></asp:RequiredFieldValidator>
                <asp:Label ID="lblIncidentError" runat="server" ForeColor="Red" Text="Please Select a Valid Incident." ValidateRequestMode="Enabled" Visible="False"></asp:Label>
                <br />
                <div>
                    <asp:Label ID="lblSurvey" runat="server" Text="Please rate this incident by the following categories:" CssClass="font-weight-bold"></asp:Label>
                   <br />
                    <div class="row">
                        <div class="col-sm-2">
                            <asp:Label ID="lblResponseTime" runat="server" Text="Response Time: "></asp:Label>
                        </div>
                        <div class="col-sm-7">
                            <asp:RadioButtonList ID="rbListRespTime" RepeatDirection="Horizontal" runat="server" CellPadding="10" CellSpacing="0" Enabled="False">
                                <asp:ListItem Value ="1" Text="Not satisfied">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</asp:ListItem>
                                <asp:ListItem Value ="2" Text="Somewhat satisfied">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</asp:ListItem>
                                <asp:ListItem Value ="3" Text="Satisfied">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</asp:ListItem>
                                <asp:ListItem Value ="4" Text="Completely satisfied">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</asp:ListItem>
                            </asp:RadioButtonList>
                        </div>
                        <asp:RequiredFieldValidator ID="rfvRadioResponseTime" runat="server" ControlToValidate="rbListRespTime" ErrorMessage="Please select your choice!" ForeColor="Red" ValidationGroup="valGrpIncident"></asp:RequiredFieldValidator>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-sm-2">
                            <asp:Label ID="lblTechEfficiency" runat="server" Text="Technician efficiency:"></asp:Label>
                        </div>
                        <div class="col-sm-7">
                            <asp:RadioButtonList ID="rbListTechEfficiency" RepeatDirection="Horizontal" runat="server" CellPadding="10" CellSpacing="0" Enabled="False">
                                <asp:ListItem Value ="1" Text="Not satisfied">&nbsp;</asp:ListItem>
                                <asp:ListItem Value ="2" Text="Somewhat satisfied">&nbsp;</asp:ListItem>
                                <asp:ListItem Value ="3" Text="Satisfied">&nbsp;</asp:ListItem>
                                <asp:ListItem Value ="4" Text="Completely satisfied">&nbsp;</asp:ListItem>
                            </asp:RadioButtonList>
                        </div>
                        <asp:RequiredFieldValidator ID="rvfRadioTechEffi" runat="server" ControlToValidate="rbListTechEfficiency" ErrorMessage="Please Select your choice!" ForeColor="Red" ValidationGroup="valGrpIncident"></asp:RequiredFieldValidator>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-sm-2">
                            <asp:Label ID="lblProbResolution" runat="server" Text="Problem Resolution: "></asp:Label>
                        </div>
                       <div class="col-sm-7">
                            <asp:RadioButtonList ID="rbListProbResolution" RepeatDirection="Horizontal" runat="server" CellPadding="10" CellSpacing="0" Enabled="False">
                                <asp:ListItem Value ="1" Text="Not satisfied">&nbsp;</asp:ListItem>
                                <asp:ListItem Value ="2" Text="Somewhat satisfied">&nbsp;</asp:ListItem>
                                <asp:ListItem Value ="3" Text="Satisfied">&nbsp;</asp:ListItem>
                                <asp:ListItem Value ="4" Text="Completely satisfied">&nbsp;</asp:ListItem>
                            </asp:RadioButtonList>
                        </div>
                        <asp:RequiredFieldValidator ID="rfvRadioProbReso" runat="server" ControlToValidate="rbListProbResolution" ErrorMessage="Please Select your choice!" ForeColor="Red" ValidationGroup="valGrpIncident"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-2">
                        <br />
                        <asp:Label ID="lblAdditionalComments" runat="server" Text="Additional comments: "></asp:Label>
                    </div>
                    <div class="col-sm-8">
                        <asp:TextBox ID="txtboxComments" TextMode="multiline" Columns="80" Rows="4" 
                            runat="server" Enabled="False"></asp:TextBox>
                    </div>
                </div>
                <br />
                <div class="form-group">
                    <asp:CheckBox ID="chkboxContactMe" runat="server" Text="Please contact me to discuss this incident" OnCheckedChanged="ChkboxContactMe_CheckedChanged" AutoPostBack="True" Enabled="False" />
                    <div>
                        <asp:RadioButton ID="rbContactEmail" runat="server" GroupName="grpContactMe" Text="Contact by email" Enabled="False"/>
                        <br />
                        <asp:RadioButton ID="rbContactPhone" runat="server" GroupName="grpContactMe" Text="Contact by phone" Enabled="False" />
                    </div>
                </div>
                <div class="col-sm-2">
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" CausesValidation="true" CssClass="btn-info customWidth" OnClick="BtnSubmit_Click" ValidationGroup="valGrpIncident" Enabled="False" />
                </div>
    <br />
           
     </asp:Content>
<%--
        </main>
    </div>
</body>
</html>

    --%>
