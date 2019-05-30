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
    public partial class ContactDisplay : System.Web.UI.Page
    {
        private CustomerList customer;
        protected void Page_Load(object sender, EventArgs e)
        {
            customer = CustomerList.GetCustomer(); // create object of customer
            if (!IsPostBack)
                this.DisplayCustomer(); // call method for display customer
        }

        protected void btnRemove_Click(object sender, EventArgs e) // method for remove button click event
        {
            if (customer.Count > 0) // check is the list has customers or not
            {
                if (lstCustomers.SelectedIndex > -1)
                {
                    customer.RemoveAt(lstCustomers.SelectedIndex);
                    this.DisplayCustomer();
                }
                else
                {
                    lblRemove.Text = "Please select the customer you want to remove.";
                }
            }
        }

        protected void btnClear_Click(object sender, EventArgs e) // method for clear button click event
        {
            if (customer.Count > 0)
            {
                customer.Clear();
                lstCustomers.Items.Clear();
            }
        }

        private void DisplayCustomer() // method for display customer 
        {
            lstCustomers.Items.Clear(); // clear the list of customers
            Customer c; // object for customer
            for (int i = 0; i < customer.Count; i++)
            {
                c = customer[i];
                lstCustomers.Items.Add(c.Display());
            }
        }

    }

}
