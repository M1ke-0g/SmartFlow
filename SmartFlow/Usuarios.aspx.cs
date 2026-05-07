using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SmartFlow
{
    /// <summary>
    /// Página para gestionar usuarios del sistema
    /// Permite agregar nuevos usuarios y visualizar los existentes
    /// </summary>
    public partial class Usuarios : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarUsuarios();
            }
        }

        /// <summary>
        /// Carga la lista de usuarios desde la base de datos
        /// </summary>
        private void CargarUsuarios()
        {
            try
            {
                using (SqlConnection con = GetConnection())
                {
                    con.Open();
                    using (SqlDataAdapter da = new SqlDataAdapter("SELECT IdUsuario, Nombre, Email, FechaCreacion FROM Usuarios ORDER BY FechaCreacion DESC", con))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        gvUsuarios.DataSource = dt;
                        gvUsuarios.DataBind();
                    }
                }
            }
            catch (Exception ex)
            {
                MostrarAlerta("Error al cargar usuarios: " + ex.Message, "danger");
            }
        }

        /// <summary>
        /// Guarda un nuevo usuario en la base de datos
        /// </summary>
        protected void BtnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                // Validar campos
                if (string.IsNullOrWhiteSpace(txtNombre.Text))
                {
                    MostrarAlerta("El nombre es obligatorio", "warning");
                    return;
                }

                if (string.IsNullOrWhiteSpace(txtEmail.Text))
                {
                    MostrarAlerta("El email es obligatorio", "warning");
                    return;
                }

                if (txtClave.Text.Length < 6)
                {
                    MostrarAlerta("La contraseña debe tener al menos 6 caracteres", "warning");
                    return;
                }

                // Validar que el email sea único
                if (!EsEmailUnico(txtEmail.Text))
                {
                    MostrarAlerta("El email ya está registrado en el sistema", "warning");
                    return;
                }

                using (SqlConnection con = GetConnection())
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand(
                        "INSERT INTO Usuarios(Nombre, Email, Clave, FechaCreacion) VALUES(@n, @e, @c, GETDATE())", con))
                    {
                        cmd.Parameters.AddWithValue("@n", txtNombre.Text);
                        cmd.Parameters.AddWithValue("@e", txtEmail.Text);
                        cmd.Parameters.AddWithValue("@c", txtClave.Text);
                        cmd.ExecuteNonQuery();
                    }
                }

                MostrarAlerta("Usuario agregado exitosamente", "success");
                LimpiarControles();
                CargarUsuarios();
            }
            catch (Exception ex)
            {
                MostrarAlerta("Error al guardar usuario: " + ex.Message, "danger");
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
        protected void GvUsuarios_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvUsuarios.PageIndex = e.NewPageIndex;
            CargarUsuarios();
        }

        /// <summary>
        /// Verifica si un email ya existe en la base de datos
        /// </summary>
        private bool EsEmailUnico(string email)
        {
            try
            {
                using (SqlConnection con = GetConnection())
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM Usuarios WHERE Email = @e", con))
                    {
                        cmd.Parameters.AddWithValue("@e", email);
                        int count = (int)cmd.ExecuteScalar();
                        return count == 0;
                    }
                }
            }
            catch
            {
                return false;
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
        /// Limpia los campos del formulario
        /// </summary>
        private void LimpiarControles()
        {
            txtNombre.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtClave.Text = string.Empty;
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
