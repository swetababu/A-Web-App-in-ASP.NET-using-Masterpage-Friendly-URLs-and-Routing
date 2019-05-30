// Assignment 11
// Purpose - SQL Data Source with GridView Control
// Created By - Sweta Saurabh Gupta(8252397)
// Date Created - 6th July 2018

using Assignment_SportsPro.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment_SportsPro
{

    public partial class SurveyComplete : System.Web.UI.Page
    {
        private Survey survey; // create an object of survey class
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["contactMe"] != null)
            {
                lblMessage.Text = "Thank You for your feedback! "; // +Session["contactMe"].ToString(); 
                lblMessage2.Text = "A customer service representative will contact you within 24 hours."; // a message is displayed if the customer selects to be contacted
            }
            else
            {
                lblMessage.Text = "Thank You for your feedback! "; // +Session["contactMe"].ToString();
            }

        }

        protected void btnReturnToSurvey_Click(object sender, EventArgs e)
        {
            Response.Redirect("/CustomerSupport/CustomerSurvey"); // redirect to CustomerSurvey page using friendly URL
        }
    }
}