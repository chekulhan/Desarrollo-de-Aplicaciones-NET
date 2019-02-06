using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations; //incluir DataAnnotations libreria

namespace WebApplicationMVC.Models
{
    
    public class LibroconValidacion
    {
        [StringLength(maximumLength:50,  ErrorMessage ="MAX 3 caracters" )]
        [Required]
        public string Titulo { get; set; }
        [Required(ErrorMessage = "Hace falta un Autor...")]
        public string Autor { get; set; }

        [Range(1, 100)]
        [DataType(DataType.Currency)]
        public decimal Precio { get; set; }
        public LibroconValidacion(string sTitulo, string sAutor, decimal dPrecio)
        {
            this.Titulo = sTitulo;
            this.Autor = sAutor;
            this.Precio = dPrecio;
        }

        // Crear un constructor sin parámetros para evitar errores en EDITAR
        public LibroconValidacion()
        {

        }
    }
}