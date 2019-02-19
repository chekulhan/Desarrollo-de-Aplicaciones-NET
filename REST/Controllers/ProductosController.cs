using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using WebApplicationMVCREST1.Models;


namespace WebApplicationMVCREST1.Controllers
{
    public class ProductosController : ApiController
    {
        
        Producto[] p = new Producto[] 
        {
            new Producto { ID=1, Nombre="PC", Precio=5},
            new Producto { ID=2, Nombre="Tablet", Precio=6}
        };

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
        }


        // pasar parameteros simples en QueryString con: public IHttpActionResult Post(int ID, string Nombre )
        // cambiar los parámteros simples para HTTP BODY: public IHttpActionResult Post([FromBody]string Nombre)
        public IHttpActionResult Post(Producto p)
        {
            
            return Ok();
        }


    }
}
