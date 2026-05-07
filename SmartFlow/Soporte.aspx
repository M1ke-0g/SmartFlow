<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Soporte.aspx.cs" Inherits="SmartFlow.Soporte" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Soporte</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>

<body>
<form id="form1" runat="server">

<!-- NAVBAR -->
<nav class="navbar navbar-dark bg-primary shadow mb-4">
<div class="container">
<a href="Default.aspx" class="navbar-brand fw-bold">SmartFlow</a>

<div>
<a href="Default.aspx" class="btn btn-light me-2">Inicio</a>
<a href="Usuarios.aspx" class="btn btn-light me-2">Usuarios</a>
<a href="Servicios.aspx" class="btn btn-light me-2">Servicios</a>
<a href="Ordenes.aspx" class="btn btn-light me-2">Órdenes</a>
<a href="Alertas.aspx" class="btn btn-light me-2">Alertas</a>
<a href="Monitoreo.aspx" class="btn btn-light me-2">Monitoreo</a>
<a href="Soporte.aspx" class="btn btn-light">Soporte</a>
</div>
</div>
</nav>

<!-- CONTENIDO -->
<div class="container mt-5">

<div class="text-center mb-4">
    <h2 class="fw-bold">Centro de Soporte Técnico</h2>
    <p class="text-muted">Soluciones rápidas, eficientes y sin drama para tus problemas</p>
</div>

<div class="row">

    <div class="col-md-4">
        <div class="card shadow p-4 text-center">
            <h5>Asistencia Remota</h5>
            <p>Diagnóstico y solución de problemas en tiempo real sin necesidad de desplazamientos.</p>
        </div>
    </div>

    <div class="col-md-4">
        <div class="card shadow p-4 text-center">
            <h5>Mantenimiento</h5>
            <p>Optimización del sistema para mejorar rendimiento y evitar fallos futuros.</p>
        </div>
    </div>

    <div class="col-md-4">
        <div class="card shadow p-4 text-center">
            <h5>Actualizaciones</h5>
            <p>Implementación de mejoras y nuevas funcionalidades para mantener el sistema al día.</p>
        </div>
    </div>

</div>

<hr class="my-5"/>

<div class="text-center">
    <h4>Contacto</h4>
    <p>Email: soporte@smartflow.com</p>
    <p>Teléfono: +57 300 000 0000</p>
</div>

</div>

</form>
</body>
</html>