/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package aspu.controller;

import aspu.dao.ComentarioDAO.ComentariosDaoImpl;
import aspu.dao.evidenciaDAO.EvidenciaDaoImpl;
import aspu.dao.noticiaDAO.NoticiaDaoImpl;
import entitis.Comentario;
import entitis.Evidencia;
import entitis.Noticia;
import entitis.Usuario;
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
import javax.servlet.http.HttpSession;

/**
 *
 * @author DELL
 */
@WebServlet(name = "ComentarioUsuServlet", urlPatterns = {"/ComentarioUsu"})
public class ComentarioUsuServlet extends HttpServlet {

    ComentariosDaoImpl comentaarioDao = new ComentariosDaoImpl();
    NoticiaDaoImpl noticiaDao = new NoticiaDaoImpl();
    EvidenciaDaoImpl evidenciaDao = new EvidenciaDaoImpl();
    NoticiaUsuServlet noticiaServlet = new NoticiaUsuServlet();

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

    public List<Evidencia> listarEvidenciasNoticia(int idNoticia) {
        List<Evidencia> evidencias = evidenciaDao.findAll();
        List<Evidencia> evidenciasNoticia = new ArrayList<>();
        for (Evidencia evidencia : evidencias) {
            if (evidencia.getNoticiaId().getId() == idNoticia) {
                System.out.println("AGREGOO: " + evidencia.getNombre());
                evidenciasNoticia.add(evidencia);
            }
        }

        return evidenciasNoticia;
    }

    public List<Comentario> listarComentariosNoticia(int idNoticia) {
        List<Comentario> comentarios = comentaarioDao.findAll();
        List<Comentario> comentariosNoticia = new ArrayList<>();
        for (Comentario comentario : comentarios) {
            if (comentario.getNoticiaId().getId() == idNoticia) {
                comentariosNoticia.add(comentario);
            }
        }

        return comentariosNoticia;
    }
    
    
    public void saveComentario(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        String comentario = request.getParameter("comentario");
        int noticia = Integer.parseInt(request.getParameter("noticia"));

        Comentario c = new Comentario();
        c.setFecha(obtenerFecha());
        c.setMensaje(comentario);
        c.setId(0);
        Noticia n = new Noticia();
        n = noticiaDao.findById(noticia);
        c.setNoticiaId(n);

        Usuario u = new Usuario();

        HttpSession session = request.getSession();
        u = (Usuario) session.getAttribute("usuario");

        c.setUsuarioUsuario(u);

        comentaarioDao.save(c);
     
        request.setAttribute("comentarios", listarComentariosNoticia(n.getId()));

        request.setAttribute("n", n);
        request.setAttribute("evidencias", listarEvidenciasNoticia(n.getId()));

        request.getRequestDispatcher("/noticia_detalles.jsp").forward(request, response);

    }
    
     public void eliminarComentario(HttpServletRequest request, HttpServletResponse response, int id, int not) throws IOException, ServletException {

        this.comentaarioDao.deleteById(id);
        request.setAttribute("id", not);
        
        noticiaServlet.verNoticia(request, response);
        
     
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
         if (param != null && param.equals("deleteusu")) {
             int comentario = Integer.parseInt(request.getParameter("com"));
             int noticia = Integer.parseInt(request.getParameter("id"));
              this.eliminarComentario(request, response, comentario, noticia);
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
        if (param != null && param.equals("save")) {
            this.saveComentario(request, response);
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
