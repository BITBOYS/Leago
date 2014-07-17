/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package leago.controller;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import leago.error.exceptions.DatabaseConnectionException;
import leago.helper.UserHelper;
import leago.models.User;

/**
 *
 * @author v094702
 */
public class ProfileServlet extends HttpServlet {

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
        try { 
            response.setContentType("text/html;charset=UTF-8");
            
            // P A R A M E T E R S
            String name = (String) request.getParameter("profile");
        
            // O P E R A T I O N
            UserHelper userHelper = new UserHelper();
            User user = userHelper.getUser(name);
            
            // R E S U L T # H A N D L I N G
            request.setAttribute("profileuser", user);
            
        } catch (DatabaseConnectionException ex) {
            
            // E R R O R # L O G G I N G
            Logger.getLogger(ProfileServlet.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("message", ex);   

            // F O R W A R D I N G
            request.setAttribute("page", "login");
            request.getRequestDispatcher("/WEB-INF/frame.jsp").forward(request, response);
        }
        
        // F O R W A R D I N G
        request.setAttribute("page", "user/profile");
        request.getRequestDispatcher("/WEB-INF/frame.jsp").forward(request, response);
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
        processRequest(request, response);
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
