using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel;
using System.Globalization;
using System.Text.RegularExpressions;

namespace Dominio
{
    public class Articulos
    {
        public int Id { get; set; }

        [DisplayName("Código")]
        public string Codigo { get; set; }
        public string Nombre { get; set; }

        [DisplayName("Descripción")]
        public string Descripcion { get; set; }
        public string ImagenUrl { get; set; }

        public Marca Marca { get; set; }

        public Categoria Categoria { get; set; }

        private decimal _Precio;

        public decimal Precio
        {
            get { return _Precio; }
            set
            {
                _Precio = Math.Round(value, 2);
            }
        }

        public string PrecioFormateado
        {
            get { return Precio.ToString("C", new CultureInfo("es-AR")); }
        }

       
    }
}
