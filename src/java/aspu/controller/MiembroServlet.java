/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package aspu.controller;

import aspu.dao.MiembrosDAO.MiembrosDaoImpl;
import entitis.Miembros;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "MiembroServlet", urlPatterns = {"/Miembro"})
public class MiembroServlet extends HttpServlet {
MiembrosDaoImpl miembroDao = new MiembrosDaoImpl();
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
            out.println("<title>Servlet MiembroServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MiembroServlet at " + request.getContextPath() + "</h1>");
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

    public void saveMiembro(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String nombres = request.getParameter("nombre");
        String email = request.getParameter("email");
        String telefono = request.getParameter("tel");
        String titulo = request.getParameter("titulo");
        String descripcion = request.getParameter("descripcion");
        
        Miembros m = new Miembros();
        m.setEmail(email);
        m.setId(0);
        m.setNombres(nombres);
        m.setTelefono(telefono);
        m.setFecha(obtenerFecha());
        m.setTitulo(titulo);
        m.setDescripcion(descripcion);
       miembroDao.save(m);

        request.setAttribute("registro", "exito");
        request.getRequestDispatcher("/miembro_crear.jsp").forward(request, response);
    }
    
    public void updateMiembro(HttpServletRequest request, HttpServletResponse response, Date fecha) throws IOException, ServletException {
        String nombres = request.getParameter("nombre");
        String email = request.getParameter("email");
        String telefono = request.getParameter("tel");
        String titulo = request.getParameter("titulo");
        String descripcion = request.getParameter("descripcion");
        
        int id = Integer.parseInt(request.getParameter("id"));
        Miembros m = new Miembros();
        m.setEmail(email);
        m.setId(id);
        m.setNombres(nombres);
        m.setTelefono(telefono);
        m.setFecha(fecha);
        m.setTitulo(titulo);
        m.setDescripcion(descripcion);
       miembroDao.update(m);

        request.setAttribute("registro", "exito");
        mostrarRegistros(request, response);
    }
    
     public void eliminarMiembro(int id) {
        this.miembroDao.deleteById(id);
    }

    public void mostrarRegistros(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("---------------------------ENTROOOOO---------------------------------");
        List<Miembros> miembros = miembroDao.findAll();
       
        request.setAttribute("miembros", miembros);

        request.getRequestDispatcher("/miembros_lista.jsp").forward(request, response);
    }
    
    public void mostrarRegistrosUsuario(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        List<Miembros> miembros = miembroDao.findAll();
       
        request.setAttribute("profesores", miembros);

        request.getRequestDispatcher("/profesores.jsp").forward(request, response);
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
              this.eliminarMiembro(Integer.parseInt(request.getParameter("id")));
        }
        if (param != null && param.equals("verusu")) {
              this.mostrarRegistrosUsuario(request, response);
        }else{
        this.mostrarRegistros(request, response);
    }}

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
            this.saveMiembro(request, response);
        }
        if (param != null && param.equals("update")) {
            Date fecha;
             try {
                 String f = request.getParameter("fecha");
                 System.out.println("ESTOO ES LO QUE RECIBIMOS: " + f);
                 fecha = new SimpleDateFormat("dd/MM/yyyy").parse(f);
                 this.updateMiembro(request, response, fecha);
             } catch (ParseException ex) {
                 Logger.getLogger(MiembroServlet.class.getName()).log(Level.SEVERE, null, ex);
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
