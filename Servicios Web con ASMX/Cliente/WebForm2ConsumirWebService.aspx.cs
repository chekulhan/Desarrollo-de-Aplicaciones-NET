using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Serialization;

namespace WebApplication1
{
    public partial class WebForm2ConsumirWebService : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGetWebServicio_Click(object sender, EventArgs e)
        {
            // Instanciar y llamar web servicio
            MiPrimerServicioWeb w1 = new MiPrimerServicioWeb();

            int Num1 = int.Parse(txtNum1.Text.ToString());
            int Num2 = int.Parse(txtNum2.Text.ToString());

            // Mostrar resultados
            lblResultado.Text = w1.SumarNumeros(Num1, Num2).ToString();

            
        }

       

    }
}