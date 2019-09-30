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
             // o sea, que Page.PreviousPage != null && Page.IsCrossPagePostBack == true NO funciona (siempre es falso)
            // hay que mirar Page.PreviousPage.IsCrossPagePostBack (se supone, pero no me funciona)
            // Usando Server.Transfer NOT Redirect
            // el atributo PostBackUrl en primero página tampoco funciona, por lo tanto recurrimos a Server.Transfer()
            // <asp:Button ID="btnSubmit" runat="server" Text="Button" OnClick="btnSubmit_Click" PostBackUrl="~/CrossPagePostBack.aspx" />
 
            if (Page.PreviousPage != null ) {
                TextBox txtNombre = (TextBox)PreviousPage.FindControl("txtNombre");
                lblNombre.Text = txtNombre.Text.ToString();
                TextBox txtEdad = (TextBox)PreviousPage.FindControl("txtEdad");
                lblEdad.Text = txtEdad.Text.ToString();
            }

        }
    }
}
