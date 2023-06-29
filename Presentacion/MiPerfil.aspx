<%@ Page Title="" Language="C#" MasterPageFile="~/Maestro.Master" AutoEventWireup="true" CodeBehind="MiPerfil.aspx.cs" Inherits="Presentacion.MiPerfil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .container {
            max-width: 600px;
            margin: 0px auto;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }
        .validacion{
            color: red;
            font-size: 12px;
        }

        .profile-name {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .profile-email {
            font-size: 18px;
            color: #6c757d;
            margin-bottom: 30px;
        }

        .profile-details {
            margin-bottom: 40px;
        }

            .profile-details h5 {
                font-weight: bold;
                margin-bottom: 10px;
            }

            .profile-details p {
                color: #6c757d;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="container">
        <div class="fondo">
            <div class=" d-flex justify-content-center align-items-center">
                <asp:Image ID="imgPerfil" ImageUrl="/Imagenes/UsuarioSinFoto.png"
                    runat="server" CssClass="img-fluid mb-3" Style="height: 250px; width: 250px; border-radius: 50%;" />
            </div>
            <div class="text-center">
                <asp:Label runat="server" Text="Usuario" ID="lblNombreUsuario" class="profile-name" />
                <br />
                <asp:Label runat="server" Text="Email" ID="lblEmail" class="profile-email" />
            </div>
            <br />
            <div class="profile-details">
                <h5>Datos de perfil:</h5>
                <div class="row col-4 m-1 form-group">
                    <label for="name">Nombre:</label>
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtNombre" />
                    <asp:RequiredFieldValidator ErrorMessage="El nombre es requerido" CssClass="validacion" ControlToValidate="txtNombre" runat="server" />
                </div>
                <div class="row col-4 m-1 form-group">
                    <label for="surname">Apellido:</label>
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtApellido" />
                    <asp:RequiredFieldValidator ErrorMessage="El apellido es requerido" CssClass="validacion" ControlToValidate="txtApellido" runat="server" />
                </div>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div class="row col-4 m-1 form-group">
                            <label for="city">Ciudad:</label>
                            <asp:DropDownList runat="server" CssClass="form-control" AutoPostBack="true" ID="ddlCiudad" OnSelectedIndexChanged="ddlCiudad_SelectedIndexChanged">
                                <asp:ListItem Text="Buenos Aires" />
                                <asp:ListItem Text="Catamarca" />
                                <asp:ListItem Text="Chaco" />
                                <asp:ListItem Text="Chubut" />
                                <asp:ListItem Text="Córdoba" />
                                <asp:ListItem Text="Corrientes" />
                                <asp:ListItem Text="Entre Ríos" />
                                <asp:ListItem Text="Formosa" />
                                <asp:ListItem Text="Jujuy" />
                                <asp:ListItem Text="La Pampa" />
                                <asp:ListItem Text="La Rioja" />
                                <asp:ListItem Text="Mendoza" />
                                <asp:ListItem Text="Misiones" />
                                <asp:ListItem Text="Neuquén" />
                                <asp:ListItem Text="Río Negro" />
                                <asp:ListItem Text="Salta" />
                                <asp:ListItem Text="San Juan" />
                                <asp:ListItem Text="San Luis" />
                                <asp:ListItem Text="Santa Cruz" />
                                <asp:ListItem Text="Santa Fe" />
                                <asp:ListItem Text="Santiago del Estero" />
                                <asp:ListItem Text="Tierra del Fuego" />
                                <asp:ListItem Text="Tucumán" />
                            </asp:DropDownList>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <br />
                <div class="row col-4 m-1 form-group">
                    <label for="image">Cambiar imagen:</label>
                    <input type="file" id="txtImagen" runat="server" class="form-control" />
                    <small class="form-text text-muted">Formatos admitidos: JPG, PNG. Tamaño máximo de archivo: 5 MB.</small>
                </div>
            </div>
            <br />
            <br />
            <div class="text-center">
                <asp:Button Text="Guardar" ID="btnGuardar" OnClick="btnGuardar_Click" CssClass="btn btn-primary" runat="server" />
            </div>
        </div>
    </div>
</asp:Content>
