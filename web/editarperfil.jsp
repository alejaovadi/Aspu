<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html class="default-style">

    <head>
        <title>Actualizar Perfil | ASPU</title>

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

        <script>

            function cambiar() {

                $("#confirmacion").fadeIn(1000);

                $("#confirmacion2").fadeIn(1000);

                $("#accion").fadeOut(100);

            }


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
                                        <!-- / Logo -->

                                        <h3 style="margin-bottom: 20px; margin-top: 20px;" class="text-left">Actualizar Perfil</h3>



                                        <!-- Form -->

                                        <form action="Usuario?action=update" method="post">
                                            <div class="row">
                                                <div class="col-6">
                                                    <div style="margin-bottom: 20px;" class="form-group">
                                                        <label for="documento">Usuario</label>
                                                        <br>
                                                        <input style="width: 100%;" type="text" value="${usuario.getUsuario()}" class="form-control" id="usuario" name="usuario" required="" readonly="">
                                                    </div>
                                                    <div style="margin-bottom: 20px;" class="form-group">
                                                        <label for="documento">Nombres</label>
                                                        <br>
                                                        <input style="width: 100%;" type="text" value="${usuario.getNombre()}" class="form-control" id="nombre" name="nombre" required="">
                                                    </div>
                                                    <div style="margin-bottom: 20px;" class="form-group">
                                                        <label for="documento">Apellidos</label>
                                                        <br>
                                                        <input style="width: 100%;" type="text" value="${usuario.getApellido()}" class="form-control" id="apellido" name="apellido" required="">
                                                    </div>


                                                </div>
                                                <div class="col-6">
                                                    <div style="margin-bottom: 20px;" class="form-group">
                                                        <label for="celular">E-mail</label>
                                                        <input style="width: 100%;" type="text" value="${usuario.getEmail()}" class="form-control" id="email" name="email" required="">
                                                    </div>

                                                    <div style="margin-bottom: 20px;" class="form-group">
                                                        <label for="celular">Contraseña</label>
                                                        <input style="width: 100%;" type="password" value="${usuario.getPassword()}" class="form-control" id="clav" name="clav" required="" readonly="">

                                                    </div>


                                                    <a id="accion" onclick="cambiar()" href="#">
                                                        <i class="ion ion-md-create text-danger"></i> &nbsp; Cambiar contraseña</a>

                                                    <div id="confirmacion2" style="display: none; margin-bottom: 20px;" class="form-group">
                                                        <label for="celular">Nueva Contraseña</label>
                                                        <input style="width: 100%;" type="password" class="form-control" id="clave" name="clave">

                                                    </div>

                                                    <div id="confirmacion" style="display: none; margin-bottom: 20px;" class="form-group">
                                                        <label for="celular">Confirma Contraseña</label>
                                                        <input style="width: 100%;" type="password" class="form-control" id="claven" name="claven">
                                                    </div>
                                                        
                                                    <div class="form-group" id="msj2">
                                                        <p>Las contraseñas no Coinciden</p>

                                                    </div>
                                                </div>



                                                <div class="col-4 offset-4">

                                                    <input type="submit" value="Actualizar" class="btn btnf btn-primary">

                                                </div>





                                            </div> 
                                        </form>
                                        <!-- / Form -->

                                    </div>

                                </div>

                                <c:choose>

                                    <c:when test="${registrousuario == 'exito'}">


                                        <script>
                                           $("#msj2").html("<p>Actualizacion Exitosa</p>");
                                           $("#msj2").fadeIn(2000).delay(1000);
                                           $("#msj2").fadeOut(2000);

                                        </script>

                                    </c:when>

                                    <c:when test="${registrousuario == 'fail'}">

                                        <script>
                                            $("#msj2").html("<p>Las contraseñas no Coinciden</p>");
                                            $("#msj2").fadeIn(2000);
                                            $("#msj2").fadeOut(2000);

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