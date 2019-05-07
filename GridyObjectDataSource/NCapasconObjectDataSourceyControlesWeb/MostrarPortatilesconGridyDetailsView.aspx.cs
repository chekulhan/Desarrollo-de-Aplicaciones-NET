using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;



namespace WebNCapas
{
    public partial class MostrarPortatilesconGridyDetailsView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            //if (e.CommandName == "MostrarProducto")
            //{
            //    string vendid = Convert.ToString(e.CommandArgument.ToString());
            //    Response.Write("Vendorid:" + vendid);
            //}

        }

    }
}