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
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javazoom.upload.MultipartFormDataRequest;
import javazoom.upload.UploadBean;
import javazoom.upload.UploadException;
import javazoom.upload.UploadFile;

/**
 *
 * @author DELL
 */
@WebServlet(name = "EvidenciaServlet", urlPatterns = {"/Evidencia"})
public class EvidenciaServlet extends HttpServlet {

    EvidenciaDaoImpl evidenciaDao = new EvidenciaDaoImpl();
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
            out.println("<title>Servlet EvidenciaServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EvidenciaServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    public boolean registrarEvidencia(String nombreEvidencia, String url, String tipo, String descripcion, String fecha, int noticia) {
        Evidencia e = new Evidencia();
        e.setId(0);
        e.setNombre(nombreEvidencia);
        e.setRuta(url);
        e.setDescripcion(descripcion);
        e.setTipo(tipo);
        e.setNoticiaId(noticiaDao.findById(noticia));
        evidenciaDao.save(e);

        System.out.println("retornaa falseee");
        return false;
    }

    public boolean ActualizarEvidencia(int id, String nombreEvidencia, String url, String descripcion, String fecha, int noticia) {
        System.out.println("ENTRO A ACTUALIZAR: id: " + id + " : " + nombreEvidencia + " - rutaa " + url
                + " - " + descripcion + " nticia: " + noticia);
        Evidencia e = new Evidencia();
        e.setId(id);
        e.setNombre(nombreEvidencia);
        e.setRuta(url);
        e.setDescripcion(descripcion);
        e.setNoticiaId(noticiaDao.findById(noticia));
        e.setTipo(evidenciaDao.findById(id).getTipo());
        evidenciaDao.update(e);

        System.out.println("retornaa falseee");
        return false;
    }

       public boolean ActualizarEvidenciaTipo(int id, String nombreEvidencia, String url, String tipo, String descripcion, String fecha, int noticia) {
        System.out.println("ENTRO A ACTUALIZAR: id: " + id + " : " + nombreEvidencia + " - rutaa " + url
                + " - " + descripcion + " nticia: " + noticia);
        Evidencia e = new Evidencia();
        e.setId(id);
        e.setNombre(nombreEvidencia);
        e.setRuta(url);
        e.setDescripcion(descripcion);
        e.setNoticiaId(noticiaDao.findById(noticia));
        e.setTipo(tipo);
        evidenciaDao.update(e);

        System.out.println("retornaa falseee");
        return false;
    }
    
    public void eliminarEvidencia(HttpServletRequest request, HttpServletResponse response, int id)
            throws ServletException, IOException {
        this.evidenciaDao.deleteById(id);
    }

    public void mostrarRegistros(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Evidencia> evidencias = evidenciaDao.findAll();

        request.setAttribute("evidencias", evidencias);

        request.getRequestDispatcher("/evidencias_lista.jsp").forward(request, response);
    }

    public void mostrarRegistrosNueva(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Noticia> noticias = noticiaDao.findAll();
        for (Noticia noticia : noticias) {
       }
        request.setAttribute("noticias", noticias);

        request.getRequestDispatcher("/evidencia_crear.jsp").forward(request, response);
    }

    public void mostrarRegistrosNoticia(HttpServletRequest request, HttpServletResponse response, int noticia)
            throws ServletException, IOException {

        List<Evidencia> evidenciasTodas = evidenciaDao.findAll();
        List<Evidencia> evidencias = new ArrayList<>();

        for (Evidencia evidenciasToda : evidenciasTodas) {
            if (evidenciasToda.getNoticiaId().getId() == noticia) {
                evidencias.add(evidenciasToda);
            }
        }
        request.setAttribute("evidencias", evidencias);
        request.setAttribute("noticia", noticiaDao.findById(noticia));

        request.getRequestDispatcher("/evidencias_lista.jsp").forward(request, response);
    }

