<%@ Page Title="" Language="C#" MasterPageFile="~/Maestro.Master" AutoEventWireup="true" CodeBehind="FormularioProductos.aspx.cs" Inherits="Presentacion.FormularioProductos" %>

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
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="container">
        <h1 style="text-align: center">Formulario de Productos</h1>
        <br />
        <div class="row">
            <div class="col-6">
                <div class="mb-3">
                    <label for="txtId" class="form-label">Id</label>
                    <asp:TextBox runat="server" ID="txtId" CssClass="form-control" />
                </div>
                <div class="mb-1">
                    <label for="txtCodigo" class="form-label">Código :</label>
                    <asp:TextBox runat="server" ID="txtCodigo" CssClass="form-control" />
                    <asp:RequiredFieldValidator ErrorMessage="El código es requerido" CssClass="validacion" ControlToValidate="txtCodigo" runat="server" />
                </div>
                <div class="mb-1">
                    <label for="txtNombre" class="form-label">Nombre :</label>
                    <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control" />
                    <asp:RequiredFieldValidator ErrorMessage="El nombre es requerido" CssClass="validacion" ControlToValidate="txtNombre" runat="server" />
                </div>
                <div class="mb-3">
                    <label for="ddlMarca" class="form-label">Marca :</label>
                    <asp:DropDownList ID="ddlMarca" CssClass="form-select" runat="server"></asp:DropDownList>
                </div>
                <div class="mb-3">
                    <label for="ddlCategoria" class="form-label">Categoria :</label>
                    <asp:DropDownList ID="ddlCategoria" CssClass="form-select" runat="server"></asp:DropDownList>
                </div>
                <div class="mb-1">
                    <label for="txtPrecio" class="form-label">Precio :</label>
                    <asp:TextBox runat="server" ID="txtPrecio" CssClass="form-control" />
                    <asp:RequiredFieldValidator ErrorMessage="El precio es requerido" CssClass="validacion" ControlToValidate="txtPrecio" runat="server" />
                    <asp:RegularExpressionValidator ErrorMessage="Ingresar solo números" CssClass="validacion" ValidationExpression="^[0-9,.]+$" ControlToValidate="txtPrecio" runat="server" />
                </div>
                <div class="mb-3">
                    <asp:Button Text="Aceptar" ID="btnAceptar" CssClass="btn btn-primary" OnClick="btnAceptar_Click" runat="server" />
                    <a href="Administracion.aspx">Cancelar</a>
                </div>
            </div>

            <div class="col-6">
                <div class="mb-3">
                    <label for="txtDescripcion" class="form-label">Descripción :</label>
                    <asp:TextBox runat="server" ID="txtDescripcion" TextMode="MultiLine" CssClass="form-control" />
                </div>
                <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>--%>
                        <div class="mb-3">
                            <label for="txtImagenUrl" class="form-label">Imagen Url :</label>
                            <asp:TextBox runat="server" ID="txtImagenUrl" CssClass="form-control"
                                AutoPostBack="true" OnTextChanged="txtImagenUrl_TextChanged" />
                        </div>
                        <asp:Image ImageUrl="https://www.palomacornejo.com/wp-content/uploads/2021/08/no-image.jpg"
                            runat="server" ID="imgProducto" Width="400px" Height="400px" />
                    <%--</ContentTemplate>
                </asp:UpdatePanel>--%>
            </div>
        </div>
        <div class="row">
            <div class="col-6">
                <asp:UpdatePanel ID="Updatepanel2" runat="server">
                    <ContentTemplate>
                        <div class="mb-3">
                            <asp:Button Text="Eliminar" ID="btnEliminar" OnClick="btnEliminar_Click" CssClass="btn btn-danger" runat="server" />
                        </div>
                        <%if (ConfirmaEliminacion)
                            {%>
                        <div class="mb-3">
                            <asp:CheckBox Text="Confirmar Eliminacion" ID="chkConfirmaEliminacion" runat="server" />
                            <asp:Button Text="Eliminar" ID="btnConfirmaEliminar" OnClick="btnConfirmaEliminar_Click" CssClass="btn btn-outline-danger" runat="server" />
                        </div>
                        <%} %>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>
</asp:Content>
