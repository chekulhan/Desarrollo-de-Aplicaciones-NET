using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShoppingCart.Models
{
    public class RepositorioPM
    {
        private List<Producto> productos;

        public RepositorioPM()
        {
            this.productos = new List<Producto>() {
                new Producto { Id = "Hamburguesa", Nombre = "Name 1", Precio = 5,  Foto = "1.jpg" },
                new Producto { Id = "Pizza", Nombre = "Name 2", Precio = 10,  Foto = "2.jpg" },
                new Producto { Id = "Chuletón", Nombre = "Name 3", Precio = 15,  Foto = "3.jpg" }    
            };
        }

        public List<Producto> findAll()
        {
            return this.productos;
        }

        //public List<Producto> findAll(string Nombre)
        //{
        //    // TO DO
        //    // return productos.Find(p=> p.Nombre.StartsWith(Nombre));
              
        //}

        public Producto find(string id)
        {
            return this.productos.Single(p => p.Id.Equals(id));
        }
    }
}