<%@ Page Title="Servicios - SmartFlow" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Servicios.aspx.cs" Inherits="SmartFlow.Servicios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5">
        <h1 class="mb-4">
            <i class="fas fa-cog" style="color: #0d6efd;"></i> Gestión de Servicios
        </h1>

        <!-- Alertas -->
        <div id="alertContainer" runat="server"></div>

        <!-- Formulario -->
        <div class="row mb-5">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header">
                        <i class="fas fa-plus-circle"></i> Agregar Nuevo Servicio
                    </div>
                    <div class="card-body">
                        <div class="mb-3">
                            <label for="txtNombre" class="form-label">Nombre del Servicio:</label>
                            <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" placeholder="Ej: Consultoría Web"></asp:TextBox>
                        </div>
                        <div class="mb-3">
                            <label for="txtPrecio" class="form-label">Precio:</label>
                            <div class="input-group">
                                <span class="input-group-text">$</span>
                                <asp:TextBox ID="txtPrecio" runat="server" TextMode="Number" CssClass="form-control" placeholder="0.00" step="0.01" min="0"></asp:TextBox>
                            </div>
                        </div>
                        <div class="d-grid gap-2">
                            <asp:Button ID="btnGuardar" runat="server" Text="Guardar Servicio" CssClass="btn btn-primary" OnClick="BtnGuardar_Click" />
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
                            <li><i class="fas fa-check-circle text-success"></i> <strong>Nombre:</strong> Descripción breve del servicio</li>
                            <li><i class="fas fa-check-circle text-success"></i> <strong>Precio:</strong> Costo unitario del servicio</li>
                            <li><i class="fas fa-info-circle text-info"></i> Los servicios se utilizan en las órdenes</li>
                            <li><i class="fas fa-lightbulb text-warning"></i> Puedes agregar múltiples servicios</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <!-- Grid de Servicios -->
        <div class="card">
            <div class="card-header">
                <i class="fas fa-list"></i> Servicios Disponibles
            </div>
            <div class="card-body table-responsive">
                <asp:GridView ID="gvServicios" runat="server" CssClass="table table-striped table-hover"
                    AutoGenerateColumns="false" AllowPaging="true" PageSize="10" OnPageIndexChanging="GvServicios_PageIndexChanging">
                    <Columns>
                        <asp:BoundField DataField="IdServicio" HeaderText="ID" />
                        <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                        <asp:BoundField DataField="Precio" HeaderText="Precio" DataFormatString="{0:C}" />
                        <asp:BoundField DataField="FechaCreacion" HeaderText="Fecha de Creación" DataFormatString="{0:dd/MM/yyyy}" />
                    </Columns>
                    <EmptyDataTemplate>
                        <div class="alert alert-info m-0">No hay servicios registrados</div>
                    </EmptyDataTemplate>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>