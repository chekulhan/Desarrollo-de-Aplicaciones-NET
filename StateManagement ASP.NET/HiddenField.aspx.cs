using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestiondeEstado
{
    public partial class HiddenField : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Asignar un valor al campo oculto
            hiddenFecha.Value = DateTime.Now.ToLongDateString();
            lblResultados.Text = hiddenFecha.Value;
        }
    }
}