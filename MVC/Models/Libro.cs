using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplicationMVC.Models
{
    
    public class Libro
    {
        public string sTitulo { get; set; }
        public string sAutor { get; set; }

        public Libro(string sTitulo, string sAutor)
        {
            this.sTitulo = sTitulo;
            this.sAutor = sAutor;
        }
    }
}