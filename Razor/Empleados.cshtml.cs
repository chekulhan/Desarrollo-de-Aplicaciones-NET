using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using webapp1.Models; // incluir página de Models

namespace webapp1.Pages
{
    public class EmpleadosModel : PageModel
    {

        /*
        Demo 1: Mostrar los atributos del modelo en la página
        public int IDEmpleado {get;set;} 
        public  string Nombre {get;set;} 
        public string Apellido {get;set;} 
        public int Salario {get;set;}
        */

        /*Demo 2: Usar una lista para pasar mas datos a la vista 
        OJO: incluir modelo con using...
        */
        public  List<Empleado> empleados {get;set;}

        public void OnGet()
        { 
            
            /*
            Demo 1: Mostrar los atributos del modelo en la página
            
            IDEmpleado = 15;
            Nombre = "Juan";
            Apellido="Smith";
            Salario=50000; */


        /*Demo 2: lista de empleados */
            empleados = new List<Empleado> {
                new Empleado()
                {
                    IDEmpleado = 1,
                    Nombre = "Name 1",
                    Apellido="Ap",
                    Salario= 100
                },
                new Empleado()
                {
                    IDEmpleado = 2,
                    Nombre = "Name 2",
                    Apellido="A2222",
                    Salario= 200
                }
            };

        }
    }
}
