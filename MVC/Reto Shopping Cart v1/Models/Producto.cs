using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShoppingCart.Models
{
    public class Producto
    {
        
        public string Id { get; set; }

        public string Nombre { get; set; }

        public double Precio { get; set; }

        public string Foto { get; set; }

        
    }
}