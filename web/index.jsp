<!DOCTYPE html>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en" class="default-style">


    <!-- Mirrored from uxpowered.com/products/appwork/v100/html-demo/layouts_without-sidenav.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 07 Jun 2018 23:05:58 GMT -->
    <head>
        <title>Inicio | ASPU</title>

        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/> 
        <meta http-equiv="x-ua-compatible" content="IE=edge,chrome=1">
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
        <link rel="icon" type="image/x-icon" href="favicon.ico">

        <link href="https://fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,500,500i,700,700i,900" rel="stylesheet">

        <!-- Icon fonts -->
        <link rel="stylesheet" href="assets_/vendor/fonts/fontawesome.css">
        <link rel="stylesheet" href="assets_/vendor/fonts/ionicons.css">
        <link rel="stylesheet" href="assets_/vendor/fonts/linearicons.css">
        <link rel="stylesheet" href="assets_/vendor/fonts/open-iconic.css">
        <link rel="stylesheet" href="assets_/vendor/fonts/pe-icon-7-stroke.css">

        <!-- Core stylesheets -->
        <link rel="stylesheet" href="assets_/vendor/css/rtl/bootstrap.css" class="theme-settings-bootstrap-css">
        <link rel="stylesheet" href="assets_/vendor/css/rtl/appwork.css" class="theme-settings-appwork-css">
        <link rel="stylesheet" href="assets_/vendor/css/rtl/theme-corporate.css" class="theme-settings-theme-css">
        <link rel="stylesheet" href="assets_/vendor/css/rtl/colors.css" class="theme-settings-colors-css">
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
        <link rel="stylesheet" href="assets_/vendor/libs/perfect-scrollbar/perfect-scrollbar.css">

    </head>

    <body>
        <div class="page-loader">
            <div class="bg-primary"></div>
        </div>

        <!-- Layout wrapper -->
        <div class="layout-wrapper layout-1 layout-without-sidenav">
            <div class="layout-inner">

                <!-- Layout navbar -->
                <jsp:include page="layouts/header.jsp" />
                <!-- / Layout navbar -->

                <!-- Layout container -->
                <div class="layout-container">

                    <!-- Layout content -->
                    <div class="layout-content">

                        <!-- Content -->
                        <div class="container-fluid flex-grow-1 container-p-y">
                            <div id="carouselExample" class="carousel slide" data-ride="carousel">
                                <ol class="carousel-indicators">
                                    <li data-target="#carouselExample" data-slide-to="0" class="active"></li>
                                    <li data-target="#carouselExample" data-slide-to="1"></li>
                                    <li data-target="#carouselExample" data-slide-to="2"></li>
                                </ol>
                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <img class="d-block w-100" src="assets_/img/bg/1.jpg" alt="First slide">
                                        <div class="carousel-caption d-none d-md-block">
                                            <h3>First slide</h3>
                                            <p>Eos mutat malis maluisset et, agam ancillae quo te, in vim congue pertinacia.</p>
                                        </div>
                                    </div>
                                    <div class="carousel-item">
                                        <img class="d-block w-100" src="assets_/img/bg/2.jpg" alt="Second slide">
                                        <div class="carousel-caption d-none d-md-block">
                                            <h3>Second slide</h3>
                                            <p>In numquam omittam sea.</p>
                                        </div>
                                    </div>
                                    <div class="carousel-item">
                                        <img class="d-block w-100" src="assets_/img/bg/3.jpg" alt="Third slide">
                                        <div class="carousel-caption d-none d-md-block">
                                            <h3>Third slide</h3>
                                            <p>Lorem ipsum dolor sit amet, virtute consequat ea qui, minim graeco mel no.</p>
                                        </div>
                                    </div>
                                </div>
                                <a class="carousel-control-prev" href="#carouselExample" role="button" data-slide="prev">
                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                    <span class="sr-only">Previous</span>
                                </a>
                                <a class="carousel-control-next" href="#carouselExample" role="button" data-slide="next">
                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </div>

                            <div class="card-group">

                                <c:forEach items="${noticias}" var="noticia">
                                    <div class="card text-center">
                                        <div class="card-body">
                                            <h4 class="card-title">${noticia.getTitulo()}</h4>
                                            <p class="card-text">${noticia.getDescripcion()}</p>
                                            <p class="card-text">
                                                <small class="text-muted">${noticia.getAutor()}</small>
                                            </p>
                                            <p class="card-text">
                                                <a href="NoticiaUsu?action=ver&id=${noticia.getId()}&tituo=${noticia.getTitulo()}&descripcion=${noticia.getDescripcion()}"
                                                   class="card-footer d-block text-center text-dark small font-weight-semibold">SHOW MORE</a>
                                            </p>
                                        </div>
                                    </div>
                                </c:forEach>


                            </div>
                            <br>
                            <div class="row">
                                <div class="col-sm-6 col-xl-4">
                                    <div>
                                        <a href="contactenos.jsp" class="media align-items-center bg-lighter text-dark py-3 px-4">
                                            <div class="ion ion-md-help-circle-outline ui-w-30 text-center text-xlarge"></div>
                                            <div class="media-body ml-3">
                                                Contactenos
                                                <div class="text-muted small">Solicitud de suscripcion de contacto</div>
                                            </div>
                                        </a>


                                        <a href="registro.jsp" class="media align-items-center bg-lighter text-dark py-3 px-4">


                                            <div class="ion ion-ios-help-buoy ui-w-30 text-center text-xlarge"></div>
                                            <div class="media-body ml-3">
                                                Registrarse
                                                <div class="text-muted small">Registrate en la pagina web</div>
                                            </div>

                                        </a>

                                        <a href="assets_\img\formulario_afiliacion.pdf" class="media align-items-center bg-lighter text-dark py-3 px-4">
                                            <div class="ion ion-ios-help-buoy ui-w-30 text-center text-xlarge"></div>
                                            <div class="media-body ml-3">
                                                Afiliate a ASPU !!!
                                                <div class="text-muted small">Descarga el Formato de Afiliación, incluya sus datos y lo entrega en la sede de ASPU-UFPS</div>
                                            </div>

                                        </a>

                                    </div>
                                </div>
                                <div class="col-sm-6 col-xl-8">
                                    <div class="card mb-4">
                                        <h6 class="card-header">Ultimos profesores</h6>
                                        <div class="card-body">

                                            <c:forEach items="${miembros}" var="miembro">
                                                <div class="media pb-1 mb-3">
                                                    <img src="assets_/img/avatars/avatar.png" class="d-block ui-w-40 rounded-circle" alt="">
                                                    <div class="media-body ml-3">
                                                        <a href="javascript:void(0)">${miembro.getNombres()}</a>
                                                        <span class="text-muted">${miembro.getTitulo()} - ${miembro.getEmail()}</span>
                                                        <p class="my-1">${miembro.getDescripcion()}</p>
                                                        <div class="clearfix">

                                                            <span class="float-left text-muted small">${miembro.getFecha()}</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>

                                        </div>
                                        <a href="Miembro?action=verusu" class="card-footer d-block text-center text-dark small font-weight-semibold">VER MAS</a>
                                    </div>
                                </div>

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
        <script src="assets_/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

        <!-- Demo -->
        <script src="assets_/js/demo.js"></script>

    </body>


    <!-- Mirrored from uxpowered.com/products/appwork/v100/html-demo/layouts_without-sidenav.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 07 Jun 2018 23:05:58 GMT -->
</html>