/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package leago.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import leago.error.MyException;
import leago.error.exceptions.DatabaseConnectionException;
import leago.error.exceptions.TeamCreationException;
import leago.error.exceptions.TeamNotExistingException;
import leago.error.exceptions.TeamUpdateException;
import leago.error.exceptions.UserNotExistingException;
import leago.helper.TeamHelper;
import leago.helper.UserHelper;
import leago.models.Team;
import leago.models.User;

public class TeamServlet extends HttpServlet {
    
    private String page;
    private String path = "/WEB-INF/frame.jsp";  
    HttpServletRequest request;
    HttpServletResponse response;
    Team team;
    boolean redirect;

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
        team = new Team();
        redirect = false;
        
        String servletPath = request.getServletPath().substring(1);
        String[] pathinfo = (request.getPathInfo() == null)? new String[0] : request.getPathInfo().substring(1).split("/");
        String id = "";
        boolean settings = false;
        String settings_action = "";
        
        for(int idx = 0; idx < pathinfo.length; idx++) {

            switch(idx) {
                case 0: 
                    id = pathinfo[idx]; 
                    break;
                case 1: 
                    if(pathinfo[idx].equals("settings"))
                        settings = true;
                    break;
                case 2: 
                    settings_action = pathinfo[idx];
                    request.setAttribute("settings_action", settings_action);
                    break;
                default: 
                    break;
            }
        }
        
