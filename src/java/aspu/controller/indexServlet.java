/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package aspu.controller;

import aspu.dao.MiembrosDAO.MiembrosDaoImpl;
import aspu.dao.noticiaDAO.NoticiaDaoImpl;
import entitis.Miembros;
import entitis.Noticia;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author DELL
 */
@WebServlet(name = "indexServlet", urlPatterns = {"/indexServlet"})
public class indexServlet extends HttpServlet {

    NoticiaDaoImpl notDao = new NoticiaDaoImpl();
    MiembrosDaoImpl mieDao = new MiembrosDaoImpl();

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
            out.println("<title>Servlet indexServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet indexServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    public void mostrarRegistros(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Noticia> noticias = notDao.findAll();

        List<Noticia> primerasNoticias = new ArrayList<>();

        if (noticias.size() >= 6) {
            for (int i = noticias.size()-1; i>noticias.size()-6; i--) {
              primerasNoticias.add(noticias.get(i));
            }
            request.setAttribute("noticias", primerasNoticias);
        } else {

            request.setAttribute("noticias", noticias);
        }

        List<Miembros> miembros = mieDao.findAll();

        List<Miembros> primerosMiembros = new ArrayList<>();
        if (miembros.size() >= 6) {
            for (int i = miembros.size()-1; i > miembros.size()-6; i--) {
                primerosMiembros.add(miembros.get(i));
            }
            request.setAttribute("miembros", primerosMiembros);
        } else {

            request.setAttribute("miembros", miembros);
        }

       

        request.getRequestDispatcher("/index.jsp").forward(request, response);
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
        if (param != null && param.equals("delete")) {
            //  this.eliminarNoticia(Integer.parseInt(request.getParameter("id")));
        }
        this.mostrarRegistros(request, response);
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
        this.mostrarRegistros(request, response);
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
