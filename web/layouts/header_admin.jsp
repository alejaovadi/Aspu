<nav class="layout-navbar navbar navbar-expand-lg align-items-lg-center bg-white container-p-x" id="layout-navbar">

        <!-- Brand demo (see assets/css/demo/demo.css) -->
	<a href="inicio_admin.jsp" style="color:gainsboro;" class="navbar-brand demo-brand d-lg-none py-0"> <span
                class="demo-brand-logo bg-primary">
                <img src="assets_/img/avatars/usuario.png" alt class="d-block ui-w-30 rounded-circle">
                
	</span> <span class="demo-brand-name font-weight-normal ml-2">${admin.getNombre()} ${admin.getApellido()}</span>
	</a>
	<div class="nav-item d-none d-lg-block text-big font-weight-light line-height-1 opacity-25 mr-3 ml-1">|</div>
        

        <div class="navbar-collapse collapse" id="layout-navbar-collapse">
          <!-- Divider -->
          <hr class="d-lg-none w-100 my-2">

          <div class="navbar-nav align-items-lg-center">
            <!-- Search -->
             <br>
            <a href="NoticiaUsu" class="navbar-brand demo-brand d-lg-none py-0 text-info">
                <span class="demo-brand-name font-weight-normal ml-2">NOTICIAS</span>
            </a>
           
          </div>
  
          <div class="navbar-nav align-items-lg-center ml-auto">
            

            <!-- Divider -->
            <div class="nav-item d-none d-lg-block text-big font-weight-light line-height-1 opacity-25 mr-3 ml-1">|</div>

            <div class="demo-navbar-user nav-item dropdown">
      
          
            <c:choose>

                <c:when test="${not empty sessionScope.admin}">

                    <div class="demo-navbar-user nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">
                            <span class="d-inline-flex flex-lg-row-reverse align-items-center align-middle">
                                <img src="assets_/img/avatars/1.png" alt class="d-block ui-w-30 rounded-circle">
                                <span class="px-1 mr-lg-2 ml-2 ml-lg-0">${admin.getNombre()}</span>
                            </span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right">

                            <a href="Usuario?action=saliradmin" class="dropdown-item">
                                <i class="ion ion-ios-log-out text-danger"></i> &nbsp; Salir</a>

                            <a href="editarperfilAdmin.jsp" class="dropdown-item">
                                <i class="ion ion-md-create text-danger"></i> &nbsp; Editar Perfil
                            </a>
                        </div>
                    </div>


                </c:when>

                <c:otherwise>
            
                </c:otherwise>
            </c:choose>
          
          
            </div>
          </div>
        </div>
      </nav>