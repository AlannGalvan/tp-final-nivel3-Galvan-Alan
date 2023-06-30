<%@ Page Title="" Language="C#" MasterPageFile="~/Maestro.Master" AutoEventWireup="true" CodeBehind="DetalleArticulos.aspx.cs" Inherits="Presentacion.DetalleArticulos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .container {
            max-width: 600px;
            margin: 0px auto;
            padding: 40px;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
    </style>
    <script type="text/javascript">
        function cargarImagenPredeterminada() {
            var imagen = document.getElementById('<%= imgArticulo.ClientID %>');
            imagen.setAttribute('src', '/Imagenes/imagenNoCarga.jpg');
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h2>Detalle del articulo seleccionado</h2>
        <br />
        <div class="row">
            <div class="col-6">
                <div class="mb-3">
                    <label for="txtId" class="form-label">Id :</label>
                    <asp:TextBox runat="server" ID="txtId" CssClass="form-control" />
                </div>

                <div class="mb-3">
                    <label for="txtCodigo" class="form-label">Código :</label>
                    <asp:TextBox runat="server" ID="txtCodigo" CssClass="form-control" />

                </div>

                <div class="mb-3">
                    <label for="txtNombre" class="form-label">Nombre :</label>
                    <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control" />

                </div>


                <div class="mb-3">
                    <label for="ddlMarca" class="form-label">Marca : </label>
                    <asp:DropDownList runat="server" ID="ddlMarca" CssClass="form-select" />
                </div>

                <div class="mb-3">
                    <label for="ddlCategoria" class="form-label">Categoría : </label>
                    <asp:DropDownList runat="server" ID="ddlCategoria" CssClass="form-select" />
                </div>

                <div class="mb-3">
                    <label for="txtPrecio" class="form-label">Precio :</label>
                    <asp:TextBox runat="server" ID="txtPrecio" CssClass="form-control" />
                </div>

                <div class="mb-3">
                    <a href="Default.aspx" class="btn btn-link">Atras</a>
                </div>

            </div>


            <div class="col-6">
                <div class="mb-3">
                    <label for="txtDescripcion" class="form-label">Descripción :</label>
                    <asp:TextBox runat="server" ID="txtDescripcion" TextMode="MultiLine" CssClass="form-control" />
                </div>

                <div class="mb-3">
                    <label for="txtImagenUrl" class="form-label">Imagen :</label>
                    <asp:TextBox runat="server" ID="txtImagenUrl" CssClass="form-control" AutoPostBack="true" OnTextChanged="txtImagenUrl_TextChanged" />
                </div>
                <asp:Image  runat="server" ID="imgArticulo" Width="400px" Height="400px" onerror="cargarImagenPredeterminada()" />
            </div>
        </div>
    </div>
</asp:Content>
