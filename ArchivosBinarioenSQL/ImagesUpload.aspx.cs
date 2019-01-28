using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;


namespace WebApplication1
{
    public partial class ImagesUpload : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {

            // PASO 1: Subir archivos al directorio 
            if (FileUpload1.HasFile)
            {
                Response.Write("ya tenemos archivo...");
                Response.Write(FileUpload1.PostedFile.FileName);
                Response.Write(FileUpload1.PostedFile.ContentType);

                string sPath = @"C:\Users\che\Documents\Temp\"; // donde lo guardamos : ruta del servidor de archivos o Server.MapPath("~/temp/"); 

                string sfileName = FileUpload1.FileName;

                sPath += sfileName; // donde lo vamos a guardar

                Response.Write(sPath);

                FileUpload1.SaveAs(sPath); // GUARDAR
            }



            // PASO 2: Guardar nombre de RUTA al BD
            // Lo mismo que PASO 1, pero guardando nombre de ruta en tabla de BD

            // PASO 3:  Subir archivo a BD
            //if (FileUpload1.HasFile)
            //{
            //    Response.Write("ya tenemos archivo...");
            //    Response.Write(FileUpload1.PostedFile.FileName);
            //    Response.Write(FileUpload1.PostedFile.ContentLength);

            //    Response.Write("Input stream longitud: " + FileUpload1.PostedFile.InputStream.Length);

            //    int iLength = (int)FileUpload1.PostedFile.InputStream.Length; // obtener longitud de archivo

            //    byte[] archivo = new byte[iLength]; // alacenar archivo en byte array

            //    FileUpload1.PostedFile.InputStream.Read(archivo, 0, iLength); // leer el archivo y asignarlo al byte array


            //    // Se insertan los valores en la base de datos
            //    String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["SQLConnectStringCheDB"].ConnectionString;
            //    SqlConnection cnx = new SqlConnection(strConnString);
            //    try
            //    {
            //        cnx.Open();
            //        SqlCommand cmd = cnx.CreateCommand();
            //        cmd.CommandText = "INSERT INTO fotos (foto) VALUES (@imagen)";
            //        cmd.Parameters.AddWithValue("@imagen", archivo);
            //        cmd.ExecuteNonQuery();
            //    }
            //    catch (Exception ex)
            //    {
            //        Response.Write("Error");
            //        throw ex;
            //    }
            //    finally
            //    {

            //        cnx.Close();

            //    }

            //}



        }

        protected void btnMostrar_Click(object sender, EventArgs e)
        {
            // PASO 4:  Leer archivo a BD y mostrarlo en la página web

            byte[] archivo;

            // Conseguir file de BD con archivo varbinarymax
            String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["SQLConnectStringCheDB"].ConnectionString;
            SqlConnection cnx = new SqlConnection(strConnString);
            SqlDataReader rsReader;

            try
            {
                cnx.Open();
                SqlCommand cmd = cnx.CreateCommand();
                cmd.CommandText = "SELECT * FROM Fotos WHERE FotoID = 1";

                rsReader = cmd.ExecuteReader();


                if (rsReader.HasRows)
                {
                    rsReader.Read();


                    archivo = (byte[])rsReader["Foto"];

                    // Mostrar datos binarios en página web
                    Response.BinaryWrite(archivo);
                    // o Mostrar datos en un control de Imagen <img>
                    string base64String = Convert.ToBase64String(archivo, 0, archivo.Length);
                    Image1.ImageUrl = "data:image/jpg;base64," + base64String;
             
                    
                    
                }

            }
            catch (Exception ex)
            {
                Response.Write("Error");
                throw ex;
            }
            finally
            {

                cnx.Close();

            }
        }

        protected void btnMostrarenGrid_Click(object sender, EventArgs e)
        {
            // PASO 4:  Leer archivo a BD y mostrarlo en GRID

            byte[] archivo;

            // Conseguir file de BD con archivo varbinarymax
            String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["SQLConnectStringCheDB"].ConnectionString;
            SqlConnection cnx = new SqlConnection(strConnString);
            DataSet dsData;

            try
            {
                cnx.Open();
                SqlCommand cmd = cnx.CreateCommand();
                cmd.CommandText = "SELECT * FROM Fotos";

                SqlDataAdapter sqlDA = new SqlDataAdapter(cmd);
                dsData = new DataSet("Productos");
                sqlDA.Fill(dsData);

                GridView1.DataSource = dsData;
                GridView1.DataBind();

            }
            catch (Exception ex)
            {
                Response.Write("Error");
                throw ex;
            }
            finally
            {

                cnx.Close();

            }
        }
    }
}