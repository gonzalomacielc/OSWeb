<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Intranet.aspx.cs" Inherits="OSWeb.Intranet" %>

<!DOCTYPE html>
<html>
<head>
    <title>Intranet</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- styles -->
    <link href="css/styles.css" rel="stylesheet">

    <link href="//cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css" rel="stylesheet" />

    <link href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css" rel="stylesheet" />
    <link href="https://cdn.datatables.net/responsive/2.2.1/css/responsive.dataTables.min.css" rel="stylesheet" />

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
</head>
<body>
    <div class="header">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <!-- Logo -->
                    <div class="logo">
                        <h1><a href="index.html">Intranet</a></h1>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="row">
                        <div class="col-lg-12">
                            <%-- <div class="input-group form">
                                <input type="text" class="form-control" placeholder="Buscar...">
                                <span class="input-group-btn">
                                    <button class="btn btn-primary" type="button">Buscar</button>
                                </span>
                            </div>--%>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="navbar navbar-inverse" role="banner">
                        <nav class="collapse navbar-collapse bs-navbar-collapse navbar-right" role="navigation">
                            <ul class="nav navbar-nav">
                                <li class="dropdown">
                                    <a runat="server" id="usuario" href="#" class="dropdown-toggle" data-toggle="dropdown">My Account <b class="caret"></b></a>
                                    <ul class="dropdown-menu animated fadeInUp">                                       
                                        <li><a href="Register.aspx">Logout</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <form runat="server" id="formulario">
        <div class="page-content">
            <div class="row">
                <div class="col-md-2">
                    <div class="sidebar content-box" style="display: block;">
                        <ul class="nav">
                            <!-- Main menu -->
                            <li class="current"><a href="index.html"><i class="glyphicon glyphicon-home"></i>Principal</a></li>
                            <li><a href="calendar.html"><i class="glyphicon glyphicon-pencil"></i>Alta de Usuarios</a></li>
                            <%--<li><a href="stats.html"><i class="glyphicon glyphicon-stats"></i>Statistics (Charts)</a></li>
                            <li><a href="tables.html"><i class="glyphicon glyphicon-list"></i>Tables</a></li>
                            <li><a href="buttons.html"><i class="glyphicon glyphicon-record"></i>Buttons</a></li>
                            <li><a href="editors.html"><i class="glyphicon glyphicon-pencil"></i>Editors</a></li>
                            <li><a href="forms.html"><i class="glyphicon glyphicon-tasks"></i>Forms</a></li>--%>
                            <li class="submenu">
                                <a href="#">
                                    <i class="glyphicon glyphicon-list"></i>Pages
                           
                                <span class="caret pull-right"></span>
                                </a>
                                <!-- Sub menu -->
                                <ul>
                                    <li><a href="login.html">Login</a></li>
                                    <li><a href="signup.html">Signup</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-10">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="content-box-large">
                                <div class="row">
                                    <div class="col-lg-12 text-center">
                                        <br />
                                        <%--                                        <div class="row">
                                            <div class="input-group col-md-6 col-md-offset-3">
                                                <asp:TextBox runat="server" type="text" class="form-control input-lg" ID="txtBusquedaEmpleador" placeholder="Buscar por cuit/cuit, razón social, nombre de fantasia o apellido" />
                                                <span class="input-group-btn">
                                                    <asp:LinkButton class="btn btn-info btn-lg" ID="btnEmpleador" OnClick="btnEmpleador_Click" runat="server" type="button">
                                                    <i class="glyphicon glyphicon-search"></i>
                                                    </asp:LinkButton>
                                                </span>
                                            </div>
                                        </div>--%>
                                        <h2>Empleadores                           
                                        </h2>
                                        <br />
                                        <div class="row">
                                            <div id="busqueda" class="input-group col-md-10 col-md-offset-1">
                                                <div>
                                                    <div id="spinner" class="spinner" style="display: none;">
                                                        <div id="loader" class="loader">Loading...</div>
                                                    </div>
                                                    <table id="tEmpleador" class="display nowrap">
                                                        <thead>
                                                            <tr>
                                                                <th>Id</th>
                                                                <th>Razón Social</th>
                                                                <th>Nombre Fantasía</th>
                                                                <th>Cuit</th>
                                                                <th>Teléfono Principal</th>
                                                                <th>Teléfono Secundario</th>
                                                                <th>Dirección</th>
                                                                <th>Localidad</th>
                                                                <th>Provincia</th>
                                                                <th>Email</th>
                                                                <th>Solicitud</th>

                                                            </tr>
                                                        </thead>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                        <h2>Empleados                          
                                        </h2>
                                        <br />
                                        <div class="row">
                                            <div  class="input-group col-md-10 col-md-offset-1">
                                                <table id="tEmpleados" class="display responsive nowrap">
                                                    <thead>
                                                        <tr>
                                                            <th>Nombre</th>
                                                            <th>Apellido</th>
                                                            <th>Cuil</th>
                                                            <th>Agrupación</th>
                                                            <th>Categoría</th>
                                                            <th>Fecha Alta</th>
                                                            <th>Fecha Baja</th>
                                                        </tr>
                                                    </thead>
                                                </table>
                                            </div>
                                        </div>

                                        <h2>Solicitudes                          
                                        </h2>
                                        <br />
                                        <div class="row">
                                            <div  class="input-group col-md-10 col-md-offset-1">
                                                <table id="tSolicitudes" class="display responsive nowrap">
                                                    <thead>
                                                        <tr>
                                                            <th>Id</th>
                                                            <th>Empleador</th>                                                            
                                                            <th>Fecha Solicitud</th>
                                                            <th>Estado</th>
                                                            <th>Tipo Solicitud</th>
                                                            <th>Responsable</th>
                                                            <th>Sector</th>
                                                        </tr>
                                                    </thead>
                                                </table>
                                            </div>
                                        </div>


                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%--<div class="col-md-6">
                            <div class="content-box-large">
                                <div class="row">
                                    <div class="col-lg-12 text-center">
                                        <h2>Empleados                             
                                        </h2>
                                        <br />
                                        <div class="input-group col-md-9 col-md-offset-2">
                                            <input type="text" class="form-control input-lg" placeholder="Buscar por CUIL, Nombre o Apellido" />
                                            <span class="input-group-btn">
                                                <asp:LinkButton runat="server" CssClass="btn btn-info btn-lg" OnClick="btnEmpleados_Click" ID="btnEmpleados" type="button">
                                                    <i class="glyphicon glyphicon-search"></i>
                                                </asp:LinkButton>
                                            </span>
                                            <br />
                                            <br />
                                            <div class="col-xs-12 col-lg-12 text-center">
                                                <asp:GridView ID="gvEmpleados" runat="server" CssClass="table table-striped table-bordered nowrap" DataKeyNames="IDEmpleado"
                                                    ForeColor="Black" AutoGenerateColumns="false">
                                                    <HeaderStyle BackColor="#D2D2D2" Font-Bold="True" ForeColor="White" />
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="Cuit">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblCuit" runat="server" Text='<%# Eval("Cuit") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
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
                                                    </Columns>
                                                </asp:GridView>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>--%>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 panel-warning">
                    <div class="content-box-header panel-heading">
                        <div class="panel-title ">New vs Returning Visitors</div>

                        <div class="panel-options">
                            <a href="#" data-rel="collapse"><i class="glyphicon glyphicon-refresh"></i></a>
                            <a href="#" data-rel="reload"><i class="glyphicon glyphicon-cog"></i></a>
                        </div>
                    </div>
                    <div class="content-box-large box-with-header">
                        Pellentesque luctus quam quis consequat vulputate. Sed sit amet diam ipsum. Praesent in pellentesque diam, sit amet dignissim erat. Aliquam erat volutpat. Aenean laoreet metus leo, laoreet feugiat enim suscipit quis. Praesent mauris mauris, ornare vitae tincidunt sed, hendrerit eget augue. Nam nec vestibulum nisi, eu dignissim nulla.
					
                            <br />
                        <br />
                    </div>
                </div>
            </div>

          <%--  <div class="content-box-large">
                Vivamus suscipit dui id tristique venenatis. Integer vitae dui egestas, ultrices augue et, luctus arcu. Sed pharetra lectus eget velit consequat, in dictum felis fringilla. Suspendisse vitae rutrum urna, quis malesuada tellus. Praesent consectetur gravida feugiat. In mi orci, malesuada sit amet lectus quis, tempor sollicitudin nibh. Nam ut nibh sit amet lorem facilisis adipiscing. Mauris condimentum ornare enim ut aliquet. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Vivamus molestie massa at accumsan luctus. Aenean ultricies elementum posuere. Praesent ut felis id metus auctor egestas at id augue.
			
                    <br />
                <br />
                Sed gravida augue risus, in lacinia augue euismod at. Vestibulum pharetra sem nibh. Mauris a enim vel sapien dignissim commodo. Ut tristique fringilla diam, vel pulvinar ligula laoreet euismod. Curabitur sit amet pretium tortor. Nullam tincidunt ultrices metus, a cursus nulla mattis in. Ut risus lorem, fringilla vitae risus quis, ullamcorper elementum nunc. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Ut lobortis risus at convallis dictum. Cras luctus, leo ac vestibulum ultrices, justo mi iaculis libero, non gravida arcu erat ut augue. Ut facilisis mollis quam, ut vestibulum magna placerat eu. Integer vulputate odio a lectus tincidunt placerat viverra vel est.
			
                    <br />
                <br />
                Ut non tincidunt felis. Aliquam urna lacus, dictum vitae dignissim id, molestie vel urna. Quisque et auctor eros, a vulputate nibh. Praesent et dictum risus, vitae congue arcu. In convallis urna non convallis suscipit. Etiam auctor erat nec felis laoreet fringilla. In quis tortor sit amet arcu tempus elementum. In urna tellus, accumsan eget feugiat quis, commodo sit amet dolor. Sed pharetra leo id dignissim tincidunt. Phasellus ac consectetur massa, eu feugiat enim. Phasellus a porta ipsum. Nullam sit amet erat ornare, interdum orci non, ullamcorper magna. Aenean dictum, mi vel tempus mattis, neque sem tincidunt turpis, vitae sollicitudin felis nulla in purus. Nunc vitae erat vitae nibh pellentesque adipiscing. In dignissim dolor vitae metus eleifend, at tincidunt massa luctus. Suspendisse id ligula non leo tincidunt tempor.
			
                    <br />
                <br />
                Nullam vel ligula arcu. Vivamus convallis libero auctor ante imperdiet, eget adipiscing nunc egestas. Quisque suscipit egestas mi tempor ornare. Fusce a tincidunt erat. Quisque quis risus adipiscing, eleifend dolor vel, ornare risus. Curabitur leo tortor, tempor at iaculis id, elementum sed tellus. Vestibulum sagittis quis mi ut lobortis. Nullam quis mattis diam, feugiat pulvinar sem.
			
                    <br />
                <br />
                Duis iaculis enim eu massa rhoncus, a aliquam lorem sollicitudin. Sed elementum, dolor sit amet interdum euismod, orci diam vestibulum leo, vel mattis justo sapien in justo. Aenean gravida dolor eu rutrum porta. Quisque mattis, justo quis lacinia pharetra, tortor eros aliquet dolor, et consectetur felis massa eget mi. Aenean dapibus leo erat, ac molestie nibh rhoncus sed. Nam pretium purus et elit convallis facilisis. Vivamus vitae dolor sit amet ante faucibus ornare eu non diam. Donec felis leo, malesuada eu lectus ac, facilisis posuere lorem.
			
                    <br />
                <br />
                Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur porta eu justo non tempor. Pellentesque auctor ultrices rhoncus. Nullam ac aliquam purus. Ut eros elit, malesuada eu purus sed, lacinia imperdiet nibh. Ut vitae pretium nisl, a suscipit elit. Duis quis ornare quam, sed aliquam diam. Nulla condimentum ligula quis dolor tempus, et dictum leo mollis. Suspendisse non cursus lorem. Cras quis cursus tellus. Fusce tincidunt nisl id odio tempor placerat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed elementum arcu sed metus faucibus rhoncus. Vivamus porta lacinia nisl. Curabitur nec ornare est. Ut congue ullamcorper tortor, sit amet pulvinar lectus.
			
                    <br />
                <br />
                Curabitur bibendum accumsan felis, in cursus lectus porttitor sed. Aliquam quis est sit amet libero pretium suscipit a vitae velit. Cras sollicitudin suscipit justo ac consectetur. Nam vel iaculis enim. Quisque ut tristique sem. Suspendisse feugiat dignissim nisi nec luctus. Etiam tincidunt id nulla vel mollis. Pellentesque convallis velit at luctus vulputate. Suspendisse potenti. Nam eu elementum tellus, sit amet varius tortor. Aliquam erat volutpat. In mi magna, mattis id bibendum id, viverra quis mauris.
			
                    <br />
                <br />
                Nulla sed sem quis odio hendrerit rutrum ac sed nisl. Nulla sit amet nibh orci. Donec ornare mollis elit quis egestas. Sed euismod mollis accumsan. In dapibus arcu arcu, id condimentum lacus accumsan eget. Vivamus in sapien non nulla ultricies molestie. Fusce volutpat tellus quis mi laoreet accumsan. Nulla nec neque aliquet lorem scelerisque eleifend eu et leo.
			
                    <br />
                <br />
                Pellentesque id arcu et odio imperdiet laoreet. Nulla sed eros risus. Sed tellus odio, faucibus et odio eu, eleifend aliquet nisl. In porttitor odio pulvinar ligula tempor, bibendum lacinia metus mattis. Donec venenatis, tellus non aliquet lobortis, magna lorem ullamcorper urna, nec posuere metus lacus non tellus. Aenean condimentum, velit ac tincidunt volutpat, dolor metus pulvinar lacus, a commodo massa dolor eget magna. Ut hendrerit lectus sit amet malesuada tincidunt.
			
                    <br />
                <br />
                Ut tristique adipiscing mauris, sit amet suscipit metus porta quis. Donec dictum tincidunt erat, eu blandit ligula. Nam sit amet dolor sapien. Quisque velit erat, congue sed suscipit vel, feugiat sit amet enim. Suspendisse interdum enim at mi tempor commodo. Sed tincidunt sed tortor eu scelerisque. Donec luctus malesuada vulputate. Nunc vel auctor metus, vel adipiscing odio. Aliquam aliquet rhoncus libero, at varius nisi pulvinar nec. Aliquam erat volutpat. Donec ut neque mi. Praesent enim nisl, bibendum vitae ante et, placerat pharetra magna. Donec facilisis nisl turpis, eget facilisis turpis semper non. Maecenas luctus ligula tincidunt imperdiet luctus. Fusce lobortis metus id leo pellentesque, iaculis consequat lacus posuere.
			  
                    <br />
                <br />
                Pellentesque luctus quam quis consequat vulputate. Sed sit amet diam ipsum. Praesent in pellentesque diam, sit amet dignissim erat. Aliquam erat volutpat. Aenean laoreet metus leo, laoreet feugiat enim suscipit quis. Praesent mauris mauris, ornare vitae tincidunt sed, hendrerit eget augue. Nam nec vestibulum nisi, eu dignissim nulla.
			
                    <br />
                <br />
                Interdum et malesuada fames ac ante ipsum primis in faucibus. Quisque sed consectetur erat. Maecenas in elementum libero. Sed consequat pellentesque ultricies. Ut laoreet vehicula nisl sed placerat. Duis posuere lectus non ante iaculis tempor. Etiam ac gravida erat. Sed interdum elit a libero tincidunt placerat. Quisque molestie blandit sem vitae tincidunt. Aliquam feugiat, eros et hendrerit pellentesque, ante magna condimentum sapien, eget ultrices eros libero non orci. Etiam varius diam lectus, id tincidunt erat tempor nec. Praesent interdum, lectus vel dictum convallis, velit est fringilla arcu, eget sollicitudin nibh sem ut magna.
			
                    <br />
                <br />
                Vivamus suscipit dui id tristique venenatis. Integer vitae dui egestas, ultrices augue et, luctus arcu. Sed pharetra lectus eget velit consequat, in dictum felis fringilla. Suspendisse vitae rutrum urna, quis malesuada tellus. Praesent consectetur gravida feugiat. In mi orci, malesuada sit amet lectus quis, tempor sollicitudin nibh. Nam ut nibh sit amet lorem facilisis adipiscing. Mauris condimentum ornare enim ut aliquet. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Vivamus molestie massa at accumsan luctus. Aenean ultricies elementum posuere. Praesent ut felis id metus auctor egestas at id augue.
			
                    <br />
                <br />
                Sed gravida augue risus, in lacinia augue euismod at. Vestibulum pharetra sem nibh. Mauris a enim vel sapien dignissim commodo. Ut tristique fringilla diam, vel pulvinar ligula laoreet euismod. Curabitur sit amet pretium tortor. Nullam tincidunt ultrices metus, a cursus nulla mattis in. Ut risus lorem, fringilla vitae risus quis, ullamcorper elementum nunc. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Ut lobortis risus at convallis dictum. Cras luctus, leo ac vestibulum ultrices, justo mi iaculis libero, non gravida arcu erat ut augue. Ut facilisis mollis quam, ut vestibulum magna placerat eu. Integer vulputate odio a lectus tincidunt placerat viverra vel est.
			
                    <br />
                <br />
                Ut non tincidunt felis. Aliquam urna lacus, dictum vitae dignissim id, molestie vel urna. Quisque et auctor eros, a vulputate nibh. Praesent et dictum risus, vitae congue arcu. In convallis urna non convallis suscipit. Etiam auctor erat nec felis laoreet fringilla. In quis tortor sit amet arcu tempus elementum. In urna tellus, accumsan eget feugiat quis, commodo sit amet dolor. Sed pharetra leo id dignissim tincidunt. Phasellus ac consectetur massa, eu feugiat enim. Phasellus a porta ipsum. Nullam sit amet erat ornare, interdum orci non, ullamcorper magna. Aenean dictum, mi vel tempus mattis, neque sem tincidunt turpis, vitae sollicitudin felis nulla in purus. Nunc vitae erat vitae nibh pellentesque adipiscing. In dignissim dolor vitae metus eleifend, at tincidunt massa luctus. Suspendisse id ligula non leo tincidunt tempor.
			
                    <br />
                <br />
                Nullam vel ligula arcu. Vivamus convallis libero auctor ante imperdiet, eget adipiscing nunc egestas. Quisque suscipit egestas mi tempor ornare. Fusce a tincidunt erat. Quisque quis risus adipiscing, eleifend dolor vel, ornare risus. Curabitur leo tortor, tempor at iaculis id, elementum sed tellus. Vestibulum sagittis quis mi ut lobortis. Nullam quis mattis diam, feugiat pulvinar sem.
			
                    <br />
                <br />
                Duis iaculis enim eu massa rhoncus, a aliquam lorem sollicitudin. Sed elementum, dolor sit amet interdum euismod, orci diam vestibulum leo, vel mattis justo sapien in justo. Aenean gravida dolor eu rutrum porta. Quisque mattis, justo quis lacinia pharetra, tortor eros aliquet dolor, et consectetur felis massa eget mi. Aenean dapibus leo erat, ac molestie nibh rhoncus sed. Nam pretium purus et elit convallis facilisis. Vivamus vitae dolor sit amet ante faucibus ornare eu non diam. Donec felis leo, malesuada eu lectus ac, facilisis posuere lorem.
			
                    <br />
                <br />
                Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur porta eu justo non tempor. Pellentesque auctor ultrices rhoncus. Nullam ac aliquam purus. Ut eros elit, malesuada eu purus sed, lacinia imperdiet nibh. Ut vitae pretium nisl, a suscipit elit. Duis quis ornare quam, sed aliquam diam. Nulla condimentum ligula quis dolor tempus, et dictum leo mollis. Suspendisse non cursus lorem. Cras quis cursus tellus. Fusce tincidunt nisl id odio tempor placerat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed elementum arcu sed metus faucibus rhoncus. Vivamus porta lacinia nisl. Curabitur nec ornare est. Ut congue ullamcorper tortor, sit amet pulvinar lectus.
			
                    <br />
                <br />
                Curabitur bibendum accumsan felis, in cursus lectus porttitor sed. Aliquam quis est sit amet libero pretium suscipit a vitae velit. Cras sollicitudin suscipit justo ac consectetur. Nam vel iaculis enim. Quisque ut tristique sem. Suspendisse feugiat dignissim nisi nec luctus. Etiam tincidunt id nulla vel mollis. Pellentesque convallis velit at luctus vulputate. Suspendisse potenti. Nam eu elementum tellus, sit amet varius tortor. Aliquam erat volutpat. In mi magna, mattis id bibendum id, viverra quis mauris.
			
                    <br />
                <br />
                Nulla sed sem quis odio hendrerit rutrum ac sed nisl. Nulla sit amet nibh orci. Donec ornare mollis elit quis egestas. Sed euismod mollis accumsan. In dapibus arcu arcu, id condimentum lacus accumsan eget. Vivamus in sapien non nulla ultricies molestie. Fusce volutpat tellus quis mi laoreet accumsan. Nulla nec neque aliquet lorem scelerisque eleifend eu et leo.
			
                    <br />
                <br />
                Pellentesque id arcu et odio imperdiet laoreet. Nulla sed eros risus. Sed tellus odio, faucibus et odio eu, eleifend aliquet nisl. In porttitor odio pulvinar ligula tempor, bibendum lacinia metus mattis. Donec venenatis, tellus non aliquet lobortis, magna lorem ullamcorper urna, nec posuere metus lacus non tellus. Aenean condimentum, velit ac tincidunt volutpat, dolor metus pulvinar lacus, a commodo massa dolor eget magna. Ut hendrerit lectus sit amet malesuada tincidunt.
			
                    <br />
                <br />
                Ut tristique adipiscing mauris, sit amet suscipit metus porta quis. Donec dictum tincidunt erat, eu blandit ligula. Nam sit amet dolor sapien. Quisque velit erat, congue sed suscipit vel, feugiat sit amet enim. Suspendisse interdum enim at mi tempor commodo. Sed tincidunt sed tortor eu scelerisque. Donec luctus malesuada vulputate. Nunc vel auctor metus, vel adipiscing odio. Aliquam aliquet rhoncus libero, at varius nisi pulvinar nec. Aliquam erat volutpat. Donec ut neque mi. Praesent enim nisl, bibendum vitae ante et, placerat pharetra magna. Donec facilisis nisl turpis, eget facilisis turpis semper non. Maecenas luctus ligula tincidunt imperdiet luctus. Fusce lobortis metus id leo pellentesque, iaculis consequat lacus posuere.
			  
                    <br />
                <br />
                Pellentesque luctus quam quis consequat vulputate. Sed sit amet diam ipsum. Praesent in pellentesque diam, sit amet dignissim erat. Aliquam erat volutpat. Aenean laoreet metus leo, laoreet feugiat enim suscipit quis. Praesent mauris mauris, ornare vitae tincidunt sed, hendrerit eget augue. Nam nec vestibulum nisi, eu dignissim nulla.
			
                    <br />
                <br />
                Interdum et malesuada fames ac ante ipsum primis in faucibus. Quisque sed consectetur erat. Maecenas in elementum libero. Sed consequat pellentesque ultricies. Ut laoreet vehicula nisl sed placerat. Duis posuere lectus non ante iaculis tempor. Etiam ac gravida erat. Sed interdum elit a libero tincidunt placerat. Quisque molestie blandit sem vitae tincidunt. Aliquam feugiat, eros et hendrerit pellentesque, ante magna condimentum sapien, eget ultrices eros libero non orci. Etiam varius diam lectus, id tincidunt erat tempor nec. Praesent interdum, lectus vel dictum convallis, velit est fringilla arcu, eget sollicitudin nibh sem ut magna.
			
                    <br />
                <br />
                Vivamus suscipit dui id tristique venenatis. Integer vitae dui egestas, ultrices augue et, luctus arcu. Sed pharetra lectus eget velit consequat, in dictum felis fringilla. Suspendisse vitae rutrum urna, quis malesuada tellus. Praesent consectetur gravida feugiat. In mi orci, malesuada sit amet lectus quis, tempor sollicitudin nibh. Nam ut nibh sit amet lorem facilisis adipiscing. Mauris condimentum ornare enim ut aliquet. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Vivamus molestie massa at accumsan luctus. Aenean ultricies elementum posuere. Praesent ut felis id metus auctor egestas at id augue.
			
                    <br />
                <br />
                Sed gravida augue risus, in lacinia augue euismod at. Vestibulum pharetra sem nibh. Mauris a enim vel sapien dignissim commodo. Ut tristique fringilla diam, vel pulvinar ligula laoreet euismod. Curabitur sit amet pretium tortor. Nullam tincidunt ultrices metus, a cursus nulla mattis in. Ut risus lorem, fringilla vitae risus quis, ullamcorper elementum nunc. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Ut lobortis risus at convallis dictum. Cras luctus, leo ac vestibulum ultrices, justo mi iaculis libero, non gravida arcu erat ut augue. Ut facilisis mollis quam, ut vestibulum magna placerat eu. Integer vulputate odio a lectus tincidunt placerat viverra vel est.
			
                    <br />
                <br />
                Ut non tincidunt felis. Aliquam urna lacus, dictum vitae dignissim id, molestie vel urna. Quisque et auctor eros, a vulputate nibh. Praesent et dictum risus, vitae congue arcu. In convallis urna non convallis suscipit. Etiam auctor erat nec felis laoreet fringilla. In quis tortor sit amet arcu tempus elementum. In urna tellus, accumsan eget feugiat quis, commodo sit amet dolor. Sed pharetra leo id dignissim tincidunt. Phasellus ac consectetur massa, eu feugiat enim. Phasellus a porta ipsum. Nullam sit amet erat ornare, interdum orci non, ullamcorper magna. Aenean dictum, mi vel tempus mattis, neque sem tincidunt turpis, vitae sollicitudin felis nulla in purus. Nunc vitae erat vitae nibh pellentesque adipiscing. In dignissim dolor vitae metus eleifend, at tincidunt massa luctus. Suspendisse id ligula non leo tincidunt tempor.
			
                    <br />
                <br />
                Nullam vel ligula arcu. Vivamus convallis libero auctor ante imperdiet, eget adipiscing nunc egestas. Quisque suscipit egestas mi tempor ornare. Fusce a tincidunt erat. Quisque quis risus adipiscing, eleifend dolor vel, ornare risus. Curabitur leo tortor, tempor at iaculis id, elementum sed tellus. Vestibulum sagittis quis mi ut lobortis. Nullam quis mattis diam, feugiat pulvinar sem.
			
                    <br />
                <br />
                Duis iaculis enim eu massa rhoncus, a aliquam lorem sollicitudin. Sed elementum, dolor sit amet interdum euismod, orci diam vestibulum leo, vel mattis justo sapien in justo. Aenean gravida dolor eu rutrum porta. Quisque mattis, justo quis lacinia pharetra, tortor eros aliquet dolor, et consectetur felis massa eget mi. Aenean dapibus leo erat, ac molestie nibh rhoncus sed. Nam pretium purus et elit convallis facilisis. Vivamus vitae dolor sit amet ante faucibus ornare eu non diam. Donec felis leo, malesuada eu lectus ac, facilisis posuere lorem.
			
                    <br />
                <br />
                Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur porta eu justo non tempor. Pellentesque auctor ultrices rhoncus. Nullam ac aliquam purus. Ut eros elit, malesuada eu purus sed, lacinia imperdiet nibh. Ut vitae pretium nisl, a suscipit elit. Duis quis ornare quam, sed aliquam diam. Nulla condimentum ligula quis dolor tempus, et dictum leo mollis. Suspendisse non cursus lorem. Cras quis cursus tellus. Fusce tincidunt nisl id odio tempor placerat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed elementum arcu sed metus faucibus rhoncus. Vivamus porta lacinia nisl. Curabitur nec ornare est. Ut congue ullamcorper tortor, sit amet pulvinar lectus.
			
                    <br />
                <br />
                Curabitur bibendum accumsan felis, in cursus lectus porttitor sed. Aliquam quis est sit amet libero pretium suscipit a vitae velit. Cras sollicitudin suscipit justo ac consectetur. Nam vel iaculis enim. Quisque ut tristique sem. Suspendisse feugiat dignissim nisi nec luctus. Etiam tincidunt id nulla vel mollis. Pellentesque convallis velit at luctus vulputate. Suspendisse potenti. Nam eu elementum tellus, sit amet varius tortor. Aliquam erat volutpat. In mi magna, mattis id bibendum id, viverra quis mauris.
			
                    <br />
                <br />
                Nulla sed sem quis odio hendrerit rutrum ac sed nisl. Nulla sit amet nibh orci. Donec ornare mollis elit quis egestas. Sed euismod mollis accumsan. In dapibus arcu arcu, id condimentum lacus accumsan eget. Vivamus in sapien non nulla ultricies molestie. Fusce volutpat tellus quis mi laoreet accumsan. Nulla nec neque aliquet lorem scelerisque eleifend eu et leo.
			
                    <br />
                <br />
                Pellentesque id arcu et odio imperdiet laoreet. Nulla sed eros risus. Sed tellus odio, faucibus et odio eu, eleifend aliquet nisl. In porttitor odio pulvinar ligula tempor, bibendum lacinia metus mattis. Donec venenatis, tellus non aliquet lobortis, magna lorem ullamcorper urna, nec posuere metus lacus non tellus. Aenean condimentum, velit ac tincidunt volutpat, dolor metus pulvinar lacus, a commodo massa dolor eget magna. Ut hendrerit lectus sit amet malesuada tincidunt.
			
                    <br />
                <br />
            </div>--%>
        </div>
    </form>
    <footer>
        <div class="container">

            <div class="copy text-center">
                Copyright 2018 <a href='#'>Website</a>
            </div>

        </div>
    </footer>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://code.jquery.com/jquery.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="js/custom.js"></script>
    <script src="//cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/responsive/2.2.1/js/dataTables.responsive.min.js"></script>

    <script>

        function MostrarGrilla() {
            $.ajax({
                type: "POST",
                url: "Intranet.aspx/GetAllEmpleadores",
                //data: '{fechaInicial: "' + fecha1 + '", fechaFinal: "' + fecha2 + '", aeropuerto: "' + aeropuerto + '", tipotasa: "' + tipotasa + '", aerolinea: "' + aerolinea + '", fpoc: "' + fpoc + '", ubicacion: "' + ubicacion + '", vuelo: "' + vuelo + '", uhoras: "' + uhoras + '", horaini: "' + horaini + '", horafin: "' + horafin + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    table = $('#tEmpleador').DataTable();
                    table.clear();
                    table.rows.add(data.d);
                    table.draw();
                },
                error: function (msg) {
                    alert(msg.d);
                }
            });


            $.ajax({
                type: "POST",
                url: "Intranet.aspx/getLastSolicitudes",
                //data: '{fechaInicial: "' + fecha1 + '", fechaFinal: "' + fecha2 + '", aeropuerto: "' + aeropuerto + '", tipotasa: "' + tipotasa + '", aerolinea: "' + aerolinea + '", fpoc: "' + fpoc + '", ubicacion: "' + ubicacion + '", vuelo: "' + vuelo + '", uhoras: "' + uhoras + '", horaini: "' + horaini + '", horafin: "' + horafin + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    table = $('#tSolicitudes').DataTable();
                    table.clear();
                    table.rows.add(data.d);
                    table.draw();
                },
                error: function (msg) {
                    alert(msg.d);
                }
            });


        }

        $(document).ready(function () {

            var $loading = $('#spinner').hide();
            $(document)
                .ajaxStart(function () {
                    $loading.show();
                })
                .ajaxStop(function () {
                    $loading.hide();

                });

            $('#tEmpleador').DataTable({

                scrollY: "390px",
                scrollCollapse: true,
                //Para agregar estilos a columnas individualmente 
                //columnDefs: [
                //{ 'className': 'dt-center my_class', 'targets': [1, 3, 5] },
                // { 'className': 'dt-center my_class2', 'targets': [0, 2, 4] }
                //],
                columnDefs: [
                    { 'className': 'dt-center', 'targets': ['_all'] },
                    { 'visible': false, 'targets': 0 }

                ],
                //responsive: true,
                dom: 'Bfrtip',
                lengthMenu: [
                    [5, 20, -1],
                    ['5 registros', '20 registros', 'Todos']
                ],
                language: {
                    url: "//cdn.datatables.net/plug-ins/1.10.15/i18n/Spanish.json"
                },
                buttons: [
                    //'pageLength', 'copy', 'csv', 'excel', 'pdf', 'print'
                    {
                        extend: 'pageLength',
                        text: 'Mostrar'
                    },
                    {
                        extend: 'copy',
                        text: 'Copiar'
                    },
                    {
                        extend: 'excel',
                        text: 'Excel'
                    },
                    {
                        extend: 'print',
                        text: 'Imprimir'
                    },
                    {
                        extend: 'csv',
                        text: 'Csv'
                    },
                    {
                        extend: 'pdf',
                        text: 'Pdf'
                    }

                ],
                columns: [
                    { data: "IdEmpleador" },
                    { data: "RazonSocial" },
                    { data: "NombreFantasia" },
                    { data: "Cuit" },
                    { data: "TelefonoPrincipal" },
                    { data: "TelefonoSecundario" },
                    { data: "Direccion" },
                    { data: "Localidad" },
                    { data: "Provincia" },
                    { data: "Email" },
                    {
                        "defaultContent": '<button class="btn-view" type="button">Agregar</button>'

                    }

                ]

            });

            $('#tEmpleados').DataTable({

                scrollY: "390px",
                scrollCollapse: true,


                //Para agregar estilos a columnas individualmente 
                //columnDefs: [
                //{ 'className': 'dt-center my_class', 'targets': [1, 3, 5] },
                // { 'className': 'dt-center my_class2', 'targets': [0, 2, 4] }
                //],
                columnDefs: [
                    { 'className': 'dt-center', 'targets': ['_all'] }

                ],
                responsive: true,
                dom: 'Bfrtip',
                lengthMenu: [
                    [5, 20, -1],
                    ['5 registros', '20 registros', 'Todos']
                ],
                language: {
                    url: "//cdn.datatables.net/plug-ins/1.10.15/i18n/Spanish.json"
                },
                buttons: [
                    //'pageLength', 'copy', 'csv', 'excel', 'pdf', 'print'
                    {
                        extend: 'pageLength',
                        text: 'Mostrar'
                    },
                    {
                        extend: 'copy',
                        text: 'Copiar'
                    },
                    {
                        extend: 'excel',
                        text: 'Excel'
                    },
                    {
                        extend: 'print',
                        text: 'Imprimir'
                    },
                    {
                        extend: 'csv',
                        text: 'Csv'
                    },
                    {
                        extend: 'pdf',
                        text: 'Pdf'
                    }

                ],
                columns: [
                    { data: "Nombre" },
                    { data: "Apellido" },
                    { data: "Cuil" },
                    { data: "Agrupacion" },
                    { data: "Categoria" },
                    { data: "FechaAlta" },
                    { data: "FechaBaja" }

                ]

            });

            $('#tSolicitudes').DataTable({

                scrollY: "390px",
                scrollCollapse: true,


                //Para agregar estilos a columnas individualmente 
                //columnDefs: [
                //{ 'className': 'dt-center my_class', 'targets': [1, 3, 5] },
                // { 'className': 'dt-center my_class2', 'targets': [0, 2, 4] }
                //],
                columnDefs: [
                    { 'className': 'dt-center', 'targets': ['_all'] }

                ],
                responsive: true,
                dom: 'Bfrtip',
                lengthMenu: [
                    [5, 20, -1],
                    ['5 registros', '20 registros', 'Todos']
                ],
                language: {
                    url: "//cdn.datatables.net/plug-ins/1.10.15/i18n/Spanish.json"
                },
                buttons: [
                    //'pageLength', 'copy', 'csv', 'excel', 'pdf', 'print'
                    {
                        extend: 'pageLength',
                        text: 'Mostrar'
                    },
                    {
                        extend: 'copy',
                        text: 'Copiar'
                    },
                    {
                        extend: 'excel',
                        text: 'Excel'
                    },
                    {
                        extend: 'print',
                        text: 'Imprimir'
                    },
                    {
                        extend: 'csv',
                        text: 'Csv'
                    },
                    {
                        extend: 'pdf',
                        text: 'Pdf'
                    }

                ],
                columns: [
                    { data: "IdSolicitud" },
                    { data: "Empleador" },
                    { data: "FechaSolicitud" },
                    { data: "Estado" },
                    { data: "TipoSolicitud" },
                    { data: "Responsable" },
                    { data: "Sector" }                 
                ]

            });


            MostrarGrilla();

            $('#tEmpleador tbody').on('click', 'tr', function () {
                table = $('#tEmpleador').DataTable();


                if (table.row(this).data() != undefined) {
                    var data = table.row(this).data();

                    var id = data.IdEmpleador;
                    //$('[id*="txtREG"]').attr('value', data.Regional);
                    //$('[id*="txtREG"]').val(data.Regional);       
                    $.ajax({
                        type: "POST",
                        url: "Intranet.aspx/GetEmpleadosByEmpleador",
                        data: '{idEmpleador: "' + id + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (data) {
                            table = $('#tEmpleados').DataTable();
                            table.clear();
                            table.rows.add(data.d);
                            table.draw();
                        },
                        error: function (msg) {
                            alert(msg.d);
                        }
                    });

                    $.ajax({
                        type: "POST",
                        url: "Intranet.aspx/GetSolicitudesByIdEmpleador",
                        data: '{idEmpleador: "' + id + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (data) {
                            table = $('#tSolicitudes').DataTable();
                            table.clear();
                            table.rows.add(data.d);
                            table.draw();
                        },
                        error: function (msg) {
                            alert(msg.d);
                        }
                    });

                }
            });
        });


    </script>

</body>
</html>
