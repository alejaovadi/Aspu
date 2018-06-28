/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package aspu.controller;

import aspu.dao.ComentarioDAO.ComentariosDaoImpl;
import aspu.dao.noticiaDAO.NoticiaDaoImpl;
import entitis.Comentario;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
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
@WebServlet(name = "ComentarioServlet", urlPatterns = {"/Comentario"})
public class ComentarioServlet extends HttpServlet {

    ComentariosDaoImpl comentaarioDao = new ComentariosDaoImpl();
    NoticiaDaoImpl noticiaDao = new NoticiaDaoImpl();

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
            out.println("<title>Servlet ComentarioServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ComentarioServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    public Date obtenerFecha() {
        Date fechaActual = new Date();
        //   System.out.println(fechaActual);
        //   System.out.println("---------------------------------------------");

        // Formateando la fecha:
        DateFormat formatoHora = new SimpleDateFormat("HH:mm:ss");
        DateFormat formatoFecha = new SimpleDateFormat("dd/MM/yyyy");
        System.out.println("Son las: " + formatoHora.format(fechaActual) + " de fecha: " + formatoFecha.format(fechaActual));

        // Fecha actual desglosada:
        Calendar fecha = Calendar.getInstance();
        int año = fecha.get(Calendar.YEAR);
        int mes = fecha.get(Calendar.MONTH) + 1;
        int dia = fecha.get(Calendar.DAY_OF_MONTH);
        //int hora = fecha.get(Calendar.HOUR_OF_DAY);
        //int minuto = fecha.get(Calendar.MINUTE);
        //int segundo = fecha.get(Calendar.SECOND);
        // System.out.println("fecha : "+ año + "" + mes + "" + dia);

        return fechaActual;
    }

    public void mostrarRegistros(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Comentario> comentarios = comentaarioDao.findAll();

        request.setAttribute("comentarios", comentarios);

        request.getRequestDispatcher("/comentarios_lista.jsp").forward(request, response);
    }

    public void eliminarComentario(int id) {
        this.comentaarioDao.deleteById(id);
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
              this.eliminarComentario(Integer.parseInt(request.getParameter("id")));
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
        processRequest(request, response);
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
