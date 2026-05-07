<%@ Page Title="Órdenes - SmartFlow" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Ordenes.aspx.cs" Inherits="SmartFlow.Ordenes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5">
        <h1 class="mb-4">
            <i class="fas fa-clipboard-list" style="color: #0d6efd;"></i> Gestión de Órdenes
        </h1>

        <!-- Alertas -->
        <div id="alertContainer" runat="server"></div>

        <!-- Formulario -->
        <div class="row mb-5">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header">
                        <i class="fas fa-plus-circle"></i> Registrar Nueva Orden
                    </div>
                    <div class="card-body">
                        <div class="mb-3">
                            <label for="ddlUsuarios" class="form-label">Usuario:</label>
                            <asp:DropDownList ID="ddlUsuarios" runat="server" CssClass="form-select"></asp:DropDownList>
                        </div>
                        <div class="mb-3">
                            <label for="txtTotal" class="form-label">Total:</label>
                            <div class="input-group">
                                <span class="input-group-text">$</span>
                                <asp:TextBox ID="txtTotal" runat="server" TextMode="Number" CssClass="form-control" 
                                    step="0.01" min="0" placeholder="0.00"></asp:TextBox>
                            </div>
                        </div>
                        <div class="d-grid gap-2">
                            <asp:Button ID="btnGuardar" runat="server" Text="Registrar Orden" 
                                CssClass="btn btn-primary" OnClick="BtnGuardar_Click" />
                            <asp:Button ID="btnLimpiar" runat="server" Text="Limpiar" 
                                CssClass="btn btn-secondary" OnClick="BtnLimpiar_Click" CausesValidation="false" />
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
                            <li><i class="fas fa-check-circle text-success"></i> <strong>Usuario:</strong> Selecciona el usuario para la orden</li>
                            <li><i class="fas fa-check-circle text-success"></i> <strong>Total:</strong> Ingresa el monto total de la orden</li>
                            <li><i class="fas fa-info-circle text-info"></i> Se generará una factura automáticamente</li>
                            <li><i class="fas fa-lightbulb text-warning"></i> Todas las órdenes quedan registradas en el sistema</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <!-- Grid de Órdenes -->
        <div class="card">
            <div class="card-header">
                <i class="fas fa-list"></i> Órdenes Registradas
            </div>
            <div class="card-body table-responsive">
                <asp:GridView ID="gvOrdenes" runat="server" CssClass="table table-striped table-hover" 
                    AutoGenerateColumns="false" AllowPaging="true" PageSize="10" OnPageIndexChanging="GvOrdenes_PageIndexChanging">
                    <Columns>
                        <asp:BoundField DataField="IdOrden" HeaderText="ID Orden" />
                        <asp:BoundField DataField="Nombre" HeaderText="Usuario" />
                        <asp:BoundField DataField="Total" HeaderText="Total" DataFormatString="{0:C}" />
                        <asp:BoundField DataField="FechaCreacion" HeaderText="Fecha" DataFormatString="{0:dd/MM/yyyy HH:mm}" />
                    </Columns>
                    <EmptyDataTemplate>
                        <div class="alert alert-info m-0">No hay órdenes registradas</div>
                    </EmptyDataTemplate>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>