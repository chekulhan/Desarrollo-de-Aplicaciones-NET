using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Collections;
using System.Data;
using System.Data.SqlClient;

namespace WebApplication1.BLL
{
    public class ProductosMger
    {


        public List<Producto> getProductos()
        {
            List<Producto> l = new List<Producto>();


            //// PASO 1: Siempre esta buien añadir productos a mano, para comprobar que funciona
            //// Luego, añadir acceso a BD

            //Producto p1 = new Producto();
            //p1.ProductID = 1;
            //p1.Descripcion = "Java";
            //p1.Precio = 5;

            //l.Add(p1);

            //Producto p2 = new Producto();
            //p2.ProductID = 1;
            //p2.Descripcion = "ASP.NET";
            //p2.Precio = 2;

            //l.Add(p2);


            // PASO 2: Acceso a la base de datos
            string connectionString = @"Data Source = 192.XXXX\YYYYY; Initial Catalog = XXXXDB; User ID = sa; Password = XXXXXXX";
            SqlConnection connection = new SqlConnection(connectionString);

            try
            {

                connection.Open();
                SqlCommand command = new SqlCommand("SELECT * FROM Productos", connection);
                SqlDataReader reader = command.ExecuteReader();


                while (reader.Read()){
                    Producto p = new Producto();

                    p.ProductID = (int)reader["ProductoID"];
                    p.Descripcion = (string)reader["Descripcion"];
                    p.Precio = (decimal)reader["Precio"];

                    l.Add(p);
                }

                reader.Close();

            }
            catch (Exception)
            {
                /*Handle error*/
            }

            finally
            {
                connection.Close();
            }

            

            return l;

        }
    }
}