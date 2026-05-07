using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SmartFlow
{
    /// <summary>
    /// Página para gestionar órdenes de clientes
    /// Permite crear órdenes y genera facturas automáticamente
    /// </summary>
    public partial class Ordenes : Page
    {
        private SqlConnection con;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarUsuarios();
                CargarOrdenes();
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
        /// Registra una nueva orden y genera su factura automáticamente
        /// </summary>
        protected void BtnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                decimal total;

                if (!decimal.TryParse(txtTotal.Text, out total))
                {
                    MostrarAlerta("Por favor ingrese un número válido en el total", "warning");
                    return;
                }

                if (total <= 0)
                {
                    MostrarAlerta("El total debe ser mayor a cero", "warning");
                    return;
                }

                if (string.IsNullOrEmpty(ddlUsuarios.SelectedValue))
                {
                    MostrarAlerta("Por favor seleccione un usuario", "warning");
                    return;
                }

                using (con = GetConnection())
                {
                    con.Open();

                    // Insertar orden
                    using (SqlCommand cmd = new SqlCommand(
                        "INSERT INTO Ordenes(IdUsuario, Total, FechaCreacion) VALUES(@u, @t, GETDATE()); SELECT SCOPE_IDENTITY();", con))
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Parameters.AddWithValue("@u", int.Parse(ddlUsuarios.SelectedValue));
                        cmd.Parameters.AddWithValue("@t", total);

                        int idOrden = Convert.ToInt32(cmd.ExecuteScalar());

                        // Insertar facturación asociada
                        using (SqlCommand fact = new SqlCommand(
                            "INSERT INTO Facturacion(IdOrden, Total, FechaCreacion) VALUES(@o, @t, GETDATE())", con))
                        {
                            fact.CommandType = CommandType.Text;
                            fact.Parameters.AddWithValue("@o", idOrden);
                            fact.Parameters.AddWithValue("@t", total);
                            fact.ExecuteNonQuery();
                        }
                    }
                }

                MostrarAlerta("Orden registrada correctamente (Factura generada automáticamente)", "success");
                LimpiarControles();
                CargarOrdenes();
            }
            catch (Exception ex)
            {
                MostrarAlerta("Error: " + ex.Message, "danger");
            }
        }

        /// <summary>
        /// Carga los usuarios disponibles en el dropdown
        /// </summary>
        private void CargarUsuarios()
        {
            try
            {
                using (con = GetConnection())
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand("SELECT IdUsuario, Nombre FROM Usuarios ORDER BY Nombre", con))
                    {
                        cmd.CommandType = CommandType.Text;
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            ddlUsuarios.DataSource = reader;
                            ddlUsuarios.DataTextField = "Nombre";
                            ddlUsuarios.DataValueField = "IdUsuario";
                            ddlUsuarios.DataBind();
                        }
                    }
                }
                ddlUsuarios.Items.Insert(0, new ListItem("-- Seleccionar usuario --", ""));
            }
            catch (Exception ex)
            {
                MostrarAlerta("Error al cargar usuarios: " + ex.Message, "danger");
            }
        }

        /// <summary>
        /// Carga la lista de órdenes registradas
        /// </summary>
        private void CargarOrdenes()
        {
            try
            {
                using (con = GetConnection())
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand(
                        "SELECT o.IdOrden, u.Nombre, o.Total, o.FechaCreacion FROM Ordenes o " +
                        "JOIN Usuarios u ON o.IdUsuario = u.IdUsuario ORDER BY o.FechaCreacion DESC", con))
                    {
                        cmd.CommandType = CommandType.Text;
                        using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            adapter.Fill(dt);
                            gvOrdenes.DataSource = dt;
                            gvOrdenes.DataBind();
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                MostrarAlerta("Error al cargar órdenes: " + ex.Message, "danger");
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
        protected void GvOrdenes_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvOrdenes.PageIndex = e.NewPageIndex;
            CargarOrdenes();
        }

        /// <summary>
        /// Limpia los campos del formulario
        /// </summary>
        private void LimpiarControles()
        {
            txtTotal.Text = string.Empty;
            ddlUsuarios.SelectedIndex = 0;
            txtTotal.Focus();
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
