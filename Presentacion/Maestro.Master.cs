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
    public partial class Maestro : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Seguridad.sesionActiva(Session["usuario"]))
            {
                Usuarios user = (Usuarios)Session["usuario"];
                lblUsuario.Text = user.Nombre + " " + user.Apellido;
                if (!string.IsNullOrEmpty(user.ImagenPerfil))
                {
                    imgAvatar.ImageUrl = "~/Imagenes/FotoPerfiles/" + user.ImagenPerfil + "?v=" + DateTime.Now.Ticks.ToString();
                }
                else
                {
                    imgAvatar.ImageUrl = "~/Imagenes/UsuarioSinFoto.png";
                }
            }
            else
            {
                imgAvatar.ImageUrl = "~/Imagenes/UsuarioSinFoto.png";
            }

            if (!(Page is Default || Page is IniciarSesion || Page is Registro || Page is Error || Page is DetalleArticulos))
            {
                if (!Seguridad.sesionActiva(Session["usuario"]))
                    Response.Redirect("IniciarSesion.aspx", false);
                else
                {
                    Usuarios user = (Usuarios)Session["usuario"];
                    lblUsuario.Text = user.Nombre + " " + user.Apellido;
                    if (!string.IsNullOrEmpty(user.ImagenPerfil))
                    {
                        imgAvatar.ImageUrl = "~/Imagenes/FotoPerfiles/" + user.ImagenPerfil + "?v=" + DateTime.Now.Ticks.ToString();
                    }
                    else
                    {
                        imgAvatar.ImageUrl = "~/Imagenes/UsuarioSinFoto.png";
                    }

                }
            }
        }

        protected void btnSalir_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("iniciarSesion.aspx");
        }
    }
}