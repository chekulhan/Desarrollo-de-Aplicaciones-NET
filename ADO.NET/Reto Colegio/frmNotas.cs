using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Diagnostics;
using System.Data.SqlClient;

namespace WindowsFormsERPVuelos
{
    public partial class frmNotas : Form
    {

        private string connectionString = @"Data Source = XXXXXX";
        private SqlConnection conn;
        private DataSet notasDS;
        SqlDataAdapter adapter;
        SqlTransaction tran;

        public frmNotas()
        {
            InitializeComponent();
        }

        private void frmNotas_Load(object sender, EventArgs e)
        {
            conn = new SqlConnection(connectionString); // Conectar a la base de datos
            string queryString = "SELECT IDAlumno, (SELECT nombre + ' ' + apellido FROM cole.alumnos AS a WHERE a.id = n.IDALUMNO) AS Nombre, Nota, IDESPECIALIDAD, CODCURSO, CODASIG  FROM cole.Notas AS n WHERE IDESPECIALIDAD = @IDEspecialidad AND CODCURSO = 1 AND CODASIG = '0369'";

            adapter = new SqlDataAdapter(queryString, conn);

            adapter.SelectCommand.Parameters.AddWithValue("@IDEspecialidad", "ASIR"); // conseguir valor de SelectedValue() de ComboBoxes
            // Añadir más parametro aqui para la consulta...

            notasDS = new DataSet();
            adapter.Fill(notasDS, "Notas"); // al ejecutar Fill(), se abre, vuelca los datos y se cierra la conexión 

            dgridNotas.DataSource = notasDS.Tables["Notas"];

            // Hacer invisible algunas columnas
            dgridNotas.Columns["IDAlumno"].Visible = false; 
            dgridNotas.Columns["IDESPECIALIDAD"].Visible = false;
            dgridNotas.Columns["CODCURSO"].Visible = false;
            dgridNotas.Columns["CODASIG"].Visible = false;

            dgridNotas.Columns["Nombre"].ReadOnly = true; // No se puede cambiar los datos del Nombre del Alumno

        }

        private void btnActualizar_Click(object sender, EventArgs e)
        {
            SqlCommandBuilder builder = new SqlCommandBuilder(adapter);
            adapter.Update(notasDS.Tables["Notas"]);
        }

        private void btnActualizarconTransaccion_Click(object sender, EventArgs e)
        {
            
            try
            {

                SqlCommandBuilder builder = new SqlCommandBuilder(adapter);
                // Fijate en el orden de cosas ... hace falta pedir comandos del builder antes de asignar una transaccion
                builder.GetDeleteCommand();
                builder.GetUpdateCommand();
                builder.GetInsertCommand();

                conn.Open();
                tran = conn.BeginTransaction();

                builder.GetDeleteCommand().Transaction = tran;
                builder.GetUpdateCommand().Transaction = tran;
                builder.GetInsertCommand().Transaction = tran;

                adapter.Update(notasDS.Tables["Notas"]);

                tran.Commit();
            }
            catch (Exception ex)
            {
                Debug.Print(ex.Message);
                tran.Rollback();
            }
            finally
            {
                conn.Close();
            }
           
        }
    }
}
