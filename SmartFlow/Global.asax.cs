using System;
using System.Web;
using System.Web.Routing;
using System.Web.SessionState;

namespace SmartFlow
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Configuración inicial de rutas
            RouteConfig.RegisterRoutes(RouteTable.Routes);
        }
    }
}