        if (servletPath.equals("new/team") && id.equals("create"))
            _create();
        else if (servletPath.equals("new/team") && id.trim().equals(""))
            _new();
        else if (servletPath.equals("team") && !id.trim().equals("") && settings && settings_action.equals("delete"))
            _destroy(id);
        else if (servletPath.equals("team") && !id.trim().equals("") && settings)
            _change(id, settings_action);
        else if(servletPath.equals("team") && !id.trim().equals(""))
            _show(id);
        else 
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
    }
    
    private void _show(String id) {
        page = "team/show";
        
        try {
            // O P E R A T I O N
            TeamHelper teamHelper = new TeamHelper();
            team = teamHelper.getTeam(id);
            
            // R E S U L T # H A N D L I N G
            request.setAttribute("team", team);
            forward();
            
        } catch (DatabaseConnectionException ex) {
            
            // E R R O R # L O G G I N G
            Logger.getLogger(TeamServlet.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("message", ex);   

            // F O R W A R D I N G
            path = "/index.jsp";
            forward();
            
        } catch (TeamNotExistingException ex) {
            Logger.getLogger(TeamServlet.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("message", ex);   
            
            try {
                // F O R W A R D I N G
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
            } catch (IOException ex1) {
                Logger.getLogger(TeamServlet.class.getName()).log(Level.SEVERE, null, ex1);
            }
        }
    }
    
    private void _new() {
        page = "team/create";
        forward();
    }
    
    private void _create() throws IOException {
        page = "team/show";
        
        // P A R A M E T E R S
        String name = request.getParameter("name");
        String tag = request.getParameter("tag");
        User user = (User) request.getSession().getAttribute("user");
        
        try {
            // O P E R A T I O N
            TeamHelper teamHelper = new TeamHelper();
            teamHelper.createTeam(user, name, tag);
            teamHelper.addPlayer(user, name);
            request.setAttribute("message", new MyException("Team creation successful", MyException.SUCCESS));

            response.sendRedirect(request.getContextPath() + "/team/" + name);
            
        } catch (TeamCreationException | DatabaseConnectionException | TeamUpdateException ex) {
            Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("message", ex);
            page = "/team/create";
            forward();
        }
        
    }
    
    private void _change(String id, String setting_action) throws IOException {
        try {
            TeamHelper teamHelper = new TeamHelper();
            team = teamHelper.getTeam(id);
            
            switch (setting_action) {
                case "profile":
                    page = "team/update_profile";
                    
                    if(request.getParameter("input_name_new1") != null && 
                       !request.getParameter("input_name_new1").trim().equals("") &&
                       request.getParameter("input_name_new2") != null && 
                       !request.getParameter("input_name_new2").trim().equals("")) {
                        updateName();
                    } else if(request.getParameter("input_tag_new1") != null && 
                            !request.getParameter("input_tag_new1").trim().equals("") &&
                            request.getParameter("input_tag_new2") != null && 
                            !request.getParameter("input_tag_new2").trim().equals("")) 
                        updateTag();
                    else if(request.getParameter("input_leader_new") != null &&
                            !request.getParameter("input_leader_new").trim().equals(""))
                        updateLeader();
                    break;
                    
                case "member":
                    page = "team/update_member";
                    if(request.getParameter("action") != null && request.getParameter("action").equals("kick"))
                        kickUser();
                    if(request.getParameter("action") != null && request.getParameter("action").equals("invite"))
                        inviteUser();
                    break;
                    
                case "tournaments":
                    page = "team/update_tournaments";
                    break;
                    
                default: 
                    page = "team/update_profile";
            }
            
            request.setAttribute("team", team);
            
            if(redirect) {
                response.sendRedirect(request.getContextPath() + "/team/" + team.getName() + "/settings/profile");
            } else {
                forward();
            }
                
        } catch (DatabaseConnectionException | TeamNotExistingException ex) {
            Logger.getLogger(TeamServlet.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("message", ex);
        }
    }
    
    private void _destroy(String id) {
        page = "team/destroy";
        
        // O P E R A T I O N
        TeamHelper teamHelper = new TeamHelper();
        User user = (User) request.getSession().getAttribute("user");
        
        try {
            Team team = teamHelper.getTeam(id);
            
            if(user.getName().equals(team.getLeader().getName())) {
                teamHelper.deleteTeam(team);
            } else {
                throw new TeamUpdateException("The user isn't the leader of the team", MyException.ERROR);
            }
        } catch (TeamUpdateException | DatabaseConnectionException | TeamNotExistingException ex) {
            Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("message", ex);
        }
        
        // R E D I R E C T I N G
        forward();
    }
    
    private void updateTag() throws DatabaseConnectionException {
        
        // P A R A M E T E R S
        String input_tag_new1 = request.getParameter("input_tag_new1");
        String input_tag_new2 = request.getParameter("input_tag_new2");
        
        // O P E R A T I O N
        TeamHelper teamHelper = new TeamHelper();
        try {
            teamHelper.updateTag(team, input_tag_new1, input_tag_new2);
            team = teamHelper.getTeam(team.getName());
            request.setAttribute("message", new MyException("Teamtag update successful", MyException.SUCCESS));
        } catch (TeamUpdateException | TeamNotExistingException ex) {
            Logger.getLogger(TeamServlet.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("message", ex);
        }
    }
    
    private void updateName() throws DatabaseConnectionException {
        
        // P A R A M E T E R S
        String input_name_new1 = request.getParameter("input_name_new1");
        String input_name_new2 = request.getParameter("input_name_new2");
        
        // O P E R A T I O N
        TeamHelper teamHelper = new TeamHelper();
        try {
            teamHelper.updateName(team, input_name_new1, input_name_new2);
            team = teamHelper.getTeam(input_name_new1);
            redirect = true;
        } catch (TeamUpdateException | TeamNotExistingException ex) {
            Logger.getLogger(TeamServlet.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("message", ex);
        }
    }
    
    private void updateLeader() throws DatabaseConnectionException {
        
        // P A R A M E T E R S
        String input_leader_new = request.getParameter("input_leader_new");
        
        // O P E R A T I O N
        TeamHelper teamHelper = new TeamHelper();
        UserHelper userHelper = new UserHelper();
        
        try {
            if(userHelper.isUserExisting(input_leader_new) &&
               teamHelper.isUserInTeam(team.getName(), input_leader_new)) {
        
                teamHelper.updateLeader(team.getName(), input_leader_new);
                team = teamHelper.getTeam(team.getName());
                request.setAttribute("message", new MyException("Teamleader update successful", MyException.SUCCESS));
            } else {
                throw new UserNotExistingException("The new Leader is not a user", MyException.ERROR);
            }
        } catch (TeamUpdateException | TeamNotExistingException | UserNotExistingException ex) {
            Logger.getLogger(TeamServlet.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("message", ex);
        }
        
        
    }
    
    private void inviteUser() throws DatabaseConnectionException {

        // P A R A M E T E R S
        String new_user = request.getParameter("new_user");
        
        // O P E R A T I O N
        TeamHelper teamHelper = new TeamHelper();
        
        try {
            teamHelper.inviteUser(new_user, team);
            team = teamHelper.getTeam(team.getName());
            request.setAttribute("message", new MyException("User invited successfully", MyException.SUCCESS));
            request.setAttribute("team", team);
            
        } catch (TeamUpdateException | TeamNotExistingException ex) {
            Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("message", ex);
        }
    }
    
    private void kickUser() throws DatabaseConnectionException {

        // P A R A M E T E R S
        int idx = Integer.valueOf(request.getParameter("member"));
        User user = team.getMember().get(idx);
        
        // O P E R A T I O N
        TeamHelper teamHelper = new TeamHelper();
        
        try {
            teamHelper.kickUser(user, team);
            team = teamHelper.getTeam(team.getName());
            request.setAttribute("message", new MyException("User kicked successfully", MyException.SUCCESS));
            request.setAttribute("team", team);
            
        } catch (TeamUpdateException | TeamNotExistingException ex) {
            Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("message", ex);
        }
    }
    
    private void forward() {
        try {
            // F O R W A R D I N G
            request.setAttribute("page", page);
            request.getRequestDispatcher(path).forward(request, response);
        } catch (ServletException | IOException ex) {
            Logger.getLogger(TeamServlet.class.getName()).log(Level.SEVERE, null, ex);
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
