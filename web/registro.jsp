<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html class="default-style">

    <head>
        <title>Registrarse | ASPU</title>

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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

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

                        <div class="authentication-wrapper authentication-2 ui-bg-cover ui-bg-overlay-container px-4">
                            <div  class="ui-bg-overlay bg-dark"></div>

                            <div class="">

                                <div class="card">
                                    <div class="p-4 px-sm-5 pt-sm-5">

                                        <!-- Logo -->

                                        <div class="d-flex justify-content-center align-items-center">
                                            <img class="position-relative" src="assets_/img/aspu.png">
                                        </div>
                                        <!-- / Logo -->
                                        <div class="text-center" id="msj">

                                        </div>


                                        <h3 style="margin-bottom: 20px; margin-top: 20px;" class="text-left">Crear Cuenta</h3>



                                        <!-- Form -->

                                        <form action="Usuario?action=save" method="post">
                                            <div class="row">
                                                <div class="col-6">
                                                    <div style="margin-bottom: 20px;" class="form-group">
                                                        <label for="documento">Usuario</label>
                                                        <br>
                                                        <input style="width: 100%;" type="text" class="form-control" id="usuario" placeholder="Nombre de usuario" name="usuario" required="">
                                                    </div>
                                                    <div style="margin-bottom: 20px;" class="form-group">
                                                        <label for="documento">Nombres</label>
                                                        <br>
                                                        <input style="width: 100%;" type="text" class="form-control" id="nombre" placeholder="Nombres" name="nombre" required="">
                                                    </div>
                                                    <div style="margin-bottom: 20px;" class="form-group">
                                                        <label for="documento">Apellidos</label>
                                                        <br>
                                                        <input style="width: 100%;" type="text" class="form-control" id="apellido" placeholder="Apellidos del miembro" name="apellido" required="">
                                                    </div>


                                                </div>
                                                <div class="col-6">
                                                    <div style="margin-bottom: 20px;" class="form-group">
                                                        <label for="celular">E-mail</label>
                                                        <input style="width: 100%;" type="text" class="form-control" id="email" placeholder="E-mail" name="email" required="">
                                                    </div>

                                                    <div style="margin-bottom: 20px;" class="form-group">
                                                        <label for="celular">Contraseña</label>
                                                        <input style="width: 100%;" type="text" class="form-control" id="clave" placeholder="Clave" name="clave" required="">
                                                    </div>

                                                </div>
                                                <div class="col-4 offset-4">

                                                    <input type="submit" value="Registrar" class="btn btnf btn-primary">

                                                </div>
                                            </div> 
                                        </form>
                                        <!-- / Form -->

                                    </div>
                                    <div class="card-footer py-3 px-4 px-sm-5">
                                        <div class="text-center text-muted">
                                            Ya tiene una cuenta ?
                                            <a href="login.jsp">Iniciar Sesion</a>
                                        </div>
                                    </div>

                                </div>

                                <c:choose>

                                    <c:when test="${registrousuario == 'exito'}">


                                        <script>
                                        $("#msj").html("<p>Registro Exitoso, Bienvenido!</p>");
                                        $("#msj").fadeIn(2000).delay(2000);
                                        $("#msj").fadeOut(2000);
                                        setTimeout("location.href='indexServlet'", 5000);

                                        </script>

                                    </c:when>

                                    <c:when test="${registrousuario == 'fail'}">

                                        <script>
                                            $("#msj").html("<p>No se pudo registrar, Intenta otro Usuario</p>");
                                            $("#msj").fadeIn(2000).delay(2000);
                                            $("#msj").fadeOut(2000);

                                        </script>

                                        <c:set var="registrousuario" value=""/>


                                    </c:when>

                                    <c:otherwise>


                                    </c:otherwise>
                                </c:choose>

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