// Assignment 11
// Purpose - SQL Data Source with GridView Control
// Created By - Sweta Saurabh Gupta(8252397)
// Date Created - 6th July 2018

using Assignment_SportsPro.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment_SportsPro
{
    public partial class CustomerDisplay : System.Web.UI.Page
    {

        private Customer selectedCustomer;
        protected void Page_Load(object sender, EventArgs e)
        {
            //bind drop-down list on first load   
            if (!IsPostBack)
                ddlCustomer.DataBind();

            //get and show customer on every load
            selectedCustomer = this.GetselectedCustomer();
            lblAddress.Text = selectedCustomer.Address + " " + selectedCustomer.City + " " + selectedCustomer.State + " " + selectedCustomer.ZipCode;
            lblPhone.Text = selectedCustomer.Phone;
            lblEmail.Text = selectedCustomer.Email;
        }

        private Customer GetselectedCustomer()
        {
            //get row from SqlDataSource based on value in drop-down list
            DataView customerTable = (DataView)
                SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            customerTable.RowFilter =
                "CustomerID = '" + ddlCustomer.SelectedValue + "'";
            DataRowView row = customerTable[0];

            //create a new customer object and load with data from row
            Customer c = new Customer();
            c.Name = row["Name"].ToString();
            c.CustomerID = row["CustomerID"].ToString();
            c.Address = row["Address"].ToString();
            c.City = row["City"].ToString();
            c.State = row["State"].ToString();
            c.ZipCode = row["ZipCode"].ToString();
            c.Phone = row["Phone"].ToString();
            c.Email = row["Email"].ToString();
            return c;
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                //get cart from session and selected item from customer
                CustomerList cust = CustomerList.GetCustomer();
                Customer c = cust[selectedCustomer.Name];

                if (c == null)
                {
                    cust.AddCustomer(selectedCustomer); // add customer method call
                    Response.Redirect("~/Administration/ContactDisplay"); // used friendly URL 
                }
                else
                {
                    //error label
                    lblMessage.Text = "Contact already added, Please try another contact";
                }

            }
        }
    }
}