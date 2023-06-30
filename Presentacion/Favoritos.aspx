<%@ Page Title="" Language="C#" MasterPageFile="~/Maestro.Master" AutoEventWireup="true" CodeBehind="Favoritos.aspx.cs" Inherits="Presentacion.Favoritos" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .container {
            padding: 20px;
        }

        h1 {
            text-align: center;
            padding: 20px;
        }

        .card {
            border: none;
            box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s;
        }

            .card:hover {
                transform: translateY(-5px);
            }

        .card-img-top {
            height: 250px;
            object-fit: cover;
        }

        .card-title {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .card-text {
            margin-bottom: 15px;
        }

        .eliminar {
            text-align: end;
        }
        .sinfavorito {
            text-align: center;
            padding: 20px;
            /*height: 50vh*/;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h1>⭐Mis articulos favoritos⭐</h1>
    <div class="container">



        <% if (repRepetidor.Items.Count == 0)
            { %>
        <div class="sinfavorito">
            <br />
            <h4>No tienes ningún artículo favorito</h4>
            <p>Agrega algunos artículos a tus favoritos para verlos aquí.</p>
        </div>
        <% }
            else
            { %>
        <div class="row row-cols-1 row-cols-md-3 g-4">
            <%-- Repetir esta sección con los datos de tu lista de productos --%>
            <asp:Repeater runat="server" ID="repRepetidor">
                <ItemTemplate>
                    <div class="col">
                        <div class="card">
                            <img src="<%#Eval("ImagenUrl") %>" class="card-img-top" onerror="this.src='/Imagenes/imagenNoCarga.jpg'" id="imgArticulo" alt="<%#Eval("Nombre")%>">
                            <div class="card-body">
                                <h5 class="card-title"><%#Eval("Nombre")%></h5>
                                <p class="card-text">Precio: <%#Eval("PrecioFormateado") %></p>
                                <div class="row">
                                    <div class="col-4 justify-content-stard align-items-lg-start">
                                        <a href="DetalleArticulos.aspx?id=<%# Eval("Id") %>" class="btn btn-primary">Ver más</a>
                                    </div>
                                    <div class="col-8" style="text-align: end">
                                        <asp:Button Text="❌" runat="server" ID="btnEliminarFavorito" CssClass="btn" OnClick="btnEliminarFavorito_Click" CommandName="Cross" CommandArgument='<%#Eval("Id")%>' />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </ItemTemplate>
            </asp:Repeater>
            <%} %>
            <%-- Fin de la repetición --%>
        </div>
    </div>
</asp:Content>
