<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TdiWebApp.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row justify-content-center">
        <div class="col-md-6 col-lg-4">
            <div class="card shadow">
                <div class="card-header bg-primary text-white">
                    <h3 class="card-title mb-0">Connexion</h3>
                </div>
                <div class="card-body">
                    <div class="mb-3">
                        <asp:Label runat="server" Text="Nom d'utilisateur" 
                                 AssociatedControlID="txtUsername" CssClass="form-label" />
                        <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" 
                                   placeholder="Entrez votre nom d'utilisateur" />
                        <asp:RequiredFieldValidator runat="server" 
                                                  ControlToValidate="txtUsername"
                                                  CssClass="text-danger"
                                                  ErrorMessage="Le nom d'utilisateur est requis." />
                    </div>

                    <div class="mb-3">
                        <asp:Label runat="server" Text="Langue préférée" 
                                 AssociatedControlID="ddlLanguage" CssClass="form-label" />
                        <asp:DropDownList ID="ddlLanguage" runat="server" CssClass="form-select">
                            <asp:ListItem Text="Français" Value="fr" />
                            <asp:ListItem Text="English" Value="en" />
                            <asp:ListItem Text="Arab" Value="ar" />

                        </asp:DropDownList>
                    </div>

                    <div class="d-grid">
                        <asp:Button ID="btnLogin" runat="server" Text="Se connecter" 
                                  OnClick="btnLogin_Click" 
                                  CssClass="btn btn-primary btn-lg" />
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
