using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TdiWebApp
{
    public partial class DataValidationBT : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && Session["UserName"] == null)
                Response.Redirect("~/Login.aspx");

        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                // Traitement des données (enregistrement en base de données, etc.)
            }
        }

        protected void ValidatePassword(object source, ServerValidateEventArgs args)
        {
            // Validation personnalisée pour le mot de passe
            args.IsValid = args.Value.Length >= 6; // Doit être d'au moins 6 caractères
        }

        protected void ValidateUsername(object source, ServerValidateEventArgs args)
        {
            string[] existingUsers = { "admin", "imad", "test" };
            args.IsValid = !Array.Exists(existingUsers, user => user.Equals(args.Value, StringComparison.OrdinalIgnoreCase));
        }

    }
}