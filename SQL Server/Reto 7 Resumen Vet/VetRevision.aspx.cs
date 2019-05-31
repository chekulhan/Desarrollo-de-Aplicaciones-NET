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
    public partial class VetRevision : System.Web.UI.Page
    {
        string connectionString= ConfigurationManager.ConnectionStrings["DBChe"].ToString();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) { 
                LoadClientes(); }

            LoadAnimales(int.Parse(ddlClientes.SelectedValue));
        }

        protected void LoadClientes()
        {

            SqlConnection conn = new SqlConnection(connectionString);
            string queryString = "SELECT codDueno, nombre + ' ' + apellido1 + ' ' + apellido2 AS nombreCompleto FROM Vet.Clientes";

            SqlCommand command = new SqlCommand(queryString, conn);
            conn.Open();

            SqlDataReader sqlReader = command.ExecuteReader();

            ddlClientes.DataSource = sqlReader;
            ddlClientes.DataValueField = "codDueno";
            ddlClientes.DataTextField = "nombreCompleto"; // uso de comlumna calculada en consulta SQL
  
            ddlClientes.DataBind();

            sqlReader.Close();
            conn.Close();

        }

        protected void LoadAnimales(int codCliente)
        {

            SqlConnection conn = new SqlConnection(connectionString);
            string queryString = "SELECT codigoAnimal, nombreAnimal FROM Vet.Animales WHERE codigoDueno="+ codCliente;

            SqlCommand command = new SqlCommand(queryString, conn);
            conn.Open();

            SqlDataReader sqlReader = command.ExecuteReader();

            ddlAnimales.DataSource = sqlReader;
            ddlAnimales.DataValueField = "codigoAnimal";
            ddlAnimales.DataTextField = "nombreAnimal";

            ddlAnimales.DataBind();

            sqlReader.Close();
            conn.Close();

        }

        protected void btnInsertar_Click(object sender, EventArgs e)
        {
            // insertar los datos en base de datos

            string sSQL = "USP_InsertarRevision";
            SqlConnection conn = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand(sSQL, conn);

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@CategoryName", "test");

            // Execute the command.

            conn.Open();

            int rowsAffected = cmd.ExecuteNonQuery();

            conn.Close();

            
        }
    }
}