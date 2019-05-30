// Assignment 11
// Purpose - SQL Data Source with GridView Control
// Created By - Sweta Saurabh Gupta(8252397)
// Date Created - 6th July 2018

using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Assignment_SportsPro.Models;

namespace Assignment_SportsPro
{
    public partial class CustomerSurvey : System.Web.UI.Page
    {
        DataView IncidentData; // create a IncidentData dataview
        Incident incident; // create an object for Incident class
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            // set focus on textbox for entering customer ID
            txtCustID.Focus();
        }

        protected void listBoxIncident_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblIncidentError.Visible = false;
        }

        protected void btnGetIncidents_Click(object sender, EventArgs e)
        {

            if (IsValid)
            {
                IncidentData = (DataView)SqlDataSourceIncident.Select(DataSourceSelectArguments.Empty);
                IncidentData.RowFilter = string.Format("CustomerID='{0}' AND DateClosed IS NOT NULL", txtCustID.Text);
                if (IncidentData.Count > 0) // check if the data is not empty
                {
                    // enable controls which has been disabled earlier
                    lblIncidentError.Visible = false;
                    listBoxIncident.Enabled = true;
                    rbListRespTime.Enabled = true;
                    rbListTechEfficiency.Enabled = true;
                    rbListProbResolution.Enabled = true;
                    txtboxComments.Enabled = true;
                    chkboxContactMe.Enabled = true;
                    rbContactEmail.Enabled = true;
                    rbContactPhone.Enabled = true;
                    btnSubmit.Enabled = true;

                    listBoxIncident.Focus(); // set focus on listbox which is showing incidents
                    lblErrorNoIncidents.Visible = false;
                    GetIncidents(); // call method for fetching incidents
                }
                else
                {
                    lblErrorNoIncidents.Visible = true;

                    // disable all the controls if it does not get the data
                    listBoxIncident.Enabled = false;
                    rbListRespTime.Enabled = false;
                    rbListTechEfficiency.Enabled = false;
                    rbListProbResolution.Enabled = false;
                    txtboxComments.Enabled = false;
                    chkboxContactMe.Enabled = false;
                    rbContactEmail.Enabled = false;
                    rbContactPhone.Enabled = false;
                    btnSubmit.Enabled = false;
                }
            }

        }
        private void GetIncidents() // method definition for fetching incidents
        {
            listBoxIncident.Items.Clear();
            listBoxIncident.Items.Insert(0, new ListItem("--Select an Incident--", "0"));
            foreach (DataRowView row in IncidentData)
            {
                incident = new Incident(); // create new object for incident class

                // fetch incident data from table
                incident.IncidentID = row["IncidentID"].ToString();
                incident.ProductCode = row["ProductCode"].ToString();
                incident.DateCLosed = row["DateClosed"].ToString();
                incident.Title = row["Title"].ToString();

                // add new listitem to list box
                listBoxIncident.Items.Add(new ListItem(incident.CustomerIncidentDisplay(), incident.IncidentID.ToString()));

            }

        }

        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            bool contactMe = false;

            if (listBoxIncident.SelectedIndex > 0)
            {
                createSurvey();
            }
            else
            {
                lblIncidentError.Visible = true;
            }

        }

        public void createSurvey()
        {
            Survey survey = new Survey(); // create new object of survey class

            // assign cutomer id and incident id values
            survey.CustomerID = Convert.ToInt16(txtCustID.Text);
            survey.IncidentID = Convert.ToInt16(listBoxIncident.SelectedItem.Value);

            // get survey values

            foreach (ListItem listItem in rbListRespTime.Items)
            {
                if (listItem.Selected)
                {
                    survey.ResponseTime = Convert.ToInt16(listItem.Value);
                }
            }
            foreach (ListItem listItem in rbListTechEfficiency.Items)
            {
                if (listItem.Selected)
                {
                    survey.TechEfficiency = Convert.ToInt16(listItem.Value);
                }
            }
            foreach (ListItem listItem in rbListProbResolution.Items)
            {
                if (listItem.Selected)
                {
                    survey.Resolution = Convert.ToInt16(listItem.Value);
                }
            }

            survey.Comments = txtboxComments.Text; // save survey comments

            if (chkboxContactMe.Checked == true) // if contact me check-box is checked, enable the radio buttons for call/email and set session value of "contactMe" to true
            {
                Session["contactMe"] = true;
                survey.Contact = true;
                if (rbContactEmail.Checked)
                {
                    survey.ContactBy = "Email";
                }
                else
                {
                    survey.ContactBy = "Phone";
                }

            }
            else
            {
                survey.Contact = false;
            }
            Response.Redirect("/CustomerSupport/SurveyComplete"); // used friendly URL
        }

        protected void ChkboxContactMe_CheckedChanged(object sender, EventArgs e)
        {
            if (chkboxContactMe.Checked == true) // if contact me check-box is checked, enable the radio buttons for call/email
            {
                rbContactEmail.Enabled = true;
                rbContactPhone.Enabled = true;
            }
            else
            {
                rbContactEmail.Enabled = false;
                rbContactPhone.Enabled = false;
            }
        }

       
    }
}
