using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class BusinessLogicCapas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GetUsuarios();
        }

        protected void btnSumar_Click(object sender, EventArgs e)
        {
            int num1 = 0;
            int num2 = 0;
            int res = 0 ;

            num1 = Convert.ToInt32(txtNum1.Text);
            num2 = Convert.ToInt32(txtNum2.Text);
            res = num1 + num2;

            lblResultado.Text = res.ToString();
        }

        protected void btnSumarconClases_Click(object sender, EventArgs e)
        {
            clsNumeros objNum = new clsNumeros();

            objNum.Num1 = Convert.ToInt32(txtNum1.Text);
            objNum.Num2 = Convert.ToInt32(txtNum2.Text);

            lblResultado.Text = objNum.Sumar().ToString();
        }

        protected void btnSumarconCapaBD_Click(object sender, EventArgs e)
        {

            
            clsNumeros objNum = new clsNumeros();
            
            objNum.Num1 = Convert.ToInt32(txtNum1.Text);
            objNum.Num2 = Convert.ToInt32(txtNum2.Text);

            lblResultado.Text = objNum.SumarconCapaBD().ToString();
        }


        protected void btnGetDatos_Click(object sender, EventArgs e)
        {


            clsPostsDAL objPosts = new clsPostsDAL();
            
            
            // Usar DAL para rellenar DataSet de base de datos
            GridView1.DataSource=   objPosts.getPosts();
            GridView1.DataBind();

        }


        protected void GetUsuarios()
        {
            Usuarios oUsuario = new Usuarios();

            GridViewUsuarios.DataSource = oUsuario.GetUsuarios();
            GridViewUsuarios.DataBind();
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