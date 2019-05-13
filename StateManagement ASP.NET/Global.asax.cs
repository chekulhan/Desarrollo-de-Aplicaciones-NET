using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace GestiondeEstado
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Código que se ejecuta al iniciar la aplicación
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);

            Application["AppMsg"] = "Nombre de la applicación";

            //Actividad Contar Usuarios:
            // Añadir TimeOut a 1 (1 minuto) al webconfig de cada session o a traves de codigo en Session_Start
            // <sessionState  mode="InProc"  cookieless="true" timeout="1" />
            Application["users"] = 0;

        }

        void Session_Start(object sender, EventArgs e)
        {

            //Actividad Contar Usuarios: 
            // Añadir TimeOut a 1 (1 minuto) al webconfig de cada session o a traves de codigo en Session_Start
            // <sessionState  mode="InProc"  cookieless="true" timeout="1" />
            Session.Timeout = 1;

            //when session in start application variable is increased by 1  
            Application.Lock();
            Application["users"] = (int)Application["users"] + 1;
            Application.UnLock();
        }

        void Session_End(object sender, EventArgs e)
        {
            ////Actividad Contar Usuarios:  when session in start application variable is increased by 1  
            Application.Lock();
            Application["users"] = (int)Application["users"] - 1;
            Application.UnLock();
        }
    }
}