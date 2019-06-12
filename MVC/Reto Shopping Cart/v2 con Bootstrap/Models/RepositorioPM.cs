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
                new Producto { Id = "H1", Nombre = "Hamburguesa", Precio = 5,  Foto = "1.jpg", Descripcion="Una hamburguesa es un tipo de sándwich hecho a base de carne molida aglutinada en forma de filete, cocinado a la parrilla o a la plancha, aunque también puede freírse u hornearse." },
                new Producto { Id = "P1", Nombre = "Pizza", Precio = 10,  Foto = "2.jpg", Descripcion="La pizza es una de las comidas más populares del mundo. ... Aunque hay múltiples variedades, lo habitual es que la pizza se cree a partir de un pan chato, con forma de disco, amasado con agua, sal, levadura y harina."},
                new Producto { Id = "C1", Nombre = "Chuletón", Precio = 15,  Foto = "3.jpg", Descripcion="Un chuletón, chuletón de buey, chuletón de ternera, chuleta de ternera, costilla de buey o costilla de ternera (en algunos países de Hispanoamérica llamado costilla de res o bife de costilla) es un corte de carne de vacuno (buey, vaca o ternera) en el que se incluye tanto la parte superior de una costilla del animal" }    
            };
        }

        public List<Producto> findAll()
        {
            return this.productos;
        }

        public IEnumerable<Producto> findAll(string strNombre)
        {


            //OJO con mayúsculas LINQ funciones son sensibles...return this.productos.Where(p => p.Nombre.StartsWith(strNombre));
            return this.productos.Where(p => p.Nombre.ToLower().StartsWith(strNombre.ToLower()));
           

        }

        public Producto find(string id)
        {
            return this.productos.Single(p => p.Id.Equals(id));
        }
    }
}