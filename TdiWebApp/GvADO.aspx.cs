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
                    Session["returnUrl"] = Request.Path;
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
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["BikeStoresConnection"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand("INSERT INTO production.products (product_name, brand_id, category_id, model_year, list_price) VALUES (@Pname, @Brind, @Category, @ModelYear, @Price)", conn);
                cmd.Parameters.AddWithValue("@Pname", ProductName.Text);
                cmd.Parameters.AddWithValue("@Brind", int.Parse(BrandId.Text));
                cmd.Parameters.AddWithValue("@Category", int.Parse(CategoryId.Text));
                cmd.Parameters.AddWithValue("@ModelYear", short.Parse(ModelYear.Text));
                cmd.Parameters.AddWithValue("@Price", decimal.Parse(ListPrice.Text));

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
            BindGrid();
        }

        protected void Bikes_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvBikes.EditIndex = e.NewEditIndex;
            BindGrid();
        }

        protected void Bikes_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvBikes.EditIndex = -1;
            BindGrid();
        }

        protected void Bikes_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int productId = Convert.ToInt32(gvBikes.DataKeys[e.RowIndex].Value);
            GridViewRow row = gvBikes.Rows[e.RowIndex];

            TextBox txtPname = (TextBox)row.Cells[1].Controls[0];
            TextBox txtBrind = (TextBox)row.Cells[2].Controls[0];
            TextBox txtCategory = (TextBox)row.Cells[3].Controls[0];
            TextBox txtModelYear = (TextBox)row.Cells[4].Controls[0];
            TextBox txtPrice = (TextBox)row.Cells[5].Controls[0];

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["BikeStoresConnection"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand("UPDATE production.products SET product_name = @Pname, brand_id = @Brind, category_id = @Category, model_year = @ModelYear, list_price = @Price WHERE product_id = @Id", conn);
                cmd.Parameters.AddWithValue("@Pname", txtPname.Text);
                cmd.Parameters.AddWithValue("@Brind", int.Parse(txtBrind.Text));
                cmd.Parameters.AddWithValue("@Category", int.Parse(txtCategory.Text));
                cmd.Parameters.AddWithValue("@ModelYear", short.Parse(txtModelYear.Text));
                cmd.Parameters.AddWithValue("@Price", decimal.Parse(txtPrice.Text));
                cmd.Parameters.AddWithValue("@Id", productId);


                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
            gvBikes.EditIndex = -1;
            BindGrid();
        }

        protected void Bikes_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

            // Récupérer le bookId à partir de la collection DataKeys
            int bookId = Convert.ToInt32(gvBikes.DataKeys[e.RowIndex].Value);

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["BikeStoresConnection"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand("DELETE FROM production.products WHERE product_id = @Id", conn);
                cmd.Parameters.AddWithValue("@Id", bookId);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }

            // Rebind the GridView to refresh data
            BindGrid();

        }


        private void BindGrid()
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["BikeStoresConnection"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM production.products", conn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvBikes.DataSource = dt;
                gvBikes.DataBind();
            }
        }


    }
}