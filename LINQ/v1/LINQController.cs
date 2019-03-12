using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MVCBlogs.Models;


namespace MVCBlogs.Controllers
{
    public class LINQController : Controller
    {
        // GET: LINQ
        public ActionResult Index()
        {

           
            string strResultados = "";

            IList<string> stringList = new List<string>() {
                "C# Tutorials",
            "VB.NET Tutorials",
            "Learn C++",
            "MVC Tutorials" ,
            "Java" };


            var libros = from l in stringList
                            where l.Contains("C")
                            select l;

            foreach (var str in libros)
            {
                strResultados += str.ToString() + "<br>";
            }


            int[] numsList = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };

            var nums = from n in numsList
                        where (n % 2) == 0
                        select n;

            foreach (var i in nums)
            {
                strResultados += i.ToString() + "<br>";
            }


            // Usando objetos y modelo
            List<Alumno> alumnos = new List<Alumno>
                {
                    new Alumno {Nombre="Svetlana", Apellido="Omelchenko", ID=111, Resultados= new List<int> {97, 92, 81, 60}},
                    new Alumno {Nombre="Claire", Apellido="O'Donnell", ID=112, Resultados= new List<int> {75, 84, 91, 39}},
                    new Alumno {Nombre="Axl", Apellido="Rose", ID=113, Resultados= new List<int> {92, 66, 92, 49}}
                };

            IEnumerable<Alumno> alumnoQuery =
                from a in alumnos
                where  a.Resultados[0] > 90 && a.Resultados[3] < 80   //where a.Resultados[0] > 90   
                select a;

            foreach (Alumno alumno in alumnoQuery)
            {
                strResultados += alumno.Nombre + " " + alumno.Apellido + "<br>";
            }



            return Content(strResultados);

        }
    }
}