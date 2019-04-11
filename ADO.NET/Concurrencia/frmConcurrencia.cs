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
        private string connectionString = @"Data Source = XXXXX";
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

            // Añadir esta linea al usar el timestamp para implementar concurrencia optimista
            dataGridProfesores.Columns["CurrentTimeStamp"].Visible = false;


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

            try
            {
                SqlCommandBuilder builder = new SqlCommandBuilder(adapter);
                adapter.Update(profesoresDS.Tables["Profesores"]);
            }
            catch (DBConcurrencyException ex)
            {
                DialogResult result;


                result = MessageBox.Show("Ha habido un error al actualizar datos - " + ex.Message);
                Debug.Print(ex.Message);
                
            }
            

        }

        private void btnTimeStamp_Click(object sender, EventArgs e)
        {
            // Profe: ver respuesta en PLANNING doc

            // De momento, esta función sobrescribe los datos de otros usuarios, que no esta bien
            // Objetivo: Implementar concurrencia optimista a traves del timestamp (base de datos)

            // Alumno: Cambiar consulta para comprar version de CurrentTimeStamp
            SqlCommand cmd = new SqlCommand("UPDATE cole.profesores SET Ciudad = @Ciudad WHERE ID = @ID", conn);

            cmd.CommandType = CommandType.Text;
          

            cmd.Parameters.Add("@ID", SqlDbType.Int, 0, "ID");
            cmd.Parameters["@ID"].SourceVersion = DataRowVersion.Original;

            // Alumno: Añadir parámetero de CurrentTimeStamp
            

            cmd.Parameters.Add("@Ciudad", SqlDbType.NVarChar, 50, "Ciudad"); // Nombre es la fuente de Columna 


 
            adapter.UpdateCommand = cmd;
            int rowsAffected = adapter.Update(profesoresDS, "Profesores");
            Debug.Print(rowsAffected.ToString());
        }
    }
}
