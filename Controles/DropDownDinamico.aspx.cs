using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class LoadDropDown : System.Web.UI.Page
    {

        string[] basededatos = { "MS Access", "SQL Server", "MySQL" };

        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!Page.IsPostBack)
            {
                //3. data bind con dictionary - con Key/Value
                Dictionary<int, string> dictBasedeDatos = new Dictionary<int,string>();
                dictBasedeDatos.Add(0, "Seleccionar");
                dictBasedeDatos.Add(1, "MS Access");
                dictBasedeDatos.Add(2, "SQL Server");
                dictBasedeDatos.Add(3, "MySQL");

                ddlBasedeDatos1.DataValueField = "Key";
                ddlBasedeDatos1.DataTextField = "Value";
                ddlBasedeDatos1.DataSource = dictBasedeDatos;

                ddlBasedeDatos1.DataBind();

            }
            else
            {
                Response.Write("Postback");
 
            }
            

        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            lblResultado.Text = ddlBasedeDatos1.SelectedValue.ToString() + ": " +
                ddlBasedeDatos1.SelectedItem.ToString();
        }

        protected void ddlBasedeDatos1_SelectedIndexChanged(object sender, EventArgs e)
        {

            if (ddlBasedeDatos1.SelectedItem.Value.ToString() == "1") // Access
            {
                Dictionary<int, string> dictAccess = new Dictionary<int, string>();
                dictAccess.Add(1, "Tablas");
                dictAccess.Add(2, "Formularios");
                dictAccess.Add(3, "Informes");
                dictAccess.Add(4, "Modulos");

                ddlBasedeDatos2.DataValueField = "Key";
                ddlBasedeDatos2.DataTextField = "Value";
                ddlBasedeDatos2.DataSource = dictAccess;
                ddlBasedeDatos2.DataBind();
            }
            else
            { Response.Write("Implementar para SQL"); }


        }
    }
}