using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Configuration;
using System.Data;
using Npgsql;
using NpgsqlTypes;


namespace OdooPostgresSQL.Controllers
{
    public class ProductosController : Controller
    {
        // GET: Productos
        public ActionResult Index()
        {
            string sContent;
            string connStr = ConfigurationManager.ConnectionStrings["OdooPostgres"].ConnectionString;

            NpgsqlConnection conn = new NpgsqlConnection(connStr);
            conn.Open();

            NpgsqlCommand cmd = new NpgsqlCommand();
            cmd.CommandText = "SELECT * FROM product_template;";
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;

            NpgsqlDataReader dr;
            dr = cmd.ExecuteReader();
            sContent = "OK";

            while (dr.Read()) { 
                sContent = sContent + dr["id"].ToString() + " " + dr["name"].ToString() + "<br>";
            }


            dr.Close();
            conn.Close();

            return Content(sContent);

            //return View();
        }
    }
}