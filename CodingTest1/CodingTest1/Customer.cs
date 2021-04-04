using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CodingTest1
{
    public class Customer
    {
        string name;
        public string Name
        {
            get
            {
                return name;
            }
            set
            {
                name = value;
            }
        }

        string company;
        public string Company
        {
            get
            {
                return company;
            }
            set
            {
                company = value;
            }
        }

        string membership;
        public string Membership
        {
            get
            {
                return membership;
            }
            set
            {
                membership = value;
            }
        }
        string emailID;
        public string Email
        {
            get
            {
                return emailID;
            }
            set
            {
                emailID = value;
            }
        }

        string password;

        int age;
        public int Age
        {
            get
            {
                return age;
            }
        }

        public int GetMembershipFee()
        {
            if (membership == "Free")
            {
                return 0;
            }
            else if (membership == "Basic")
            {
                return 30;
            }
            else if (membership == "Premium")
            {
                return 60;
            }

            return -1;
        }

        public void ComputeAge(string dobString)
        {
            DateTime dob = Convert.ToDateTime(dobString);
            DateTime currentDate = DateTime.Now;
            age = currentDate.Year - dob.Year;
        }
    }
}