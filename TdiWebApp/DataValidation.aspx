<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DataValidation.aspx.cs" Inherits="TdiWebApp.DataValidation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Formulaire d'Inscription</h2>
    <form>
        <!-- Champ Nom -->
        <asp:Label ID="lblName" runat="server" Text="Nom :" />
        <asp:TextBox ID="txtName" runat="server" />
        <asp:RequiredFieldValidator ID="rfvName" runat="server"
            ControlToValidate="txtName" ErrorMessage="Le nom est requis."
            ForeColor="Red" />
        <br /><br />

        <!-- Champ Prenom -->
        <asp:Label ID="lblPrenom" runat="server" Text="Prénom :" />
        <asp:TextBox ID="txtPrenom" runat="server" />
       <asp:CustomValidator ID="cvPrenom" runat="server"
            ControlToValidate="txtPrenom"
            OnServerValidate="ValidateUsername" ErrorMessage="Ce nom d'utilisateur est déjà pris."
            ForeColor="Red" />
        <br /><br />

        <!-- Champ Âge -->
        <asp:Label ID="lblAge" runat="server" Text="Âge :" />
        <asp:TextBox ID="txtAge" runat="server" />
        <asp:RangeValidator ID="rvAge" runat="server"
            ControlToValidate="txtAge" MinimumValue="18" MaximumValue="60" Type="Integer"
            ErrorMessage="L’âge doit être compris entre 18 et 60 ans."
            ForeColor="Red" />
        <br /><br />

        <!-- Champ Date de nissance -->
        <asp:Label ID="lblBirthdate" runat="server" Text="Date de naissance:" AssociatedControlID="txtBirthdate" />
        <asp:TextBox ID="txtBirthdate" runat="server" TextMode="Date" />
        <asp:CustomValidator ID="cvAgeClientSide" runat="server"
         ControlToValidate="txtBirthdate"
         ClientValidationFunction="ValidateAge" ErrorMessage="Veuillez entrer une date dans le passé."
         ForeColor="Red" />
        <br /><br />

        <!-- Champ Email -->
        <asp:Label ID="lblEmail" runat="server" Text="Email :" />
        <asp:TextBox ID="txtEmail" runat="server" />
        <asp:RegularExpressionValidator ID="revEmail" runat="server"
            ControlToValidate="txtEmail"
            ValidationExpression="^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$"
            ErrorMessage="Entrez un email valide." ForeColor="Red" />
        <br /><br />

        <!-- Champ Confirmation de l'Email -->
        <asp:Label ID="lblConfirmEmail" runat="server" Text="Confirmer l'Email :" />
        <asp:TextBox ID="txtConfirmEmail" runat="server" />
        <asp:CompareValidator ID="cvEmail" runat="server"
            ControlToCompare="txtEmail" ControlToValidate="txtConfirmEmail"
            ErrorMessage="Les emails ne correspondent pas." ForeColor="Red" />
        <br /><br />

        <!-- Champ Mot de passe -->
        <asp:Label ID="lblPassword" runat="server" Text="Mot de passe :" />
        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" />
        <asp:CustomValidator ID="cvPassword" runat="server"
            ControlToValidate="txtPassword"
            OnServerValidate="ValidatePassword" ErrorMessage="Le mot de passe doit contenir au moins 6 caractères."
            ForeColor="Red" />
        <br /><br />

        <!-- Bouton de Soumission -->
        <asp:Button ID="btnSubmit" runat="server" Text="Soumettre" OnClick="btnSubmit_Click" />
        <br /><br />

        <!-- Résumé des Erreurs -->
        <asp:ValidationSummary ID="vsSummary" runat="server" ForeColor="Red" />
    </form>
    <script type="text/javascript">
        function ValidateAge(src, args) {
            var date = new Date(args.Value);
            var today = new Date();
            args.IsValid = date<today;
        }
    </script>
</asp:Content>
