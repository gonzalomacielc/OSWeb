<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Empleadores.aspx.cs" Inherits="OSWeb.Empleadores" %>

<!DOCTYPE html>

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1 maximum-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>OSTEP SITE</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.13/css/dataTables.bootstrap.min.css" />
    <link rel="stylesheet" href="https://cdn.datatables.net/fixedheader/3.1.2/css/fixedHeader.bootstrap.min.css" />
    <link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.1.1/css/responsive.bootstrap.min.css" />



    <!-- Bootstrap Core CSS -->
    <%--<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">--%>

    <!-- Theme CSS -->
    <link href="css/freelancer.min.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style>
        .modal {
            text-align: center;
            padding: 0 !important;
        }

            .modal:before {
                content: '';
                display: inline-block;
                height: 100%;
                vertical-align: middle;
                margin-right: -4px;
            }

        .modal-dialog {
            display: inline-block;
            text-align: left;
            vertical-align: middle;
        }

        #myModal label, h4 {
            color: black;
        }

        th {
            text-align: center;
        }

        #myModalAp label, h4 {
            color: black;
        }

        .solicitud {
            color: cornflowerblue;
            font-style: italic;
            font-weight: bold;
            font-size: 1.5em;
            font-family: 'Helvetica','Verdana','Monaco',sans-serif;
        }

        #lblError {
            color: red;
        }
    </style>
</head>

