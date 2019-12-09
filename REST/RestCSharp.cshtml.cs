using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using RestSharp;
using WebInterfaz.Models;
using Newtonsoft.Json;

namespace WebInterfaz.Pages
{
    public class AJAX2Model : PageModel
    {

        public List<Genre> genres { get; set; }
        
        public int GenreId { get; set; }
        public string Name { get; set; }
        
        
        public void OnGet()
        {

            var client = new RestClient("https://localhost:44305/api/Genres");
            var request = new RestRequest(Method.GET);
            request.AddHeader("cache-control", "no-cache");
            request.AddHeader("content-type", "application/json");
            IRestResponse response = client.Execute(request);

            genres = JsonConvert.DeserializeObject<List<Genre>>(response.Content);
            genres.Where(g => g.GenreId > 6).ToList();
            

        }
        
        
        
        public void OnPost(int GenreId, string Name)
        {

            var client = new RestClient("https://localhost:44305/api/genres");
            var request = new RestRequest(Method.POST);
            request.AddHeader("cache-control", "no-cache");
            request.AddHeader("content-type", "application/x-www-form-urlencoded"); // imprescindible para enlazar formulario valores con objeto de web api

            // agregamos parameters de formulario
            request.AddParameter("GenreId", GenreId);
            request.AddParameter("Name", Name);

            IRestResponse response = client.Post(request);

            OnGet();

        }
        
        
    }
}
