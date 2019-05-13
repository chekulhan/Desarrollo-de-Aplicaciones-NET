using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestiondeEstado
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // usando Session
            //lblResultados.Text = Session["Nombre"].ToString();

            // usando QueryString y Hidden Forms
            if (Page.IsPostBack == true)
            {
                Response.Redirect("WebForm4.aspx?Nombre=" + hiddenName.Value + "&Email=" + txtEmail.Text);
            }
            else
            {

                lblResultados.Text = Request.QueryString["Nombre"].ToString(); 
                hiddenName.Value = Request.QueryString["Nombre"].ToString(); 

            }
            
        }
    }
}