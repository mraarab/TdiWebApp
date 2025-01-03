<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SimpleForm.aspx.cs" Inherits="TdiWebApp.SimpleForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<!--
    <asp:Label ID="lblName" runat="server" Text="Nom :" />
    <asp:TextBox ID="txtName" runat="server" />
    <br /><br />

    <asp:Label ID="lblEmail" runat="server" Text="Email :"  />
    <asp:TextBox ID="txtEmail" runat="server" />
    <br /><br />

    <asp:Button ID="btnSubmit" runat="server" Text="Soumettre" OnClick="btnSubmit_Click" />
    <br /><br />

    <asp:Label ID="lblMessage" runat="server" />
-->

    <h2>Formulaire d'inscription</h2>
        <asp:Label ID="lblFirstName" runat="server" Text="Prénom:" AssociatedControlID="txtFirstName" />
        <asp:TextBox ID="txtFirstName" runat="server" />
        <br /><br />

        <asp:Label ID="lblLastName" runat="server" Text="Nom:" AssociatedControlID="txtLastName" />
        <asp:TextBox ID="txtLastName" runat="server" />
        <br /><br />

        <asp:Label ID="lblCountry" runat="server" Text="Sélectionnez un pays:" AssociatedControlID="ddlCountry" />
        <asp:DropDownList ID="ddlCountry" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlOptions_SelectedIndexChanged">
            <asp:ListItem Text="Sélectionnez un pays" Value="" />
            <asp:ListItem Text="France" Value="France" />
            <asp:ListItem Text="Canada" Value="Canada" />
            <asp:ListItem Text="Belgique" Value="Belgique" />
            <asp:ListItem Text="Suisse" Value="Suisse" />
        </asp:DropDownList>

        <asp:Label ID="lblOption" runat="server" />
        <br /><br />

        <asp:Label ID="lblBirthdate" runat="server" Text="Date de naissance:" AssociatedControlID="txtBirthdate" />
        <asp:TextBox ID="txtBirthdate" runat="server" TextMode="Date" />
        <br /><br />

        <asp:CheckBox ID="chkNewsletter" runat="server" Text="S'inscrire à la newsletter" />
        <br /><br />

        <asp:Button ID="Button1" runat="server" Text="Soumettre" OnClick="btnSubClick" />
        <br /><br />

        <asp:Label ID="lblHello" runat="server" Text="" Font-Bold="True" />
        <asp:Label ID="lblConfirmation" runat="server" Text="" Font-Italic="True" />


</asp:Content>
