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
            //1. con la herramienta de diseño, pero no es dinamico

            //2. cargar valores dinamicamente de array - falta Key/Value par
            ddlBasedeDatos1.DataSource = basededatos;
            ddlBasedeDatos1.DataBind();

            if (!Page.IsPostBack)
            {
                //3. data bind con dictionary - con Key/Value
                Dictionary<int, string> dictBasedeDatos = new Dictionary<int,string>();
                dictBasedeDatos.Add(1, "MS Access");
                dictBasedeDatos.Add(2, "SQL Server");
                dictBasedeDatos.Add(3, "MySQL");

                ddlBasedeDatos2.DataValueField = "Key";
                ddlBasedeDatos2.DataTextField = "Value";
                ddlBasedeDatos2.DataSource = dictBasedeDatos;

                ddlBasedeDatos2.DataBind();

            }
            else
            {
                Response.Write("Postback");

            }
            

        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            lblResultado.Text = ddlBasedeDatos2.SelectedValue.ToString() + ": " +
                ddlBasedeDatos2.SelectedItem.ToString();
        }
    }
}