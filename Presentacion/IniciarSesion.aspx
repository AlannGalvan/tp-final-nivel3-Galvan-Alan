<%@ Page Title="" Language="C#" MasterPageFile="~/Maestro.Master" AutoEventWireup="true" CodeBehind="IniciarSesion.aspx.cs" Inherits="Presentacion.IniciarSesion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .container {
            padding: 20px;
        }

        .card {
            width: 400px;
            padding: 20px;
            background-color: #ffffff;
            box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);
           
        }

        .card-title {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .btn-success {
            width: 100%;
        }

        .validacion {
            color: red;
            font-size: 12px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="d-flex justify-content-center align-items-center" style="height: 80vh;">
            <div class="card">
                <h2 class="card-title" style="text-align: center">Iniciar sesión</h2>
                <div>
                    <div class="mb-1">
                        <asp:TextBox CssClass="form-control" ID="txtEmail" TextMode="Email" placeholder="Correo electrónico" runat="server" />
                        <asp:RequiredFieldValidator ErrorMessage="Ingrese su correo electrónico" CssClass="validacion" ControlToValidate="txtEmail" runat="server" />
                    </div>
                    <div class="mb-3">
                        <asp:TextBox CssClass="form-control" ID="txtContraseña" TextMode="Password" placeholder="Contraseña" runat="server" />
                        <asp:RequiredFieldValidator ErrorMessage="Ingrese su contraseña" ControlToValidate="txtContraseña" CssClass="validacion" runat="server" />
                    </div>
                    <asp:Button Text="Iniciar sesión" CssClass="btn btn-success" ID="btnIniciarSesion" OnClick="btnIniciarSesion_Click" runat="server" />
                </div>
                <p style="text-align: center">¿No tienes una cuenta? <a href="Registro.aspx">Regístrate</a></p>
            </div>
        </div>
    </div>
</asp:Content>
