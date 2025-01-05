using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TdiWebApp
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            // Simuler une authentification simple
            string username = txtUsername.Text;

            // Stocker le nom d'utilisateur en session
            Session["UserName"] = username;

            // Incrémenter le compteur d'utilisateurs connectés
            if (Application["ConnectedUsers"] == null)
            {
                Application["ConnectedUsers"] = 1;
            }
            else
            {
                Application["ConnectedUsers"] = (int)Application["ConnectedUsers"] + 1;
            }

            //Sauvegarder la préférence de langue
            CreateOrUpdateCookie(ddlLanguage.SelectedValue);

        // Rediriger vers la page d'accueil
        Response.Redirect("~/");
        }

        protected void CreateOrUpdateCookie(string lng)
        {
            HttpCookie userCookie = Request.Cookies["PreferredLanguage"];
            if (userCookie != null)
            {
                // Recrée le cookie et Sauvegarder la préférence de langue
                userCookie["Language"] = lng;
                userCookie.Expires = DateTime.Now.AddDays(7); // Mise à jour de l'expiration
                Response.Cookies.Add(userCookie);
            }
            else
            {
                // Crée le cookie et Sauvegarder la préférence de langue
                HttpCookie languageCookie = new HttpCookie("PreferredLanguage", lng);
                languageCookie.Expires = DateTime.Now.AddDays(7); // Expire dans 7 jours
                Response.Cookies.Add(languageCookie);
            }
        }

    }
}