    public void cargarArchivo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, UploadException {

        String nueva = "";
        String ruta2 = getServletContext().getRealPath("/");
        ruta2 += "temp/img";
        UploadBean upBean = new UploadBean();
        UploadFile file = null;
        upBean.setFolderstore(ruta2);
        boolean msg = false;
        int n = 0;

        if (!MultipartFormDataRequest.isMultipartFormData(request)) {
            msg = false;

        } else {

            MultipartFormDataRequest mrequest = new MultipartFormDataRequest(request);

            Hashtable files = mrequest.getFiles();

            String nombre = mrequest.getParameter("nombre");
            String descripcion = mrequest.getParameter("descripcion");

            String idNoticia = request.getParameter("id");
            String idEvidencia = "" + request.getParameter("ide");
            String accion = "" + request.getParameter("accion");
            String tipo = mrequest.getParameter("tipo");
            String r = "" + request.getParameter("ruta");

            if (idNoticia == null || idNoticia.equalsIgnoreCase("")) {
                idNoticia = mrequest.getParameter("id");
              }
           
            n = Integer.parseInt(idNoticia);
            String fecha = mrequest.getParameter("2017/04/09");
            if ((files != null) && (!files.isEmpty())) {
                System.out.println("entro aca 1 ");

                file = (UploadFile) files.get("file");

                if (file == null) {
                    System.out.println("entro aca 2 ");
                    msg = true;
                }
                if (file.getFileName() != null) {
                    System.out.println("entrrooo 3");

                    if(tipo!=null){
                    if (tipo.equalsIgnoreCase("p")) {
                        tipo = ".pdf";
                    } else {
                        tipo = ".jpg";
                    }
                    }

                    File filess = new File(ruta2 + "/" + nombre + tipo);

                    filess.delete();
                    file.setFileName(nombre + tipo);
                    upBean.store(mrequest, "file");
                    nueva = "temp/img/" + nombre + tipo;
                   
                    if (accion != null && accion.equalsIgnoreCase("update")) {
                        System.out.println("etroo a actualizarr EVIDENCIA");
                        msg = this.ActualizarEvidenciaTipo(Integer.parseInt(idEvidencia), nombre, nueva, tipo, descripcion, "2016/02/09", n);
                    } else {
                        System.out.println("entroo disque es registrar");
                        msg = this.registrarEvidencia(nombre, nueva, tipo, descripcion, "2016/02/09", n);
                    }
              
                } else {
                    System.out.println("etroo a actualizarr EVIDENCIA segunda opcion");
                    msg = false;
                    msg = this.ActualizarEvidencia(Integer.parseInt(idEvidencia), nombre, r, descripcion, "2016/02/09", n);

                }

            }

        }

        mostrarRegistrosNoticia(request, response, n);

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
            int id = Integer.parseInt(request.getParameter("id"));
            this.eliminarEvidencia(request, response, id);
            String noticia = "" + request.getParameter("not");
            System.out.println("NOTICIAA: " + noticia);
            if (noticia.equalsIgnoreCase("") || noticia == null) {
                mostrarRegistros(request, response);
            } else {
                int not = Integer.parseInt(noticia);
                mostrarRegistrosNoticia(request, response, not);
            }
        }else{

        if (param != null && param.equals("nueva")) {
            System.out.println("ATENCIOJNNN ENTROOOOO");
            mostrarRegistrosNueva(request, response);
        }else{

        if (param != null && param.equals("listar")) {
            String noticia = request.getParameter("id");
            int not = Integer.parseInt(noticia);
            mostrarRegistrosNoticia(request, response, not);
        } else {
            this.mostrarRegistros(request, response);
        }
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
        if (param != null && param.equals("cargar")) {
            try {
                this.cargarArchivo(request, response);
            } catch (UploadException ex) {
                Logger.getLogger(EvidenciaServlet.class.getName()).log(Level.SEVERE, null, ex);
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
