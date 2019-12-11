using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using ODOOdotnetcore.Models;

namespace ODOOdotnetcore.Pages
{
    public class OdooAppsModel : PageModel
    {
        public List<IrModuleModule> apps {get;set;}
        public void OnGet()
        {
            using (var context = new ODOODBContext())
            {
                apps = context.IrModuleModule.ToList();
                    
            }
        }
    }
}
