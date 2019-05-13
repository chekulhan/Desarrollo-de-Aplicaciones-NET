using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestiondeEstado
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            hiddenName.Value = Request.QueryString["Nombre"].ToString();
            hiddenEmail.Value = Request.QueryString["Email"].ToString();

            lblNombre.Text= Request.QueryString["Nombre"].ToString();
            lblEmail.Text =  Request.QueryString["Email"].ToString();
        }
    }
}