<%@ Page Title="" Language="C#" MasterPageFile="~/Maestro.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Presentacion.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        h1 {
            text-align: center;
            padding: 20px;
            margin-bottom: 20px;
            font-size: 24px;
            color: #333;
            margin: 0;
        }

        .container {
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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid">
        <h1 class="header">¡Bienvenidos a la web de articulos!</h1>       
        <br />
        <div class="row justify-content-center">
            <div class="col-6 text-center">
                <asp:TextBox ID="txtBuscar" runat="server" CssClass="form-control" placeholder="Buscar por nombre o marca..." AutoPostBack="True" OnTextChanged="txtBuscar_TextChanged"></asp:TextBox>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="row row-cols-1 row-cols-md-4 g-4">

            <asp:Repeater ID="rptArticulos" runat="server">
                <ItemTemplate>
                    <div class="col">
                        <div class="card">
                            <img src="<%#Eval("ImagenUrl") %>" class="card-img-top" alt="<%#Eval("Nombre") %>" onerror="this.src='/Imagenes/imagenNoCarga.jpg'">
                            <div class="card-body">
                                <h5 class="card-title"><%# Eval("Nombre") %></h5>
                                <p class="card-text">Precio: <%# Eval("PrecioFormateado") %></p>
                                <div class="row">
                                    <div class="col-6 justify-content-start align-items-lg-start">
                                        <a href="DetalleArticulos.aspx?id=<%# Eval("Id") %>" class="btn btn-primary">Ver más</a>
                                    </div>
                                    <%if (Negocio.Seguridad.sesionActiva(Session["usuario"]))
                                        { %>
                                    <div class="col-6" style="text-align: end">
                                        <a href="Favoritos.aspx?id=<%#Eval("Id") %>">⭐</a>
                                    </div>
                                    <%} %>
                                </div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

        </div>

    </div>
</asp:Content>
