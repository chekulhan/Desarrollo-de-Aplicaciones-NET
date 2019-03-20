using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Configuration;
using Npgsql;
using NpgsqlTypes;
using OdooPostgresSQL.Models;

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



        public ActionResult IndexconModelo()
        {

            string connStr = ConfigurationManager.ConnectionStrings["OdooPostgres"].ConnectionString;

            List<Producto> productos = new List<Producto>();

            NpgsqlConnection conn = new NpgsqlConnection(connStr);
            conn.Open();

            NpgsqlCommand cmd = new NpgsqlCommand();
            cmd.CommandText = "SELECT * FROM product_template;";
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;

            NpgsqlDataReader dr;
            dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                Producto p = new Producto();
                p.ID = dr["id"];
                p.Name = dr["name"].ToString();

                productos.Add(p);
                
            }


            dr.Close();
            conn.Close();

            

            return View(productos);
        }
    }
}