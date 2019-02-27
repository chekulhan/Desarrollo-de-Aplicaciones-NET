using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

using System.Configuration;

namespace SuperHeroes
{
    public partial class ADOSQLDataReader : System.Web.UI.Page
    {
        private string connectionString;
        private string queryString = "SELECT * FROM Marvels";

        protected void Page_Load(object sender, EventArgs e)
        {

            connectionString= ConfigurationManager.ConnectionStrings["SQLConnectString"].ToString();
  
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {


            SqlConnection conn = new SqlConnection(connectionString);
            SqlCommand command = new SqlCommand(queryString, conn);
            conn.Open();

            SqlDataReader sqlReader = command.ExecuteReader();

            GridView1.DataSource = sqlReader;
            GridView1.DataBind();

            sqlReader.Close();
            conn.Close();


        }

        protected void btnActualizarConDataSet_Click(object sender, EventArgs e)
        {
 
            SqlDataAdapter adapter = new SqlDataAdapter(queryString, connectionString);

            DataSet ds = new DataSet();
            adapter.Fill(ds, "Resultados");

            GridView1.DataSource = ds;
            GridView1.DataBind();

            
        }
    }
}