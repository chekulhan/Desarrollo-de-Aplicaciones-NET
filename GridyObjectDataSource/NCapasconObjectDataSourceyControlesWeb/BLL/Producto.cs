using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebNCapas.BLL
{
    public class Producto
    {
        private string nombre;
        

        public int ProductoID { get; set; }
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

        public decimal Precio { get; set; }

        // Se podria implementar la logica de negocios aqui...pero seria mejor en otro evento
        //public decimal Precio
        //{
        //    get { return precio; }
        //    set
        //    {
        //        if (precio < 10)
        //            throw new ArgumentOutOfRangeException(nameof(Precio), "Precio no puede ser menos de 10 euros");
        //        else
        //            precio = value; 
        //    }
        //}

        public string Foto { get; set; }
        public bool Disponible { get; set; }
            
    }
}