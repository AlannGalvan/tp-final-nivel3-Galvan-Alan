using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;

namespace Presentacion
{
    public partial class DetalleArticulos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                //Configuración inicial de la pantalla.
                if (!IsPostBack)
                {
                    MarcaNegocio marcanegocio = new MarcaNegocio();
                    List<Marca> listaMarcas = marcanegocio.listar();


                    CategoriaNegocio categoriaNegocio = new CategoriaNegocio();
                    List<Categoria> listaCategorias = categoriaNegocio.listar();

                    ddlMarca.DataSource = listaMarcas;
                    ddlMarca.DataValueField = "Id";
                    ddlMarca.DataTextField = "Descripcion";
                    ddlMarca.DataBind();

                    ddlCategoria.DataSource = listaCategorias;
                    ddlCategoria.DataValueField = "Id";
                    ddlCategoria.DataTextField = "Descripcion";
                    ddlCategoria.DataBind();
                }

                //Configuración si estamos modificando.
                string id = Request.QueryString["id"] != null ? Request.QueryString["id"].ToString() : "";

                if (id != "" && !IsPostBack)
                {
                    ArticulosNegocio negocio = new ArticulosNegocio();
                    Articulos seleccionado = (negocio.listar(id))[0];


                    //pre cargar todos los campos a modificar. 
                    txtId.Text = id;
                    txtId.ReadOnly = true;
                    txtCodigo.Text = seleccionado.Codigo;
                    txtCodigo.ReadOnly = true;
                    txtNombre.Text = seleccionado.Nombre;
                    txtNombre.ReadOnly = true;
                    txtDescripcion.Text = seleccionado.Descripcion;
                    txtDescripcion.ReadOnly = true;
                    txtPrecio.Text = seleccionado.Precio.ToString();
                    txtPrecio.ReadOnly = true;
                    txtImagenUrl.Text = seleccionado.ImagenUrl;
                    txtImagenUrl.ReadOnly = true;

                    ddlMarca.SelectedValue = seleccionado.Marca.Id.ToString();
                    ddlMarca.Enabled = false;
                    ddlCategoria.SelectedValue = seleccionado.Categoria.Id.ToString();
                    ddlCategoria.Enabled = false;

                    txtImagenUrl_TextChanged(sender, e);

                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }

        protected void txtImagenUrl_TextChanged(object sender, EventArgs e)
        {
                imgArticulo.ImageUrl = txtImagenUrl.Text;          
        }
    }
}