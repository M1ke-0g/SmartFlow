using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SmartFlow
{
    /// <summary>
    /// Página para gestionar servicios de la empresa
    /// Permite crear nuevos servicios con nombre y precio
    /// </summary>
    public partial class Servicios : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarServicios();
            }
        }

        /// <summary>
        /// Carga la lista de servicios desde la base de datos
        /// </summary>
        private void CargarServicios()
        {
            try
            {
                using (SqlConnection con = GetConnection())
                {
                    con.Open();
                    using (SqlDataAdapter da = new SqlDataAdapter("SELECT IdServicio, Nombre, Precio, FechaCreacion FROM Servicios ORDER BY FechaCreacion DESC", con))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        gvServicios.DataSource = dt;
                        gvServicios.DataBind();
                    }
                }
            }
            catch (Exception ex)
            {
                MostrarAlerta("Error al cargar servicios: " + ex.Message, "danger");
            }
        }

        /// <summary>
        /// Guarda un nuevo servicio en la base de datos
        /// </summary>
        protected void BtnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                // Validar campos
                if (string.IsNullOrWhiteSpace(txtNombre.Text))
                {
                    MostrarAlerta("El nombre del servicio es obligatorio", "warning");
                    return;
                }

                if (string.IsNullOrWhiteSpace(txtPrecio.Text))
                {
                    MostrarAlerta("El precio es obligatorio", "warning");
                    return;
                }

                if (!decimal.TryParse(txtPrecio.Text, out decimal precio) || precio < 0)
                {
                    MostrarAlerta("Ingrese un precio válido (mayor a 0)", "warning");
                    return;
                }

                using (SqlConnection con = GetConnection())
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand(
                        "INSERT INTO Servicios(Nombre, Precio, FechaCreacion) VALUES(@n, @p, GETDATE())", con))
                    {
                        cmd.Parameters.AddWithValue("@n", txtNombre.Text);
                        cmd.Parameters.AddWithValue("@p", precio);
                        cmd.ExecuteNonQuery();
                    }
                }

                MostrarAlerta("Servicio agregado exitosamente", "success");
                LimpiarControles();
                CargarServicios();
            }
            catch (Exception ex)
            {
                MostrarAlerta("Error al guardar servicio: " + ex.Message, "danger");
            }
        }

        /// <summary>
        /// Limpia los controles del formulario
        /// </summary>
        protected void BtnLimpiar_Click(object sender, EventArgs e)
        {
            LimpiarControles();
        }

        /// <summary>
        /// Maneja el cambio de página del GridView
        /// </summary>
        protected void GvServicios_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvServicios.PageIndex = e.NewPageIndex;
            CargarServicios();
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
        /// Limpia los campos del formulario
        /// </summary>
        private void LimpiarControles()
        {
            txtNombre.Text = string.Empty;
            txtPrecio.Text = string.Empty;
            txtNombre.Focus();
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
