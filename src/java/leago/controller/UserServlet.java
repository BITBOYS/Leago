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
import leago.error.exceptions.UserCreationException;
import leago.error.exceptions.UserNotExistingException;
import leago.error.exceptions.UserUpdateException;
import leago.error.success.UserCreationSuccess;
import leago.error.success.UserUpdateSuccess;
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
        String[] pathinfo = (request.getPathInfo() == null)? new String[0] : request.getPathInfo().substring(1).split("/");
        String id = "";
        
        for(int idx = 0; idx < pathinfo.length; idx++) {
            
            switch(idx) {
                case 0: id = pathinfo[idx]; break;
                default: break;
            }
        }
        
        if (servletPath.equals("register") && id.equals("create"))
            _create();
        else if (servletPath.equals("register"))
            _new();
        else if (servletPath.equals("settings") && id.trim().equals("delete"))
            _destroy();
        else if (servletPath.equals("settings") && !id.trim().equals(""))
            _update(id);
        else if (servletPath.equals("settings"))
            _change();
        else if(!id.trim().equals(""))
            _show(id);
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
        page = "user/create";
        forward();
    }
    
    private void _create() throws IOException, ServletException {
        page = "/login";
        
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
            page = "/user/create";
            
        } catch (UserCreationSuccess ex) {
            request.setAttribute("message", ex);
        }
     
        forward();
    }
    
    private void _change() throws IOException, ServletException {
        page = "user/update";
        forward();
    }
    
    private void _update(String id) throws ServletException, IOException {
        try {
            page = "user/update";
            
            switch(id) {
                case "email": updateEmail(); break;
                case "name": updateName(); break;
                case "password": updatePassword(); break;
                default: break;
            }
            
            forward();
        } catch (DatabaseConnectionException ex) {
            Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("message", ex);
        }
        
    }
    
    private void _destroy() throws ServletException, IOException {
        page = "user/destroy";
        
        // O P E R A T I O N
        UserHelper userHelper = new UserHelper();
        try {
            userHelper.deleteUser((User) request.getSession().getAttribute("user"));
        } catch (UserUpdateException | DatabaseConnectionException ex) {
            Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("message", ex);
        } catch (UserUpdateSuccess ex) {
            request.getSession().invalidate();
        }
        
        // R E D I R E C T I N G
        forward();
    }
    
    
    
    
    
    
    private void updateName() throws DatabaseConnectionException {
        
        // P A R A M E T E R S
        String input_name_new1 = request.getParameter("input_name_new1");
        String input_name_new2 = request.getParameter("input_name_new2");
        User user = (User) request.getSession().getAttribute("user");
        
        // O P E R A T I O N
        UserHelper userHelper = new UserHelper();
        try {
            userHelper.updateName(user.getName(), input_name_new1, input_name_new2);
        } catch (UserUpdateException ex) {
            Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("message", ex);
        } catch (UserUpdateSuccess ex) {
            request.setAttribute("message", ex);
            user.setName(input_name_new1);
            request.getSession().setAttribute("user", user);
        }
        
    }
    
    private void updateEmail() throws DatabaseConnectionException {
        
        // P A R A M E T E R S
        String input_email_new1 = request.getParameter("input_email_new1");
        String input_email_new2 = request.getParameter("input_email_new2");
        String user = ((User) request.getSession().getAttribute("user")).getName();
        
        // O P E R A T I O N
        UserHelper userHelper = new UserHelper();
        try {
            userHelper.updateEmail(user, input_email_new1, input_email_new2);
        } catch (UserUpdateException ex) {
            Logger.getLogger(UserServlet.class.getName()).log(Level.INFO, null, ex);
            request.setAttribute("message", ex);
        } catch (UserUpdateSuccess ex) {
            request.setAttribute("message", ex);
        }
    }
    
    private void updatePassword() throws DatabaseConnectionException {
            
        // P A R A M E T E R S
        String input_password_new1 = request.getParameter("input_password_new1");
        String input_password_new2 = request.getParameter("input_password_new2");
        String input_password_old = request.getParameter("input_password_old");
        User user = (User) request.getSession().getAttribute("user");
        
        // O P E R A T I O N
        UserHelper userHelper = new UserHelper();
        try {
            userHelper.updatePassword(user, input_password_new1, input_password_new2, input_password_old);
        } catch (UserUpdateException ex) {
            Logger.getLogger(UserServlet.class.getName()).log(Level.INFO, null, ex);
            request.setAttribute("message", ex);
        } catch (UserUpdateSuccess ex) {
            request.setAttribute("message", ex);
        }
    }
    
    private void forward() throws ServletException, IOException {
        
        // F O R W A R D I N G
        request.setAttribute("page", page);
        request.getRequestDispatcher(path).forward(request, response);
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