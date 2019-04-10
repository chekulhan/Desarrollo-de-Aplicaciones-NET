using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;
using System.Diagnostics;

namespace WindowsFormsERPVuelos
{
    public partial class frmConcurrencia : Form
    {
        private string connectionString = @"Data Source = XXXXXX";
        private SqlConnection conn;
        private DataSet profesoresDS;
        SqlDataAdapter adapter;
       
        // Prueba de concurrencia - despues de SQLDataAdapter

        public frmConcurrencia()
        {
            InitializeComponent();
        }

        private void frmConcurrencia_Load(object sender, EventArgs e)
        {
            conn = new SqlConnection(connectionString); // Conectar a la base de datos
            string queryString = "SELECT * FROM cole.Profesores";

            adapter = new SqlDataAdapter(queryString, conn);


            profesoresDS = new DataSet();
            adapter.Fill(profesoresDS, "Profesores"); // al ejecutar Fill(), se abre, vuelca los datos y se cierra la conexión 

            dataGridProfesores.DataSource = profesoresDS.Tables["Profesores"];

            
        }

        private void button1_Click(object sender, EventArgs e)
        {

            conn.Open();
            SqlCommand cmd = new SqlCommand("UPDATE cole.profesores SET Ciudad = @Ciudad WHERE ID = @IDProfesor", conn);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@IDProfesor", int.Parse(txtProfesorID.Text));
            cmd.Parameters.AddWithValue("@Ciudad", txtCiudad.Text);

            // Ejecutar el procedimiento 
            cmd.ExecuteNonQuery();

            conn.Close();

        }


        private void btnActualizar_Click(object sender, EventArgs e)
        {
            SqlCommandBuilder builder = new SqlCommandBuilder(adapter);
            adapter.Update(profesoresDS.Tables["Profesores"]);
        }

        private void btnActualizarconConcurrencia_Click(object sender, EventArgs e)
        {
            // Implementar un TRY CATCH y mostrar un mensaje de error para el usuario
            // Por defecto, el objeto SQLDataAdapter usa concurrencia optimista 

    
            SqlCommandBuilder builder = new SqlCommandBuilder(adapter);
            adapter.Update(profesoresDS.Tables["Profesores"]);
           
            

        }
    }
}
