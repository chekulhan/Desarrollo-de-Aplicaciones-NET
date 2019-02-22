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

namespace WindowsFormsApp2
{
    public partial class Form1 : Form
    {

        private string connectionString = @"Data Source = XXXXXXXXXXXX";
        private SqlConnection conn;
        private SqlCommand cmd;


        private void RefreshGrid()
        {

            cmd = new SqlCommand("USP_GetEmpleados", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlDataReader dr = cmd.ExecuteReader();

            DataTable dt = new DataTable();
            dt.Load(dr);

            // Bind datos al formulario
            dataGridView1.DataSource = dt;
            
            dr.Close();
        }

        public Form1()
        {
            InitializeComponent();
        }


        private void Form1_Load(object sender, EventArgs e)
        {
            conn = new SqlConnection(connectionString); // Conectar a la base de datos
            conn.Open();

            RefreshGrid(); // actualizar los datos en el grid
        }

        private void Form1_FormClosed(Object sender, FormClosedEventArgs e)
        {

            Debug.Write("Closing");
            conn.Close(); // Cerrrar conexion de base de datos


        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            int iID;
            int iResult;

            cmd = new SqlCommand("USP_InsertEmpleado", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@NombredeEmpleado", txtNombre.Text.ToString());
            cmd.Parameters.AddWithValue("@Apellido", txtApellido.Text.ToString());
            cmd.Parameters.AddWithValue("@Email", txtEmail.Text.ToString());

            //Establecer parámetro de OUTPUT, en este caso en nuevo ID de SCOPE_IDENTITY()
            SqlParameter parameterOUTPUT = new SqlParameter();
            parameterOUTPUT.ParameterName = "@ID";
            parameterOUTPUT.SqlDbType = SqlDbType.Int;
            parameterOUTPUT.Direction = ParameterDirection.Output;
            cmd.Parameters.Add(parameterOUTPUT);

            //Establecer parámetro de RETORNO
            SqlParameter parameterRETURN = new SqlParameter("@ReturnValue", System.Data.SqlDbType.Int);
            parameterRETURN.Direction = System.Data.ParameterDirection.ReturnValue;
            cmd.Parameters.Add(parameterRETURN);


            cmd.ExecuteNonQuery();
            iResult = (int)cmd.Parameters["@ReturnValue"].Value;

            if (iResult ==0) { // Comprobar parçametro de RETORNO
                iID = (int)cmd.Parameters["@ID"].Value; // Get New ID

                txtID.Text = iID.ToString();
                MessageBox.Show("Un nuevo empleados ha sido creado con ID " + iID.ToString());
            }

    }

        private void btnActualizar_Click(object sender, EventArgs e)
        {
            RefreshGrid(); // actualizar los datos en el grid
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            int iID;
            int rowIndex = e.RowIndex;
            //DataGridViewRow row = dataGridView1.Rows[rowIndex];

            iID = (int) dataGridView1.Rows[e.RowIndex].Cells[0].Value;


            cmd = new SqlCommand("USP_GetEmpleado", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlParameter parameterINPUT = new SqlParameter();
            parameterINPUT.ParameterName = "@ID";
            parameterINPUT.SqlDbType = SqlDbType.Int;
            parameterINPUT.Direction = ParameterDirection.Input;
            parameterINPUT.Value = iID;
            cmd.Parameters.Add(parameterINPUT);

            SqlDataReader sqlReader = cmd.ExecuteReader();

            if (sqlReader.HasRows)
            {
                sqlReader.Read();
                txtID.Text = sqlReader["IDEmpleado"].ToString();
                txtNombre.Text = sqlReader["Nombre"].ToString();
                txtApellido.Text = sqlReader["Apellido"].ToString();
                txtEmail.Text = sqlReader["Email"].ToString();

            }
            sqlReader.Close();
            
        }

        private void btnBorrar_Click(object sender, EventArgs e)
        {

            int iResult;

            cmd = new SqlCommand("USP_BorrarEmpleado", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@ID", SqlDbType.Int);
            cmd.Parameters["@ID"].Value = txtID.Text;

            //Establecer parámetro de RETORNO
            SqlParameter parameterRETURN = new SqlParameter("@ReturnValue", System.Data.SqlDbType.Int);
            parameterRETURN.Direction = System.Data.ParameterDirection.ReturnValue;
            cmd.Parameters.Add(parameterRETURN);

            cmd.ExecuteNonQuery();

            iResult = (int)cmd.Parameters["@ReturnValue"].Value;

            if (iResult == 0)
            { // Comprobar parçametro de RETORNO

                MessageBox.Show("Un empleado ha sido borrado con ID " + txtID.Text.ToString());
                //Resetear controles
                txtID.Text = "";
                txtNombre.Text = "";
                txtApellido.Text = "";
                txtEmail.Text = "";

                RefreshGrid();
            }
            else
            {
                MessageBox.Show("Empleado no existe. ID " + txtID.Text.ToString());
            }
        }
    }
}
