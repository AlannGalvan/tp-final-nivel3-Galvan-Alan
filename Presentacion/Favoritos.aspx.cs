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
    public partial class Favoritos : System.Web.UI.Page
    {
        public List<Articulos> ListarArticulos { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            
                if (Seguridad.sesionActiva(Session["usuario"]))
                {
                    Usuarios usuario = (Usuarios)Session["usuario"];
                    string id = Request.QueryString["id"];
                    if (!string.IsNullOrEmpty(id) && int.TryParse(id, out int idArticulo))
                    {
                        FavoritosNegocio negocio = new FavoritosNegocio();
                        Favorito nuevo = new Favorito();

                        nuevo.IdUser = usuario.Id;
                        nuevo.IdArticulo = int.Parse(id);

                        negocio.agregar(nuevo);
                    }

                    ListarArticulos = new List<Articulos>();

                    if (usuario != null)
                    {
                        FavoritosNegocio artNegocio = new FavoritosNegocio();
                        List<int> idArtFavoritos = artNegocio.listarFavoritoIdUser(usuario.Id);
                        if (idArtFavoritos.Count > 0)
                        {
                            ArticulosNegocio articuloNeg = new ArticulosNegocio();
                            ListarArticulos = articuloNeg.listarArticuloId(idArtFavoritos);
                            repRepetidor.DataSource = ListarArticulos;
                            repRepetidor.DataBind();
                        }
                    }
                    else
                    {
                        Session.Add("error", "No se han podido cargar los articulos");
                        Response.Redirect("Error.aspx");
                    }
                }
            
        }

        protected void btnEliminarFavorito_Click(object sender, EventArgs e)
        {
            Usuarios user = (Usuarios)Session["usuario"];
            FavoritosNegocio negocio = new FavoritosNegocio();

            int idArticulo = int.Parse(((Button)sender).CommandArgument);

            int idUser = user.Id;

            negocio.eliminar(idArticulo, idUser);

            //repRepetidor.DataBind();
            Page_Load(sender, e);
        }


    }
}