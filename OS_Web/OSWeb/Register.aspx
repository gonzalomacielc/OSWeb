<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="OSWeb.Register" EnableEventValidation="false" %>

<!DOCTYPE html>

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="UTF-8">
    <title>Registracion/Login Form</title>
    <link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">


    <link rel="stylesheet" href="css/LoginStyle.css">
</head>

<body>
    <script>

        function validaFieldRegister() {
            $("#login :input").prop('required', false);
            $("#signup :input").prop('required', true);
            $("#__txtTelSecundario").prop('required', false);
        }

        function validaFieldLogin() {
            $("#login :input").prop('required', true);
            $("#signup :input").prop('required', false);

        }
    </script>
    <form runat="server">
        <div class="form container">
            <ul class="tab-group">
                <li class="tab active"><a href="#login">Ingreso</a></li>
                <li class="tab "><a href="#signup">Registro</a></li>
            </ul>
            <div class="tab-content">
                <div id="login">
                    <h1>Bienvenido a OstepWeb!</h1>
                    <div class="field-wrap alert alert-danger">
                        <label>
                            Dirección de email<span class="req">*</span>
                        </label>
                        <input runat="server" id="__txtEmail" type="email" autocomplete="off" />
                    </div>
                    <div class="field-wrap alert alert-danger">
                        <label>
                            Contraseña<span class="req">*</span>
                        </label>
                        <input runat="server" id="__txtPass" type="password" autocomplete="off" />
                        <br />
                        <asp:Label Style="color: tomato" Text="" ID="lblErrorLogin" runat="server" />
                    </div>
                    <p class="forgot"><a href="#">Olvidó su contraseña?</a></p>
                    <asp:Button Text="Ingresar" runat="server" ID="btnLogin" OnClientClick="validaFieldLogin()" OnClick="btnLogin_Click" CssClass="button button-block" />
                </div>
                <div id="signup" >
                    <h1>Nuevo Usuario</h1>
                    <div class="field-wrap">
                        <label>
                            Razón Social<span class="req">*</span>
                        </label>
                        <input type="text" runat="server" id="__txtRazonSocial" autocomplete="off" />
                    </div>
                    <div class="field-wrap">
                        <label>
                            Nombre de Fantasía<span class="req">*</span>
                        </label>
                        <input type="text" runat="server" id="__txtNombreFantasia" autocomplete="off" />
                    </div>
                    <div class="field-wrap">
                        <label>
                            Cuit<span class="req">*</span>
                        </label>
                        <input type="number" min="0" runat="server" id="__txtCuit" autocomplete="off" />
                    </div>
                    <div class="field-wrap">
                        <label>
                            Dirección<span class="req">*</span>
                        </label>
                        <input type="text" runat="server" id="__txtDireccion" autocomplete="off" />
                    </div>
                    <div class="field-wrap">
                        <label>
                            Teléfono Principal<span class="req">*</span>
                        </label>
                        <input type="tel" runat="server" id="__txtTelPrincipal" autocomplete="off" />
                    </div>
                    <div class="field-wrap">
                        <label>
                            Teléfono Secundario
                        </label>
                        <input type="tel" runat="server" id="__txtTelSecundario" autocomplete="off" />
                    </div>
                    <div class="field-wrap">
                        <select class="req" runat="server" id="ddlProv">
                            <option value="Buenos Aires">Buenos Aires</option>
                            <option value="Catamarca">Catamarca</option>
                            <option value="Chaco">Chaco</option>
                            <option value="Chubut">Chubut</option>
                            <option value="Ciudad Autónoma de Buenos Aires">Ciudad Autónoma de Buenos Aires</option>
                            <option value="Córdoba">Córdoba</option>
                            <option value="Corrientes">Corrientes</option>
                            <option value="Entre Ríos">Entre Ríos</option>
                            <option value="Formosa">Formosa</option>
                            <option value="Jujuy">Jujuy</option>
                            <option value="La Pampa">La Pampa</option>
                            <option value="La Rioja">La Rioja</option>
                            <option value="Mendoza">Mendoza</option>
                            <option value="Misiones">Misiones</option>
                            <option value="Neuquén">Neuquén</option>
                            <option value="Río Negro">Río Negro</option>
                            <option value="Salta">Salta</option>
                            <option value="San Juan">San Juan</option>
                            <option value="San Luis">San Luis</option>
                            <option value="Santa Cruz">Santa Cruz</option>
                            <option value="Santa Fe">Santa Fe</option>
                            <option value="Santiago del Estero">Santiago del Estero</option>
                            <option value="Tierra del Fuego">Tierra del Fuego</option>
                            <option value="Tucumán">Tucumán</option>
                        </select>
                    </div>
                    <div class="field-wrap">
                        <label>
                            Localidad<span class="req">*</span>
                        </label>
                        <input type="text" runat="server" id="__txtLocalidad" autocomplete="off" />
                    </div>
                    <div class="field-wrap">
                        <label>
                            Código Postal<span class="req">*</span>
                        </label>
                        <input type="text" runat="server" id="__txtCodPostal" autocomplete="off" />
                    </div>
                    <div class="field-wrap">
                        <label>
                            Dirección de email<span class="req">*</span>
                        </label>
                        <input type="email" runat="server" id="__txtUsuario" autocomplete="off" />
                    </div>
                    <div class="field-wrap">
                        <label>
                            Contraseña<span class="req">*</span>
                        </label>
                        <input type="password" runat="server" id="__txtPassword" autocomplete="off" />
                        <br />
                        <asp:Label Style="color: tomato" Text="" ID="lblErrorRegister" runat="server" />
                    </div>
                    <asp:Button Text="Crear Usuario" runat="server" ID="btnCrear" OnClientClick="validaFieldRegister()" OnClick="btnCrear_Click" CssClass="button button-block" />
                </div>
            </div>
            <!-- tab-content -->
        </div>
    </form>
    <!-- /form -->
    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.15.1/jquery.validate.min.js"></script>
    <script src="js/login.js"></script>

</body>
