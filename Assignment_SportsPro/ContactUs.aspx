<%-- 
    Assignment 11
    Purpose - SQL Data Source with GridView Control
    Created By - Sweta Saurabh Gupta (8252397)
    Date Created - 6th July 2018
--%>

<%@ Page Title="Contact Us | SportsPro Assignment" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="Assignment_SportsPro.ContactUs" %>

<asp:Content ID="ContactUsContent" ContentPlaceHolderID="mainPlaceholder" runat="server">
   
   
             <h2>How to contact us</h2>
            <p>
                If you ever have any questions or comments about our products, please be sure to contact us in whatever way is most convinient for you. 
            </p>

            <table class="table table-borderless">
                <tr>
                    <td>Phone: </td>
                    <td>
                        1-800-555-0400<br />
                        Weekdays, 8 to 5 Pacific Time
                    </td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td>
                        <a href="mailto:sportspro@sportsprosoftware.com">sportspro@sportsprosoftware.com</a>
                    </td>
                </tr>
                <tr>
                    <td>Fax: </td>
                    <td>
                        1-559-555-2732
                    </td>
                </tr>
                <tr>
                    <td>Address: </td>
                    <td>
                        Sportspro Software, Inc. <br />
                        1500 N, Main Street <br />
                        Fresno, California 93710
                    </td>
                </tr>
            </table>
   
</asp:Content>

