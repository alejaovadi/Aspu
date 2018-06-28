/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package aspu.controller;

import aspu.dao.rolDAO.RolDaoImpl;
import aspu.dao.usuarioDAO.UsuarioDaoImpl;
import email.Email;
import static email.Email.enviarConGMail;
import entitis.Rol;
import entitis.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author DELL
 */
@WebServlet(name = "UsuarioServlet", urlPatterns = {"/Usuario"})
public class UsuarioServlet extends HttpServlet {

    UsuarioDaoImpl uDao = new UsuarioDaoImpl();
    RolDaoImpl rolDao = new RolDaoImpl();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UsuarioServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UsuarioServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    public void logear(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Usuario u = new Usuario();
        String usuario = request.getParameter("usuario");
        String pass = request.getParameter("pass");
        u = uDao.findById(usuario);
            if (u != null && u.getUsuario().equalsIgnoreCase(usuario) && u.getPassword().equalsIgnoreCase(pass)) {
            if (u.getRolId().getId()==1) {

                HttpSession session = request.getSession();
                session.setAttribute("admin", u);
                request.getRequestDispatcher("/inicio_admin.jsp").forward(request, response);

            } else {

                HttpSession session = request.getSession();
                session.setAttribute("usuario", u);
                request.getRequestDispatcher("indexServlet").forward(request, response);
            }
        } else {
            request.setAttribute("login", "fail");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    public void salirUsuario(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.setAttribute("usuario", "");
        request.getRequestDispatcher("indexServlet").forward(request, response);
    }

    public void salirAdmin(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.setAttribute("admin", "");
        request.getRequestDispatcher("indexServlet").forward(request, response);
    }

    public void recuperarContraseña(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        Usuario u = new Usuario();
        u.setEmail(email);
        String asunto = "Recuperacion de contraseña ASPU";

        for (Usuario usuario : uDao.findAll()) {
            if (usuario.getEmail().equalsIgnoreCase(email)) {
                u = usuario;
            }
        }
        String cuerpo = "Hola, " + u.getNombre() + " tu Usuario es: " + u.getUsuario() + " tu contraseña es: " + u.getPassword();
        enviarConGMail(u.getEmail(), asunto, cuerpo);
        request.setAttribute("recuperacion", "exito");
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    public void saveUsuario(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String nombres = request.getParameter("nombre");
        String apellidos = request.getParameter("apellido");
        String email = request.getParameter("email");
        String pass = request.getParameter("clave");
        String Usuario = request.getParameter("usuario");

        Usuario u = new Usuario();
        u.setApellido(apellidos);
        u.setNombre(nombres);
        u.setPassword(pass);
        u.setUsuario(Usuario);
        u.setEmail(email);
        Rol r = rolDao.findById(2);

        u.setRolId(r);
        Usuario prueba = new Usuario();
        prueba = uDao.findById(Usuario);

        if (prueba != null && prueba.getUsuario().equalsIgnoreCase(Usuario)) {
            request.setAttribute("registrousuario", "fail");
            request.getRequestDispatcher("registro.jsp").forward(request, response);
            System.out.println("entro a fail");
        } else {

            this.uDao.save(u);
            HttpSession session = request.getSession();
            session.setAttribute("usuario", u);
            request.setAttribute("registrousuario", "exito");
            request.getRequestDispatcher("registro.jsp").forward(request, response);

        }

    }

    public void updateUsuario(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {

        System.out.println("ingresoo a actualizar");

        String nombres = request.getParameter("nombre");
        String apellidos = request.getParameter("apellido");
        String email = request.getParameter("email");
        String pas = "" + request.getParameter("clav");
        String Usuario = request.getParameter("usuario");
        String pass = "" + request.getParameter("claven");
        String passn = "" + request.getParameter("clave");

        if (pass.equalsIgnoreCase("") || pass.isEmpty()) {

            Usuario u = new Usuario();
            u.setApellido(apellidos);
            u.setNombre(nombres);
            u.setPassword(pas);
            u.setUsuario(Usuario);
            u.setEmail(email);

            if (uDao.findById(Usuario).getRolId().getId()==1) {

                Rol r = rolDao.findById(1);
                u.setRolId(r);

                this.uDao.update(u);
                HttpSession session = request.getSession();
                session.setAttribute("admin", u);
                request.setAttribute("registrousuario", "exito");
                request.getRequestDispatcher("editarperfilAdmin.jsp").forward(request, response);

            } else {
                Rol r = rolDao.findById(2);
                u.setRolId(r);
                this.uDao.update(u);
                HttpSession session = request.getSession();
                session.setAttribute("usuario", u);
                request.setAttribute("registrousuario", "exito");
                request.getRequestDispatcher("editarperfil.jsp").forward(request, response);
            }

        } else {

            if (pass.equals(passn)) {

                Usuario u = new Usuario();
                u.setApellido(apellidos);
                u.setNombre(nombres);
                u.setPassword(pass);
                u.setUsuario(Usuario);
                u.setEmail(email);

                if (Usuario.equalsIgnoreCase("daQuin")) {

                    Rol r = rolDao.findById(1);
                    u.setRolId(r);

                    this.uDao.update(u);
                    HttpSession session = request.getSession();
                    session.setAttribute("admin", u);
                    request.setAttribute("registrousuario", "exito");
                    request.getRequestDispatcher("editarperfil.jsp").forward(request, response);

                } else {
                    Rol r = rolDao.findById(2);
                    u.setRolId(r);
                    this.uDao.update(u);
                    HttpSession session = request.getSession();
                    session.setAttribute("usuario", u);
                    request.setAttribute("registrousuario", "exito");
                    request.getRequestDispatcher("editarperfil.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("registrousuario", "fail");
                request.getRequestDispatcher("editarperfil.jsp").forward(request, response);
            }
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String param = request.getParameter("action");
        if (param != null && param.equals("salirusuario")) {
            this.salirUsuario(request, response);
        }
        if (param != null && param.equals("saliradmin")) {
            this.salirAdmin(request, response);
        }

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String param = request.getParameter("action");
        if (param != null && param.equals("login")) {
            this.logear(request, response);
        }
        if (param != null && param.equals("save")) {
            this.saveUsuario(request, response);
        }
        if (param != null && param.equals("update")) {
            this.updateUsuario(request, response);
        }
        if (param != null && param.equals("recuperar")) {
            this.recuperarContraseña(request, response);
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
