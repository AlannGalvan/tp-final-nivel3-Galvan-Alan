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
    public partial class Administracion : System.Web.UI.Page
    {
        public bool BusquedaAvanzada { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Seguridad.esAdmin(Session["usuario"]))
            {
                Session.Add("error", "Se requiere permiso de admin para acceder a esta pantalla");
                Response.Redirect("Error.aspx");
            }

            BusquedaAvanzada = chkAvanzado.Checked;
            if (!IsPostBack || !chkAvanzado.Checked)
            {
                ArticulosNegocio negocio = new ArticulosNegocio();
                Session.Add("listaProductos", negocio.listarConSP());
                dgvProductos.DataSource = Session["listaProductos"];
                dgvProductos.DataBind();
            }
        }
        protected void dgvProductos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgvProductos.PageIndex = e.NewPageIndex;
            dgvProductos.DataBind();
        }
        protected void dgvProductos_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = dgvProductos.SelectedDataKey.Value.ToString();
            Response.Redirect("FormularioProductos.aspx?id=" + id);
        }
        protected void txtBuscar_TextChanged(object sender, EventArgs e)
        {
            List<Articulos> lista = (List<Articulos>)Session["listaProductos"];
            List<Articulos> listaFiltrada = lista.FindAll(x => x.Nombre.ToUpper().Contains(txtBuscar.Text.ToUpper()));
            dgvProductos.DataSource = listaFiltrada;
            dgvProductos.DataBind();
        }

        protected void chkAvanzado_CheckedChanged(object sender, EventArgs e)
        {
            BusquedaAvanzada = chkAvanzado.Checked;
            txtBuscar.Enabled = !BusquedaAvanzada;
            if (BusquedaAvanzada)
            {
                ddlCampo.SelectedIndex = 0;
                ddlCampo_SelectedIndexChanged(sender, e);
            }
        }

        protected void ddlCampo_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlCriterio.Items.Clear();
            if(ddlCampo.SelectedItem.ToString() == "Precio")
            {
                ddlCriterio.Items.Add("Igual a");
                ddlCriterio.Items.Add("Mayor a");
                ddlCriterio.Items.Add("Menor a");
            }
            else
            {
                ddlCriterio.Items.Add("Contiene");
                ddlCriterio.Items.Add("Comienza con");
                ddlCriterio.Items.Add("Termina con");
            }
        }

        protected void btnBusquedaAvanzada_Click(object sender, EventArgs e)
        {
            
                try
                {
                    ArticulosNegocio negocio = new ArticulosNegocio();
                    dgvProductos.DataSource = negocio.filtrar(ddlCampo.SelectedItem.ToString(),
                    ddlCriterio.SelectedItem.ToString(), txtBusquedaAvanzada.Text);
                    dgvProductos.DataBind();
                }
                catch (Exception ex)
                {
                    Session.Add("error", ex.ToString());
                    Response.Redirect("Error.aspx");
                }
           
        }




    }
}