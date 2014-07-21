/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package leago.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import leago.error.exceptions.DatabaseConnectionException;
import leago.error.exceptions.TournamentNotExistingException;
import leago.helper.TournamentHelper;
import leago.models.Team;
import leago.models.Tournament;
import leago.models.User;

/**
 *
 * @author v094702
 */
@WebServlet(name = "TournamentServlet", urlPatterns = {"/tournament"})
public class TournamentServlet extends HttpServlet {

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
        
        if(!id.trim().equals(""))
            _show(id);
//        else if (servletPath.equals("register") && id.equals("create"))
//            _create();
//        else if (servletPath.equals("register"))
//            _new();
    
    }
    
    private void _show(String id) throws ServletException, IOException {
        page = "tournament/show";
        System.out.println("show");
        
        try {
            // O P E R A T I O N
            TournamentHelper tournamentHelper = new TournamentHelper();
            Tournament tournament = tournamentHelper.getTournament(id);
            ArrayList<Team> teams = tournamentHelper.getTeamsByTournament(id);
            ArrayList<User> member = tournamentHelper.getTournamentMember(id);
            
            // R E S U L T # H A N D L I N G
            request.setAttribute("tournament", tournament);
            request.setAttribute("teams", teams);
            request.setAttribute("member", member);
            forward();
            
        } catch (DatabaseConnectionException ex) {
            
            // E R R O R # L O G G I N G
            Logger.getLogger(TournamentServlet.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("message", ex);   

            // F O R W A R D I N G
            path = "/index.jsp";
            forward();
            
        } catch (TournamentNotExistingException ex) {
            Logger.getLogger(TournamentServlet.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("message", ex);   
            
            // F O R W A R D I N G
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
        
    }
    
    private void _new() {
        
    }
    
    private void _create() {
        
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
