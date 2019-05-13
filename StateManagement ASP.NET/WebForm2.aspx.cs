using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestiondeEstado
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            
            if (Page.IsPostBack == true)
            {
                //usando Session
                //Session["Nombre"] = txtNombre.Text.ToString();
                //Response.Redirect("WebForm3.aspx");

                //usando QueryString
                Response.Redirect("WebForm3.aspx?Nombre=" + txtNombre.Text.ToString());
            }
        }
    }
}