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
import leago.error.MyException;
import leago.error.exceptions.DatabaseConnectionException;
import leago.error.exceptions.UserCreationException;
import leago.error.exceptions.UserNotExistingException;
import leago.error.success.UserCreationSuccessful;
import leago.helper.UserHelper;
import leago.models.User;

/**
 *
 * @author v094702
 */
public class UserServlet extends HttpServlet {

    private String page;
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
        this.request = request;
        this.response = response;
        
        String servletPath = request.getServletPath().substring(1);
        String id = (request.getPathInfo() == null)? "" : request.getPathInfo().substring(1).split("/")[0];
        String action = request.getParameter("action");
        System.out.println(request.getServletPath() + " - " + id);
        
        if (servletPath.equals("register") && id.equals("create"))
            _create();
        else if (servletPath.equals("register"))
            _new();
        else if(!id.trim().equals(""))
            _show(id);
        else 
            path = "/index.jsp";        
    }
    
    private void _show(String id) throws ServletException, IOException {
        page = "user/show";
        
        try {
            // O P E R A T I O N
            UserHelper userHelper = new UserHelper();
            User user = userHelper.getUser(id);
            
            // R E S U L T # H A N D L I N G
            request.setAttribute("profileuser", user);
            forward();
            
        } catch (DatabaseConnectionException ex) {
            
            // E R R O R # L O G G I N G
            Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("message", ex);   

            // F O R W A R D I N G
            path = "/index.jsp";
            forward();
            
        } catch (UserNotExistingException ex) {
            Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("message", ex);   
            
            // F O R W A R D I N G
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }
    
    private void _new() throws IOException, ServletException {
        page = "register";
        forward();
    }
    
    private void _create() throws IOException, ServletException {
        page = "login";
        
        // P A R A M E T E R S
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String reenter_password = request.getParameter("reenter_password");
        
        try {
            // O P E R A T I O N
            UserHelper userHelper = new UserHelper();
            userHelper.createUser(name, email, password, reenter_password);

        } catch (UserCreationException | DatabaseConnectionException ex) {
            Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("message", ex);
            page = "register";
        } catch (UserCreationSuccessful ex) {
            request.setAttribute("message", ex); 
        }
        
        forward();
    }
    
    private void _update() {
        page = "";
    }
    
    private void _destroy() {
       path = "/index.jsp";
    }
    
    private void forward() throws ServletException, IOException {
        
        // F O R W A R D I N G
        request.setAttribute("page", this.page);
        request.getRequestDispatcher(this.path).forward(request, response);
    }
    
    private void forward(String page, String path) throws ServletException, IOException {
        
        if(page != null && !page.trim().equals(""))
            this.page = page;
        
        if(path != null && !path.trim().equals(""))
            this.path = path;
        
        // F O R W A R D I N G
        request.setAttribute("page", this.page);
        request.getRequestDispatcher(this.path).forward(request, response);
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