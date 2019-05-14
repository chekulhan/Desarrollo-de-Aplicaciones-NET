using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using WebAPI.Models;

namespace WebAPI.Controllers
{
    public class PersonaController : ApiController
    {
        Persona[] p = new Persona[]
       {
            new Persona { ID = 1, Nombre = "Jon", Apellido = "Smith" },
            new Persona { ID = 2, Nombre = "Axl", Apellido = "Rose" },
            new Persona { ID = 3, Nombre = "Slash", Apellido = "AAAA" }
       };

        public IHttpActionResult GetAllPersonas()
        {
            return Ok(p);
        }

        public IHttpActionResult GetPersona(int id)
        {
            var persona = p.FirstOrDefault((p) => p.ID == id);
            if (persona == null)
            {
                return Content(HttpStatusCode.NotFound, "Persona No disponible");
            }
            return Ok(persona);
        }


    }
}
