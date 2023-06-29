<%@ Page Title="" Language="C#" MasterPageFile="~/Maestro.Master" AutoEventWireup="true" CodeBehind="Administracion.aspx.cs" Inherits="Presentacion.Administracion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .container {
            max-width: 600px;
            margin: 0px auto;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
         .validacion {
            color: red;
            font-size: 12px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>--%>
    <div class="container">
        <div style="height: 130vh;">
            <h1 style="text-align: center">Administración De Productos</h1>
            <div class="row">
                <div class="col-6">
                    <div class="mb-3">
                        <asp:Label Text="Buscar" runat="server" />
                        <asp:TextBox runat="server" ID="txtBuscar" CssClass="form-control" placeholder="Buscar por nombre" AutoPostBack="true" OnTextChanged="txtBuscar_TextChanged" />
                    </div>
                </div>

                <div class="col-6" style="display: flex; flex-direction: column; justify-content: flex-end">
                    <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>--%>
                            <div class="mb-3">
                                <asp:CheckBox Text="BusquedaAvanzada"
                                    ID="chkAvanzado" runat="server"
                                    AutoPostBack="true"
                                    OnCheckedChanged="chkAvanzado_CheckedChanged" />
                            </div>
                      <%--  </ContentTemplate>
                    </asp:UpdatePanel>--%>
                </div>
                <%--<asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>--%>
                <% if (chkAvanzado.Checked)
                    {%>
                <div class="row">
                    <div class="col-3">
                        <div class="mb-3">
                            <asp:Label Text="Campo" ID="lblCampo" runat="server" />
                            <asp:DropDownList runat="server" CssClass="form-control" AutoPostBack="true" ID="ddlCampo" OnSelectedIndexChanged="ddlCampo_SelectedIndexChanged">
                                <asp:ListItem Text="Nombre" />
                                <asp:ListItem Text="Marca" />
                                <asp:ListItem Text="Categoria" />
                                <asp:ListItem Text="Precio" />
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-3">
                        <div class="mb-3">
                            <asp:Label Text="Criterio" runat="server" />
                            <asp:DropDownList runat="server" ID="ddlCriterio" CssClass="form-control"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-3">
                        <div class="mb-1">
                            <asp:Label Text="Busqueda Avanzada" runat="server" />
                            <asp:TextBox runat="server" ID="txtBusquedaAvanzada" CssClass="form-control" />
                            <%if (ddlCampo.SelectedItem.ToString() == "Precio")
                                { %>
                            <asp:RequiredFieldValidator ErrorMessage="El precio es requerido" CssClass="validacion" ControlToValidate="txtBusquedaAvanzada" runat="server" />
                            <asp:RegularExpressionValidator ErrorMessage="Ingresar solo números" CssClass="validacion" ValidationExpression="^[0-9]+$" ControlToValidate="txtBusquedaAvanzada" runat="server" />
                            <%} %>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-3">
                        <div class="mb-3">
                            <asp:Button Text="Busqueda Avanzada" runat="server" CssClass="btn btn-primary" ID="btnBusquedaAvanzada" OnClick="btnBusquedaAvanzada_Click" />
                        </div>
                    </div>
                </div>
                <%} %>
                <%-- </ContentTemplate>
            </asp:UpdatePanel>--%>
            </div>
            <asp:GridView ID="dgvProductos" runat="server" DataKeyNames="Id"
                CssClass="table table-dark table-striped table-bordered border-secondary" AutoGenerateColumns="false"
                OnSelectedIndexChanged="dgvProductos_SelectedIndexChanged"
                OnPageIndexChanging="dgvProductos_PageIndexChanging"
                AllowPaging="true" PageSize="10">
                <Columns>
                    <asp:BoundField HeaderText="Codigo" DataField="Codigo" />
                    <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                    <asp:BoundField HeaderText="Descripción" DataField="Descripcion" />
                    <asp:BoundField HeaderText="Marca" DataField="Marca.Descripcion" />
                    <asp:BoundField HeaderText="categoria" DataField="Categoria.Descripcion" />
                    <asp:BoundField HeaderText="Precio" DataField="Precio" />
                    <asp:CommandField HeaderText="Modificar" ShowSelectButton="true" SelectText="&#x270D;" />
                </Columns>
            </asp:GridView>
            <a href="FormularioProductos.aspx" class="btn btn-primary">Agregar</a>
        </div>
    </div>
</asp:Content>
