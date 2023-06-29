using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
    public class Seguridad
    {
        public static bool sesionActiva(object user)
        {
            Usuarios usuario = user != null ? (Usuarios)user : null;
            if (usuario != null && usuario.Id != 0)
                return true;
            else 
                return false;
        }

        public static bool esAdmin(object user)
        {
            Usuarios usuario = user != null ? (Usuarios)user : null;
            return usuario != null ? usuario.Admin : false;
        }
    }
}
