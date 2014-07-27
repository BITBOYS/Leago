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
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import leago.error.exceptions.AuthenticationException;
import leago.error.exceptions.DatabaseConnectionException;
import leago.error.exceptions.UserNotExistingException;
import leago.helper.UserHelper;
import leago.helper.BCrypt;
import leago.models.User;

/**
 *
 * @author v094702
 */
@WebServlet(name = "SessionServlet", urlPatterns = {"/SessionServlet"})
public class SessionServlet extends HttpServlet {

    private String page = "";
    private String path = "/WEB-INF/frame.jsp";    
    HttpServletRequest request;
    HttpServletResponse response;
    
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
        
        String action = request.getRequestURI().substring(7);
        String action2 = request.getParameter("action");
        this.request = request;
        this.response = response;
        
        if(action.equals("login") && action2 == null)
            _new();
        else if(action.equals("login") && action2.equals("create")) 
            _create();
        else if(action.equals("logout")) 
            _destroy();
        
    }
    
    private void _new() throws ServletException, IOException {
        page = "login";
        forward();
    }
    
    private void _create() throws IOException, ServletException {
        try {            
            // P A R A M E T E R S
            String id = (String) request.getParameter("id");  
            String password = request.getParameter("password");
            
            // O P E R A T I O N
            UserHelper userHelper = new UserHelper();
            boolean result = userHelper.authenticate(id, password);

            // R E S U L T # H A N D L I N G
            if(result) {
                User user = userHelper.getUser(id);
                request.getSession().setAttribute("user", user);

                // R E D I R E C T I N G
                response.sendRedirect(request.getContextPath() + "/user/" + user.getName());
            }
            
        } catch (AuthenticationException | DatabaseConnectionException | UserNotExistingException ex) {
            // E R R O R # L O G G I N G
            Logger.getLogger(SessionServlet.class.getName()).log(Level.INFO, null, ex);
            request.setAttribute("message", ex);   

            // F O R W A R D I N G
            page = "login";
            forward();
        }
    }
    
    private void _destroy() throws ServletException, IOException {
        request.getSession().invalidate();
        String pageToForward = request.getContextPath();
        response.sendRedirect(pageToForward);
    }    
    
    private void forward() throws ServletException, IOException {        
        // F O R W A R D I N G
        request.setAttribute("page", page);
        request.getRequestDispatcher(path).forward(request, response);
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
