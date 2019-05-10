using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;


namespace WebNCapas.BLL
{
    public class ProductoMgr
    {
        private string connectionString = @"Data Source = XXXXXX";

        public bool InsertProducto(Producto p)
        {

            // Actualizar producto
            return true;
        }

        public bool DeleteProducto(int ID)
        {

            // borrar producto
            return true;
        }

        public int UpdateProducto(int ProductoID, string Nombre, string Detalles, decimal Precio, bool Disponible)
        {

            // Update producto
            SqlConnection connection = new SqlConnection(connectionString);

            // Se puede añadir la lógica de negocios aqui, por ejemplo....
            if (Precio < 10)
            {
                throw new ArgumentOutOfRangeException(nameof(Precio), "Precio no puede ser menos de 10 euros");
            }

            Producto p = new Producto();
            p.ProductoID = ProductoID;
            p.Nombre = Nombre;
            p.Detalles = Detalles;
            p.Precio = Precio;


            try

            {
   
                connection.Open();
                string sSQL = "Update Productos SET Nombre = @Nombre, Detalles = @Detalles, Precio = @Precio WHERE ProductoID = @ProductoID;";
                SqlCommand cmd = new SqlCommand(sSQL, connection);
                cmd.CommandType = CommandType.Text;


                cmd.Parameters.AddWithValue("@ProductoID", p.ProductoID);
                cmd.Parameters.AddWithValue("@Nombre", p.Nombre.ToString());
                cmd.Parameters.AddWithValue("@Detalles", p.Detalles.ToString());
                cmd.Parameters.AddWithValue("@Precio", p.Precio);


                if (connection.State == ConnectionState.Closed)
                {
                    connection.Open();
                }

                cmd.ExecuteNonQuery();
            }
            catch (Exception e)
            {
                /*Handle error*/
                Console.WriteLine(e.Message);
                Console.WriteLine(e.ToString());

            }

            finally
            {
                connection.Close();
            }

            return 1;
           
        }
        public List<Producto> GetProductos()
        {
            List<Producto> listProductos = new List<Producto>
            {
                new Producto {ProductoID=1,  Nombre="Lenova", Detalles="Descricion de Lenova", Precio=250, Foto="images/laptop1.jpg", Disponible=true},
                new Producto {ProductoID=2,   Nombre="ACER", Detalles="Descricion de ACER", Precio=40, Foto="images/laptop2.jpg", Disponible=true},
                new Producto { ProductoID=3,  Nombre="Apple", Detalles="Descricion de Apple", Precio=150, Foto="images/laptop3.jpg", Disponible=false},
            };


            return listProductos;
        }


        public DataSet GetPortatiles()
        {

            DataSet dsPortatiles = new DataSet();
            SqlConnection connection = new SqlConnection(connectionString);

            try
            {

                if (connection.State == ConnectionState.Closed)
                {
                    connection.Open();
                }
                SqlDataAdapter adapter = new SqlDataAdapter("SELECT *  FROM Productos", connection);

                adapter.Fill(dsPortatiles, "Portatiles");
            }
            catch (Exception)
            {
                /*Handle error*/
            }

            finally
            {
                connection.Close();
            }

            return dsPortatiles;

        }


        public Producto GetPortatil(int IDProducto)
        {
            Producto p = new Producto();

            SqlConnection conn = new SqlConnection(connectionString);
            string queryString = "SELECT * FROM Productos WHERE ProductoID = " + IDProducto;

            SqlCommand command = new SqlCommand(queryString, conn);
            conn.Open();

            try
            {
                SqlDataReader sqlReader = command.ExecuteReader();

                while (sqlReader.HasRows==true)
                {
                    while (sqlReader.Read()) { 
                        
                        p.ProductoID = int.Parse(sqlReader["ProductoID"].ToString());
                        p.Nombre = sqlReader["Nombre"].ToString();
                        p.Detalles = sqlReader["Detalles"].ToString();
                        p.Precio = Convert.ToDecimal(sqlReader["Precio"]);
                    }
                }


                sqlReader.Close();
            }
            catch (Exception ex)
            {
                /*Handle error*/
                Console.WriteLine(ex.GetType().FullName);
                Console.WriteLine(ex.Message);
            }


            finally
            {
                conn.Close();
            }

            return p; // devolver producto objeto


        }

        public List<Producto> GetPortatilesconObjectos()
        {
            List<Producto> listProductos = new List<Producto>();

            SqlConnection conn = new SqlConnection(connectionString);
            string queryString = "SELECT * FROM Productos";

            SqlCommand command = new SqlCommand(queryString, conn);
            conn.Open();

            try
            {
                SqlDataReader sqlReader = command.ExecuteReader();


                while (sqlReader.Read())
                {
                    Producto p = new Producto();
                    p.ProductoID = int.Parse(sqlReader["ProductoID"].ToString());
                    p.Nombre = sqlReader["Nombre"].ToString();
                    p.Detalles = sqlReader["Detalles"].ToString();
                    p.Precio = Convert.ToDecimal(sqlReader["Precio"]);
                    //p.Precio = sqlReader.GetDecimal(3); //"Precio"
                    //p.Precio = decimal.Parse(sqlReader["Precio"].ToString());  //"Precio"

                    listProductos.Add(p);
                }

                sqlReader.Close();
            }
            catch (Exception ex)
            {
                /*Handle error*/
                Console.WriteLine(ex.GetType().FullName);
                Console.WriteLine(ex.Message);
            }
        

            finally
            {
                conn.Close();
            }

            return listProductos;


        }


        public Producto GetProducto(int pID)
        {

            List<Producto> listProductos = this.GetProductos();

            Producto prod = listProductos.Find(p => p.ProductoID == pID); // LamDA expression
           
            return prod;
        }
    }
}