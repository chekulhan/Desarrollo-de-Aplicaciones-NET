using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestiondeEstado
{
    public partial class SessionconObjeto2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Persona p;
            p = (Persona)Session["usuario"];

            lblNombre.Text = p.Nombre;
            lblEdad.Text = p.Edad.ToString();
        }
    }
}