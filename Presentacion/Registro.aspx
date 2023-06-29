<%@ Page Title="" Language="C#" MasterPageFile="~/Maestro.Master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="Presentacion.Registro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .container {
            padding: 20px;
        }

        .card {
            width: 400px;
            padding: 20px;
            /*text-align: center;*/
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
    <script>
        function validar() {
            //capturar el control
            const txtNombre = document.getElementById("txtNombre");
            const txtApellido = document.getElementById("txtApellido");

            // Validación del campo txtNombre
            if (txtNombre.value == "") {
                txtNombre.classList.add("is-invalid");
                txtNombre.classList.remove("is-valid");

                return false;
            }
            txtNombre.classList.remove("is-invalid");
            txtNombre.classList.add("is-valid");

            // Validación del campo txtApellido
            if (txtApellido.value == "") {
                txtApellido.classList.add("is-invalid");
                txtApellido.classList.remove("is-valid");
                return false;
            }
            txtApellido.classList.remove("is-invalid");
            txtApellido.classList.add("is-valid");

            return true;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="d-flex justify-content-center align-items-center" style="height: 100vh;">
            <div class="card">
                <h2 class="card-title" style="text-align: center">Registro</h2>
                <div>
                    <div class="mb-3">
                        <asp:TextBox CssClass="form-control" ID="txtNombre" MaxLength="15" ClientIDMode="Static" placeholder="Nombre" runat="server" />
                    </div>
                    <div class="mb-3">
                        <asp:TextBox CssClass="form-control" ID="txtApellido" MaxLength="15" ClientIDMode="Static" placeholder="Apellido" runat="server" />
                    </div>
                    <div class="mb-1">
                        <asp:TextBox CssClass="form-control" ID="txtEmail" TextMode="Email" placeholder="Correo electrónico" runat="server" />
                        <asp:RequiredFieldValidator ErrorMessage="Ingrese correo electrónico " ControlToValidate="txtEmail" CssClass="validacion" runat="server" />
                    </div>
                    <div class="mb-3">
                        <asp:TextBox CssClass="form-control" ID="txtContraseña" TextMode="Password" MaxLength="15" MinLength="4" placeholder="Contraseña" runat="server" />
                        <asp:RequiredFieldValidator ErrorMessage="Ingrese una contraseña" CssClass="validacion" ControlToValidate="txtContraseña" runat="server" />
                    </div>
                    <asp:Button Text="Registrarse" CssClass="btn btn-success" ID="btnRegistrarse" OnClick="btnRegistrarse_Click" OnClientClick="return validar()" runat="server" />
                </div>
                <p style="text-align: center">¿Ya tienes una cuenta? <a href="IniciarSesion.aspx">Iniciar sesión</a></p>
            </div>
        </div>
    </div>
</asp:Content>
