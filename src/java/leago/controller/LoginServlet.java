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
import leago.error.AuthenticationException;
import leago.models.User;
import leago.service.LoginService;

/**
 *
 * @author v094702
 */
public class LoginServlet extends HttpServlet {

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
            String name = (String) request.getParameter("name");
            String password = (String) request.getParameter("password");
            
            // V A L I D A T I O N
            if(!validate(name)) {
                
                // F O R W A R D I N G
                request.setAttribute("page", "login");
                request.getRequestDispatcher("/WEB-INF/frame.jsp").forward(request, response);    
            } else {
                
                // O P E R A T I O N
                LoginService login = new LoginService();
                boolean result = login.authenticate(name, password);

                // R E S U L T # H A N D L I N G
                if(result) {
                    User user = login.getLoginUser(name);
                    request.getSession().setAttribute("user", user);

                    // R E D I R E C T I N G
                    response.sendRedirect(request.getContextPath() + "/user?profile=" + user.getName());
                }                
            }
            
        } catch (AuthenticationException ex) {
            
            // E R R O R # L O G G I N G
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("message", ex);   

            // F O R W A R D I N G
            request.setAttribute("page", "login");
            request.getRequestDispatcher("/WEB-INF/frame.jsp").forward(request, response);
        }
        
        
    }
    
    private boolean validate(String name) {
        boolean result = false;
        
        // if not null or no empty string
        if(name != null && !name.trim().equals("")) {
            result = true;
        }
        
        return result;
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