
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="en" class="default-style">

    <head>
        <title>Login | ASPU</title>

        <meta charset="utf-8">
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
        <!-- Page -->
        <link rel="stylesheet" href="assets_/vendor/css/pages/authentication.css">
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

                        <div class="authentication-wrapper authentication-1 px-4">
                            <div class="authentication-inner">

                                <!-- Logo -->
                                <div class="d-flex justify-content-center align-items-center">
                                    <img class="position-relative" src="assets_/img/aspu.png">
                                </div>
                                <!-- / Logo -->

                                <!-- Form -->
                                <form class="my-5" action="Usuario?action=login" method="post">
                                    <div class="form-group">
                                        <label class="form-label">Usuario</label>
                                        <input type="text" id="usuario" name="usuario" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label d-flex justify-content-between align-items-end">
                                            <div>Password</div>
                                            <a href="#" class="d-block small" data-toggle="modal" data-target="#myModal">¿Se te olvidó tu contraseña?</a>
                                        </label>
                                        <input type="password" id="pass" name="pass" class="form-control">
                                    </div>
                                    <div class="d-flex justify-content-between align-items-center m-0">
                                        <label class="custom-control custom-checkbox m-0">
                                            <input type="checkbox" class="custom-control-input">
                                            <span class="custom-control-label">Remember me</span>
                                        </label>

                                        <button type="submit" class="btn btn-primary">Sign In</button>
                                    </div>

                                    <div class="text-center text-muted">
                                        <div style="padding-bottom: 3px; padding-top: 3px; margin-bottom: 10px;" class="text-center" id="msj"></div>
                                    </div>

                                </form>
                                <!-- / Form -->




                                <div class="text-center text-muted">
                                    No tiene cuenta ?
                                    <a href="registro.jsp">Registrate</a>
                                </div>

                                <c:choose>

                                    <c:when test="${recuperacion == 'exito'}">


                                        <script>
                                            $("#msj").html("Revisa tu correo Electronico");
                                            $("#msj").slideDown("slow").delay(3000).slideUp("fast");
                                        </script>
                                        <c:set var="recuperacion" value=""/>   

                                    </c:when>

                                    <c:when test="${login == 'fail'}">


                                        <script>
                                            $("#msj").html("Usuario o Contraseña Invalidos");
                                            $("#msj").slideDown("slow").delay(3000).slideUp("fast");
                                        </script>
                                        <c:set var="recuperacion" value=""/>   

                                    </c:when>

                                    <c:otherwise>

                                    </c:otherwise>
                                </c:choose>




                                <!-- Modal -->
                                <div id="myModal" class="modal fade" role="dialog">
                                    <div class="modal-dialog">

                                        <!-- Modal content-->
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                <h4 class="modal-title"></h4>
                                            </div>
                                            <div class="modal-body">
                                                <h3 class="text-center">RECUPERAR CONTRASEÑA</h3>
                                                <p>Recupera tu contraseña</p>

                                                <form action="Usuario?action=recuperar" method="post">
                                                    <div class="row">
                                                        <div class="col-6">

                                                            <div style="margin-bottom: 20px;" class="form-group">
                                                                <label for="titulo">Escribe tu E-mail, y enviaremos la informacion</label>
                                                                <input type="text" style="width: 100%;" class="form-control" id="email" placeholder="Correo de recuperacion de cuenta" name="email">
                                                            </div>


                                                        </div>

                                                        <div class="col-4 offset-4">
                                                            <input type="submit" value="Enviar" class="btn btnf btn-primary">
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

                            </div>
                        </div>

                        <jsp:include page="layouts/footer.jsp" />
                    </div>
                </div>
            </div>
        </div>

        <!-- / Content -->

        <!-- Core scripts -->
        <script src="assets_/vendor/libs/popper/popper.js"></script>
        <script src="assets_/vendor/js/bootstrap.js"></script>
        <script src="assets_/vendor/js/sidenav.js"></script>

        <!-- Libs -->
        <script src="assets_/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

        <!-- Demo -->
        <script src="assets_/js/demo.js"></script>

    </body>

</html>