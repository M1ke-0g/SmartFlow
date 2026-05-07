<%@ Page Title="Inicio - SmartFlow" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SmartFlow.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5">
        <!-- Encabezado -->
        <div class="mb-5">
            <h1 class="display-4 fw-bold mb-2">
                <i class="fas fa-chart-line" style="color: #0d6efd;"></i> Bienvenido a SmartFlow
            </h1>
            <p class="lead text-muted">Sistema de gestión integral para tu negocio</p>
        </div>

        <!-- Alertas -->
        <div id="alertContainer" runat="server">
        </div>

        <!-- Estadísticas -->
        <div class="row mb-5">
            <div class="col-md-3 mb-3">
                <div class="stat-card">
                    <i class="fas fa-users"></i>
                    <h3>
                        <asp:Label ID="lblTotalUsuarios" runat="server" Text="0"></asp:Label>
                    </h3>
                    <p>Usuarios Registrados</p>
                </div>
            </div>
            <div class="col-md-3 mb-3">
                <div class="stat-card" style="background: linear-gradient(135deg, #198754 0%, #157347 100%);">
                    <i class="fas fa-shopping-cart"></i>
                    <h3>
                        <asp:Label ID="lblTotalOrdenes" runat="server" Text="0"></asp:Label>
                    </h3>
                    <p>Órdenes Registradas</p>
                </div>
            </div>
            <div class="col-md-3 mb-3">
                <div class="stat-card" style="background: linear-gradient(135deg, #dc3545 0%, #bd2130 100%);">
                    <i class="fas fa-cog"></i>
                    <h3>
                        <asp:Label ID="lblTotalServicios" runat="server" Text="0"></asp:Label>
                    </h3>
                    <p>Servicios Disponibles</p>
                </div>
            </div>
            <div class="col-md-3 mb-3">
                <div class="stat-card" style="background: linear-gradient(135deg, #0dcaf0 0%, #0aa8d8 100%);">
                    <i class="fas fa-dollar-sign"></i>
                    <h3>
                        <asp:Label ID="lblTotalVentas" runat="server" Text="$0.00"></asp:Label>
                    </h3>
                    <p>Total en Ventas</p>
                </div>
            </div>
        </div>

        <!-- Tarjetas de Acceso Rápido -->
        <div class="row mb-5">
            <div class="col-md-6 mb-3">
                <div class="card h-100">
                    <div class="card-header">
                        <i class="fas fa-users"></i> Gestión de Usuarios
                    </div>
                    <div class="card-body">
                        <p class="card-text">Administra los usuarios del sistema, agrega nuevos usuarios y gestiona sus permisos.</p>
                        <a href="Usuarios.aspx" class="btn btn-primary">
                            <i class="fas fa-arrow-right"></i> Ir a Usuarios
                        </a>
                    </div>
                </div>
            </div>
            <div class="col-md-6 mb-3">
                <div class="card h-100">
                    <div class="card-header">
                        <i class="fas fa-clipboard-list"></i> Gestión de Órdenes
                    </div>
                    <div class="card-body">
                        <p class="card-text">Crea nuevas órdenes y genera facturas automáticas para tus clientes.</p>
                        <a href="Ordenes.aspx" class="btn btn-primary">
                            <i class="fas fa-arrow-right"></i> Ir a Órdenes
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-6 mb-3">
                <div class="card h-100">
                    <div class="card-header">
                        <i class="fas fa-cog"></i> Gestión de Servicios
                    </div>
                    <div class="card-body">
                        <p class="card-text">Define los servicios que ofrece tu empresa con sus precios.</p>
                        <a href="Servicios.aspx" class="btn btn-primary">
                            <i class="fas fa-arrow-right"></i> Ir a Servicios
                        </a>
                    </div>
                </div>
            </div>
            <div class="col-md-6 mb-3">
                <div class="card h-100">
                    <div class="card-header">
                        <i class="fas fa-tachometer-alt"></i> Monitoreo
                    </div>
                    <div class="card-body">
                        <p class="card-text">Supervisa el estado del sistema y el rendimiento en tiempo real.</p>
                        <a href="Monitoreo.aspx" class="btn btn-primary">
                            <i class="fas fa-arrow-right"></i> Ir a Monitoreo
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Información adicional -->
        <div class="row mt-5">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <i class="fas fa-info-circle"></i> Acerca de SmartFlow
                    </div>
                    <div class="card-body">
                        <p>SmartFlow es una solución completa de gestión empresarial diseñada para optimizar tus procesos de negocio. Con una interfaz moderna y funcionalidades robustas, podrás administrar usuarios, servicios, órdenes y facturas de manera eficiente.</p>
                        <p class="mb-0"><strong>Versión:</strong> 1.0 | <strong>Última actualización:</strong> 2024</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>