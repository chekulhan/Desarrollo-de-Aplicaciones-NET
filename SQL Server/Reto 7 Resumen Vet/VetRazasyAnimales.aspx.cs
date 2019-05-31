using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class RazasyAnimales : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) { 
                string strAnimal = Request.QueryString["raza"].ToString();
                
                ddlRazas.SelectedValue = strAnimal;
            }
        }
    }
}