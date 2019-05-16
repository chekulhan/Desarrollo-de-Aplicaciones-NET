using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestiondeEstado
{
    public partial class SessionconObjeto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGo_Click(object sender, EventArgs e)
        {
            Persona p = new Persona();

            p.Nombre = txtNombre.Text;
            p.Edad = int.Parse(txtEdad.Text);

            Session["usuario"] = p;
            Response.Redirect("SessionconObjeto2.aspx");
        }
    }
}