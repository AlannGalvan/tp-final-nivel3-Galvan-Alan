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
    public partial class MiPerfil : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            try
            {
                if (!IsPostBack)
                {
                    if (Seguridad.sesionActiva(Session["usuario"]))
                    {
                        Usuarios user = (Usuarios)Session["usuario"];
                        lblNombreUsuario.Text = user.Nombre + " " + user.Apellido;
                        lblEmail.Text = user.Email;
                        txtNombre.Text = user.Nombre;
                        txtApellido.Text = user.Apellido;
                        if (!string.IsNullOrEmpty(user.ImagenPerfil))
                        {
                            imgPerfil.ImageUrl = "~/Imagenes/FotoPerfiles/" + user.ImagenPerfil + "?v=" + DateTime.Now.Ticks.ToString();
                        }
                       
                        if (Session["NuevaCiudad"] != null)
                        {
                            string nuevaCiudad = Session["NuevaCiudad"].ToString();
                            ddlCiudad.Text = nuevaCiudad;
                        }

                       
                    }
                }
            }
            catch (Exception ex)
            {

                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                Page.Validate();
                if (!Page.IsValid)
                    return;

                UsuariosNegocio negocio = new UsuariosNegocio();
                Usuarios user = (Usuarios)Session["usuario"];

                if (txtImagen.PostedFile.FileName != "")
                {
                    string ruta = Server.MapPath("./Imagenes/FotoPerfiles/");
                    txtImagen.PostedFile.SaveAs(ruta + "perfil-" + user.Id + ".jpg");
                    user.ImagenPerfil = "perfil-" + user.Id + ".jpg";
                }

                user.Nombre = txtNombre.Text;
                user.Apellido = txtApellido.Text;

                negocio.actualizar(user);

                Image img = (Image)Master.FindControl("imgAvatar");
                img.ImageUrl = "~/Imagenes/FotoPerfiles/" + user.ImagenPerfil + "?v=" + DateTime.Now.Ticks.ToString();
            }
            catch (Exception ex)
            {

                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx");
            }

        }

        protected void ddlCiudad_SelectedIndexChanged(object sender, EventArgs e)
        {
            string nuevaCiudad = ddlCiudad.SelectedItem.Text;
            Session["NuevaCiudad"] = nuevaCiudad;
        }
    }
}