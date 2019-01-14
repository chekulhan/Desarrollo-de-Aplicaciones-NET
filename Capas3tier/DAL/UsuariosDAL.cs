using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;


namespace WebApplication1
{

    public class UsuarioDAL
    {

        private string connectionString = @"Data Source = XXXXXXX";

        public UsuarioDAL()
        {
            

        }

        

        public int AddUsuarios(Usuarios oUsuario)
        {
            int iResult = -1;

            SqlConnection connection = new SqlConnection(connectionString);

            try
            {

                connection.Open();

                SqlCommand cmd = new SqlCommand("usp_AddUsuario", connection);
                cmd.CommandType = CommandType.StoredProcedure;
              

                
                cmd.Parameters.AddWithValue("@NombredeUsuario", oUsuario.NombredeUsuario.ToString());
                cmd.Parameters.AddWithValue("@Direccion", oUsuario.Direccion.ToString());
                cmd.Parameters.AddWithValue("@Movil", oUsuario.Movil.ToString());
                cmd.Parameters.AddWithValue("@Email", oUsuario.Email.ToString());
                

                SqlParameter parameter = new SqlParameter();
                parameter.ParameterName = "@ID";
                parameter.SqlDbType = SqlDbType.Int;
                parameter.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(parameter);

                

                

                if (connection.State == ConnectionState.Closed)
                {
                    connection.Open();
                }
                
                cmd.ExecuteNonQuery();
                iResult = (int)parameter.Value;

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

            return iResult;
        }

        public DataSet getUsuariosDAL()
        {
            

           
            DataSet dsUsuarios = new DataSet();
            SqlConnection connection = new SqlConnection(connectionString);
           
            try
            {

                if (connection.State == ConnectionState.Closed)
                {
                    connection.Open();
                }

                SqlDataAdapter adapter = new SqlDataAdapter("SELECT * FROM Usuarios", connection);

                
                adapter.Fill(dsUsuarios, "Usuarios");
                
                
            }
            catch (Exception)
            {
                /*Handle error*/
            }

            finally
            {
                connection.Close();
            }

            return dsUsuarios;
           

        }
    }

    
}