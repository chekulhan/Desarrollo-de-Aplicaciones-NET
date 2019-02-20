using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebApplicationMVCConsumeREST.Models;
using System.Net.Http;
using Newtonsoft.Json;
using System.Threading.Tasks;

namespace WebApplicationMVCConsumeREST.Controllers
{
    public class HomeController : Controller
    {

        [HttpGet]
        public ActionResult Create()
        {

            return View();
        }

        [HttpPost]
        public ActionResult Create(Producto p)
        {

            //Hosted web API REST Service base url  
            string Baseurl = "http://localhost:63102";
            using (var client = new HttpClient())
            {
                Dictionary<string, string> variables = new Dictionary<string, string>() {
                    { "Nombre", p.Nombre },
                    { "Precio", p.Precio.ToString() }
                };
                var content = new FormUrlEncodedContent(variables);

        
                client.BaseAddress = new Uri(Baseurl);
                HttpResponseMessage response =  client.PostAsync("api/productos", content).Result;
                if (response.IsSuccessStatusCode)
                {
                    Console.Write("Success");
   
                }
                else
                    Console.Write("Error");
            }



            ViewBag.Action = "Your product has been added " + p.Nombre;
            return View(p);
            
        }



        public async Task<ActionResult> ViewProductos()
        {
            List<Producto> productoInfo = new List<Producto>();
            //Hosted web API REST Service base url  
            string Baseurl = "http://localhost:63102";

            using (var client = new HttpClient())
            {
                //Passing service base url  
                client.BaseAddress = new Uri(Baseurl);

                client.DefaultRequestHeaders.Clear();
                //Define request data format  
                //client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

                //Sending request to find web api REST service resource GetAllEmployees using HttpClient  
                HttpResponseMessage Res = await client.GetAsync("api/productos");

                //Checking the response is successful or not which is sent using HttpClient  
                if (Res.IsSuccessStatusCode)
                {
                    //Storing the response details recieved from web api   
                    var ProductoResponse = Res.Content.ReadAsStringAsync().Result;

                    //Deserializing the response recieved from web api and storing into the Employee list  
                    productoInfo = JsonConvert.DeserializeObject<List<Producto>>(ProductoResponse);

                }
                //returning the employee list to view  
                return View(productoInfo);
            }
        }


    }
}