using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CodingTest1
{
    public partial class Default : System.Web.UI.Page
    {
        Customer custObj = new Customer();

        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            if (!IsPostBack)
            {
                listRadioMembership.SelectedIndex = 0;

                ddlDay.Items.Add("Select");
                for (int i=1; i<=31; i++)
                {
                    ddlDay.Items.Add(i.ToString());
                }

                ddlYear.Items.Add("Select");
                for (int i = 1920; i <= 2020; i++)
                {
                    ddlYear.Items.Add(i.ToString());
                }
            }
        }

        protected void listRadioMembership_SelectedIndexChanged(object sender, EventArgs e)
        {
            custObj.Membership = listRadioMembership.SelectedValue;
            lblAmount.Text = "$" + custObj.GetMembershipFee().ToString();
        }

        protected void CustValEmail_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string companyName = txtCompany.Text;
            string email = txtEmail.Text;

            if (email.Contains(companyName))
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
            }
        }

        protected void btnSignup_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                custObj.Name = txtName.Text;
                custObj.Email = txtEmail.Text;
                custObj.Company = txtCompany.Text;

                string dobStr = ddlMonth.SelectedValue + "/" + ddlDay.SelectedValue + "/" + ddlYear.SelectedValue;
                custObj.ComputeAge(dobStr);

                if (listRadioMembership.SelectedIndex == 0)
                {
                    custObj.Membership = "Free";
                }
                else if (listRadioMembership.SelectedIndex == 1)
                {
                    custObj.Membership = "Basic";
                }
                else if (listRadioMembership.SelectedIndex == 2)
                {
                    custObj.Membership = "Premium";
                }

                Session["customer"] = custObj;

                Response.Redirect("~\\Welcome.aspx");
            }
        }

        protected void CustValMembership_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = true;

            if(listRadioMembership.SelectedValue == "Premium")
            {
                string dobStr = ddlMonth.SelectedValue + "/" + ddlDay.SelectedValue + "/" + ddlYear.SelectedValue;
                custObj.ComputeAge(dobStr);

                if(custObj.Age < 17)
                {
                    args.IsValid = false;
                }
            }
        }
    }
}