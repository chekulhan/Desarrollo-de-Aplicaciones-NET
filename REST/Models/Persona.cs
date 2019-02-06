using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplicationREST.Models
{
    public class Persona
    {

        public int ID { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }

        public DateTime FechadeNacimiento { get; set; }

        public string Email { get; set; }
        public Persona(int ID, string Nombre, string Apellido, string Email)
        {
            this.ID = ID;
            this.Nombre = Nombre;
            this.Apellido = Apellido;
            this.Email = Email;
        }

        // Crear un constructor sin parámetros para evitar errores en EDITAR
        public Persona()
        {

        }

    }
}