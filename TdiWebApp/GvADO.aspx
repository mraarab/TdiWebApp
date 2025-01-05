<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GvADO.aspx.cs" Inherits="TdiWebApp.GvADO" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container mt-4">
        <h2 class="mb-4">Books Management</h2>

        <div class="mb-3">
            <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control" Placeholder="Title"></asp:TextBox>
        </div>
        <div class="mb-3">
            <asp:TextBox ID="txtAuthor" runat="server" CssClass="form-control" Placeholder="Author"></asp:TextBox>
        </div>
        <div class="mb-3">
            <asp:TextBox ID="txtPublicationYear" runat="server" CssClass="form-control" Placeholder="Publication Year"></asp:TextBox>
        </div>
        <div class="mb-3">
            <asp:TextBox ID="txtGenre" runat="server" CssClass="form-control" Placeholder="Genre"></asp:TextBox>
        </div>
        <div class="mb-3">
            <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control" Placeholder="Price"></asp:TextBox>
        </div>
        <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary" Text="Add Book" OnClick="btnAdd_Click" />

        <div class="mt-4">

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" 
                OnRowCommand="GridView1_RowCommand" 
                OnRowDeleting="GridView1_RowDeleting" 
                OnRowEditing="GridView1_RowEditing" 
                OnRowCancelingEdit="GridView1_RowCancelingEdit" 
                OnRowUpdating="GridView1_RowUpdating" 
                CssClass="table table-striped table-bordered mt-4">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="ID" ReadOnly="True" />
                    <asp:BoundField DataField="Title" HeaderText="Title" />
                    <asp:BoundField DataField="Author" HeaderText="Author" />
                    <asp:BoundField DataField="PublicationYear" HeaderText="Publication Year" />
                    <asp:BoundField DataField="Genre" HeaderText="Genre" />
                    <asp:BoundField DataField="Price" HeaderText="Price" />
                    <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>

        </div>
    </div>


</asp:Content>
