<%@ Page Title="Usuarios - SmartFlow" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="SmartFlow.Usuarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5">
        <h1 class="mb-4">
            <i class="fas fa-users" style="color: #0d6efd;"></i> Gestión de Usuarios
        </h1>

        <!-- Alertas -->
        <div id="alertContainer" runat="server"></div>

        <!-- Formulario -->
        <div class="row mb-5">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header">
                        <i class="fas fa-user-plus"></i> Agregar Nuevo Usuario
                    </div>
                    <div class="card-body">
                        <div class="mb-3">
                            <label for="txtNombre" class="form-label">Nombre:</label>
                            <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" placeholder="Juan Pérez"></asp:TextBox>
                        </div>
                        <div class="mb-3">
                            <label for="txtEmail" class="form-label">Email:</label>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" placeholder="juan@example.com"></asp:TextBox>
                        </div>
                        <div class="mb-3">
                            <label for="txtClave" class="form-label">Contraseña:</label>
                            <asp:TextBox ID="txtClave" runat="server" CssClass="form-control" TextMode="Password" placeholder="Ingrese contraseña"></asp:TextBox>
                        </div>
                        <div class="d-grid gap-2">
                            <asp:Button ID="btnGuardar" runat="server" Text="Guardar Usuario" CssClass="btn btn-primary" OnClick="BtnGuardar_Click" />
                            <asp:Button ID="btnLimpiar" runat="server" Text="Limpiar" CssClass="btn btn-secondary" OnClick="BtnLimpiar_Click" CausesValidation="false" />
                        </div>
                    </div>
                </div>
            </div>

            <!-- Información -->
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header">
                        <i class="fas fa-info-circle"></i> Información
                    </div>
                    <div class="card-body">
                        <ul class="list-unstyled">
                            <li><i class="fas fa-check-circle text-success"></i> <strong>Nombre:</strong> Campo obligatorio, máximo 100 caracteres</li>
                            <li><i class="fas fa-check-circle text-success"></i> <strong>Email:</strong> Debe ser un correo válido único en el sistema</li>
                            <li><i class="fas fa-check-circle text-success"></i> <strong>Contraseña:</strong> Mínimo 6 caracteres</li>
                            <li><i class="fas fa-info-circle text-info"></i> Los usuarios se pueden editar después de ser creados</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <!-- Grid de Usuarios -->
        <div class="card">
            <div class="card-header">
                <i class="fas fa-list"></i> Usuarios Registrados
            </div>
            <div class="card-body table-responsive">
                <asp:GridView ID="gvUsuarios" runat="server" CssClass="table table-striped table-hover"
                    AutoGenerateColumns="false" AllowPaging="true" PageSize="10" OnPageIndexChanging="GvUsuarios_PageIndexChanging">
                    <Columns>
                        <asp:BoundField DataField="IdUsuario" HeaderText="ID" />
                        <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                        <asp:BoundField DataField="Email" HeaderText="Email" />
                        <asp:BoundField DataField="FechaCreacion" HeaderText="Fecha de Creación" DataFormatString="{0:dd/MM/yyyy}" />
                    </Columns>
                    <EmptyDataTemplate>
                        <div class="alert alert-info m-0">No hay usuarios registrados</div>
                    </EmptyDataTemplate>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>