<body id="page-top" class="index">
    <form runat="server" id="form">
        <asp:HiddenField runat="server" ID="hdnIdUsuario"></asp:HiddenField>
        <!-- Navigation -->
        <asp:ScriptManager ID="SCMEmpleador" runat="server" />
        <nav id="mainNav" class="navbar navbar-default navbar-fixed-top navbar-custom">
            <div class="container">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header page-scroll">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
                    </button>
                    <a class="navbar-brand" href="#page-top">Empleadores</a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav navbar-right">
                        <li class="hidden">
                            <a href="#page-top"></a>
                        </li>
                        <li class="page-scroll">
                            <a href="#Empleador">Datos de Empleador</a>
                        </li>
                        <li class="page-scroll">
                            <a href="#Empleados">Empleados</a>
                        </li>
                        <li class="page-scroll">
                            <a href="#AportesContribucion">Aporte/contribución</a>
                        </li>
                        <li class="page-scroll">
                            <a href="#Solicitud">Libre Deuda</a>
                        </li>
                        <%-- <li class="dropdown">
	                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Mi cuenta <b class="caret"></b></a>
	                        <ul class="dropdown-menu animated fadeInUp">
	                          <li><a href="profile.html">Profile</a></li>
	                          <li><a href="login.html">Logout</a></li>
	                        </ul>
	                      </li>--%>
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container-fluid -->
        </nav>

        <!-- Header -->
        <header>
            <div class="container">
                <div class=".intro-header">
                    <div class="col-lg-12">
                        <img class="img-responsive" src="img/logo.png" alt="">
                        <div class="intro-text">

                            <span class="skills">Developed by SkyTrek</span>
                        </div>
                    </div>
                </div>
            </div>
        </header>

        <!-- Empleador Grid Section -->

        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <section class="success" id="Empleador">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12 text-center">
                                <h2>Datos del Empleador                                    
                                </h2>
                                <br />
                                <button onclick="editarEmpleador()" type="button" id="btnAddEmpl" data-backdrop="static" data-keyboard="false" class="btn btn-default btn-sm">
                                    <span class="glyphicon glyphicon-pencil"></span>Editar 
                                </button>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12 col-md-4 form-group">
                                <label>Razón Social</label>
                                <input class="form-control" id="txtRazonSocial" runat="server" type="text" disabled />
                            </div>
                            <div class="col-xs-12 col-md-4 form-group">
                                <label>Nombre de Fantasía</label>
                                <input class="form-control" id="txtNombreFantasia" runat="server" type="text" disabled />
                            </div>
                            <div class="col-xs-12 col-md-4 form-group">
                                <label>Cuit</label>
                                <input class="form-control" id="txtCuit" placeholder="Ingrese números sin guiones" runat="server" type="number" min="0" disabled />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12 col-md-4 form-group">
                                <label>Dirección</label>
                                <input class="form-control" id="txtDireccion" runat="server" type="text" disabled />
                            </div>
                            <div class="col-xs-12 col-md-4 form-group">
                                <label>Teléfono Principal</label>
                                <input class="form-control" id="txtTelPrin" runat="server" type="tel" disabled />
                            </div>
                            <div class="col-xs-12 col-md-4 form-group">
                                <label>Teléfono Secundario</label>
                                <input class="form-control" id="txtTelSec" runat="server" type="tel" disabled />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12 col-md-4 form-group">
                                <label>Provincia</label>
                                <select id="selPcia" runat="server" class="form-control" disabled>
                                    <option value="Buenos Aires">Buenos Aires</option>
                                    <option value="Catamarca">Catamarca</option>
                                    <option value="Chaco">Chaco</option>
                                    <option value="Chubut">Chubut</option>
                                    <option value="Caba">Caba</option>
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
                            <div class="col-xs-12 col-md-4 form-group">
                                <label>Código Postal</label>
                                <input class="form-control" id="txtCodPostal" runat="server" type="text" disabled />
                            </div>
                            <div class="col-xs-12 col-md-4 form-group">
                                <label>Email</label>
                                <input class="form-control" id="txtEmail" runat="server" type="email" disabled />
                            </div>
                            <div class="col-xs-12 col-md-4 form-group">
                                <label>Localidad</label>
                                <input class="form-control" id="txtLocalidad" runat="server" disabled />
                            </div>
                        </div>
                        <asp:Button runat="server" ID="btnGuardar" Style="visibility: hidden" OnClick="btnGuardar_Click" Text="Guardar" class="btn btn-primary" />
                    </div>
                </section>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <!-- Empleados Section -->
                <section id="Empleados">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12 text-center">
                                <h2>Empleados                              
                                </h2>
                                <br />
                                <button type="button" id="btnAgregarEmpl" class="btn btn-default btn-sm" onclick="LabelAgregar()" data-backdrop="static" data-keyboard="false" data-toggle="modal" data-target="#myModal">
                                    <span class="glyphicon glyphicon-pencil"></span>Agregar 
                                </button>
                            </div>
                            <br />
                            <br />
                            <div class="col-xs-12 col-lg-12 text-center">
                                <asp:GridView ID="gvEmpleados" runat="server" CssClass="table table-striped table-bordered nowrap" DataKeyNames="IDEmpleado, Nombre, Apellido, Cuil, FechaAlta, FechaBaja"
                                    OnRowCommand="gvEmpleados_RowCommand" ForeColor="Black" AutoGenerateColumns="false">
                                    <HeaderStyle BackColor="#D2D2D2" Font-Bold="True" ForeColor="White" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="Nombre">
                                            <ItemTemplate>
                                                <asp:Label ID="lblNombre" runat="server" Text='<%# Eval("Nombre") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Apellido">
                                            <ItemTemplate>
                                                <asp:Label ID="lblApellido" runat="server" Text='<%# Eval("Apellido") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Cuil">
                                            <ItemTemplate>
                                                <asp:Label ID="lblCuil" runat="server" Text='<%# Eval("Cuil") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Fecha de Alta">
                                            <ItemTemplate>
                                                <asp:Label ID="lblFechaAlta" runat="server" Text='<%# Eval("FechaAlta", "{0:dd/MM/yyyy}" ) %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Fecha de Baja">
                                            <ItemTemplate>
                                                <asp:Label ID="lblFechaBaja" runat="server" Text='<%# Eval("FechaBaja", "{0:dd/MM/yyyy}" ) %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Editar" HeaderStyle-Width="15px">
                                            <ItemTemplate>
                                                <%-- <asp:ImageButton data-backdrop="static" data-keyboard="false" data-toggle="modal" data-target="#myModal" ID="imgEdit" ImageUrl="/img/edit.png" onclick="imgEdit_Click"  runat="server" />--%>
                                                <asp:ImageButton runat="server" Text="Editar" ImageUrl="/img/edit.png" ID="btnEditEmpl" OnClientClick="validaFields()" FieldCommandName="edit"></asp:ImageButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <%--  <asp:TemplateField HeaderStyle-Width="15px" HeaderText="Baja">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="DeleteButton" runat="server" ImageUrl="/img/del.png"
                                                    CommandName="Delete" OnClientClick="return confirm('Está seguro que quiere dar de baja a este empleado?');"
                                                    AlternateText="Delete" />
                                            </ItemTemplate>
                                        </asp:TemplateField>--%>
                                    </Columns>
                                </asp:GridView>

                            </div>
                        </div>
                        <div class="row">
                            <!-- Modal -->
                            <div class="modal fade" id="myModal" role="dialog"
                                aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <!-- Modal Header -->
                                        <div class="modal-header">
                                            <button type="button" class="close"
                                                data-dismiss="modal">
                                                <span aria-hidden="true">&times;</span>
                                                <span class="sr-only">Close</span>
                                            </button>
                                            <h4 class="modal-title" id="myModalLabel">Nuevo empleado
                                            </h4>
                                        </div>

                                        <!-- Modal Body -->
                                        <div id="alta" class="modal-body">
                                            <label runat="server" visible="false" id="lblError">Datos inválidos. Revise por favor los datos</label>
                                            <div class="row">
                                                <asp:HiddenField runat="server" ID="hdnEdit" Value="0" />
                                                <asp:HiddenField runat="server" ID="hdnIdEmpleado" />
                                                <div class="col-xs-12  form-group">
                                                    <label>Nombre</label>
                                                    <input class="form-control" name="txtNombre" id="txtNombre" runat="server" type="text" />
                                                </div>
                                                <div class="col-xs-12 form-group">
                                                    <label>Apellido</label>
                                                    <input class="form-control" name="txtApellido" id="txtApellido" runat="server" type="text" />
                                                </div>
                                                <div class="col-xs-12 form-group">
                                                    <label>Cuil</label>
                                                    <input class="form-control" id="txtCuil" placeholder="Ingrese números sin guiones" runat="server" type="number" min="0" />
                                                </div>
                                                <div class="col-xs-12 form-group">
                                                    <label>Fecha Alta</label>
                                                    <asp:TextBox class="form-control" ID="txtFechaAlta" TextMode="Date" runat="server" />
                                                </div>
                                                <div class="col-xs-12 form-group">
                                                    <label>Fecha Baja</label>
                                                    <asp:TextBox CssClass="form-control" ID="txtFechaBaja" TextMode="Date" Enabled="false" runat="server" />
                                                </div>
                                                <div class="col-xs-12 form-group">
                                                    <label>Agrupación</label>
                                                    <select runat="server" id="ddlAgrupacion" class="form-control">
                                                        <option value="Maestranza">Maestranza</option>
                                                        <option value="Administrativos">Administrativos</option>
                                                        <option value="Otros">Otros</option>
                                                    </select>
                                                </div>
                                                <div class="col-xs-12 col-md-4 form-group">
                                                    <label>Categoría</label>
                                                    <select runat="server" id="ddlCategoria" class="form-control">
                                                        <option value="Primera">Primera</option>
                                                        <option value="Segunda">Segunda</option>
                                                        <option value="Tercera">Tercera</option>
                                                        <option value="Cuarta">Cuarta</option>
                                                        <option value="Quinta">Quinta</option>
                                                    </select>
                                                </div>
                                                <div class="col-xs-12 col-md-4 form-group">
                                                    <label>Tipo de Contrato</label>
                                                    <select runat="server" id="ddlTipoContrato" class="form-control">
                                                        <option value="Permanente">Permanente</option>
                                                        <option value="Temporal">Temporal</option>
                                                    </select>
                                                </div>
                                                <div class="col-xs-12 col-md-4 form-group">
                                                    <label>Jornada</label>
                                                    <select runat="server" id="ddlJornada" class="form-control">
                                                        <option value="Parcial">Parcial</option>
                                                        <option value="Completa">Completa</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Modal Footer -->
                                        <div class="modal-footer">
                                            <button id="btnBaja" disabled type="button" class="btn alert-danger pull-left"
                                                onclick="ActivarFechaBaja()">
                                                Baja de Empleado
                                            </button>
                                            <button type="button" class="btn btn-default"
                                                data-dismiss="modal">
                                                Cerrar
                                            </button>
                                            <asp:Button Text="Guardar" ID="btnCargaEmpleado" runat="server" type="button" OnClick="btnCargaEmpleado_Click" class="btn btn-primary"></asp:Button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </section>
            </ContentTemplate>
        </asp:UpdatePanel>
        <!-- Aportes Section -->
        <section class="success" id="AportesContribucion">
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12 text-center">
                                <h2>Aporte y contribución</h2>
                            </div>
                        </div>
                        <br />
                        <br />
                        <div class="modal fade" id="myModalAp" role="dialog">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <!-- Modal Header -->
                                    <div class="modal-header">
                                        <button type="button" class="close"
                                            data-dismiss="modal">
                                            <span aria-hidden="true">&times;</span>
                                            <span class="sr-only">Close</span>
                                        </button>
                                        <h4 class="modal-title">Aporte y contribución</h4>
                                    </div>

                                    <!-- Modal Body -->
                                    <div class="modal-body pull-center">
                                        <label>Aportes:</label><label id="lblCalcAportes"></label><br />
                                        <label>Contribuciones:</label><label id="lblCalcContribuciones"></label><br />
                                        <label>Total:</label><label id="lblCalcTotal"></label>
                                    </div>

                                    <!-- Modal Footer -->
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12 col-md-4 form-group">
                                <label>Remuneración básica</label>
                                <asp:TextBox class="form-control" placeholder="Ingrese remuneración básica" ID="txtRemBas" runat="server" type="number" min="0" />
                            </div>
                            <div class="col-xs-12 col-md-4 form-group">
                                <label>Agrupación</label>
                                <select runat="server" id="selAgLibreDeuda" class="form-control">
                                    <option value="Maestranza">Maestranza</option>
                                    <option value="Administrativos">Administrativos</option>
                                </select>
                            </div>
                            <div class="col-xs-12 col-md-4 form-group">
                                <label>Categoría</label>
                                <select runat="server" id="selCatLibreDeuda" class="form-control">
                                    <option value="Primera">Primera</option>
                                    <option value="Segunda">Segunda</option>
                                    <option value="Tercera">Tercera</option>
                                    <option value="Cuarta">Cuarta</option>
                                    <option value="Quinta">Quinta</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12 col-md-12 form-group">
                                <asp:Button ID="btnCalcular" type="button" Text="Calcular" OnClick="btnCalcular_Click" class="btn btn-success btn-lg btn-block" runat="server" />
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </section>

        <!-- Libre Deuda Section -->
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <section id="Solicitud">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12 text-center">
                                <h2>Libre Deuda</h2>
                            </div>
                        </div>
                        <div class="modal fade" id="myModalSol" role="dialog">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <!-- Modal Header -->
                                    <div class="modal-header">
                                        <button type="button" class="close"
                                            data-dismiss="modal">
                                            <span aria-hidden="true">&times;</span>
                                            <span class="sr-only">Close</span>
                                        </button>
                                        <h4 class="modal-title">Solicitud libre deuda</h4>
                                    </div>

                                    <!-- Modal Body -->
                                    <div class="modal-body">
                                        <label class="solicitud">
                                            Se ha procesado el pedido correctamente y generado la solicitud Nro:
                                                <label id="lblSol" class="solicitud"></label>
                                        </label>
                                    </div>

                                    <!-- Modal Footer -->
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-xs-12 col-md-12 form-group">
                                <br />
                                <br />
                                <asp:Button Text="Solicitar" ID="btnSolicitar" OnClick="btnSolicitar_Click" class="btn btn-success btn-lg btn-block" runat="server" />
                            </div>
                        </div>

                    </div>
                </section>
            </ContentTemplate>
        </asp:UpdatePanel>
        <!-- Footer -->
        <footer class="text-center">
            <div class="footer-above">
            </div>
            <div class="footer-below">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            Copyright &copy; Ostep 2016
                   
                        </div>
                    </div>
                </div>
            </div>
        </footer>

        <!-- Scroll to Top Button (Only visible on small and extra-small screen sizes) -->
        <div class="scroll-top page-scroll hidden-sm hidden-xs hidden-lg hidden-md">
            <a class="btn btn-primary" href="#page-top">
                <i class="fa fa-chevron-up"></i>
            </a>
        </div>

        <!-- jQuery -->
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="vendor/bootstrap/js/bootstrap.min.js"></script>

        <!-- Plugin JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>

        <!-- Contact Form JavaScript -->
        <script src="js/jqBootstrapValidation.js"></script>
        <script src="js/contact_me.js"></script>

        <!-- Theme JavaScript -->
        <script src="js/freelancer.min.js"></script>

        <script type="text/javascript" src="https://cdn.datatables.net/1.10.13/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/1.10.13/js/dataTables.bootstrap.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/fixedheader/3.1.2/js/dataTables.fixedHeader.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/responsive/2.1.1/js/dataTables.responsive.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/responsive/2.1.1/js/responsive.bootstrap.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.15.1/jquery.validate.min.js"></script>
        <script type="text/javascript" src="js/script.js"></script>
    </form>

</body>

