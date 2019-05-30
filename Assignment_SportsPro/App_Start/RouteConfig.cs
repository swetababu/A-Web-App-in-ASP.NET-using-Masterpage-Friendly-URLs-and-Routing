// Assignment 11
// Purpose - SQL Data Source with GridView Control
// Created By - Sweta Saurabh Gupta(8252397)
// Date Created - 6th July 2018

using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Routing;
using Microsoft.AspNet.FriendlyUrls;

namespace Assignment_SportsPro
{
    public static class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            // FriendlyUrls Settings
            var settings = new FriendlyUrlSettings();
            settings.AutoRedirectMode = RedirectMode.Permanent;
            routes.EnableFriendlyUrls(settings);

            // ignore WebResource.axd file
            routes.Ignore("{resource}.axd/{*pathInfo}");

            // map static routes for pages
            routes.MapPageRoute("RegisterProducts", "CustomerSupport/RegisterProducts", "~/ProductRegistration.aspx"); // routing for ProductRegistration Page
            routes.MapPageRoute("CompleteCustomerSurvey", "CustomerSupport/CustomerSurvey", "~/CustomerSurvey.aspx"); // routing for CustomerSurvey Page
            routes.MapPageRoute("SurveyComplete", "CustomerSupport/SurveyComplete", "~/SurveyComplete.aspx"); // routing for SurveyComplete Page
            routes.MapPageRoute("DsiplayCustomerIncidents", "TechSupport/CustomerIncidentDisplay", "~/CustomerIncidentDisplay.aspx"); // routing for CustomerIncidentDisplay Page
            routes.MapPageRoute("UpdateIncidents", "TechSupport/UpdateIncidents", "~/IncidentUpdate.aspx"); // routing for IncidentUpdate Page

        }
    }
}
