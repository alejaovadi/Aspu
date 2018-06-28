/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package aspu.controller;

import aspu.dao.ComentarioDAO.ComentariosDaoImpl;
import aspu.dao.evidenciaDAO.EvidenciaDaoImpl;
import aspu.dao.noticiaDAO.NoticiaDaoImpl;
import aspu.dao.usuarioDAO.UsuarioDaoImpl;
import static email.Email.enviarConGMail;
import entitis.Comentario;
import entitis.Evidencia;
import entitis.Noticia;
import email.NoticiaEvidencia;
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
@WebServlet(name = "NoticiaUsuServlet", urlPatterns = {"/NoticiaUsu"})
public class NoticiaUsuServlet extends HttpServlet {

    NoticiaDaoImpl noticiaDao = new NoticiaDaoImpl();
    EvidenciaDaoImpl evidenciaDao = new EvidenciaDaoImpl();
    ComentariosDaoImpl comentaarioDao = new ComentariosDaoImpl();
    UsuarioDaoImpl usuarioDao = new UsuarioDaoImpl();
    List<Evidencia> evidenciasNoticiaPdf = new ArrayList<>();

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
            out.println("<title>Servlet NoticiaUsuServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet NoticiaUsuServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    public void mostrarRegistros(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("ENTRAR");
        List<Noticia> noticias = noticiaDao.findAll();

        List<NoticiaEvidencia> noticiaEvidencia = new ArrayList<>();

        for (Noticia noticia : noticias) {

            NoticiaEvidencia ne = new NoticiaEvidencia();
            ne.setN(noticia);
            if (listarEvidenciasNoticia(noticia.getId()).isEmpty()) {
                ne.setEvidencia("assets_/img/bg/5.jpg");
            } else {

                ne.setEvidencia(listarEvidenciasNoticia(noticia.getId()).get(0).getRuta());
            }
            noticiaEvidencia.add(ne);
        }

        request.setAttribute("noticias", noticiaEvidencia);

        request.getRequestDispatcher("/noticias.jsp").forward(request, response);

    }

    public List<Evidencia> listarEvidenciasNoticia(int idNoticia) {
        List<Evidencia> evidencias = evidenciaDao.findAll();
        List<Evidencia> evidenciasNoticia = new ArrayList<>();
        for (Evidencia evidencia : evidencias) {
            if (evidencia.getNoticiaId().getId() == idNoticia && evidencia.getTipo().equalsIgnoreCase(".jpg")) {
                evidenciasNoticia.add(evidencia);
            }
            if (evidencia.getNoticiaId().getId() == idNoticia && evidencia.getTipo().equalsIgnoreCase(".pdf")) {
                evidenciasNoticiaPdf.add(evidencia);
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

    public void verNoticia(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        evidenciasNoticiaPdf.clear();
        for (Evidencia evidencia : evidenciasNoticiaPdf) {
            System.out.println("evidencia pdf: " + evidencia.getNombre());
        }
        int not = Integer.parseInt(request.getParameter("id"));
        Noticia n = noticiaDao.findById(not);
        request.setAttribute("n", n);
        request.setAttribute("comentarios", listarComentariosNoticia(n.getId()));
        request.setAttribute("evidencias", listarEvidenciasNoticia(not));
        request.setAttribute("pdfs", evidenciasNoticiaPdf);

        request.getRequestDispatcher("/noticia_detalles.jsp").forward(request, response);

    }

    public void eliminarComentario(HttpServletRequest request, HttpServletResponse response, int id, String asunto) throws IOException, ServletException {

        if (asunto != null) {
            Usuario u = new Usuario();
            Comentario c = new Comentario();
            c = comentaarioDao.findById(id);
            u = c.getUsuarioUsuario();
            String cuerpo = "Hola, " + u.getNombre() + " tu Comentario " + c.getMensaje()
                    + " de esta Noticia: " + c.getNoticiaId().getTitulo() + ", FUE ELIMINADO por el administrador del portal ASPU"
                    + " debido a la siguiente Razon: " + asunto;
            System.out.println("E MAIL: " + cuerpo);
            enviarConGMail(u.getEmail(), "TU COMENTARIO FUE ELIMINADO", cuerpo);

        }

        this.comentaarioDao.deleteById(id);
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

    public void saveComentario(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        String comentario = request.getParameter("comentario");
        int noticia = Integer.parseInt(request.getParameter("id"));

        Comentario c = new Comentario();
        c.setFecha(obtenerFecha());
        c.setMensaje(comentario);
        c.setId(0);
        Noticia n = new Noticia();
        n = noticiaDao.findById(noticia);
        c.setNoticiaId(n);

        Usuario u = new Usuario();

        HttpSession session = request.getSession();

        System.out.println("USUARIOO: " + session.getAttribute("usuario"));

        System.out.println("ADMINN: " + session.getAttribute("admin"));

        if (session.getAttribute("usuario") == null || session.getAttribute("usuario").equals("")) {

            u = (Usuario) session.getAttribute("admin");

        } else {
            u = (Usuario) session.getAttribute("usuario");
        }

        c.setUsuarioUsuario(u);

        comentaarioDao.save(c);

        verNoticia(request, response);

    }

    public void updateComentario(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        String comentario = request.getParameter("comentario");
        int noticia = Integer.parseInt(request.getParameter("id"));
        int idComentario = Integer.parseInt(request.getParameter("com"));

        Comentario c = new Comentario();
        c.setFecha(comentaarioDao.findById(idComentario).getFecha());
        c.setMensaje(comentario);
        c.setId(idComentario);
        Noticia n = new Noticia();
        n = noticiaDao.findById(noticia);
        c.setNoticiaId(n);

        Usuario u = new Usuario();

        HttpSession session = request.getSession();

        if (session.getAttribute("usuario") == null || session.getAttribute("usuario").equals("")) {

            u = (Usuario) session.getAttribute("admin");

        } else {
            u = (Usuario) session.getAttribute("usuario");
        }

        c.setUsuarioUsuario(u);

        comentaarioDao.update(c);

        verNoticia(request, response);

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
            this.eliminarComentario(request, response, comentario, null);
            verNoticia(request, response);
        } else {
            if (param != null && param.equals("ver")) {
                verNoticia(request, response);
            } else {
                this.mostrarRegistros(request, response);
            }
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

        if (param != null && param.equals("deleteusu")) {
            System.out.println("entrooooooo");
            String asunto = request.getParameter("asunto");
            int comentario = Integer.parseInt(request.getParameter("com"));
            int noticia = Integer.parseInt(request.getParameter("id"));
            this.eliminarComentario(request, response, comentario, asunto);
            verNoticia(request, response);
        } else {

            if (param != null && param.equals("save")) {
                this.saveComentario(request, response);
            }
            if (param != null && param.equals("update")) {
                this.updateComentario(request, response);
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
