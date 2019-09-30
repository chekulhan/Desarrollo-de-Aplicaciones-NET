using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class CrossPagePostBack : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            // OJO: Page.IsCrossPagePostback es false, deberia ser true....
            // o sea, que Page.PreviousPage != null && Page.IsCrossPagePostBack == true NO funciona
            // Usando Server.Transfer NOT Redirect
            if (Page.PreviousPage != null ) {
                TextBox txtNombre = (TextBox)PreviousPage.FindControl("txtNombre");
                lblNombre.Text = txtNombre.Text.ToString();
                TextBox txtEdad = (TextBox)PreviousPage.FindControl("txtEdad");
                lblEdad.Text = txtEdad.Text.ToString();
            }

        }
    }
}