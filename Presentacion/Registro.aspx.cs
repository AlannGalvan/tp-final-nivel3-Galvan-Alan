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
    public partial class Registro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegistrarse_Click(object sender, EventArgs e)
        {
            try
            {
                Page.Validate();
                if (!Page.IsValid)
                    return;

                    Usuarios nuevoUsuario = new Usuarios();
                    UsuariosNegocio usuarioNegocio = new UsuariosNegocio();
                    //EmailServicio emailServicio = new EmailServicio();

                    nuevoUsuario.Nombre = txtNombre.Text;
                    nuevoUsuario.Apellido = txtApellido.Text;
                    nuevoUsuario.Email = txtEmail.Text;
                    nuevoUsuario.Pass = txtContraseña.Text;
                    nuevoUsuario.Id = usuarioNegocio.insertarNuevo(nuevoUsuario);
                    Session.Add("usuario", nuevoUsuario);

                    //emailServicio.armarCorreo(nuevoUsuario.Email, "Bienvenido/a Usuario", "Hola te damos la bienvenida a Articulos web");
                    //emailServicio.enviarEmail();

                    Response.Redirect("Default.aspx", false);
                
            }
            catch (Exception ex)
            {

                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }

       
    }
}