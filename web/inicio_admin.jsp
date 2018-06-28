<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>

<html class="default-style">


    <!-- Mirrored from uxpowered.com/products/appwork/v100/html-demo/layouts_without-sidenav.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 07 Jun 2018 23:05:58 GMT -->
    <head>
        <title>Nosotros | ASPU</title>

        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
                        <main id="menu">
                            <jsp:include page="layouts/menu_admin.jsp"/>
                        </main>
                        <h4
                            class="d-flex flex-wrap justify-content-between align-items-center pt-3 mb-4">
                            <ol class="breadcrumb font-weight-bold mb-3">
                                <li class="breadcrumb-item"><a href="javascript:void(0)">
                                        <i class="ion ion-ios-chatbubbles"></i> ASPU
                                    </a></li>
                                <li class="breadcrumb-item"><a href="javascript:void(0)">Nosotros</a>
                                </li>

                            </ol>
                        </h4>

                        <div class="col">

                            <h4 class="media align-items-center my-4">
                                <div
                                    class="ion ion-md-help-circle-outline ui-w-60 text-center text-large"></div>
                                <div class="media-body ml-1">
                                    Asociación Sindical de Profesores Universitarios ASPU
                                    <div class="text-muted text-tiny font-weight-light"></div>
                                </div>
                            </h4>
                            <div class="bg-white ui-bordered mb-2">
                                <a href="#company-faq-2"
                                   class="d-flex justify-content-between text-dark py-3 px-4"
                                   data-toggle="collapse"> Que es la ASPU <span
                                        class="collapse-icon"></span>
                                </a>
                                <div id="company-faq-2" class="text-muted">
                                    <div class="px-4 pb-3">La organización gremial denominada
                                        “ASPU”, “ASOCIACIÓN SINDICAL DE PROFESORES UNIVERSITARIOS”, es
                                        una Organización Sindical de primer grado y de gremio, que
                                        está integrada por las y los profesores de Instituciones de
                                        Educación Superior Colombianas, cualquiera que sea la
                                        actividad que realicen como la docencia, investigación,
                                        proyección social o administración académica, y funciona de
                                        conformidad con la Constitución Nacional, los Convenios de la
                                        Organización Internacional del Trabajo ratificados por nuestro
                                        país, por el Código Sustantivo de Trabajo, y demás normas
                                        nacionales e internacionales vigentes sobre la materia.</div>
                                </div>
                            </div>

                            <div class="bg-white ui-bordered mb-2">
                                <a href="#company-faq-1"
                                   class="d-flex justify-content-between text-dark py-3 px-4"
                                   data-toggle="collapse"> Los fines principales de ASPU <span
                                        class="collapse-icon"></span>
                                </a>
                                <div id="company-faq-1" class="collapse text-muted">
                                    <div class="px-4 pb-3">
                                        <ul>
                                            <li>Defender los derechos de sus afiliados. Estudiar las
                                                características de la profesión de profesor universitario,
                                                sus salarios, prestaciones sociales, honorarios, sistemas de
                                                protección y de prevención de accidentes y demás condiciones
                                                económicas y de trabajo, así como las condiciones
                                                académicas, de investigación, de extensión y sociales de sus
                                                afiliadas y afiliados para procurar su mejoramiento y
                                                defensa.</li>
                                            <li>Defender la prestación por parte del Estado del
                                                servicio público de educación superior y fortalecer las
                                                instituciones estatales.</li>
                                            <li>Procurar el acercamiento del conjunto de los
                                                trabajadores y empleadores, sobre la base del diálogo, el
                                                respeto mutuo y dentro del marco de respeto de los derechos
                                                humanos.</li>
                                            <li>Asesorar jurídicamente a sus afiliadas y afiliados
                                                en la defensa de sus derechos, emanados de su relación
                                                laboral, convención colectiva, contrato sindical, laudo
                                                arbitral, y representarlos ante las autoridades
                                                administrativas, ante los empleadores y ante terceros. No
                                                implica representación individual en juicio o ante el
                                                empleador.</li>
                                            <li>Representar en juicio o ante cualquier autoridad u
                                                organismo los intereses económicos comunes o generales de
                                                las afiliadas y afiliados o de la profesión y representar
                                                esos mismos intereses ante los empleadores y ante terceros y
                                                en caso de conflictos colectivos que no hayan podido
                                                resolverse por arreglo directo procurando la mediación.</li>
                                            <li>Promover la educación sindical, profesional,
                                                científica y general de sus afiliados, su sensibilidad
                                                social y el desarrollo de la Universidad Colombiana
                                                autónoma, democrática, incluyente, de excelente nivel
                                                académico, universal y gratuita.</li>
                                            <li>Presentar pliegos de peticiones, derechos de
                                                petición y otras solicitudes consagradas constitucional y
                                                legalmente relativos a las condiciones de trabajo o a las
                                                diferencias con los empleadores, cualquiera que sea su
                                                origen y que no estén sometidas por la ley o la convención a
                                                un procedimiento distinto o que no hayan podido ser
                                                resueltos por otros medios.</li>
                                            <li>Celebrar convenciones colectivas y contratos
                                                sindicales, garantizar su cumplimiento por parte de las
                                                afiliadas y afiliados y empleadores y ejercer los derechos y
                                                acciones que de ellos nazcan.</li>
                                            <li>Brindar solidaridad a sus afiliadas y afiliados
                                                prestándoles ayuda oportuna y eficaz en caso de enfermedad,
                                                desocupación, invalidez o calamidad.</li>
                                            <li>Servir de intermediario para la adquisición y
                                                distribución entre sus afiliados de artículos de consumo,
                                                materias primas y elementos de trabajo a bajo costo.</li>
                                            <li>Realizar movimientos colectivos, asambleas
                                                permanentes y otras actividades orientadas a la defensa de
                                                los derechos de las afiliadas y afiliados o de la
                                                universidad pública.</li>
                                            <li>Celebrar los negocios jurídicos que se requieran
                                                para el cumplimiento de su objeto de conformidad con el
                                                numeral 10 del artículo 373 del Código Sustantivo del
                                                Trabajo.</li>
                                            <li>Defender efectivamente los derechos de los miembros
                                                del Sindicato y velar por su reposición cuando sean
                                                lesionados en cualquier forma, por sus opiniones
                                                filosóficas, políticas, religiosas o raciales.</li>
                                            <li>Desarrollar todas aquellas acciones que le permitan
                                                proponer alternativas para la solución de los problemas
                                                económicos, sociales, políticos, laborales y culturales de
                                                los trabajadores y la sociedad, en especial los de la
                                                educación.</li>
                                        </ul>

                                    </div>
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
    <script
    src="assets_/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

    <!-- Demo -->
    <script src="assets_/js/demo.js"></script>

</body>


<!-- Mirrored from uxpowered.com/products/appwork/v100/html-demo/layouts_without-sidenav.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 07 Jun 2018 23:05:58 GMT -->
</html>