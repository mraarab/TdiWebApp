<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DataValidationBT.aspx.cs" Inherits="TdiWebApp.DataValidationBT" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Formulaire d'Inscription</h2>
    <div class="container">
        <form>
            <div class="form-group row">
                <label for="txtName" class="col-sm-2 col-form-label">Nom :</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" />
                    <asp:RequiredFieldValidator ID="rfvName" runat="server"
                        ControlToValidate="txtName" ErrorMessage="Le nom est requis."
                        ForeColor="Red" />
                </div>
            </div>

            <div class="form-group row">
                <label for="txtPrenom" class="col-sm-2 col-form-label">Prénom :</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtPrenom" runat="server" CssClass="form-control" />
                    <asp:CustomValidator ID="cvPrenom" runat="server"
                        ControlToValidate="txtPrenom"
                        OnServerValidate="ValidateUsername" ErrorMessage="Ce nom d'utilisateur est déjà pris."
                        ForeColor="Red" />
                </div>
            </div>

            <div class="form-group row">
                <label for="txtAge" class="col-sm-2 col-form-label">Âge :</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtAge" runat="server" CssClass="form-control" />
                    <asp:RangeValidator ID="rvAge" runat="server"
                        ControlToValidate="txtAge" MinimumValue="18" MaximumValue="60" Type="Integer"
                        ErrorMessage="L’âge doit être compris entre 18 et 60 ans."
                        ForeColor="Red" />
                </div>
            </div>

            <div class="form-group row">
                <label for="txtBirthdate" class="col-sm-2 col-form-label">Date de naissance :</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtBirthdate" runat="server" TextMode="Date" CssClass="form-control" />
                    <asp:CustomValidator ID="cvAgeClientSide" runat="server"
                        ControlToValidate="txtBirthdate"
                        ClientValidationFunction="ValidateAge" ErrorMessage="Veuillez entrer une date dans le passé."
                        ForeColor="Red" />
                </div>
            </div>

            <div class="form-group row">
                <label for="txtEmail" class="col-sm-2 col-form-label">Email :</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" />
                    <asp:RegularExpressionValidator ID="revEmail" runat="server"
                        ControlToValidate="txtEmail"
                        ValidationExpression="^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$"
                        ErrorMessage="Entrez un email valide." ForeColor="Red" />
                </div>
            </div>

            <div class="form-group row">
                <label for="txtConfirmEmail" class="col-sm-2 col-form-label">Confirmer l'Email :</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtConfirmEmail" runat="server" CssClass="form-control" />
                    <asp:CompareValidator ID="cvEmail" runat="server"
                        ControlToCompare="txtEmail" ControlToValidate="txtConfirmEmail"
                        ErrorMessage="Les emails ne correspondent pas." ForeColor="Red" />
                </div>
            </div>

            <div class="form-group row">
                <label for="txtPassword" class="col-sm-2 col-form-label">Mot de passe :</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" />
                    <asp:CustomValidator ID="cvPassword" runat="server"
                        ControlToValidate="txtPassword"
                        OnServerValidate="ValidatePassword" ErrorMessage="Le mot de passe doit contenir au moins 6 caractères."
                        ForeColor="Red" />
                </div>
            </div>

            <div class="form-group row">
                <div class="col-sm-10 offset-sm-2">
                    <asp:Button ID="btnSubmit" runat="server" Text="Soumettre" OnClick="btnSubmit_Click" CssClass="btn btn-primary" />
                </div>
            </div>

            <!-- Résumé des Erreurs -->
            <asp:ValidationSummary ID="vsSummary" runat="server" ForeColor="Red" />
        </form>
    </div>

    <script type="text/javascript">
        function ValidateAge(src, args) {
            var date = new Date(args.Value);
            var today = new Date();
            args.IsValid = date < today;
        }
    </script>

</asp:Content>
