<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GvEF.aspx.cs" Inherits="TdiWebApp.GvEF" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container mt-5">
        <h2>Produits</h2>
        <asp:Button ID="btnShowForm" runat="server" Text="Ajouter un Produit" CssClass="btn btn-success" OnClientClick="toggleForm(); return false;" />
        
        <div id="addProductForm" style="display:none;" class="mt-3">
            <h3>Ajouter un Produit</h3>
            <div class="mb-3">
                <label for="ProductName" class="form-label">Nom du Produit:</label>
                <asp:TextBox ID="ProductName" runat="server" CssClass="form-control" />
            </div>
            <div class="mb-3">
                <label for="BrandId" class="form-label">ID de la Marque:</label>
                <asp:TextBox ID="BrandId" runat="server" CssClass="form-control" />
            </div>
            <div class="mb-3">
                <label for="CategoryId" class="form-label">ID de la Catégorie:</label>
                <asp:TextBox ID="CategoryId" runat="server" CssClass="form-control" />
            </div>
            <div class="mb-3">
                <label for="ModelYear" class="form-label">Année du Modèle:</label>
                <asp:TextBox ID="ModelYear" runat="server" CssClass="form-control" />
            </div>
            <div class="mb-3">
                <label for="ListPrice" class="form-label">Prix de Liste:</label>
                <asp:TextBox ID="ListPrice" runat="server" CssClass="form-control" />
            </div>
            <asp:Button ID="btnAdd" runat="server" Text="Ajouter" CssClass="btn btn-primary" OnClick="btnAdd_Click" />
        </div>
    </div>

    <div class="container mt-5">
        <h2>Liste des Produits</h2>

        <asp:GridView ID="gvBikes" runat="server" AutoGenerateColumns="False"  DataKeyNames="product_id"
                OnRowDeleting="Bikes_RowDeleting" 
                OnRowEditing="Bikes_RowEditing" 
                OnRowCancelingEdit="Bikes_RowCancelingEdit" 
                OnRowUpdating="Bikes_RowUpdating" 
                CssClass="table table-striped table-bordered">
                <Columns>
                    <asp:BoundField DataField="product_id" HeaderText="ID" ReadOnly="True" />
                    <asp:BoundField DataField="product_name" HeaderText="Nom du Produit" />
                    <asp:BoundField DataField="brand_id" HeaderText="ID de la Marque" />
                    <asp:BoundField DataField="category_id" HeaderText="ID de la Catégorie" />
                    <asp:BoundField DataField="model_year" HeaderText="Année du Modèle" />
                    <asp:BoundField DataField="list_price" HeaderText="Prix" />
                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnEdit" runat="server" CommandName="Edit" CssClass="btn btn-warning btn-sm" Text="Modifier" />
                            <asp:LinkButton ID="btnDelete" runat="server" CommandName="Delete" CssClass="btn btn-danger btn-sm" Text="Supprimer" OnClientClick="return confirm('Êtes-vous sûr de vouloir supprimer ce produit ?');" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:LinkButton ID="btnUpdate" runat="server" CommandName="Update" CssClass="btn btn-success btn-sm" Text="Mettre à jour" />
                            <asp:LinkButton ID="btnCancel" runat="server" CommandName="Cancel" CssClass="btn btn-secondary btn-sm" Text="Annuler" />
                        </EditItemTemplate>
                    </asp:TemplateField>

                </Columns>
       </asp:GridView>
    </div>

    <script type="text/javascript">
        function toggleForm() {
            var form = document.getElementById('addProductForm');
            if (form.style.display === "none") {
                form.style.display = "block";
            } else {
                form.style.display = "none";
            }
        }
    </script>

</asp:Content>