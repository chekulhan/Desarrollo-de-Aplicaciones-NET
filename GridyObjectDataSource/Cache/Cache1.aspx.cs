using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace WebNCapas
{
    public partial class Cache1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblTime.Text = DateTime.Now.ToLongTimeString();


            // Insertar datos o objeto en Cache
            HttpRuntime.Cache.Insert("chacheobj", "valor"); // Hay más opciones de cache sobrecargado
            // o directamente con el objeto Cache. Al final, es el mismo objeto.
            
        }

        protected void ObjectDataSource1_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
        {
            lblStatus.Text = "-- Selecting event fired";
        }

        protected void btnGetCache_Click(object sender, EventArgs e)
        {
            // Mostrar datos o objetos que esta guardado en Cache
            var strCache = HttpRuntime.Cache.Get("chacheobj"); // o Cache.Get("chacheobj").ToString();

            lblCache.Text = strCache.ToString();
       
        }
    }
}