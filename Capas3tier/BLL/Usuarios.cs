using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;


namespace WebApplication1
{

    public class Usuarios
    {
        public string NombredeUsuario { get; set; }
        public string Direccion { get; set; }
        public string Movil { get; set; }
        public string Email { get; set; }

        public Usuarios()
        {
            NombredeUsuario = "";
            Direccion = "";
            Movil = "";
            Email = "";
        }

        public int SaveUsuario()
        {
            UsuarioDAL uDAL = new UsuarioDAL();

            return uDAL.AddUsuarios(this);
        }

        public DataSet GetUsuarios()
        {
            UsuarioDAL uDAL = new UsuarioDAL();

            return uDAL.getUsuariosDAL();
        }

    }

    
}