using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Assignment_SportsPro.Models
{
    public class CustomerList // create CusotmerList class
    {
        private List<Customer> customer;

        public CustomerList()
        {
            customer = new List<Customer>(); // create new list for customer
        }

        public int Count
        {
            get { return customer.Count; } // returns total customer count
        }

        public Customer this[int index]
        {
            get { return customer[index]; } // return current customer
            set { customer[index] = value; }
        }

        public Customer this[string name]
        {
            get
            {
                foreach (Customer c in customer)
                    if (c.Name == name) return c;
                return null;
            }
        }

        public static CustomerList GetCustomer() // definition for GetCustomer ()
        {
            CustomerList customer = (CustomerList)HttpContext.Current.Session["Customer"];
            if (customer == null)
                HttpContext.Current.Session["Customer"] = new CustomerList(); // maintain session for current customer
            return (CustomerList)HttpContext.Current.Session["Customer"];
        }

        public void AddCustomer(Customer c)
        {
            customer.Add(c); // add customer
        }

        public void RemoveAt(int index)
        {
            customer.RemoveAt(index); // remove customer
        }

        public void Clear()
        {
            customer.Clear(); // clear function
        }
    }
}