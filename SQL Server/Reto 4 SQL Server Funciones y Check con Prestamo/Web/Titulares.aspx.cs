using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace BancoPrestamo
{
    public partial class Titulares : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        //Se podria haber utilizado al nivel aplicacion, poniendo funcion en global.asax code: void Application_Error(object sender, EventArgs e)
        private void Page_Error(object sender, EventArgs e)
        {
            Response.Redirect("ErrorPage.aspx");
        }

    }
}