using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebNCapas.BLL
{
    public class Producto
    {
        public int ID { get; set; }
        public string Nombre { get; set; }
        public string Detalles { get; set; }
        public double Precio { get; set; }
        public string Foto { get; set; }
    }
}