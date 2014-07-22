package leago.controller;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import leago.error.exceptions.DatabaseConnectionException;
import leago.error.exceptions.TournamentNotExistingException;
import leago.error.exceptions.TournamentUpdateException;
import leago.error.success.TournamentUpdateSuccess;
import leago.helper.TournamentHelper;
import leago.models.Tournament;

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
        String[] pathinfo = (request.getPathInfo() == null) ? new String[0] : request.getPathInfo().substring(1).split("/");
        String id = "";
        String action = "";

        for (int idx = 0; idx < pathinfo.length; idx++) {

            switch (idx) {
                case 0:
                    id = pathinfo[idx];
                    break;
                case 1:
                    action = pathinfo[idx];
                    break;
                default:
                    break;
            }
        }
        System.out.print(id);

        if (!id.trim().equals("")) {
            _show(id);
        } else if (servletPath.equals("new/tournament") && id.equals("create")) {
            _create();
        } else if (servletPath.equals("new/tournament")) {
            _new();
        } else if (action.equals("settings") && !id.trim().equals("")) {
            _update(id);
        } else if (servletPath.equals("settings")) {
            _change();
        }
    }

    private void _show(String id) throws ServletException, IOException {
        page = "tournament/show";
        System.out.println(" - show");

        try {
            // O P E R A T I O N
            TournamentHelper tournamentHelper = new TournamentHelper();
            Tournament tournament = tournamentHelper.getTournament(id);

            // R E S U L T # H A N D L I N G
            request.setAttribute("tournament", tournament);
            forward();

            System.out.println(" - " + tournament);

        } catch (DatabaseConnectionException ex) {

            // E R R O R # L O G G I N G
            Logger.getLogger(TournamentServlet.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("message", ex);

            // F O R W A R D I N G
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);

        } catch (TournamentNotExistingException ex) {
            Logger.getLogger(TournamentServlet.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("message", ex);

            // F O R W A R D I N G
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }

    }

    private void _new() throws IOException, ServletException {
        page = "create/tournament";
        forward();
    }

    private void _create() {

    }
    
    private void _change() throws IOException, ServletException {
        page = "user/update";
        forward();
    }
    
    private void _update(String id) throws ServletException, IOException {
        try {
            page = "tournament/update";
            
            switch(id) {
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
    
    private void _destroy() {
       path = "/index.jsp";
    }

    
    
    
    private void updateName() throws DatabaseConnectionException {
        
        // P A R A M E T E R S
        String input_name_new = request.getParameter("input_name_new");
        Tournament tournament = (Tournament)request.getAttribute("tournament");
        
        // O P E R A T I O N
        TournamentHelper tournamentHelper = new TournamentHelper();
        try {
            tournamentHelper.editTournamentName(tournament.getName(), input_name_new);
        } catch (TournamentUpdateException ex) {
            Logger.getLogger(TournamentServlet.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("message", ex);
        } catch (TournamentUpdateSuccess ex) {
            request.setAttribute("message", ex);
            tournament.setName(input_name_new);
            request.getSession().setAttribute("tournament", tournament);
        }
        
    }
    
    private void updatePassword() throws DatabaseConnectionException {
            
        // P A R A M E T E R S
        String input_password_new1 = request.getParameter("input_password_new1");
        String input_password_new2 = request.getParameter("input_password_new2");
        String input_password_old = request.getParameter("input_password_old");
        Tournament tournament = (Tournament) request.getAttribute("tournament");
        
        // O P E R A T I O N
        TournamentHelper tournamentHelper = new TournamentHelper();
        try {
            tournamentHelper.editTournamentPassword(tournament, input_password_old, input_password_new1, input_password_new2);
        } catch (TournamentUpdateException ex) {
            Logger.getLogger(TournamentServlet.class.getName()).log(Level.INFO, null, ex);
            request.setAttribute("message", ex);
        } catch (TournamentUpdateSuccess ex) {
            request.setAttribute("message", ex);
        }
    }
    
    
    private void forward() throws ServletException, IOException {

        // F O R W A R D I N G
        request.setAttribute("page", this.page);
        request.getRequestDispatcher(this.path).forward(request, response);
    }

    private void forward(String page, String path) throws ServletException, IOException {

        if (page != null && !page.trim().equals("")) {
            this.page = page;
        }

        if (path != null && !path.trim().equals("")) {
            this.path = path;
        }

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
