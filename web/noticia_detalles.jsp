<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en" class="default-style">


    <!-- Mirrored from uxpowered.com/products/appwork/v100/html-demo/layouts_without-sidenav.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 07 Jun 2018 23:05:58 GMT -->
    <head>
        <title>Detalles Noticia | ASPU</title>

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
        <style type="text/css">
            .carousel img {
                max-height: 500px;
                margin: 0 auto;
            }
        </style>

        <script src="assets_/vendor/js/material-ripple.js"></script>
        <script src="assets_/vendor/js/layout-helpers.js"></script>

        <!-- Theme settings -->
        <!-- This file MUST be included after core stylesheets and layout-helpers.js in the <head> section -->
        <script src="assets_/vendor/js/theme-settings.js"></script>
        <script>
            window.themeSettings = new ThemeSettings({
                cssPath: 'assets_/vendor/css/rtl/',
                themesPath: 'assets_/vendor/css/rtl/'
            });
        </script>

        <!-- Core scripts -->
        <script src="assets_/vendor/js/pace.js"></script>
        <script src="assets_/vendor/js/jquery.min.js"></script>

        <!-- Libs -->
        <link rel="stylesheet"
              href="assets_/vendor/libs/perfect-scrollbar/perfect-scrollbar.css">
        <link rel="stylesheet" href="assets_/vendor/libs/quill/typography.css">
        <link rel="stylesheet" href="assets_/vendor/libs/quill/editor.css">

    </head>

    <body>
        <div class="page-loader">
            <div class="bg-primary"></div>
        </div>

        <!-- Layout wrapper -->
        <div class="layout-wrapper layout-1 layout-without-sidenav">
            <div class="layout-inner">

                <!-- Layout navbar -->

                <c:choose>

                    <c:when test="${not empty sessionScope.admin}">
                        <jsp:include page="layouts/header_admin.jsp" />
                    </c:when>

                    <c:otherwise>
                        <jsp:include page="layouts/header.jsp" />
                    </c:otherwise>
                </c:choose>
                <!-- / Layout navbar -->

                <!-- Layout container -->
                <div class="layout-container">

                    <!-- Layout content -->
                    <div class="layout-content">

                        <!-- Content -->    

                        <div class="container-fluid flex-grow-1 container-p-y">
                            <h4
                                class="d-flex flex-wrap justify-content-between align-items-center pt-3 mb-4">
                                <ol class="breadcrumb font-weight-bold mb-3">
                                    <li class="breadcrumb-item"><a href="javascript:void(0)">
                                            <i class="ion ion-ios-chatbubbles"></i> ASPU
                                        </a></li>
                                    <li class="breadcrumb-item"><a href="javascript:void(0)">Noticias</a>
                                    </li>
                                    <li class="breadcrumb-item active">Detalles noticia</li>
                                </ol>
                            </h4>

                            <div class="card mb-4">

                                <c:choose>

                                    <c:when test="${not empty n}">

                                        <div class="card-header">
                                            <div class="media flex-wrap align-items-center">
                                                <img src="assets_/img/avatars/3-small.png"
                                                     class="d-block ui-w-40 rounded-circle" alt>
                                                <div class="media-body ml-3">
                                                    <a href="javascript:void(0)">${n.getAutor()}</a>
                                                    <div class="text-muted small">${n.getFecha()}</div>
                                                </div>
                                                <div class="text-muted small ml-3">
                                                    <div>
                                                        Member since <strong>01/12/2017</strong>
                                                    </div>
                                                    <div>
                                                        <strong>1,234</strong> posts
                                                    </div>
                                                </div>
                                            </div>
                                        </div>





                                        <div class="card-body">
                                            <h3>${n.getTitulo()}</h3>
                                            <p>${n.getDescripcion()}</p>

                                            <c:forEach items="${evidencias}" var="evidencia">  

                                                <div id="contimg">
                                                    <a data-toggle="modal" data-target="#myModalVer${evidencia.getId()}">
                                                        <img src="${evidencia.getRuta()}"/>
                                                    </a> 
                                                    <h4 class="card-title">${evidencia.getNombre()}</h4>
                                                    <p class="card-text">${evidencia.getDescripcion()}</p>
                                                </div>


                                                <div class="modal fade" id="myModalVer${evidencia.getId()}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">

                                                    <div class="modal-dialog" role="document">
                                                        <div class="">
                                                            <div class="modal-body" style="background: #f7f7f7">
                                                                <button type="button" class="close" style="height: 15px;" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>


                                                                <div class="row" style="height: 20px"></div>
                                                                <div class="text-center">
                                                                    <img src="${evidencia.getRuta()}" style="width: 500px;" alt="Logo UFPS">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                            </c:forEach>

                                        </div>

                                        <div class="card-body">
                                            <c:forEach items="${pdfs}" var="pdf">  
                                                <a href="${pdf.getRuta()}" class="media align-items-center bg-lighter text-dark py-3 px-4">


                                                    <div class="ion ion-md-document ui-w-30 text-center text-xlarge"></div>
                                                    <div class="media-body ml-3">
                                                        ${pdf.getNombre()}
                                                        <div class="text-muted small">${pdf.getDescripcion()}</div>
                                                    </div>

                                                </a>
                                            </c:forEach>
                                        </div>


                                    </c:when>

                                    <c:otherwise>


                                    </c:otherwise>
                                </c:choose>
                                <div
                                    class="card-footer d-flex flex-wrap justify-content-between align-items-center px-0 pt-0 pb-3">
                                    <div class="px-4 pt-3">
                                        <a href="javascript:void(0)" class="text-muted"> <i
                                                class="ion ion-ios-heart-empty text-danger text-large align-middle"></i>&nbsp;
                                            <span class="align-middle">48</span>
                                        </a> <span class="text-muted ml-4"> <i
                                                class="ion ion-ios-eye text-lighter text-large align-middle"></i>&nbnbsp;
                                            <span class="align-middle">1,203</span>
                                        </span>
                                    </div>
                                    <div class="px-4 pt-3">
                                        <button type="button" class="btn btn-primary">
                                            <i class="ion ion-md-create"></i>&nbsp; Reply
                                        </button>
                                    </div>
                                </div>
                            </div>

                            <c:choose>

                                <c:when test="${not empty sessionScope.usuario}">
                                    <div class="card mb-3">
                                        <div class="card-body">
                                            <div class="media">
                                                <img src="assets_/img/avatars/avatar.png" alt
                                                     class="d-block ui-w-40 rounded-circle">
                                                <div class="media-body ml-4">
                                                    <div class="float-right text-muted small">22 May</div>
                                                    <a href="javascript:void(0)">${usuario.getNombre()}</a>
                                                    <div class="text-muted small">Member since 01/12/2017
                                                        &nbsp;·&nbsp; 345 posts</div>
                                                    <div class="mt-2">

                                                        <form action="NoticiaUsu?action=save&id=${n.getId()}" method="post">
                                                            <div class="row">
                                                                <div class="col-12">

                                                                    <div class="form-group">
                                                                        <label for="nombre">Comentar...</label>
                                                                        <textarea class="form-control" id="comentario" placeholder="Escribe tu comentario" name="comentario" required=""></textarea>
                                                                    </div>

                                                                </div>

                                                                <div class="col-2 offset-0">
                                                                    <input type="submit" id="btn_publicar" value="Publicar" class="btn btnf btn-default">
                                                                </div>
                                                            </div> 
                                                        </form>
                                                    </div>
                                                    <div class="small mt-2">

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>


                                </c:when>


                                <c:when test="${not empty sessionScope.admin}">
                                    <div class="card mb-3">
                                        <div class="card-body">
                                            <div class="media">
                                                <img src="assets_/img/avatars/avatar.png" alt
                                                     class="d-block ui-w-40 rounded-circle">
                                                <div class="media-body ml-4">
                                                    <div class="float-right text-muted small">22 May</div>
                                                    <a href="javascript:void(0)">${admin.getNombre()} - Admin</a>
                                                    <div class="text-muted small">Member since 01/12/2017
                                                        &nbsp;·&nbsp; 345 posts</div>
                                                    <div class="mt-2">

                                                        <form action="NoticiaUsu?action=save&id=${n.getId()}" method="post">
                                                            <div class="row">
                                                                <div class="col-12">

                                                                    <div class="form-group">
                                                                        <label for="nombre">Comentar...</label>
                                                                        <textarea class="form-control" id="comentario" placeholder="Escribe tu comentario" name="comentario" required=""></textarea>
                                                                    </div>

                                                                </div>

                                                                <div class="col-2 offset-0">
                                                                    <input type="submit" id="btn_publicar" value="Publicar" class="btn btnf btn-default">
                                                                </div>
                                                            </div> 
                                                        </form>
                                                    </div>
                                                    <div class="small mt-2">

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>


                                </c:when>

                                <c:otherwise>

                                    <div class="card mb-3">
                                        <div class="card-body">
                                            <div class="media">
                                                <img src="assets_/img/avatars/avatar.png" alt
                                                     class="d-block ui-w-40 rounded-circle">
                                                <div class="media-body ml-4">
                                                    <div class="float-right text-muted small">22 May</div>
                                                    <a href="javascript:void(0)">Visitante</a>
                                                    <div class="text-muted small">Member since 01/12/2017
                                                        &nbsp;·&nbsp; 345 posts</div>
                                                    <div class="mt-2">


                                                        <div class="row">
                                                            <div class="col-12">

                                                                <div class="form-group">
                                                                    <label style="width: 100%;" for="nombre">Quieres agregar un comentario?...</label>

                                                                    <a type="button" class="btn btn-default btn-group-xl" href="login.jsp" title="Inicia Sesion">
                                                                        Inicia Sesion   <i class="fa fa-user"></i> 
                                                                    </a>
                                                                </div>

                                                            </div>

                                                        </div> 

                                                    </div>
                                                    <div class="small mt-2">

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </c:otherwise>
                            </c:choose>


                            <c:forEach items="${comentarios}" var="comentario">
                                <div class="card mb-3">
                                    <div class="card-body">
                                        <div class="media">
                                            <img src="assets_/img/avatars/avatar.png" alt
                                                 class="d-block ui-w-40 rounded-circle">
                                            <div class="media-body ml-4">
                                                <div class="float-right text-muted small">${comentario.getFecha()}</div>
                                                <a href="javascript:void(0)">${comentario.getUsuarioUsuario().getNombre()}</a>
                                                <div class="text-muted small">Member since 01/12/2017
                                                    &nbsp;·&nbsp; 345 posts</div>
                                                <div class="mt-2">${comentario.getMensaje()}</div>
                                                <div class="small mt-2">

                                                    <c:choose>

                                                        <c:when test="${not empty sessionScope.usuario && sessionScope.usuario.getNombre() == comentario.getUsuarioUsuario().getNombre()}">

                                                            <a href="#" class="" data-toggle="modal" data-target="#myModalEliminar${comentario.getId()}">
                                                                <i class="ion ion-md-trash text-danger" title="Eliminar">&nbsp;</i>
                                                            </a>

                                                            <a href="#" class="" data-toggle="modal" data-target="#myModalEditar${comentario.getId()}">
                                                                <i class="ion ion-ios-create text-info" title="Editar">&nbsp;</i>
                                                            </a>

                                                            <!-- Modal Eliminar -->
                                                            <div id="myModalEliminar${comentario.getId()}" class="modal fade" role="dialog">
                                                                <div class="modal-dialog">

                                                                    <!-- Modal content-->
                                                                    <div class="modal-content">
                                                                        <div class="modal-header">
                                                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                            <h4 class="modal-title"></h4>
                                                                        </div>
                                                                        <div class="modal-body">
                                                                            <h3 class="text-center">ELIMINAR COMENTARIO</h3>
                                                                            <p class="text-justify">Esta seguro que desea Eliminar este Comentario: <strong>${comentario.getMensaje()}</strong> ?</p>

                                                                            <div style="text-align: center;">


                                                                                <a href="NoticiaUsu?action=deleteusu&com=${comentario.getId()}&id=${comentario.getNoticiaId().getId()}" class="btn btn-danger">Eliminar</a>


                                                                            </div>

                                                                        </div>
                                                                        <div class="modal-footer">
                                                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                                        </div>
                                                                    </div>

                                                                </div>
                                                            </div>


                                                            <!-- Modal Editar -->
                                                            <div id="myModalEditar${comentario.getId()}" class="modal fade" role="dialog">
                                                                <div class="modal-dialog">

                                                                    <!-- Modal content-->
                                                                    <div class="modal-content">
                                                                        <div class="modal-header">
                                                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                            <h4 class="modal-title"></h4>
                                                                        </div>
                                                                        <div class="modal-body">
                                                                            <h3 class="text-center">EDITAR COMENTARIO</h3>

                                                                            <form action="NoticiaUsu?action=update&id=${comentario.getNoticiaId().getId()}&com=${comentario.getId()}" method="post">
                                                                                <div class="row">
                                                                                    <div class="col-12">

                                                                                        <div class="form-group">
                                                                                            <label for="nombre"><a class="text-info"> ${comentario.getUsuarioUsuario().getNombre()}</a></label>
                                                                                            <textarea class="form-control" id="comentario" name="comentario" required=""> ${comentario.getMensaje()} </textarea>
                                                                                        </div>

                                                                                    </div>

                                                                                    <div class="col-6 offset-3">
                                                                                        <input type="submit" id="" value="Editar" class="btn btnf btn-default">
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

                                                        </c:when>




                                                        <c:when test="${not empty sessionScope.admin && sessionScope.admin.getNombre() == comentario.getUsuarioUsuario().getNombre()}">

                                                            <a href="#" class="" data-toggle="modal" data-target="#myModalEliminar${comentario.getId()}">
                                                                <i class="ion ion-md-trash text-danger" title="Eliminar">&nbsp;</i>
                                                            </a>

                                                            <a href="#" class="" data-toggle="modal" data-target="#myModalEditar${comentario.getId()}">
                                                                <i class="ion ion-ios-create text-info" title="Editar">&nbsp;</i>
                                                            </a>

                                                            <!-- Modal Eliminar -->
                                                            <div id="myModalEliminar${comentario.getId()}" class="modal fade" role="dialog">
                                                                <div class="modal-dialog">

                                                                    <!-- Modal content-->
                                                                    <div class="modal-content">
                                                                        <div class="modal-header">
                                                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                            <h4 class="modal-title"></h4>
                                                                        </div>
                                                                        <div class="modal-body">
                                                                            <h3 class="text-center">ELIMINAR COMENTARIO</h3>
                                                                            <p class="text-justify">Esta seguro que desea Eliminar este Comentario: <strong>${comentario.getMensaje()}</strong> ?</p>

                                                                            <div style="text-align: center;">


                                                                                <a href="NoticiaUsu?action=deleteusu&com=${comentario.getId()}&id=${comentario.getNoticiaId().getId()}" class="btn btn-danger">Eliminar</a>


                                                                            </div>

                                                                        </div>
                                                                        <div class="modal-footer">
                                                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                                        </div>
                                                                    </div>

                                                                </div>
                                                            </div>


                                                            <!-- Modal Editar -->
                                                            <div id="myModalEditar${comentario.getId()}" class="modal fade" role="dialog">
                                                                <div class="modal-dialog">

                                                                    <!-- Modal content-->
                                                                    <div class="modal-content">
                                                                        <div class="modal-header">
                                                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                            <h4 class="modal-title"></h4>
                                                                        </div>
                                                                        <div class="modal-body">
                                                                            <h3 class="text-center">EDITAR COMENTARIO</h3>

                                                                            <form action="NoticiaUsu?action=update&id=${comentario.getNoticiaId().getId()}&com=${comentario.getId()}" method="post">
                                                                                <div class="row">
                                                                                    <div class="col-12">

                                                                                        <div class="form-group">
                                                                                            <label for="nombre"><a class="text-info"> ${comentario.getUsuarioUsuario().getNombre()}</a></label>
                                                                                            <textarea class="form-control" id="comentario" name="comentario" required=""> ${comentario.getMensaje()} </textarea>
                                                                                        </div>

                                                                                    </div>

                                                                                    <div class="col-6 offset-3">
                                                                                        <input type="submit" id="" value="Publicar" class="btn btnf btn-default">
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

                                                        </c:when>



                                                        <c:when test="${not empty sessionScope.admin}">

                                                            <a href="#" class="" data-toggle="modal" data-target="#myModalEliminar${comentario.getId()}">
                                                                <i class="ion ion-md-trash text-danger" title="Eliminar">&nbsp;</i>
                                                            </a>                                                         

                                                            <!-- Modal Eliminar -->
                                                            <div id="myModalEliminar${comentario.getId()}" class="modal fade" role="dialog">
                                                                <div class="modal-dialog">

                                                                    <!-- Modal content-->
                                                                    <div class="modal-content">
                                                                        <div class="modal-header">
                                                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                            <h4 class="modal-title"></h4>
                                                                        </div>
                                                                        <div class="modal-body">
                                                                            <h3 class="text-center">ELIMINAR COMENTARIO</h3>
                                                                            <p class="text-justify">Esta seguro que desea Eliminar el comentario de 
                                                                                <a class="text-info"> ${comentario.getUsuarioUsuario().getNombre()}</a>
                                                                                : <strong>${comentario.getMensaje()}</strong> ?
                                                                            </p>
                                                                            <form action="NoticiaUsu?action=deleteusu&com=${comentario.getId()}&id=${comentario.getNoticiaId().getId()}" method="post">
                                                                                <div class="row">
                                                                                    <div class="col-12">
                                                                                        <div class="form-group">
                                                                                            <label for="razon">Razon</label>
                                                                                            <textarea class="form-control" id="asunto" placeholder="Razon por la que desea Eliminar el comentario" name="asunto" required=""></textarea>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-6 offset-3">
                                                                                        <div style="text-align: center;">
                                                                                            <input type="submit" value="Eliminar" class="btn btnf btn-danger">

                                                                                        </div>
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

                                                        </c:when>


                                                        <c:otherwise>

                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>




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

                $('#btn_publicar').click(function () {
                    var html = quill.root.innerHTML;
                    console.log(html);
                    var htmlCodificado = encodeURIComponent(html);
                    var idNoticia = 1; // esto lo pasa el servidor
                    $.ajax({
                        method: "POST",
                        url: "registrar_comentario",
                        data: {
                            id: idNoticia,
                            comentario: htmlCodificado
                        }
                    }).done(function (msg) {
                        alert(msg);
                    });
                });
            });
        </script>
    </body>


    <!-- Mirrored from uxpowered.com/products/appwork/v100/html-demo/layouts_without-sidenav.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 07 Jun 2018 23:05:58 GMT -->
</html>