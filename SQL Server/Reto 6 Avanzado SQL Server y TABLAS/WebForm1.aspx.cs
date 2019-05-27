using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Generic;

namespace WebApplication2
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["DBChe"].ToString();
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand("usp_PedidosyLineas", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Order_ID", 2465);
            cmd.Parameters.AddWithValue("@Order_Date", "19/5/1976");
            cmd.Parameters.AddWithValue("@CUSTOMER_ID", 104);



            DataTable dt = new DataTable();
            dt.Columns.Add("codigoPedido");
            dt.Columns.Add("numLinea");
            dt.Columns.Add("codProducto");
            dt.Columns.Add("precio", typeof(Decimal));
            dt.Columns.Add("cantidad", typeof(Decimal));
            


            //DataColumn totalColumn = new DataColumn();
            //totalColumn.DataType = System.Type.GetType("System.Decimal");
            //totalColumn.ColumnName = "total";
            //totalColumn.Expression = "(precio * cantidad)";
            //totalColumn.ReadOnly = true;

            //dt.Columns.Add(totalColumn);



            dt.Rows.Add(2465, 1, 1726, 5.4, 10);
            dt.Rows.Add(2465, 2, 1726, 5, 5);
            dt.Rows.Add(2465, 3, 1726, 3, 15);


            SqlParameter param = new SqlParameter();
            param.ParameterName = "@lineas";
            param.TypeName= "OE.T_LineasPedido";
            param.SqlDbType = SqlDbType.Structured;
            param.Value = dt;
            cmd.Parameters.Add(param);
           
            // http://www.sommarskog.se/arrays-in-sql-2008.html
            var o = cmd.ExecuteNonQuery();

        }
    }
}