using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace GestiondeEstado
{
    public partial class Cookies2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Get Cookie
            HttpCookie cookie = Request.Cookies["infousuario"];
            if (cookie != null)
            {
                
                lblResultado.Text = cookie["color"].ToString();
                
                Label label = (Label)Page.FindControl("lblColor");
                if (label != null)
                {
                    label.Style.Add("background-color", cookie["color"].ToString());
                }
            }
            else
            {
                lblResultado.Text = "No cookie found";

            }
        }
    }   
}