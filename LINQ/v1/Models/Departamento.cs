using System;
using System.Collections.Generic;

namespace WebMVC1.Models
{
    public class Departamento
    {
        public string DeptID { get; set; }
        public string Nombre { get; set; }
        public int Presupuesto { get; set; }

        public virtual ICollection<Empleado> Empleados { get; set; }
    }

}
