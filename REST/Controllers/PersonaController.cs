using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using WebApplicationREST.Models;



namespace WebApplicationREST.Controllers
{
    public class PersonaController : ApiController
    {

        Persona[] p = new Persona[]
       {
            new Persona { ID = 1, Nombre = "Jon", Apellido = "Smith" },
            new Persona { ID = 2, Nombre = "Axl", Apellido = "Rose" },
            new Persona { ID = 3, Nombre = "Slash", Apellido = "AAAA" }
       };

        public IEnumerable<Persona> GetAllPersonas()
        {
            return p;
        }

        public IHttpActionResult GetPersona(int id)
        {
            var persona = p.FirstOrDefault((p) => p.ID == id);
            if (persona == null)
            {
                return NotFound();
            }
            return Ok(persona);
        }

    }
}
