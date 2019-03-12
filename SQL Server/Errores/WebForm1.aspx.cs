using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


namespace WebApplication2
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnDatos_Click(object sender, EventArgs e)
        {

            SqlDataReader dr;
            DataTable dt;

            string connectionString = ConfigurationManager.ConnectionStrings["DBConexion"].ToString();
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = connectionString;

            // Ejecutamos un procedimiento almacenado que llama a RAISERROR ('Error en Transact SQL.', 16, 1 ) sin TRY..CATCH
            SqlCommand cmd = new SqlCommand("usp_RaiseError", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            conn.Open();

            try
            {
		
		// TRY..CATCH en procedimiento almacenado funciona si NO devolvemos resultados, i.e. ejecutamos cmd.ExecuteNonQuery()
                
                dr = cmd.ExecuteReader();

                // Bind datos al formulario
                GridView1.DataSource = dr;
                GridView1.DataBind();

            }
            catch (Exception ex)
            {
                Response.Write("Error");
                Response.Write(ex.Message);
            }
            finally
            {
               
                if (conn != null) conn.Close();  
            }

        }

        
    }
}