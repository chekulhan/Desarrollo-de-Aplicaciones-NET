using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class BusinessLogicCapasUsuarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GetUsuarios();
        }
      


        protected void GetUsuarios()
        {
            //Usuarios oUsuario = new Usuarios();

            //GridViewUsuarios.DataSource = oUsuario.GetUsuarios();
            //GridViewUsuarios.DataBind();
        }
        protected void BtnSaveUser_Click(object sender, EventArgs e)
        {

            int iID = 0;
            
            Usuarios oUsuario = new Usuarios();

            oUsuario.NombredeUsuario = txtNombre.Text;
            oUsuario.Direccion = txtDireccion.Text;
            oUsuario.Movil = txtMobile.Text;
            oUsuario.Email = txtEmail.Text;

            iID = oUsuario.SaveUsuario();

            Response.Write("User Saved..." + iID.ToString());
        }
            



    }
}