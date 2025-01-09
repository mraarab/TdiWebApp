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
    public partial class GvEF : System.Web.UI.Page
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
                    BindData();
                }
            }
        }

        private void BindData()
        {
            using (BikeStoresEntities context = new BikeStoresEntities())
            {
                var bikes = context.products.ToList();
                gvBikes.DataSource = bikes;
                gvBikes.DataBind();
            }
        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            using (BikeStoresEntities context = new BikeStoresEntities())
            {
                products product = new products
                {
                    product_name = ProductName.Text,
                    brand_id = int.Parse(BrandId.Text),
                    category_id = int.Parse(CategoryId.Text),
                    model_year = short.Parse(ModelYear.Text),
                    list_price = decimal.Parse(ListPrice.Text)
                };
                context.products.Add(product);
                context.SaveChanges();
            }
        }

        protected void Bikes_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvBikes.EditIndex = e.NewEditIndex;
            BindData();
        }

        protected void Bikes_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvBikes.EditIndex = -1;
            BindData();
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


            using (BikeStoresEntities context = new BikeStoresEntities())
            {
                products product = context.products.Find(productId);
                {
                    if (product != null) {
                        product.product_name = txtPname.Text;
                        product.brand_id = int.Parse(txtBrind.Text);
                        product.category_id = int.Parse(txtCategory.Text);
                        product.model_year = short.Parse(txtModelYear.Text);
                        product.list_price = decimal.Parse(txtPrice.Text);
                        context.SaveChanges();
                    }

                };
            }
            gvBikes.EditIndex = -1;
            BindData();
        }

        protected void Bikes_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

            // Récupérer le product id à partir de la collection DataKeys
            int productId = Convert.ToInt32(gvBikes.DataKeys[e.RowIndex].Value);

            using (BikeStoresEntities context = new BikeStoresEntities())
            {
                products bike = context.products.Find(productId);
                if (bike != null)
                {
                    context.products.Remove(bike);
                    context.SaveChanges();
                }
            }
            BindData();
        }

    }
}