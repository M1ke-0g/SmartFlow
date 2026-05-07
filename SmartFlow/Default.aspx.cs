using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace SmartFlow
{
    /// <summary>
    /// Página de inicio (Dashboard) de SmartFlow
    /// Muestra estadísticas generales del sistema
    /// </summary>
    public partial class Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarEstadisticas();
            }
        }

        /// <summary>
        /// Carga las estadísticas generales del sistema
        /// </summary>
        private void CargarEstadisticas()
        {
            try
            {
                using (SqlConnection con = GetConnection())
                {
                    con.Open();

                    // Obtener total de usuarios
                    using (SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM Usuarios", con))
                    {
                        lblTotalUsuarios.Text = cmd.ExecuteScalar().ToString();
                    }

                    // Obtener total de órdenes
                    using (SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM Ordenes", con))
                    {
                        lblTotalOrdenes.Text = cmd.ExecuteScalar().ToString();
                    }

                    // Obtener total de servicios
                    using (SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM Servicios", con))
                    {
                        lblTotalServicios.Text = cmd.ExecuteScalar().ToString();
                    }

                    // Obtener total de ventas
                    using (SqlCommand cmd = new SqlCommand("SELECT ISNULL(SUM(Total), 0) FROM Ordenes", con))
                    {
                        decimal totalVentas = Convert.ToDecimal(cmd.ExecuteScalar());
                        lblTotalVentas.Text = "$" + totalVentas.ToString("0.00");
                    }
                }
            }
            catch (Exception ex)
            {
                // Mostrar alerta de error
                MostrarAlerta("Error al cargar estadísticas: " + ex.Message, "danger");
            }
        }

        /// <summary>
        /// Obtiene la conexión a la base de datos desde Web.config
        /// </summary>
        private SqlConnection GetConnection()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["conexionDB"]?.ConnectionString;
            if (string.IsNullOrEmpty(connectionString))
            {
                throw new Exception("Cadena de conexión 'conexionDB' no encontrada en Web.config");
            }
            return new SqlConnection(connectionString);
        }

        /// <summary>
        /// Muestra una alerta en la página
        /// </summary>
        private void MostrarAlerta(string mensaje, string tipo = "info")
        {
            string html = $@"<div class='alert alert-{tipo} alert-dismissible fade show' role='alert'>
                                <i class='fas fa-exclamation-circle'></i> {mensaje}
                                <button type='button' class='btn-close' data-bs-dismiss='alert' aria-label='Close'></button>
                            </div>";
            alertContainer.InnerHtml = html;
        }
    }
}
