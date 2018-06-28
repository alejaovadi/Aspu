

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav class="layout-navbar navbar navbar-expand-lg align-items-lg-center bg-white container-p-x" id="layout-navbar">

    <!-- Brand demo (see assets/css/demo/demo.css) -->
    <a href="indexServlet" class="navbar-brand demo-brand d-lg-none py-0"> <span
            class="demo-brand-logo bg-primary"> <img src="/Aspu/assets_/img/aspu.ico">
        </span> <span class="demo-brand-name font-weight-normal ml-2">ASPU</span>
    </a>
    <div class="nav-item d-none d-lg-block text-big font-weight-light line-height-1 opacity-25 mr-3 ml-1">|</div>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#layout-navbar-collapse">
        <span class="navbar-toggler-icon"></span>
        <a href="header.jsp"></a>
    </button>

    <div class="navbar-collapse collapse" id="layout-navbar-collapse">
        <!-- Divider -->
        <hr class="d-lg-none w-100 my-2">

        <div class="navbar-nav align-items-lg-center">
            <!-- Search -->
            <br>
            <a href="NoticiaUsu" class="navbar-brand demo-brand d-lg-none py-0">
                <span class="demo-brand-name font-weight-normal ml-2">NOTICIAS</span>
            </a>

            <div class="nav-item d-none d-lg-block text-big font-weight-light line-height-1 opacity-25 mr-3 ml-1">|</div>

            <a href="Miembro?action=verusu" class="navbar-brand demo-brand d-lg-none py-0">
                <span class="demo-brand-name font-weight-normal ml-2">PROFESORES</span>
            </a>

            <div class="nav-item d-none d-lg-block text-big font-weight-light line-height-1 opacity-25 mr-3 ml-1">|</div>
            <a href="nosotros.jsp" class="navbar-brand demo-brand d-lg-none py-0">
                <span class="demo-brand-name font-weight-normal ml-2">NOSOTROS</span>
            </a>
            <div class="nav-item d-none d-lg-block text-big font-weight-light line-height-1 opacity-25 mr-3 ml-1">|</div>
            <a href="contactenos.jsp" class="navbar-brand demo-brand d-lg-none py-0">
                <span class="demo-brand-name font-weight-normal ml-2">CONTACTENOS</span>
            </a>
        </div>

        <div class="navbar-nav align-items-lg-center ml-auto">


            <!-- Divider -->
            <div class="nav-item d-none d-lg-block text-big font-weight-light line-height-1 opacity-25 mr-3 ml-1">|</div>


            <c:choose>

                <c:when test="${not empty sessionScope.usuario}">

                    <div class="demo-navbar-user nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">
                            <span class="d-inline-flex flex-lg-row-reverse align-items-center align-middle">
                                <img src="assets_/img/avatars/1.png" alt class="d-block ui-w-30 rounded-circle">
                                <span class="px-1 mr-lg-2 ml-2 ml-lg-0">${usuario.getNombre()}</span>
                            </span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right">

                            <a href="Usuario?action=salirusuario" class="dropdown-item">
                                <i class="ion ion-ios-log-out text-danger"></i> &nbsp; Salir</a>

                            <a href="editarperfil.jsp" class="dropdown-item">
                                <i class="ion ion-md-create text-danger"></i> &nbsp; Editar Perfil</a>
                        </div>
                    </div>


                </c:when>

                <c:otherwise>

                    <div class="demo-navbar-user nav-item dropdown">

                        <a class="nav-link dropdown-toggle" href="login.jsp">
                            <span class="d-inline-flex flex-lg-row-reverse align-items-center align-middle">
                                <img src="assets_/img/avatars/1.png" alt class="d-block ui-w-30 rounded-circle">
                                <span class="px-1 mr-lg-2 ml-2 ml-lg-0">Iniciar Sesion</span>
                            </span>
                        </a>
                    </div>



                </c:otherwise>
            </c:choose>








        </div>
    </div>
</nav>