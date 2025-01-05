using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TdiWebApp
{
    public partial class SimpleForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && Session["UserName"] == null)
                Response.Redirect("~/Login.aspx");
        }

        // for exemple-1
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string name = txtName.Text;
            string email = txtEmail.Text;

            lblMessage.Text = $"Merci {name}, votre email ({email}) a été enregistré avec succès.";
        }

        // for exemple-2
        protected void btnSubClick(object sender, EventArgs e)
        {
            string firstName = txtFirstName.Text;
            string lastName = txtLastName.Text;
            string country = ddlCountry.SelectedValue;
            //string birthdate = txtBirthdate.Text;
            bool isNewsletterSubscribed = chkNewsletter.Checked;

            lblHello.Text = $"Bienvenue, {firstName} {lastName} !";

            lblConfirmation.Text = isNewsletterSubscribed ? "Vous vous êtes inscrit à la newsletter." : "Vous n'êtes pas inscrit à la newsletter.";

/*            if (isNewsletterSubscribed)
            {
                lblConfirmation.Text = "Vous vous êtes inscrit à la newsletter.";
            }
            else
            {
                lblConfirmation.Text = "Vous n'êtes pas inscrit à la newsletter.";
            }
*/
        }
        protected void ddlOptions_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedOption = ddlCountry.SelectedItem.Text;
            lblOption.Text = $"Vous avez choisi : {selectedOption}";
        }
    }
}