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
                            <h4
                                class="d-flex flex-wrap justify-content-between align-items-center pt-3 mb-4">
                                <ol class="breadcrumb font-weight-bold mb-3">
                                    <li class="breadcrumb-item"><a href="javascript:void(0)">
                                            <i class="ion ion-ios-chatbubbles"></i> ASPU
                                        </a></li>
                                    <li class="breadcrumb-item"><a href="javascript:void(0)">Miembros</a>
                                    </li>
                                </ol>

                            </h4>

                            <div class="card-columns">

                                <c:forEach items="${profesores}" var="miembro">

                                    <div class="card">
                                        <img class="card-img-top" src="assets_/img/avatars/avatar.png"
                                             alt="Card image cap">
                                        <div class="card-body">
                                            <p class="card-text">
                                                <small class="text-muted">${miembro.obtenerFecha()}</small>
                                            </p>
                                            <h4 class="card-title">${miembro.getNombres()} - ${miembro.getTitulo()}</h4>
                                            <p class="card-text">${miembro.getDescripcion()}</p>
                                            <p class="card-text"></p>
                                           
                                        </div>
                                    </div>

                                </c:forEach>



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

        <!-- Demo -->
        <script src="assets_/js/demo.js"></script>

    </body>


    <!-- Mirrored from uxpowered.com/products/appwork/v100/html-demo/layouts_without-sidenav.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 07 Jun 2018 23:05:58 GMT -->
</html>