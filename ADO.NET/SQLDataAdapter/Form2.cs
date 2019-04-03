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
    public partial class Form2 : Form
    {

        private string connectionString = @"Data Source = XXXXXXXX";
        private SqlConnection conn;
        private DataSet empleadosDS;
        SqlDataAdapter adapter;


        private void RefreshGrid()
        {

            conn = new SqlConnection(connectionString); // Fijáte que la conexion NO esta ABIERTA


            adapter.Fill(empleadosDS, "Empleados"); // al ejecutar Fill(), se abre, vuelca los datos y se cierra la conexión 
         
            gridEmpleados.DataSource = empleadosDS.Tables["Empleados"];

        }

        public Form2()
        {
            InitializeComponent();
        }



        private void Form2_Load(object sender, EventArgs e)
        {
            conn = new SqlConnection(connectionString); // Conectar a la base de datos
            string queryString = "SELECT * FROM dbo.Empleados";
            adapter = new SqlDataAdapter(queryString, conn);
            empleadosDS = new DataSet();
            RefreshGrid();
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            SqlCommandBuilder builder = new SqlCommandBuilder(adapter);
            adapter.Update(empleadosDS, "Empleados"); // Fijáte que la conexion NO esta ABIERTA

        }

        private void btnInsert_Click(object sender, EventArgs e)
        {
            // Ejemplo básico de un INSERT sin usar el GridView
            // Se puede crear TextBoxes con valores para insertar en una nueva fila de DataTable

            DataTable table = empleadosDS.Tables["Empleados"];
            DataRow rowData;
            rowData = table.NewRow();
            rowData["Nombre"] = "nuevo Nombre"; // valores que se puede coger de Textbox
            rowData["Apellido"] = "nuevo Apellido";
            table.Rows.Add(rowData);

            SqlCommandBuilder builder = new SqlCommandBuilder(adapter);
            adapter.Update(empleadosDS, "Empleados"); // Fijáte que la conexion NO esta ABIERTA


            RefreshGrid();
        }

        private void btnInfo_Click(object sender, EventArgs e)
        {
            // Mostrar información sobre RowState (de cada fila) y DataRowVersion (de cada columna)
            DataTable table = empleadosDS.Tables["Empleados"];
            foreach (DataRow dr in table.Rows)
            {
                Debug.Print("ROWSTATE: " + dr.RowState.ToString()); //Unchanged, Modified, ...
                Debug.Print("Original: " + dr["Nombre", DataRowVersion.Original].ToString());
                Debug.Print("Nuevo valor: " + dr["Nombre", DataRowVersion.Current].ToString());

            }
        
        }

        private void btnComandos_Click(object sender, EventArgs e)
        {
           

            // Ver las consultas que crea automaticamente el SQLCommandBuilder
            SqlCommandBuilder builder = new SqlCommandBuilder(adapter);
            SqlCommand comm = builder.GetUpdateCommand();
            Debug.Print(comm.CommandText.ToString());


            // Construir el update command, diferente de lo que nos proporciona el SqlCommandBuilder
            // en este caso, solo estoy actualizando la columna Nombre, y nada mas....

            string sqlText = "Update Empleados SET Nombre = @Nombre WHERE IdEmpleado=@IdOriginal";
            SqlCommand updateCommand = new SqlCommand(sqlText, conn);
            updateCommand.Parameters.Add("@Nombre", SqlDbType.NVarChar, 50, "Nombre"); // Nombre es la fuente de Columna 
            updateCommand.Parameters.Add("@IdOriginal", SqlDbType.Int, 0, "IdEmpleado");
            updateCommand.Parameters["@IdOriginal"].SourceVersion =DataRowVersion.Original;
            adapter.UpdateCommand = updateCommand;

            adapter.Update(empleadosDS, "Empleados");


            RefreshGrid(); // Refrescar grid

        }
    }
}
