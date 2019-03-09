using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebMVC1.Models;


namespace WebMVC1.Controllers
{
    public class DepartamentoController : Controller
    {

        // Añadimos 
        private List<Departamento> deptList = new List<Departamento>{
            new Departamento() { DeptID = "MARK", Nombre = "Marketing", Presupuesto = 10000 } ,
            new Departamento() { DeptID = "FIN", Nombre = "Finanzas",  Presupuesto = 45000 } ,
            new Departamento() { DeptID = "ICT", Nombre = "ICT",  Presupuesto = 12000 } ,
             new Departamento() { DeptID = "CONT", Nombre = "Contabilidad",  Presupuesto = 50000 }
            };
     

        public ActionResult Index()
        {
            // Empleamos LINQ to Entity
            IEnumerable<Departamento> resultadosQuery = from dept in deptList
                                                       where dept.Presupuesto > 8000
                                                       select dept;

            return View(resultadosQuery);
            //return View(deptList.Where(dept => dept.Presupuesto > 15000));
        }

        public ActionResult Create()
        {
            return View();
        }
    
    
    }
}
