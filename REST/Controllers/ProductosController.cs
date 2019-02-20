using System;

using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using WebApplicationMVCREST1.Models;
using System.Collections.Generic;

namespace WebApplicationMVCREST1.Controllers
{
    public class ProductosController : ApiController
    {



        static List<Producto> p = new List<Producto>(
                        new Producto[] {new Producto(1,"PC", 5),
                       new Producto(2, "Tablet", 6) });


        /*Producto[] p = new Producto[] 
        {
            new Producto { ID=1, Nombre="PC", Precio=5},
            new Producto { ID=2, Nombre="Tablet", Precio=6}
        }; */

        public IHttpActionResult GetProducto(int ID) {
            var producto = p.FirstOrDefault((p) => p.ID == ID);
            if (producto == null)
            {
                //return BadRequest(); OR NotFound(); Son helper methods de IHttpActionResult
                return Content(HttpStatusCode.NotFound, "Producto No disponible");
            }
            return Ok(producto);
        }

        public IHttpActionResult GetProductos()
        {
            return Ok(p);
            //return Json(p);
 
        }


        // pasar parameteros simples en QueryString con: public IHttpActionResult Post(int ID, string Nombre )
        // cambiar los parámteros simples para HTTP BODY: public IHttpActionResult Post([FromBody]string Nombre)
        public IHttpActionResult Post(Producto producto)
        {
            p.Add(producto);
            return Ok();
        }


    }
}
