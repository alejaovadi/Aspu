/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package aspu.controller;

import aspu.dao.evidenciaDAO.EvidenciaDaoImpl;
import aspu.dao.noticiaDAO.NoticiaDaoImpl;
import entitis.Evidencia;
import entitis.Noticia;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author DELL
 */
@WebServlet(name = "NoticiaServlet", urlPatterns = {"/Noticia"})
public class NoticiaServlet extends HttpServlet {

    NoticiaDaoImpl noticiaDao = new NoticiaDaoImpl();
    EvidenciaDaoImpl evidenciaDao = new EvidenciaDaoImpl();

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
            out.println("<title>Servlet NoticiaServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet NoticiaServlet at " + request.getContextPath() + "</h1>");
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
        System.out.println("Fechaaaa: "+ fechaActual);
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

    public void saveNoticia(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String titulo = request.getParameter("titulo");
        String descripcion = request.getParameter("descripcion");
        String autor = request.getParameter("autor");

        Noticia noticia = new Noticia();
        noticia.setAutor(autor);
        noticia.setDescripcion(descripcion);
        noticia.setTitulo(titulo);
        noticia.setId(0);
        noticia.setFecha(obtenerFecha());
        this.noticiaDao.save(noticia);

        request.setAttribute("registro", "exito");
        request.getRequestDispatcher("/noticia_crear.jsp").forward(request, response);
    }

    public void updateNoticia(HttpServletRequest request, HttpServletResponse response, Date fecha) throws IOException, ServletException, ParseException {
        String titulo = request.getParameter("titulo");
        String descripcion = request.getParameter("descripcion");
        String autor = request.getParameter("autor");
        int id = Integer.parseInt(request.getParameter("id"));
        System.out.println("FECHAA: " + fecha);
                    
        Noticia noticia = new Noticia();
        noticia.setAutor(autor);
        noticia.setDescripcion(descripcion);
        noticia.setTitulo(titulo);
        noticia.setId(id);
        noticia.setFecha(fecha);
        this.noticiaDao.update(noticia);

        request.setAttribute("registro", "exito");
        mostrarRegistros(request, response);
    }

    public void eliminarNoticia(int id) {
        List<Evidencia> evidencias = evidenciaDao.findAll();
        for (Evidencia evidencia : evidencias) {
            if(evidencia.getNoticiaId().getId() == id){
                evidenciaDao.deleteById(evidencia.getId());
            }
        }
        
        this.noticiaDao.deleteById(id);
    }

    public void mostrarRegistros(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("ENTRAR");
        List<Noticia> noticias = noticiaDao.findAll();
        request.setAttribute("noticias", noticias);

        request.getRequestDispatcher("/noticia_list.jsp").forward(request, response);
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
              this.eliminarNoticia(Integer.parseInt(request.getParameter("id")));
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
        String param = request.getParameter("action");
        if (param != null && param.equals("save")) {
            this.saveNoticia(request, response);
        }
        if (param != null && param.equals("update")) {
            try {
                 Date fecha = new SimpleDateFormat("dd/MM/yyyy").parse(request.getParameter("fecha"));
                this.updateNoticia(request, response, fecha);
            } catch (ParseException ex) {
                Logger.getLogger(NoticiaServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
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
