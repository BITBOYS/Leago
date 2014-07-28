package leago.controller;

import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import leago.error.MyException;
import leago.error.exceptions.DatabaseConnectionException;
import leago.error.exceptions.TournamentCreationException;
import leago.error.exceptions.TournamentNotExistingException;
import leago.error.exceptions.TournamentUpdateException;
import leago.error.success.TournamentCreationSuccess;
import leago.error.success.TournamentUpdateSuccess;
import leago.helper.TournamentHelper;
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
            throws ServletException, IOException, DatabaseConnectionException, TournamentNotExistingException, ParseException {
        this.request = request;
        this.response = response;

        String servletPath = request.getServletPath().substring(1);
        String[] pathinfo = (request.getPathInfo() == null) ? new String[0] : request.getPathInfo().substring(1).split("/");
        String id = "";
        String settings_action = "";
        boolean settings = false;

        for (int idx = 0; idx < pathinfo.length; idx++) {

            switch (idx) {
                case 0:
                    id = pathinfo[idx];
                    break;
                case 1: 
                    if(pathinfo[idx].equals("settings"))
                        settings = true;
                    break;
                case 2:
                    settings_action = pathinfo[idx];
                default:
                    break;
            }
        }    
        
        if (servletPath.equals("new/tournament") && id.equals("create"))
            _create();
        else if (servletPath.equals("new/tournament") && id.trim().equals(""))
            _new();
        else if (servletPath.equals("tournament") && !id.trim().equals("") && settings && settings_action.equals("delete"))
            _destroy(id);
        else if (servletPath.equals("tournament") && !id.trim().equals("") && settings)
            _change(id, settings_action);
        else if(servletPath.equals("tournament") && !id.trim().equals(""))
            _show(id);
        else 
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
    }

    private void _show(String id) throws ServletException, IOException {
        page = "tournament/show";

        try {
            // O P E R A T I O N
            TournamentHelper tournamentHelper = new TournamentHelper();
            Tournament tournament = tournamentHelper.getTournament(id);

            tournament.setSchedule(tournamentHelper.createTournamentSchedule(tournament));

            //GET ALL TEAMS FOR SCHEDULE
            tournament.setSchedule(tournamentHelper.createTournamentSchedule(tournament));
            //GET THE STATISTIC OF ALLE TOURNAMENT MEMBERS
            ArrayList<User> member = tournamentHelper.getMemberByTournament(id);

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
        page = "tournament/create";
        forward();
    }

    private void _create() throws ServletException, IOException, ParseException {
        page = "/tournament/show";

        // P A R A M E T E R
        String name = request.getParameter("tournament_name");
        int rounds = ((request.getParameter("tournament_rounds") == null || request.getParameter("tournament_rounds").equals(""))) ? 1 : Integer.valueOf(request.getParameter("tournament_rounds"));
        String venue = request.getParameter("tournament_venue").equals("") ? null : "'" + request.getParameter("tournament_venue") + "'";;
        String startdate = (request.getParameter("tournament_startdate").equals("")) ? null : "'" + request.getParameter("tournament_startdate") + "'";
        String enddate = (request.getParameter("tournament_enddate").equals("")) ? null : "'" + request.getParameter("tournament_enddate") + "'";
        String deadline = (request.getParameter("tournament_deadline").equals("")) ? null : "'" + request.getParameter("tournament_deadline") + "'";
        String description = request.getParameter("tournament_description").equals("") ? null : "'" + request.getParameter("tournament_description") + "'";
        User leader = (User) request.getSession().getAttribute("user");

        try {
            // O P E R A T I O N
            TournamentHelper tournamentHelper = new TournamentHelper();
            tournamentHelper.createTournament(name, leader, startdate, enddate, description, rounds, venue, deadline);
            request.setAttribute("message", new MyException("Tournament creation successful", MyException.SUCCESS));
            
            response.sendRedirect(request.getContextPath() + "/tournament/" + name);

        } catch (TournamentCreationException | DatabaseConnectionException ex) {
            Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("message", ex);
            request.setAttribute("name", name);
            request.setAttribute("rounds", rounds);
            request.setAttribute("venue", venue);
            request.setAttribute("startdate", startdate);
            request.setAttribute("enddate", enddate);
            request.setAttribute("deadline", deadline);
            request.setAttribute("description", description);
            
            page = "/tournament/create";
            
            forward();
        }
        
        
    }

    private void _change(String id, String settings_action) throws ServletException, IOException, TournamentNotExistingException {
        System.out.println("update - " + settings_action);

        try {
            page = "tournament/update_tournament";

            // O P E R A T I O N
            TournamentHelper tournamentHelper = new TournamentHelper();
            Tournament tournament = tournamentHelper.getTournament(id);
            request.setAttribute("tournament", tournament);

            switch (settings_action) {
                case "tournament":
                    page = "tournament/update_tournament";                    
                    break;

                case "team":
                    page = "tournament/update_teams";
                    break;

                case "danger":
                    page = "tournament/update_danger";
                    break;

                default:
                    break;
            }

            request.setAttribute("settings_action", settings_action);
            
            forward();

        } catch (DatabaseConnectionException ex) {
            Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("message", ex);
        }

    }

    private void _destroy(String id) {
//        System.out.println("destroy");
//        page = "tournament/destroy";
//
//        // O P E R A T I O N
//        TournamentHelper tournamentHelper = new TournamentHelper();
//
//        try {
//            tournamentHelper.deleteTournament(id);
//        } catch (TournamentUpdateException | DatabaseConnectionException ex) {
//            Logger.getLogger(TournamentServlet.class.getName()).log(Level.SEVERE, null, ex);
//            request.setAttribute("message", ex);
//        } catch (TournamentCreationSuccess ex) {
//            request.setAttribute("message", ex);
//        }
//
//        // R E D I R E C T I N G
//        forward();
    }

    private void updateName() throws DatabaseConnectionException {

        // P A R A M E T E R S
        String input_name_new = request.getParameter("input_name_new");
        Tournament tournament = (Tournament) request.getAttribute("tournament");

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

    private void forward() throws ServletException, IOException {

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
        try {
            processRequest(request, response);
        } catch (DatabaseConnectionException ex) {
            Logger.getLogger(TournamentServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (TournamentNotExistingException ex) {
            Logger.getLogger(TournamentServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            Logger.getLogger(TournamentServlet.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (DatabaseConnectionException ex) {
            Logger.getLogger(TournamentServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (TournamentNotExistingException ex) {
            Logger.getLogger(TournamentServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            Logger.getLogger(TournamentServlet.class.getName()).log(Level.SEVERE, null, ex);
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
