using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TdiWebApp
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Afficher les informations
            if (Application["ConnectedUsers"] != null)
                lblConnectedUsers.Text = $"  Utilisateurs connectés : {Application["ConnectedUsers"]}";

            // Afficher la langue préférée
            HttpCookie languageCookie = Request.Cookies["PreferredLanguage"];
            if (languageCookie != null && languageCookie["Language"] != null)
                lblLanguage.Text = $"  Langue préférée : {languageCookie["Language"]}";
        }
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            if (Application["ConnectedUsers"] != null)
            {
                Application["ConnectedUsers"] = (int)Application["ConnectedUsers"] - 1;
            }
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/Login.aspx");
        }


    }
}