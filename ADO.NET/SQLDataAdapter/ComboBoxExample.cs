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
    public partial class ComboBoxExample : Form
    {

        private string connectionString = @"Data Source = XXXXXXX";
        private SqlConnection conn;
 

        public ComboBoxExample()
        {
            InitializeComponent();
        }

      
        private void btnBindCombo_Click(object sender, EventArgs e)
        {
            // cargar el combobox con datos usando SQLDataAdapter
            SqlConnection conn = new SqlConnection(connectionString);
            string queryString = "SELECT IDEmpleado, Nombre FROM dbo.Empleados";

            SqlDataAdapter adapter = new SqlDataAdapter(queryString, conn);

            DataSet ds = new DataSet();

            adapter.Fill(ds, "Empleados");
            cboEmpleados.DataSource = ds.Tables["Empleados"];
            cboEmpleados.DisplayMember = "Nombre";
            cboEmpleados.ValueMember = "IDEmpleado";

        }

        private void cboEmpleados_SelectedIndexChanged(object sender, EventArgs e)
        {
            Debug.Print(cboEmpleados.SelectedValue.ToString());
        }

        private void btnBindCombo2_Click(object sender, EventArgs e)
        {

            // dos ejemplos usando un BindingSource con diferentes fuentes de datos
            // Ejemplo 1:
            BindingSource bs = new BindingSource();

            List<string> data = new List<string>
            {
                "Item 1",
                "Item 2",
                "Item 3"
            };

            bs.DataSource = dataDict;
            cboEmpleados2.DataSource = bs;

            // Ejemplo 2: Diccionario
            Dictionary<int, string> dataDict = new Dictionary<int, string>();
            dataDict.Add(1, "Item 1");
            dataDict.Add(2, "Item 2");
            dataDict.Add(3, "Item 3");

            bs.DataSource = dataDict;
            
            cboEmpleados2.DataSource = bs;
            cboEmpleados2.DisplayMember = "Value";
            cboEmpleados2.ValueMember = "Key";


            
        }

        private void cboEmpleados2_SelectedIndexChanged(object sender, EventArgs e)
        {
            Debug.Print(cboEmpleados2.SelectedValue.ToString());
        }

        private void btnBindComboSQLReader_Click(object sender, EventArgs e)
        {
            //// cargar el combobox con datos con SQL Data Reader
            SqlConnection conn = new SqlConnection(connectionString);
            string queryString = "SELECT IDEmpleado, Nombre FROM dbo.Empleados";

            SqlCommand command = new SqlCommand(queryString, conn);
            conn.Open();

            SqlDataReader sqlReader = command.ExecuteReader();

   
            // Otra opcion es recorrer el SQLDataReader, en este caso tampoco se asigna la propiedad .ValueMember
            List<ItemEjemplo> lista = new List<ItemEjemplo>();
            cboEmpleados3.DisplayMember = "Text";
            cboEmpleados3.ValueMember = "Value";
            
            while (sqlReader.Read())
            {
                lista.Add(new ItemEjemplo(sqlReader["Nombre"].ToString(),int.Parse(sqlReader["IdEmpleado"].ToString())));
            }
            cboEmpleados3.DataSource = lista; // asignar la lista al ComboBox control
  
            sqlReader.Close();
            conn.Close();
        }

        // IMPORTANTE: Evento SelectedIndexChanged() dispara al cargar los datos de la base de datos (i.e. al asignar DataSource y ValueMember, ...)
        // Usar evento SelectionChangeCommitted() dispara evento al click de Usuario
        private void cboEmpleados3_SelectedIndexChanged(object sender, EventArgs e)
        {
           Debug.Print(cboEmpleados3.SelectedValue.ToString());
        }

        private void btnSQLDataReader2_Click(object sender, EventArgs e)
        {
            //// cargar el combobox con datos con SQL Data Reader usando DataTable
            SqlConnection conn = new SqlConnection(connectionString);
            string queryString = "SELECT IDEmpleado, Nombre FROM dbo.Empleados";

            SqlCommand command = new SqlCommand(queryString, conn);
            conn.Open();

            SqlDataReader sqlReader = command.ExecuteReader();

            // Usar un DataTable para los resultados de SQLDataReader
            DataTable dt = new DataTable();
            dt.Load(sqlReader);
            cboEmpleados3.DataSource = dt;
            cboEmpleados3.DisplayMember = "Nombre";
            cboEmpleados3.ValueMember = "IDEmpleado";


            sqlReader.Close();
            conn.Close();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            //// reutilizar una conexion con SQLDataReader
            SqlConnection conn = new SqlConnection(connectionString);
            string queryString = "SELECT IDEmpleado, Nombre FROM dbo.Empleados";

            SqlCommand command1 = new SqlCommand(queryString, conn);
            conn.Open();

            SqlDataReader sqlReader1 = command1.ExecuteReader();

            Debug.Print("Reader Open y connexion open" + sqlReader1.HasRows);

            sqlReader1.Close();


            SqlCommand command2 = new SqlCommand(queryString, conn);

            SqlDataReader sqlReader2 = command2.ExecuteReader();

            Debug.Print(" 2 Reader Open" + sqlReader2.HasRows);

            sqlReader2.Close();


            // close conexion
            conn.Close();
        }

        private void btnReader3_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(connectionString);
            string queryString = "SELECT IDEmpleado, Nombre FROM dbo.Empleados";

            SqlCommand command = new SqlCommand(queryString, conn);
            conn.Open();

            SqlDataReader sqlReader = command.ExecuteReader();

            BindingSource bs = new BindingSource();
            bs.DataSource = sqlReader;

            cboEmpleados3.DataSource = bs;
            cboEmpleados3.DisplayMember = "Nombre";
            cboEmpleados3.ValueMember = "IDEmpleado";

            sqlReader.Close();
            conn.Close();
        }
    }
}
