using System;

namespace WebMVC1.Models
{
    public class Empleado
    {
        public int EmpleadoID { get; set; }
        public string Nombre { get; set; }
        public int Edad { get; set; }


        public int DeptID { get; set; }
        public virtual Departamento Departamento { get; set; }
    }
}
