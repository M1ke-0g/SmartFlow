<%@ Page Title="Alertas - SmartFlow" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Alertas.aspx.cs" Inherits="SmartFlow.Alertas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5">
        <h1 class="mb-4">
            <i class="fas fa-bell" style="color: #0d6efd;"></i> Sistema de Alertas Inteligentes
        </h1>

        <!-- Introducción -->
        <div class="row mb-5">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <i class="fas fa-info-circle"></i> Descripción General
                    </div>
                    <div class="card-body">
                        <p class="lead">El Sistema de Alertas Inteligentes de SmartFlow proporciona notificaciones en tiempo real sobre eventos críticos de tu negocio.</p>
                        <p>Con monitoreo continuo, recibirás alertas inmediatas sobre:</p>
                        <ul>
                            <li><strong>Órdenes Importantes:</strong> Cuando se registren órdenes de alto valor</li>
                            <li><strong>Nuevos Usuarios:</strong> Notificaciones de registros de usuarios</li>
                            <li><strong>Servicios Críticos:</strong> Cambios en la disponibilidad de servicios</li>
                            <li><strong>Anomalías del Sistema:</strong> Detección de comportamientos anómalos</li>
                            <li><strong>Facturación Pendiente:</strong> Recordatorio de pagos no procesados</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <!-- Características -->
        <div class="row mb-5">
            <div class="col-md-4 mb-3">
                <div class="card h-100">
                    <div class="card-header">
                        <i class="fas fa-lightning-bolt" style="color: #ffc107;"></i> Alertas en Tiempo Real
                    </div>
                    <div class="card-body">
                        <p>Recibe notificaciones instantáneas sobre eventos críticos. No te pierdas ninguna oportunidad de negocio.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 mb-3">
                <div class="card h-100">
                    <div class="card-header">
                        <i class="fas fa-sliders-h" style="color: #17a2b8;"></i> Alertas Personalizables
                    </div>
                    <div class="card-body">
                        <p>Configura tus propias reglas de alertas según las necesidades específicas de tu negocio.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 mb-3">
                <div class="card h-100">
                    <div class="card-header">
                        <i class="fas fa-history" style="color: #28a745;"></i> Historial Completo
                    </div>
                    <div class="card-body">
                        <p>Acceso a todo el historial de alertas para auditoría y análisis posterior de eventos.</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Ejemplos de Alertas -->
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <i class="fas fa-exclamation-triangle"></i> Tipos de Alertas Disponibles
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-striped">
                                <thead class="table-light">
                                    <tr>
                                        <th>Tipo de Alerta</th>
                                        <th>Descripción</th>
                                        <th>Severidad</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><i class="fas fa-shopping-cart"></i> Orden Registrada</td>
                                        <td>Se genera cuando se registra una nueva orden en el sistema</td>
                                        <td><span class="badge bg-info">Información</span></td>
                                    </tr>
                                    <tr>
                                        <td><i class="fas fa-user-plus"></i> Usuario Nuevo</td>
                                        <td>Notificación de registro de nuevo usuario</td>
                                        <td><span class="badge bg-success">Baja</span></td>
                                    </tr>
                                    <tr>
                                        <td><i class="fas fa-dollar-sign"></i> Venta Importante</td>
                                        <td>Cuando el monto de orden supera cierto umbral</td>
                                        <td><span class="badge bg-warning">Media</span></td>
                                    </tr>
                                    <tr>
                                        <td><i class="fas fa-exclamation-circle"></i> Error del Sistema</td>
                                        <td>Se detecta un error crítico en el procesamiento</td>
                                        <td><span class="badge bg-danger">Alta</span></td>
                                    </tr>
                                    <tr>
                                        <td><i class="fas fa-database"></i> Respaldo de Base de Datos</td>
                                        <td>Notificación de respaldo completado exitosamente</td>
                                        <td><span class="badge bg-success">Baja</span></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>