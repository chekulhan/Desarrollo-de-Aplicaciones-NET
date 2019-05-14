using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestiondeEstado
{
    public partial class Cookies1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSaveCookie_Click(object sender, EventArgs e)
        {
            HttpCookie cookie = new HttpCookie("infousuario");
            cookie["color"] = txtColor.Text.ToString();
            Response.Cookies.Add(cookie);
            Response.Redirect("Cookies2.aspx");

        }
    }
}