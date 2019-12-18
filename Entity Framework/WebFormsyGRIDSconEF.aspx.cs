using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EagerLazyLoading.Models;

namespace EagerLazyLoading
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //List<Departamentos> depts = context.Departamentos.Include("Empleados").ToList();

            using (DeptContexto2 context = new DeptContexto2())
            {
                List<Departamentos> depts = context.Departamentos.Include("Empleados").ToList();

               
                
                GridView1.DataSource = depts;
                GridView1.DataBind();

                
            }
        }
    }
}