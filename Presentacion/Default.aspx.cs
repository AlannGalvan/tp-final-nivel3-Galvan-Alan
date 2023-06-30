using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using Dominio;
using AccesoDatos;
using System.Data;
using System.ComponentModel;

namespace Presentacion
{
    public partial class Default : System.Web.UI.Page
    {
        public List<Articulos> ListaArticulos { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            ArticulosNegocio negocio = new ArticulosNegocio();
            ListaArticulos = negocio.listarConSP();

            if (!IsPostBack)
            {           
                    rptArticulos.DataSource = ListaArticulos;
                    rptArticulos.DataBind();
            }
        }

        protected void txtBuscar_TextChanged(object sender, EventArgs e)
        {
            string nombre = txtBuscar.Text.ToLower();
            List<Articulos> resultados = new List<Articulos>();
            ArticulosNegocio negocio = new ArticulosNegocio();
            ListaArticulos = negocio.listarConSP();

            foreach (Articulos articulo in ListaArticulos)
            {
                if (articulo.Nombre.ToLower().Contains(nombre) || articulo.Marca.Descripcion.ToLower().Contains(nombre))
                {
                    resultados.Add(articulo);
                }
            }

            rptArticulos.DataSource = resultados;
            rptArticulos.DataBind();
        }
    }
}