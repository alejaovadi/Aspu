<!DOCTYPE html>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en" class="default-style">


    <!-- Mirrored from uxpowered.com/products/appwork/v100/html-demo/layouts_without-sidenav.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 07 Jun 2018 23:05:58 GMT -->
    <head>
        <title>Miembros | ASPU</title>

        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="IE=edge,chrome=1">
        <meta name="description" content="">
        <meta name="viewport"
              content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
        <link rel="icon" type="image/x-icon" href="favicon.ico">

        <link
            href="https://fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,500,500i,700,700i,900"
            rel="stylesheet">

        <!-- Icon fonts -->

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <link rel="stylesheet" href="assets_/vendor/fonts/fontawesome.css">
        <link rel="stylesheet" href="assets_/vendor/fonts/ionicons.css">
        <link rel="stylesheet" href="assets_/vendor/fonts/linearicons.css">
        <link rel="stylesheet" href="assets_/vendor/fonts/open-iconic.css">
        <link rel="stylesheet" href="assets_/vendor/fonts/pe-icon-7-stroke.css">

        <!-- Core stylesheets -->
        <link rel="stylesheet" href="assets_/vendor/css/rtl/bootstrap.css"
              class="theme-settings-bootstrap-css">
        <link rel="stylesheet" href="assets_/vendor/css/rtl/appwork.css"
              class="theme-settings-appwork-css">
        <link rel="stylesheet" href="assets_/vendor/css/rtl/theme-corporate.css"
              class="theme-settings-theme-css">
        <link rel="stylesheet" href="assets_/vendor/css/rtl/colors.css"
              class="theme-settings-colors-css">
        <link rel="stylesheet" href="assets_/vendor/css/rtl/uikit.css">
        <link rel="stylesheet" href="assets_/css/demo.css">
        <link rel="stylesheet" href="assets_/css/stilo.css">


        <link rel="stylesheet" href="plugins/datatables/dataTables.bootstrap.css">
        <link rel="stylesheet" href="lib/css/bootstrap.min.css">



        <script src="assets_/vendor/js/material-ripple.js"></script>
        <script src="assets_/vendor/js/layout-helpers.js"></script>

        <!-- Theme settings -->
        <!-- This file MUST be included after core stylesheets and layout-helpers.js in the <head> section -->
        <script src="assets_/vendor/js/theme-settings.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <script>
            window.themeSettings = new ThemeSettings({
                cssPath: 'assets_/vendor/css/rtl/',
                themesPath: 'assets_/vendor/css/rtl/'
            });
            $(document).ready(function () {

                $('#nav li').first().addClass("active").find('ul').show();
                $('#nav > li > a').click(function () {
                    if ($(this).attr('class') != 'active') {
                        $('#nav li ul').slideUp();
                        $(this).next().slideToggle();
                        $('#nav li a').removeClass('active');
                        $(this).addClass('active');
                    }
                });
            });


        </script>

        <!-- Core scripts -->
        <script src="assets_/vendor/js/pace.js"></script>
        <script src="assets_/vendor/js/jquery.min.js"></script>

        <!-- Libs -->
        <link rel="stylesheet"
              href="assets_/vendor/libs/perfect-scrollbar/perfect-scrollbar.css">
        <link rel="stylesheet"
              href="assets_/vendor/libs/bootstrap-tagsinput/bootstrap-tagsinput.css">
        <link rel="stylesheet" href="assets_/vendor/libs/quill/typography.css">
        <link rel="stylesheet" href="assets_/vendor/libs/quill/editor.css">
    </head>

    <body>
        <c:choose>
            <c:when test="${empty sessionScope.admin}">
                <c:redirect url="indexServlet"/>

            </c:when>
        </c:choose>
        <div class="page-loader">
            <div class="bg-primary"></div>
        </div>

        <!-- Layout wrapper -->
        <div class="layout-wrapper layout-1 layout-without-sidenav">
            <div class="layout-inner">

                <!-- Layout navbar -->
                <jsp:include page="layouts/header_admin.jsp" />
                <!-- / Layout navbar -->

                <!-- Layout container -->
                <div class="layout-container">

                    <!-- Layout content -->
                    <div class="layout-content">

                        <!-- Content -->
                        <div class="container-fluid flex-grow-1 container-p-y">
                            <div class="contenedor">
                                <main id="menu">
                                    <jsp:include page="layouts/menu_admin.jsp" />
                                </main>
                                <main id="main2">

                                    <h4
                                        class="d-flex flex-wrap justify-content-between align-items-center pt-3 mb-4">
                                        <ol class="breadcrumb font-weight-bold mb-3">
                                            <li class="breadcrumb-item"><a href="javascript:void(0)">
                                                    <i class="ion ion-ios-chatbubbles"></i> ASPU
                                                </a></li>
                                            <li class="breadcrumb-item"><a href="javascript:void(0)">Miembros</a>
                                            </li>
                                            <li class="breadcrumb-item active">Ver Miembros</li>
                                        </ol>
                                    </h4>

                                    <div class="row mt-5">
                                        <div class="col-12">
                                            <div class="table-responsive">
                                                <table id="table2" class="table table-bordered table-hover">
                                                    <thead>
                                                        <tr>
                                                            <th>
                                                                Id
                                                            </th>
                                                            <th>
                                                                Nombres
                                                            </th>                   
                                                            <th>
                                                                E-mail
                                                            </th>
                                                            <th>
                                                                Titulo
                                                            </th>
                                                            <th>
                                                                Descripcion
                                                            </th>
                                                            <th>
                                                                Telefono
                                                            </th>                   
                                                            <th>
                                                                Fecha
                                                            </th> 

                                                            <th>
                                                                Acciones
                                                            </th> 
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach items="${miembros}" var="miembro">
                                                            <tr>
                                                                <td>
                                                                    ${miembro.getId()}
                                                                </td>
                                                                <td>
                                                                    ${miembro.getNombres()}
                                                                </td>
                                                                <td>
                                                                    ${miembro.getEmail()}
                                                                </td>
                                                                <td>
                                                                    ${miembro.getTitulo()}
                                                                </td>
                                                                <td>
                                                                    ${miembro.getDescripcion()}
                                                                </td>
                                                                <td>
                                                                    ${miembro.getTelefono()}
                                                                </td>
                                                                <td>
                                                                    ${miembro.obtenerFecha()}
                                                                </td>

                                                                <td>

                                                                    <a type="button" class="btn btn-info btn-xs " data-toggle="modal" data-target="#myModal${miembro.getId()}">
                                                                        <i class="fa fa-edit" title="Editar"></i> 
                                                                    </a>

                                                                    <a type="button" class="btn btn-danger btn-xs " data-toggle="modal" data-target="#myModalEliminar${miembro.getId()}">
                                                                        <i class="fa fa-remove" title="Eliminar"></i> 
                                                                    </a>

                                                                 <!--   <a href="Miembro?action=delete&id=${miembro.getId()}" class="btn btn-danger">Eliminar</a>
                                                                    button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal${miembro.getId()}">Actualizar</button>
                                                                    -->

                                                                    <!-- Modal Eliminar -->
                                                                    <div id="myModalEliminar${miembro.getId()}" class="modal fade" role="dialog">
                                                                        <div class="modal-dialog modal-sm">

                                                                            <!-- Modal content-->
                                                                            <div class="modal-content">
                                                                                <div class="modal-header">
                                                                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                                    <h4 class="modal-title"></h4>
                                                                                </div>
                                                                                <div class="modal-body">
                                                                                    <h3 class="text-center">ELIMINAR MIEMBRO</h3>
                                                                                    <p class="text-center">Esta seguro que desea Eliminar este Miembro: <strong>${miembro.getNombres()}</strong> ?</p>

                                                                                    <div style="text-align: center;">
                                                                                        <a href="Miembro?action=delete&id=${miembro.getId()}" class="btn btn-danger">Eliminar</a>
                                                                                    </div>

                                                                                </div>
                                                                                <div class="modal-footer">
                                                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                                                </div>
                                                                            </div>

                                                                        </div>
                                                                    </div>



                                                                    <!-- Modal -->
                                                                    <div id="myModal${miembro.getId()}" class="modal fade" role="dialog">
                                                                        <div class="modal-dialog">

                                                                            <!-- Modal content-->
                                                                            <div class="modal-content">
                                                                                <div class="modal-header">
                                                                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                                    <h4 class="modal-title"></h4>
                                                                                </div>
                                                                                <div class="modal-body">
                                                                                    <h3 class="text-center">EDITAR MIEMBRO</h3>
                                                                                    <p class="text-left">Editar el Registro ${miembro.getId()}</p>

                                                                                    <form action="Miembro?action=update&id=${miembro.getId()}&fecha=${miembro.obtenerFecha()}" method="post">
                                                                                        <div class="row">
                                                                                            <div class="col-6">
                                                                                                <div style="margin-bottom: 20px;" class="form-group">
                                                                                                    <label for="documento">Nombres</label>
                                                                                                    <br>
                                                                                                    <input style="width: 100%;" type="text" class="form-control" value="${miembro.getNombres()}" id="nombre" placeholder="Nombres del miembro" name="nombre" required="">
                                                                                                </div>
                                                                                                <div style="margin-bottom: 20px;" class="form-group">
                                                                                                    <label for="nombre">E-mail</label>
                                                                                                    <br>
                                                                                                    <input style="width: 100%;" type="text" class="form-control" value="${miembro.getEmail()}" id="email" placeholder="Correo del miembro" name="email" required="">

                                                                                                </div>

                                                                                                <div style="margin-bottom: 20px;" class="form-group">
                                                                                                    <label for="nombre">Descripcion</label>
                                                                                                    <br>
                                                                                                    <input style="width: 100%;" type="text" value="${miembro.getDescripcion()}" class="form-control" id="descripcion" placeholder="Descripcion del miembro" name="descripcion" required="">

                                                                                                </div>

                                                                                            </div>
                                                                                            <div class="col-6">
                                                                                                <div style="margin-bottom: 20px;" class="form-group">
                                                                                                    <label for="celular">Telefono</label>
                                                                                                    <input style="width: 100%;" type="text" class="form-control" value="${miembro.getTelefono()}" id="tel" placeholder="Telefono del miembro" name="tel" required="">
                                                                                                </div>
                                                                                                <div style="margin-bottom: 20px;" class="form-group">
                                                                                                    <label for="nombre">Titulo</label>
                                                                                                    <input style="width: 100%;" type="text" value="${miembro.getTitulo()}" class="form-control" id="titulo" placeholder="Titulo del Miembro" name="titulo" required="">

                                                                                                </div>

                                                                                            </div>
                                                                                            <div class="col-4 offset-4">
                                                                                                <div style="display: none; color: red;" class="text-center" id="msj"></div>
                                                                                                <input type="submit" value="Registrar" class="btn btnf btn-primary">
                                                                                            </div>
                                                                                        </div> 
                                                                                    </form>

                                                                                </div>
                                                                                <div class="modal-footer">
                                                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                                                </div>
                                                                            </div>

                                                                        </div>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>

                                                </table>
                                            </div>
                                        </div>
                                    </div>

                                    <div style="display: none; color: red;" class="text-center" id="msj"></div>

                                    <c:choose>

                                        <c:when test="${not empty registro}">


                                            <script>
            $("#msj").html("<br> Actualizacion Exitosa");
            $("#msj").slideDown("slow").delay(3000).slideUp("fast");

                                            </script>

                                        </c:when>

                                        <c:otherwise>

                                        </c:otherwise>
                                    </c:choose>

                                </main>
                            </div>

                        </div>
                        <!-- / Content -->

                        <!-- Layout footer -->
                        <jsp:include page="layouts/footer.jsp" />
                        <!-- / Layout footer -->

                    </div>
                    <!-- Layout content -->

                </div>
                <!-- / Layout container -->


            </div>
        </div>
        <!-- / Layout wrapper -->

        <!-- Core scripts -->
        <script src="assets_/vendor/libs/popper/popper.js"></script>
        <script src="assets_/vendor/js/bootstrap.js"></script>
        <script src="assets_/vendor/js/sidenav.js"></script>

        <!-- Libs -->
        <script
        src="assets_/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
        <script
        src="assets_/vendor/libs/bootstrap-tagsinput/bootstrap-tagsinput.js"></script>
        <script>
            // Quill does not support IE 10 and below so don't load it to prevent console errors
            if (typeof document.documentMode !== 'number'
                    || document.documentMode > 10) {
                document
                        .write('\x3Cscript src="assets_/vendor/libs/quill/quill.js">\x3C/script>');
            }
        </script>

        <!-- Demo -->
        <script src="assets_/js/demo.js"></script>
        <script type="text/javascript">
            $(function () {

                if (!window.Quill) {
                    $('#article-editor,#article-editor-toolbar').remove();
                    $('#article-editor-fallback').removeClass('d-none');
                } else {
                    $('#article-editor-fallback').remove();
                    var quill = new Quill('#article-editor', {
                        modules: {
                            toolbar: '#article-editor-toolbar'
                        },
                        theme: 'snow'
                    });
                }

                quill.on('text-change', function (delta, oldDelta, source) {
                    if (source == 'user') {
                        var noticia_html = encodeURIComponent(quill.root.innerHTML);
                        $('#noticia_html').val(noticia_html);
                        $('#noticia_delta').val(JSON.stringify(quill.getContents()));
                    }
                });
            });
        </script>
        <script src="plugins/bootstrap.min.js" type="text/javascript"></script>
        <script src="plugins/jquery-1.10.2.js" type="text/javascript"></script>
        <script src="plugins/datatables/jquery.dataTables.min.js"></script>
        <script src="plugins/datatables/dataTables.bootstrap.min.js"></script>

        <script>


            $(function () {
                $("#table2").DataTable();
            });

        </script>
        <script>

        </script>


    </body>


    <!-- Mirrored from uxpowered.com/products/appwork/v100/html-demo/layouts_without-sidenav.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 07 Jun 2018 23:05:58 GMT -->
</html>