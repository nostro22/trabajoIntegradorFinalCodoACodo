/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.util.LinkedList;
import java.util.List;
import java.util.Collections;
import database.MascotaDAO;
import database.UsuarioDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Usuario;
import model.Mascota;


@WebServlet(name = "anuncioController", urlPatterns = {"/mascotas/*"})
public class MascotaController extends HttpServlet {

  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            
            String action = request.getPathInfo();
            MascotaDAO mascotaDao = new MascotaDAO();
            UsuarioDAO udao = new UsuarioDAO();
            List<Mascota> listaMascotas = null;
            HttpSession session = request.getSession();
            Usuario actualUser;
            Mascota actualMascota;
            String username;
            String password;
            String name;
            String last_name;
            String email;
            
            int idMascota;
            int id;
            String nombre;
            String raza;
            String cliente; 
            String donante;
            Double edad;
            Mascota mascotaActual;
            Date fecha;
            int regs_afectados;
           
            out.print(action);
                    
            switch (action) {
             
                case "/publicar":
                    donante = (String) session.getAttribute("actualUsername");
                    
                    cliente = null;
                    nombre = request.getParameter("nombre");
                    raza = request.getParameter("raza");
                    edad = Double.valueOf(request.getParameter("edad"));
                    actualMascota = new Mascota(nombre,  raza,  cliente,  donante,  edad);
                    regs_afectados = mascotaDao.createMascota(actualMascota);
                    session.setAttribute("aCreado", regs_afectados);
                    response.sendRedirect("/centro/views/MascotaPublicada.jsp");
                    break;
                    
                case "/obtenerLista":                    
                    listaMascotas = mascotaDao.getaMascotas();
                    session.setAttribute("listaMascotas", listaMascotas);
                    response.sendRedirect("/centro/views/listarMascotas.jsp");
                    break;
                    
                case "/borrar":
                     idMascota = Integer.parseInt(request.getParameter("id"));
                     mascotaActual = mascotaDao.getaMascotaById(idMascota);
                    out.print( mascotaDao.deleteMascota(idMascota)); 
                           response.sendRedirect("/centro/mascotas/obtenerLista");
                    break;
                
                case "/adoptar":
                    
                     idMascota = Integer.parseInt(request.getParameter("id"));
                     mascotaActual = mascotaDao.getaMascotaById(idMascota);
                    cliente = (String) session.getAttribute("actualUsername");
                    mascotaActual.setCliente(cliente);
                    out.print( mascotaDao.updateMascota(mascotaActual));  
           
                    response.sendRedirect("/centro/mascotas/obtenerLista");
                
                    break;
                    
                case "/editar":
                    
                    idMascota = Integer.parseInt(request.getParameter("id"));
                    mascotaActual = mascotaDao.getaMascotaById(idMascota);
                    session.setAttribute("aCreado",mascotaActual);
                    
                    response.sendRedirect("/centro/views/MascotaEditar.jsp");
                
                    break;
                
                case "/actualizar":
                    
                    idMascota = Integer.parseInt(request.getParameter("id"));
                    mascotaActual = mascotaDao.getaMascotaById(idMascota);
                    nombre = request.getParameter("nombre");
                    raza = request.getParameter("raza");
                    edad = Double.valueOf(request.getParameter("edad"));
                    mascotaActual.setNombre(nombre);
                    mascotaActual.setRaza(raza);
                    mascotaActual.setEdad(edad);
                    regs_afectados = mascotaDao.updateMascota(mascotaActual);
                     session.setAttribute("aCreado", regs_afectados);
                    response.sendRedirect("/centro/mascotas/obtenerLista");
                
                    break;
                
                default:
                    break;
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(MascotaController.class.getName()).log(Level.SEVERE, null, ex);
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(MascotaController.class.getName()).log(Level.SEVERE, null, ex);
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
