using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.BLL;

namespace WebApplication1
{
    public partial class GridObjects : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Write("Grid Objects");

            // PRUEBA 1:
            // Loop over Objects - comprobar que devuelve objetos
            //foreach (Producto p in l)
            //{
            //    Response.Write(p.Descripcion);
            //}



            //OPCION 3: Asociar el DataSource al Grid usando codigo
            //ObjectDataSource1.TypeName = "WebApplication1.BLL.ProductosMger"; // Usar todo el  espaciodenombre
            //ObjectDataSource1.SelectMethod = "getProductos";
            //GridView1.DataSource = ObjectDataSource1; // coleccion de objetos Producto
            //GridView1.DataBind();


            //OPCION 2: Aplicar la LIST de objetos a la DataSource del Grid
            //ProductosMger PM = new ProductosMger();
            //List<Producto> l;
            //l = PM.getProductos();

            //GridView1.DataSource = l; // coleccion de objetos Producto
            //GridView1.DataBind();


            //OPCION 1: Usar HTML ONLY
            // < asp:ObjectDataSource ID = "ObjectDataSource1" runat = "server" TypeName = "WebApplication1.BLL.ProductosMger" SelectMethod = "getProductos" ></ asp:ObjectDataSource >
            // < asp:GridView ID = "GridView1" runat = "server" DataSourceID = "ObjectDataSource1" >




            
            Response.Write("Grid Objects END");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            // AJAX y SCRIPT MANAGER
            
        }
    }
}