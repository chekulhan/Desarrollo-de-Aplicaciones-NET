using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestiondeEstado
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = Application["AppMsg"].ToString();
            lblApp.Text = Application["AppMsg"].ToString();
            lblMsg.Text = Application["users"].ToString();


            // actividad ViewState
            if (IsPostBack == false) { // establecer como 0 al principio
                ViewState["counter"] = 0;
                lblCounter.Text = ViewState["counter"].ToString();
            }
    }

        protected void btnIncrement_Click(object sender, EventArgs e)
        {
            // Usando ViewState
            if (ViewState["counter"] != null)
            {
                ViewState["counter"] =(int) ViewState["counter"] + 1;
                lblCounter.Text = ViewState["counter"].ToString();
            }
                
        }

       
    }
}