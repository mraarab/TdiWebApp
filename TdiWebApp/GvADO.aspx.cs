using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TdiWebApp
{
    public partial class GvADO : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                if (Session["UserName"] == null)
                {
                    Response.Redirect("~/Login.aspx");
                }
                else
                {
                    BindGrid();
                }
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand("INSERT INTO Books (Title, Author, PublicationYear, Genre, Price) VALUES (@Title, @Author, @PublicationYear, @Genre, @Price)", conn);
                cmd.Parameters.AddWithValue("@Title", txtTitle.Text);
                cmd.Parameters.AddWithValue("@Author", txtAuthor.Text);
                cmd.Parameters.AddWithValue("@PublicationYear", int.Parse(txtPublicationYear.Text));
                cmd.Parameters.AddWithValue("@Genre", txtGenre.Text);
                cmd.Parameters.AddWithValue("@Price", decimal.Parse(txtPrice.Text));

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
            BindGrid();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                // Retrieve the row index from the CommandArgument
                int rowIndex = Convert.ToInt32(e.CommandArgument);

                // Get the bookId from the DataKeys collection
                 int bookId = Convert.ToInt32(GridView1.DataKeys[rowIndex].Value);

                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString))
                {
                    SqlCommand cmd = new SqlCommand("DELETE FROM Books WHERE Id = @Id", conn);
                    cmd.Parameters.AddWithValue("@Id", bookId);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();

                }

                // Rebind the GridView to refresh data
                BindGrid();
                
            }
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            BindGrid();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            BindGrid();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int bookId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
            GridViewRow row = GridView1.Rows[e.RowIndex];

            TextBox txtTitle = (TextBox)row.Cells[1].Controls[0];
            TextBox txtAuthor = (TextBox)row.Cells[2].Controls[0];
            TextBox txtPublicationYear = (TextBox)row.Cells[3].Controls[0];
            TextBox txtGenre = (TextBox)row.Cells[4].Controls[0];
            TextBox txtPrice = (TextBox)row.Cells[5].Controls[0];

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand("UPDATE Books SET Title = @Title, Author = @Author, PublicationYear = @PublicationYear, Genre = @Genre, Price = @Price WHERE Id = @Id", conn);
                cmd.Parameters.AddWithValue("@Title", txtTitle.Text);
                cmd.Parameters.AddWithValue("@Author", txtAuthor.Text);
                cmd.Parameters.AddWithValue("@PublicationYear", int.Parse(txtPublicationYear.Text));
                cmd.Parameters.AddWithValue("@Genre", txtGenre.Text);
                cmd.Parameters.AddWithValue("@Price", decimal.Parse(txtPrice.Text));
                cmd.Parameters.AddWithValue("@Id", bookId);

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
            GridView1.EditIndex = -1;
            BindGrid();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            // Récupérer l'index de la ligne à supprimer
            int rowIndex = e.RowIndex;

            // Vérifiez si l'index est valide
            if (rowIndex >= 0 && rowIndex < GridView1.Rows.Count)
            {
                // Récupérer le bookId à partir de la collection DataKeys
                int bookId = Convert.ToInt32(GridView1.DataKeys[rowIndex].Value);

                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString))
                {
                    SqlCommand cmd = new SqlCommand("DELETE FROM Books WHERE Id = @Id", conn);
                    cmd.Parameters.AddWithValue("@Id", bookId);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }

                // Rebind the GridView to refresh data
                BindGrid();
            }
        }


        private void BindGrid()
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM Books", conn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }


    }
}