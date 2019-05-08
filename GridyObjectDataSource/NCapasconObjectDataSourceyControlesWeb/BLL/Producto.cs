using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebNCapas.BLL
{
    public class Producto
    {
        private string nombre;
        

        public int ID { get; set; }
        public string Nombre
        {
            get {  return nombre.ToUpper();  }
            set { nombre = value; }    
        }

        public string Detalles { get; set; }
        public string NombreyDetalles
        {
            get { return Nombre + " - " + Detalles; }
        }
        public double Precio { get; set; }
        public string Foto { get; set; }
        public bool Disponible { get; set; }
            
    }
}