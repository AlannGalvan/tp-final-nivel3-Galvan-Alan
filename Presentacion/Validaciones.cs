using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace Presentacion
{
    public static class Validaciones
    {
        public static bool validaTextoVacio(object control)
        {
            if(control is TextBox texto)
            {
                if (string.IsNullOrEmpty(texto.Text))
                    return true;
                else
                    return false;
            }

            return true;
        }
    }
}