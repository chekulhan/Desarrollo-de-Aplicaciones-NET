using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.IO;
using System.Net;
using System.Text;


namespace WebApplicationMVC.IoT.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }


        // librerias using System.IO, System.Net y System.Text;
        public ActionResult IoTPost()
        {

            int sValue = 30; // temperatura
            string API_KEY = "Z0HAVLYQ2VVYRB9J";  // thingspeak API KEY del profesor

            WebRequest wreq = WebRequest.Create("https://api.thingspeak.com/update");
            wreq.Method = "POST";
            // Create POST data and convert it to a byte array.  
            string postData = "api_key=" + API_KEY + "&field1=" + sValue.ToString();
            byte[] byteArray = Encoding.UTF8.GetBytes(postData);

            wreq.ContentType = "application/x-www-form-urlencoded";
            wreq.ContentLength = byteArray.Length;

            Stream dataStream = wreq.GetRequestStream();
            // Write the data to the request stream.  
            dataStream.Write(byteArray, 0, byteArray.Length);
            // Close the Stream object.  
            dataStream.Close();
            
            return Content("Ejemplo de IoT");
        }

        public ActionResult IoTGet()
        {

            string API_KEY = "Z0HAVLYQ2VVYRB9J";  // thingspeak API KEY del profesor
            string CHANNEL = "706261"; // thingspeak canal del profesor

            WebRequest wreq = WebRequest.Create("https://api.thingspeak.com/channels/" + CHANNEL + "/feeds.json?api_key=" + API_KEY);
            wreq.Method = "GET";

            WebResponse webresp = wreq.GetResponse();

            // Usar un streamreader para leer la respuesta de thingspeak (abrir y cerrrar)
            StreamReader responseReader = new StreamReader(webresp.GetResponseStream());
            string response = responseReader.ReadToEnd();
            responseReader.Close();


            return Content(response);
        }


   




    }
}