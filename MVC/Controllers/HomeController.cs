using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebApplicationMVC.Models; // Incluir referencia a Models



namespace WebApplicationMVC.Controllers
{
    public class HomeController : Controller
    {
        // PASO 1: Acceso a páginas
        // GET: Home/Index
        public ActionResult Index()
        {
            
            return View();
        }

        // GET: Home/Page2
        public ActionResult Page2()
        {
            
            return View();
        }

        //PASO 2: Mostrar los diferentes tipos de "ActionResult"
        public ActionResult MostrarContent()
        {
            // Tipos de return types de MVC Controller (incluye View, Content, ReDirect, ...)
            // https://www.c-sharpcorner.com/UploadFile/dacca2/various-return-types-from-mvc-controller/
            return Content("<h1>Aqui tenemos contenido HTML </h1>");
        }


        // PASO 3: Mostrar la vista de datos
        public ActionResult MostrarPaisesconSTRINGS()
        {
            List<string> listPaises = new List<string>() { "España", "Australia" }; // Crear una lista de strings

            return View(listPaises); // Pasar la lista de paises a la vista a través de Modelo
        }

        // Paso 4: Pasar un modelo hecho de clases
        public ActionResult MostrarLibros()
        {
            
            List<Libro> Libros = new List<Libro>();

            Libros.Add(new Libro("ASP.NET", "Microsoft"));
            Libros.Add(new Libro("Java", "Java S.L."));


            return View(Libros);  // Pasar objetos de libros
        }



       


        // Paso 5: Pasar datos de Controlador a Vistas
        public ActionResult UsarViewDatayViewBagyTempData()
        {
            
            ViewData["Message"] = "Ejemplo de pasar datos con ViewData"; // Usar ViewData dictionary para pasar datos
            ViewBag.TotalLibros = 5; // Usar viewBag para pasar datos
            TempData["edad"] = 31; // Usar TempData

            return View();
        }



        // Paso 6: Edit items
        public ActionResult LibrosParaEditar()
        {

            Libro l = new Libro("ASP.NET", "Microsoft"); // Crear un objeto para editar

            return View(l);
        }

        [HttpPost]
        public ActionResult LibrosParaEditar(Libro libro)
        {
            // Conseguir datos del objeto Libro
            string sTitulo = libro.sTitulo;
            // guardarlos en Base de datos
            
            return Redirect("EditComplete");
        }

        public ActionResult EditComplete()
        {

            return View();
        }


    }
}