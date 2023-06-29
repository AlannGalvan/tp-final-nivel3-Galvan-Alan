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
    public partial class IniciarSesion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnIniciarSesion_Click(object sender, EventArgs e)
        {
            Page.Validate();
            if (!Page.IsValid)
                return;

            Usuarios usuario = new Usuarios();
            UsuariosNegocio negocio = new UsuariosNegocio();
            try
            {
                if(Validaciones.validaTextoVacio(txtEmail) || Validaciones.validaTextoVacio(txtContraseña))
                {
                    Session.Add("error", "Debes completar Correo electónico y contraseña");
                    Response.Redirect("Error.aspx");
                }
                usuario.Email = txtEmail.Text;
                usuario.Pass = txtContraseña.Text;
                if (negocio.login(usuario))
                {
                    Session.Add("usuario", usuario);
                    Response.Redirect("Default.aspx", false);
                }
                else
                {
                    Session.Add("error", "Correo electrónico o contraseña incorrecta...");
                    Response.Redirect("Error.aspx", false);
                }
            }
            catch (System.Threading.ThreadAbortException ex) { }
            catch (Exception ex)
            {

                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }

       
    }
}