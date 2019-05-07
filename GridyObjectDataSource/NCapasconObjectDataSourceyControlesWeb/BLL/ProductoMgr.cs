using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebNCapas.BLL
{
    public class ProductoMgr
    {
        public List<Producto> GetProductos()
        {
            List<Producto> listProductos = new List<Producto>
            {
                new Producto {ID=1,  Nombre="Lenova", Detalles="Descricion de Lenova", Precio=250, Foto="images/laptop1.jpg"},
                new Producto {ID=2,   Nombre="ACER", Detalles="Descricion de ACER", Precio=40, Foto="images/laptop2.jpg"},
                new Producto { ID=3,  Nombre="Apple", Detalles="Descricion de Apple", Precio=150, Foto="images/laptop3.jpg"},
            };


            return listProductos;
        }



        public Producto GetProducto(int pID)
        {

            List<Producto> listProductos = this.GetProductos();

            Producto prod = listProductos.Find(p => p.ID == pID); // LamDA expression
           
            return prod;
        }
    }
}