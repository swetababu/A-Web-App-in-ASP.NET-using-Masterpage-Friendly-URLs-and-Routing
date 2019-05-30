using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Assignment_SportsPro.Models
{
    public class Customer // create customer class
    {
        public string CustomerID { get; set; } // get and set values for CustomerID
        public string Name { get; set; } // get and set values for Name
        public string Address { get; set; } // get and set values for Address
        public string City { get; set; } // get and set values for City
        public string State { get; set; } // get and set values for State
        public string ZipCode { get; set; } // get and set values for ZipCode
        public string Phone { get; set; } // get and set values for Phone
        public string Email { get; set; } // get and set values for Email

        // Display fucntion definition
        public string Display()
        {
            string displayString = string.Format("{0}: {1}; {2} ",
                Name,
                Phone,
                Email
            );
            return displayString; // return displayString with name, phone and email
        }
    }
}