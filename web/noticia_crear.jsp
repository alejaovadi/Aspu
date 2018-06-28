<!DOCTYPE html>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en" class="default-style">


    <!-- Mirrored from uxpowered.com/products/appwork/v100/html-demo/layouts_without-sidenav.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 07 Jun 2018 23:05:58 GMT -->
    <head>
        <title>Noticias | ASPU</title>

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
                                            <li class="breadcrumb-item"><a href="javascript:void(0)">Noticias</a>
                                            </li>
                                            <li class="breadcrumb-item active">Registrar Noticia</li>
                                        </ol>
                                    </h4>

                                    <form action="Noticia?action=save" method="post">
                                        <div class="row">
                                            <div class="col-6">
                                                <div class="form-group">
                                                    <label for="documento">Titulo</label>
                                                    <input type="text" class="form-control" id="titulo" placeholder="Titulo de la Noticia" name="titulo" required="">
                                                </div>
                                                <div class="form-group">
                                                    <label for="nombre">Descripcion</label>
                                                    <textarea class="form-control" id="descripcion" placeholder="Descripcion de la Noticia" name="descripcion" required=""></textarea>
                                                </div>

                                            </div>
                                            <div class="col-6">
                                                <div class="form-group">
                                                    <label for="celular">Autor</label>
                                                    <input type="text" class="form-control" id="autor" placeholder="Autor de la Noticia" name="autor" required="">
                                                </div>

                                            </div>
                                            <div class="col-4 offset-4">
                                                <div style="display: none; color: red;" class="text-center" id="msj"></div>
                                                <input type="submit" value="Registrar" class="btn btnf btn-primary">
                                            </div>
                                        </div> 
                                    </form>

                                </main>



                                <c:choose>

                                    <c:when test="${not empty registro}">


                                        <script>
        $("#msj").html("<br> Registro Exitoso");
        $("#msj").slideDown("slow").delay(3000).slideUp("fast");
                                        </script>

                                    </c:when>

                                    <c:otherwise>

                                    </c:otherwise>
                                </c:choose>


                            </div>
                            <!--
                            <form method="post" action="registrar_noticia.jsp">
                             
                                <input type="hidden" name="noticia_html" id="noticia_html">
                                <input type="hidden" name="noticia_delta" id="noticia_delta">
                                <div class="card">
                                    <div class="card-body media align-items-center">
                                        <img src="assets_/img/avatars/1-small.png"
                                             class="d-block ui-w-40 rounded-circle" alt="">
                                        <div class="media-body ml-3">
                                            <a href="javascript:void(0)" class="d-block text-dark"> <strong>Administrador</strong>
                                                <span class="text-muted">@mgreene</span>
                                            </a> Created at 03/30/2018
                                        </div>
                                    </div>
                                    <hr class="m-0">

                                    <div class="card-body pb-2">


                                        <div class="form-group">
                                            <label class="form-label">Titulo</label> <input name="titulo"
                                                                                            type="text" class="form-control"
                                                                                            value="What Is The Big R For Marketing Your Business">
                                        </div>

                                        <div class="form-group">
                                            <label class="form-label">Asunto</label> <input name="asunto"
                                                                                            type="text" class="form-control"
                                                                                            value="what-is-the-big-r-for-marketing-your-business">
                                        </div>
                                        <div class="form-group">
                                            <label class="form-label">Categoria</label> <select
                                                name="categoria" class="custom-select">
                                                <option value="1">Educación</option>
                                                <option value="2">Politica</option>
                                                <option value="3">Administrativa</option>
                                            </select>
                                        </div>

                                        <div class="form-group">
                                            <label class="form-label">Contenido</label>
                                            <div id="article-editor-toolbar">
                                                <span class="ql-formats"> <select class="ql-font"></select>
                                                    <select class="ql-size"></select>
                                                </span> <span class="ql-formats">
                                                    <button class="ql-bold"></button>
                                                    <button class="ql-italic"></button>
                                                    <button class="ql-underline"></button>
                                                    <button class="ql-strike"></button>
                                                </span> <span class="ql-formats"> <select class="ql-color"></select>
                                                    <select class="ql-background"></select>
                                                </span> <span class="ql-formats">
                                                    <button class="ql-script" value="sub"></button>
                                                    <button class="ql-script" value="super"></button>
                                                </span> <span class="ql-formats">
                                                    <button class="ql-header" value="1"></button>
                                                    <button class="ql-header" value="2"></button>
                                                    <button class="ql-blockquote"></button>
                                                    <button class="ql-code-block"></button>
                                                </span> <span class="ql-formats">
                                                    <button class="ql-list" value="ordered"></button>
                                                    <button class="ql-list" value="bullet"></button>
                                                    <button class="ql-indent" value="-1"></button>
                                                    <button class="ql-indent" value="+1"></button>
                                                </span> <span class="ql-formats">
                                                    <button class="ql-direction" value="rtl"></button> <select
                                                        class="ql-align"></select>
                                                </span> <span class="ql-formats">
                                                    <button class="ql-link"></button>
                                                    <button class="ql-image"></button>
                                                    <button class="ql-video"></button>
                                                </span> <span class="ql-formats">
                                                    <button class="ql-clean"></button>
                                                </span>
                                            </div>
                                            <div id="article-editor" style="height: 400px"></div>
                                            <textarea id="article-editor-fallback"
                                                      class="form-control d-none" style="height: 400px"></textarea>
                                        </div>



                                    </div>
                                    <hr class="m-0">
                                    <div class="card-body pb-2">
                                        <h6 class="small font-weight-semibold mb-4">Meta datos</h6>


                                        <div class="form-group">
                                            <label class="form-label">Descripcion</label>
                                            <textarea name="descripcion" class="form-control" rows="3">Read What Is The Big R For Marketing Your Business</textarea>
                                        </div>

                                        <div class="form-group">
                                            <label class="form-label">Palabras claves</label> <input
                                                name="palabras_clave" type="text" class="form-control"
                                                value="Productivity, Creativity, Writing, Inspiration, Psychology">
                                        </div>
                                    </div>

                                </div>

                                <div class="text-right mt-3">
                                    <button type="submit" class="btn btn-primary">Save
                                        changes</button>
                                    &nbsp;
                                    <button type="button" class="btn btn-default">Cancel</button>
                                </div>
                            </form>
                            -->
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


    </body>


    <!-- Mirrored from uxpowered.com/products/appwork/v100/html-demo/layouts_without-sidenav.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 07 Jun 2018 23:05:58 GMT -->
</html>