using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Assignment_SportsPro.Models
{
    public class Incident // create Incident class
    {
        public string IncidentID { get; set; } // get and set values for IncidentID
        public string CustomerID { get; set; } // get and set values for CustomerID
        public string ProductCode { get; set; } // get and set values for ProductCode
        public string TechID { get; set; } // get and set values for TechID
        public string DateOpened { get; set; } // get and set values for DateOpened
        public string DateCLosed { get; set; } // get and set values for DateCLosed
        public string Title { get; set; } // get and set values for Title


        // CustomerIncidentDisplay function definition
        public string CustomerIncidentDisplay()
        {
            string displayIncident = string.Format("Incident For {0} closed ({1}) ({2})",
                ProductCode.ToString(),
                DateCLosed.ToString(),
                Title.ToString());
            return displayIncident; // return displayIncident string
        }
    }
}