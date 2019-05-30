using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Assignment_SportsPro.Models
{
    public class Survey // create Survey class
    {
        public int CustomerID { get; set; } // get and set values for CustomerID
        public int IncidentID { get; set; } // get and set values for IncidentID
        public int ResponseTime { get; set; } // get and set values for ResponseTime
        public int TechEfficiency { get; set; } // get and set values for TechEfficiency
        public int Resolution { get; set; } // get and set values for Resolution
        public string Comments { get; set; } // get and set values for Comments
        public bool Contact { get; set; } // get and set values for Contact
        public string ContactBy { get; set; } // get and set values for ContactBy
    }
}