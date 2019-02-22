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
    public partial class Form1 : Form
    {

        private string connectionString = @"Data Source = XXXXX";
        private SqlConnection conn;
        private SqlCommand cmd;


        private void RefreshGrid()
        {

            cmd = new SqlCommand("USP_GetVuelos", conn);
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

            conn.Close(); // Cerrrar conexion de base de datos

        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            int iID;
            int iResult;

            cmd = new SqlCommand("USP_InsertarVuelo", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@NombreVuelo", txtVuelo.Text.ToString());
            cmd.Parameters.AddWithValue("@Destino", txtDestino.Text.ToString());
            cmd.Parameters.AddWithValue("@Avion", txtEmail.Text.ToString());

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

            if (iResult ==0) { // Comprobar parámetro de RETORNO
                iID = (int)cmd.Parameters["@ID"].Value; // Get New ID

                txtID.Text = iID.ToString();
                MessageBox.Show("Un nuevo vuelo ha sido creado con ID " + iID.ToString());
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

            iID = (int) dataGridView1.Rows[e.RowIndex].Cells[0].Value;


            cmd = new SqlCommand("USP_GetVuelo", conn);
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
                txtID.Text = sqlReader["ID"].ToString();
                txtVuelo.Text = sqlReader["Nombre"].ToString();
                txtDestino.Text = sqlReader["Destino"].ToString();
                txtAvion.Text = sqlReader["Avion"].ToString();

            }
            sqlReader.Close();
            
        }

        private void btnBorrar_Click(object sender, EventArgs e)
        {

            int iResult;

            cmd = new SqlCommand("USP_BorrarVuelo", conn);
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

                MessageBox.Show("Un vuelo ha sido borrado con ID " + txtID.Text.ToString());
                //Resetear controles
                txtID.Text = "";
                txtVuelo.Text = "";
                txtDestino.Text = "";
                txtEmail.Text = "";

                RefreshGrid();
            }
            else
            {
                MessageBox.Show("Vuelo no existe. ID " + txtID.Text.ToString());
            }
        }

        
    }
}
