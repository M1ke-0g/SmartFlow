<%@ Page Title="Monitoreo - SmartFlow" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Monitoreo.aspx.cs" Inherits="SmartFlow.Monitoreo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5">
        <h1 class="mb-4">
            <i class="fas fa-tachometer-alt" style="color: #0d6efd;"></i> Monitoreo en Tiempo Real
        </h1>

        <!-- Introducción -->
        <div class="row mb-5">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <i class="fas fa-info-circle"></i> Supervisión del Sistema
                    </div>
                    <div class="card-body">
                        <p class="lead">SmartFlow proporciona herramientas avanzadas de monitoreo para supervisar el rendimiento y la salud de tu sistema en tiempo real.</p>
                        <p>Mantén control total sobre tus operaciones con un panel de control intuitivo que te permite:</p>
                        <ul>
                            <li><strong>Monitorear Rendimiento:</strong> Seguimiento en vivo de la velocidad del sistema</li>
                            <li><strong>Gestionar Recursos:</strong> Control del uso de CPU, memoria y almacenamiento</li>
                            <li><strong>Análisis de Base de Datos:</strong> Monitoreo de queries lentas y índices</li>
                            <li><strong>Seguridad:</strong> Detección de intentos de acceso no autorizados</li>
                            <li><strong>Disponibilidad:</strong> Verificación continua del uptime del sistema</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <!-- Métricas del Sistema -->
        <div class="row mb-5">
            <div class="col-md-6 mb-3">
                <div class="card">
                    <div class="card-header">
                        <i class="fas fa-server"></i> Estado del Servidor
                    </div>
                    <div class="card-body">
                        <p><strong>Estado:</strong> <span class="badge bg-success">En Línea</span></p>
                        <p><strong>Uptime:</strong> 47 días, 3 horas, 25 minutos</p>
                        <p><strong>CPU Utilizado:</strong> <span class="badge bg-info">34%</span></p>
                        <p><strong>Memoria Disponible:</strong> <span class="badge bg-warning">2.8 GB / 8 GB</span></p>
                    </div>
                </div>
            </div>
            <div class="col-md-6 mb-3">
                <div class="card">
                    <div class="card-header">
                        <i class="fas fa-database"></i> Base de Datos
                    </div>
                    <div class="card-body">
                        <p><strong>Estado:</strong> <span class="badge bg-success">Conectada</span></p>
                        <p><strong>Tamaño:</strong> 245 MB</p>
                        <p><strong>Conexiones Activas:</strong> <span class="badge bg-info">12</span></p>
                        <p><strong>Último Respaldo:</strong> Hoy a las 03:00 AM</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Gráficos y Análisis -->
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <i class="fas fa-chart-line"></i> Análisis de Rendimiento
                    </div>
                    <div class="card-body">
                        <div class="alert alert-info" role="alert">
                            <i class="fas fa-lightbulb"></i> <strong>Consejo:</strong> La aplicación está funcionando en óptimas condiciones. No se han detectado problemas críticos en las últimas 24 horas.
                        </div>
                        <p><strong>Últimas 24 horas:</strong></p>
                        <ul>
                            <li>Total de Solicitudes Procesadas: 15,847</li>
                            <li>Tiempo Promedio de Respuesta: 245 ms</li>
                            <li>Errores Registrados: 3 (0.02%)</li>
                            <li>Transacciones Completadas: 14,156</li>
                            <li>Datos Transferidos: 847 MB</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <!-- Alertas Activas -->
        <div class="row mt-5">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <i class="fas fa-exclamation-circle"></i> Alertas y Avisos
                    </div>
                    <div class="card-body">
                        <div class="alert alert-warning alert-dismissible fade show" role="alert">
                            <i class="fas fa-warning"></i> <strong>Advertencia:</strong> El respaldo de base de datos está programado para mañana a las 03:00 AM. Esto puede afectar el rendimiento durante 15-20 minutos.
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                        <p><em>No hay alertas críticas activas en este momento.</em></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>