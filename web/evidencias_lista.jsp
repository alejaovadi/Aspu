<!DOCTYPE html>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en" class="default-style">


    <!-- Mirrored from uxpowered.com/products/appwork/v100/html-demo/layouts_without-sidenav.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 07 Jun 2018 23:05:58 GMT -->
    <head>
        <title>Evidencias | ASPU</title>

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
        <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> -->
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

        <script>

            function cambiar(n) {
                // var i = document.getElementById("imgcambiar" + n);
                // i.style.display = "none";

                $("#imgcambiar" + n).fadeOut(100);

                $("#file" + n).fadeIn(2000);

                $("#select" + n).fadeIn(2000);

                $("#accion" + n).fadeOut(100);

                // document.getElementById("file" + n).style.display = "";


            }


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


        <!--    <script type='text/javascript' src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>-->
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

                                    <h4 class="d-flex flex-wrap justify-content-between align-items-center pt-3 mb-4">
                                        <ol class="breadcrumb font-weight-bold mb-3">
                                            <li class="breadcrumb-item"><a href="javascript:void(0)">
                                                    <i class="ion ion-ios-chatbubbles"></i> ASPU
                                                </a></li>
                                            <li class="breadcrumb-item"><a href="javascript:void(0)">Evidencias</a>
                                            </li>
                                            <li class="breadcrumb-item active">Ver Evidencias</li>
                                        </ol>
                                    </h4>

                                    <c:choose>

                                        <c:when test="${not empty noticia}">
                                            <div class="row">
                                                <div class="col-10" style="margin-bottom: 10px;">
                                                    <h5>Evidencias de la noticia: ${noticia.getTitulo()}</h5>
                                                </div>
                                                <div class="col-2">
                                                    <a href="evidencia_crear.jsp?id=${noticia.getId()}&nombre=${noticia.getTitulo()}" class="media align-items-center bg-lighter text-dark py-3 px-4">
                                                        <div class="ion ion-md-add-circle ui-w-30 text-center text-xlarge"></div>
                                                        <div class="media-body ml-3 text-center">
                                                            Agregar Nueva
                                                        </div>

                                                    </a>
                                                </div>
                                            </div>


                                        </c:when>

                                        <c:otherwise>

                                        </c:otherwise>
                                    </c:choose>

                                    <div class="row mt-5" style="width: 100%;">
                                        <div class="col-12">
                                            <div class="table-responsive">
                                                <table id="table2" class="table table-bordered table-hover">
                                                    <thead style="background: #f7f7f7">
                                                        <tr >
                                                            <th class="text-center">ID</th>
                                                            <th class="text-center">Nombre</th>
                                                            <th class="text-center">Descripcion</th>
                                                            <th class="text-center">Tipo</th>
                                                            <th class="text-center">Noticia</th>
                                                            <th class="text-center">Edicion</th>



                                                        </tr>
                                                    </thead>
                                                    <tbody>

                                                        <c:forEach items="${evidencias}" var="evidencia">
                                                            <tr id="fila${evidencia.getId()}">
                                                                <td class="align-center">${evidencia.getId()}</td>
                                                                <td class="align-center">${evidencia.getNombre()}</td>
                                                                <td class="align-center">${evidencia.getDescripcion()}</td>
                                                                <td class="align-center">${evidencia.getTipo()}</td>
                                                                <td class="align-center">${evidencia.getNoticiaId().getTitulo()}</td>



                                                                <td style="width: 120px;">
                                                                    <a type="button" id="act${evidencia.getId()}" class="btn btn-info btn-xs " data-toggle="modal" data-target="#myModal${evidencia.getId()}">
                                                                        <i class="fa fa-edit" title="Editar"></i> 
                                                                    </a>

                                                                    <a type="button" class="btn btn-danger btn-xs " data-toggle="modal" data-target="#myModalEliminar${evidencia.getId()}">
                                                                        <i class="fa fa-remove" title="Eliminar"></i> 
                                                                    </a>

                                                                    <a type="button" class="btn btn-secondary btn-xs " data-toggle="modal" data-target="#myModalVer${evidencia.getId()}">
                                                                        <i class="fa fa-search-plus" title="Ver"></i> 
                                                                    </a>

                                                                    <!-- Modal ACTUALIZAR -->
                                                                    <div id="myModal${evidencia.getId()}" class="modal fade" role="dialog">
                                                                        <div class="modal-dialog">

                                                                            <!-- Modal content-->
                                                                            <div class="modal-content">
                                                                                <div class="modal-header">
                                                                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                                    <h4 class="modal-title"></h4>
                                                                                </div>
                                                                                <div class="modal-body">
                                                                                    <h3 class="text-center">EDITAR EVIDENCIA</h3>
                                                                                    <p class="text-left">Editar el Registro ${evidencia.getId()}</p>

                                                                                    <form align="center" class="login" role="form" enctype="multipart/form-data" method="post" name="formagregar" action="Evidencia?action=cargar&accion=update&id=${evidencia.getNoticiaId().getId()}&ide=${evidencia.getId()}&ruta=${evidencia.getRuta()}">

                                                                                        <div class="row">
                                                                                            <div class="col-6">
                                                                                                <div style="margin-bottom: 20px;" class="form-group">
                                                                                                    <label for="documento">Nombre</label>
                                                                                                    <input style="width: 100%;" type="text" value="${evidencia.getNombre()}" class="form-control" id="nombre" placeholder="Nombre de la evidencia" name="nombre" required="">
                                                                                                </div>
                                                                                                <div style="margin-bottom: 20px;" class="form-group">
                                                                                                    <label for="documento">Archivo</label>
                                                                                                    <input style="display: none;" type="file" class="form-control" placeholder="Archivo" name="file" id="file${evidencia.getId()}">
                                                                                                    <div style="text-align: center; ">


                                                                                                        <c:choose>
                                                                                                            <c:when test="${evidencia.getTipo() == '.pdf'}">
                                                                                                                <a style="width: 100%;" href="${evidencia.getRuta()}" id="imgcambiar${evidencia.getId()}" class="media align-items-center bg-lighter text-dark py-3 px-4">

                                                                                                                    <div class="ion ion-md-document ui-w-30 text-center text-xlarge"></div>
                                                                                                                    <div class="media-body ml-3">
                                                                                                                        ${evidencia.getNombre()}
                                                                                                                        <div class="text-muted small">${evidencia.getDescripcion()}</div>
                                                                                                                    </div>

                                                                                                                </a>
                                                                                                            </c:when>
                                                                                                            <c:otherwise>
                                                                                                                <img id="imgcambiar${evidencia.getId()}" src="${evidencia.getRuta()}" style="border-radius: 30%; width: 200px; margin-bottom: 10px;" alt="${evidencia.getNombre()}">    

                                                                                                            </c:otherwise>
                                                                                                        </c:choose>



                                                                                                        <a href="#" id="accion${evidencia.getId()}" onclick="cambiar(${evidencia.getId()})" class="sidenav-link sidenav">
                                                                                                            <i class="sidenav-icon ion ion-md-swap"> Cambiar Archivo </i>
                                                                                                        </a>


                                                                                                    </div>
                                                                                                </div>

                                                                                                <div id="select${evidencia.getId()}" style="display: none;" class="form-group">
                                                                                                    <label for="tipo">Tipo Archivo</label>
                                                                                                    <select class="form-control" id="tipo" name="tipo" required="">
                                                                                                        <option value="p">Archivo Pdf</option>
                                                                                                        <option value="i">Archivo Imagen</option>
                                                                                                    </select>
                                                                                                </div>

                                                                                            </div>
                                                                                            <div class="col-6">
                                                                                                <div style="margin-bottom: 20px;" class="form-group">
                                                                                                    <label for="nombre">Descripcion</label>
                                                                                                    <input style="width: 100%;" type="text" value="${evidencia.getDescripcion()}" class="form-control" id="descripcion" placeholder="Descripcion de la evidencia" name="descripcion" required="">

                                                                                                </div>

                                                                                            </div>
                                                                                            <div class="col-4 offset-4">
                                                                                                <div style="display: none; color: red;" class="text-center" id="msj"></div>
                                                                                                <input type="submit" value="Editar" class="btn btnf btn-primary">
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



                                                                    <!-- Modal Eliminar -->
                                                                    <div id="myModalEliminar${evidencia.getId()}" class="modal fade" role="dialog">
                                                                        <div class="modal-dialog modal-sm">

                                                                            <!-- Modal content-->
                                                                            <div class="modal-content">
                                                                                <div class="modal-header">
                                                                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                                    <h4 class="modal-title"></h4>
                                                                                </div>
                                                                                <div class="modal-body">
                                                                                    <h3 class="text-center">ELIMINAR EVIDENCIA</h3>
                                                                                    <p class="text-center">Esta seguro que desea Eliminar esta Evidencia: <strong>${evidencia.getNombre()}</strong> ?</p>

                                                                                    <c:choose>
                                                                                        <c:when test="${evidencia.getTipo() == '.pdf'}">
                                                                                            <a href="${evidencia.getRuta()}" class="media align-items-center bg-lighter text-dark py-3 px-4">

                                                                                                <div class="ion ion-md-document ui-w-30 text-center text-xlarge"></div>
                                                                                                <div class="media-body ml-3">
                                                                                                    ${evidencia.getNombre()}
                                                                                                    <div class="text-muted small">${evidencia.getDescripcion()}</div>
                                                                                                </div>

                                                                                            </a>
                                                                                        </c:when>
                                                                                        <c:otherwise>
                                                                                            <div style="text-align: center; ">
                                                                                                <img src="${evidencia.getRuta()}" style="width: 200px; margin-bottom: 10px;" alt="${evidencia.getNombre()}">    
                                                                                            </div>  
                                                                                        </c:otherwise>
                                                                                    </c:choose>


                                                                                    <div class="text-center">
                                                                                        <a href="Evidencia?action=delete&id=${evidencia.getId()}&not=${noticia.getId()}" class="btn btn-danger">Eliminar</a>
                                                                                    </div>

                                                                                </div>
                                                                                <div class="modal-footer">
                                                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                                                </div>
                                                                            </div>

                                                                        </div>
                                                                    </div>

                                                                    <!-- Modal Ver -->

                                                                    <div class="modal fade" id="myModalVer${evidencia.getId()}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">

                                                                        <div class="modal-dialog" role="document">
                                                                            <div class="">
                                                                                <div class="modal-body" style="background: #f7f7f7">
                                                                                    <button type="button" class="close" style="height: 15px;" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>


                                                                                    <div class="row" style="height: 20px"></div>
                                                                                    <div class="text-center">

                                                                                        <c:choose>

                                                                                            <c:when test="${evidencia.getTipo() == '.pdf'}">
                                                                                                <a href="${evidencia.getRuta()}" class="media align-items-center bg-lighter text-dark py-3 px-4">

                                                                                                    <div class="ion ion-md-document ui-w-30 text-center text-xlarge"></div>
                                                                                                    <div class="media-body ml-3">
                                                                                                        ${evidencia.getNombre()}
                                                                                                        <div class="text-muted small">${evidencia.getDescripcion()}</div>
                                                                                                    </div>

                                                                                                </a>
                                                                                            </c:when>
                                                                                            <c:otherwise>
                                                                                                <img src="${evidencia.getRuta()}" style="width: 500px;" alt="${evidencia.getNombre()}">
                                                                                            </c:otherwise>
                                                                                        </c:choose>

                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                </td>

                                                            </c:forEach>
                                                        </tr>
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