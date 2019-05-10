using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace WebNCapas
{
    public partial class MostrarPortatilesconBD : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void ObjectDataSource1_Updated(object sender, ObjectDataSourceStatusEventArgs e)
        {
            if (e.Exception != null)
            {
                // populate your field here
                lblMessage.Text = e.Exception.Message;
                e.ExceptionHandled = true;
            }
        }
    }
}