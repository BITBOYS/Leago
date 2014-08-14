package leago.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import leago.helper.TournamentHelper;
import leago.models.Match;
import leago.models.Schedule;
import leago.models.Team;
import leago.models.Tournament;
import leago.models.User;

/**
 *
 * @author v094702
 */
public class TournamentServlet extends HttpServlet {

    private static final DateFormat FORMATTER_DATE = new SimpleDateFormat("yyyy-MM-dd HH:mm");
    
    private String page;
    private String path = "/WEB-INF/frame.jsp";
    HttpServletRequest request;
    HttpServletResponse response;
    boolean redirect;
    Tournament tournament;

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
        redirect = false;
        tournament = new Tournament();

        String servletPath = request.getServletPath().substring(1);
        String[] pathinfo = (request.getPathInfo() == null) ? new String[0] : request.getPathInfo().substring(1).split("/");
        String id = "";
        String settings_action = "";
        boolean settings = false;
        boolean match = false;

        for (int idx = 0; idx < pathinfo.length; idx++) {

            switch (idx) {
                case 0:
                    id = pathinfo[idx];
                    break;
                case 1: 
                    if(pathinfo[idx].equals("settings"))
                        settings = true;
                    if(pathinfo[idx].equals("match"))
                        match = true;
                    break;
                case 2:
                    settings_action = pathinfo[idx];
                default:
                    break;
            }
        }    
        
        if (servletPath.equals("new/tournament") && id.equals("create")) // "leago.de/new/tournament"
            _create();
        else if (servletPath.equals("new/tournament") && id.trim().equals("")) // "leago.de/new/tournament/xxx"
            _new();
        else if (servletPath.equals("tournament") && !id.trim().equals("") && settings && settings_action.equals("delete")) // "leago.de/tournament/xxx/settings/delete"
            _destroy(id);
        else if(servletPath.equals("tournament") && !id.trim().equals("") && match && !settings_action.trim().equals(""))
            _match(id, settings_action);
        else if (servletPath.equals("tournament") && !id.trim().equals("") && settings) // "leago.de/tournament/xxx/settings/xxx"
            _change(id, settings_action);
        else if(servletPath.equals("tournament") && !id.trim().equals("")) // "leago.de/tournament/xxx/"
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

            // R E S U L T # H A N D L I N G
            request.setAttribute("tournament", tournament);
            forward();

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
        String venue = request.getParameter("tournament_venue");
        String startdate = request.getParameter("tournament_startdate");
        String enddate = request.getParameter("tournament_enddate");
        String deadline = request.getParameter("tournament_deadline");
        String description = request.getParameter("tournament_description");
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

        try {
            page = "tournament/update_profile";
            
            // O P E R A T I O N
            TournamentHelper tournamentHelper = new TournamentHelper();
            tournament = tournamentHelper.getTournament(id);
            
            switch (settings_action) {
                case "profile":
                    updateProfile();
                    break;                           

                case "teams":
                    page = "tournament/update_teams";
                    if(request.getParameter("action") != null && request.getParameter("action").equals("invite"))
                        inviteTeam();
                    if(request.getParameter("action") != null && request.getParameter("action").equals("kick"))
                        kickTeam();
                    break;

                case "danger":
                    page = "tournament/update_danger";
                    
                    String leader = request.getParameter("input_leader_new");
                    
                    if(validInput(leader))
                        updateLeader(leader);
                    break;
                    
                case "schedule":
                    page = "tournament/update_profile";
                    
                    if(request.getParameter("action") != null && request.getParameter("action").equals("accept")) {
                        createSchedule();
                    } else {
                        generateSchedule();
                    }
                    settings_action = "profile";
                    break;

                default:
                    settings_action = "profile";
                    break;
            }
            
            request.setAttribute("tournament", tournament);
            request.setAttribute("settings_action", settings_action);
            
            if(redirect) {
                response.sendRedirect(request.getContextPath() + "/tournament/" + tournament.getName() + "/settings/profile");
            } else {
                forward();
            }

        } catch (DatabaseConnectionException ex) {
            Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("message", ex);
        }

    }

    private void _destroy(String id) throws IOException, ServletException {
        page = "tournament/destroy";

        // O P E R A T I O N
        TournamentHelper tournamentHelper = new TournamentHelper();

        try {
            tournamentHelper.deleteTournament(id);
        } catch (TournamentUpdateException | DatabaseConnectionException ex) {
            Logger.getLogger(TournamentServlet.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("message", ex);
        }

        // R E D I R E C T I N G
        forward();
    }
    
    private void _match(String id, String match_id) throws IOException, ServletException {
        page = "tournament/show";
        
        // P A R A M E T E R
        int points_home = ((request.getParameter("input_points1") == null || request.getParameter("input_points1").equals(""))) ? 0 : Integer.valueOf(request.getParameter("input_points1"));
        int points_away = ((request.getParameter("input_points2") == null || request.getParameter("input_points2").equals(""))) ? 0 : Integer.valueOf(request.getParameter("input_points2"));
            
        // O P E R A T I O N
        try {
            // Wenn gültige Werte (Zahlen größer als oder gleich 0) eingeben Wurden           
            if(points_home >= 0 || points_away >= 0) {
                TournamentHelper tournamentHelper = new TournamentHelper();
                tournament = tournamentHelper.getTournament(id);
                User user = (User) request.getSession().getAttribute("user");
                

                if(user.getName().equals(tournament.getLeader().getName())) {
                    // Aktualisiertes Match-Objekt aus der DB lesen
                    Match match = tournamentHelper.getMatch(Integer.valueOf(match_id));
                    // Tabelle aktualisieren
                    tournamentHelper.updateTournamentTable(tournament, match, points_home, points_away);
                    // Match in die DB schreiben
                    tournamentHelper.editTournamentMatch(Integer.valueOf(match_id), points_home, points_away);
                    // Aktualisiertes Match-Objekt aus der DB lesen
                    match = tournamentHelper.getMatch(Integer.valueOf(match_id));
                    
                    // Neue Tabelle aus der DB lesen und ins Objekt schreiben, ums es auf der Profilseite anzuzeigen
                    tournament.setTable(tournamentHelper.getTableByTournament(tournament.getName()));
                    // Neues Match objekt ins Turnier schreiben, damit es auf der Profilseite aktuell angezeigt wird
                    tournament.getSchedule().getRounds().get(match.getRound_nr()-1).getMatches().set(match.getGame_nr()-1, match);
                    // Erfoglsmeldung
                    request.setAttribute("message", new MyException("The match result was updated successfully", MyException.SUCCESS));
                } else {
                    throw new TournamentUpdateException("You must be logged in as the leader of the tournament to do this", MyException.ERROR);
                }
            } else {
                throw new TournamentUpdateException("Please enter a valid match result", MyException.ERROR);
            }
            
            request.setAttribute("tournament", tournament);
        } catch (DatabaseConnectionException | TournamentUpdateException | TournamentNotExistingException ex) {
            Logger.getLogger(TournamentServlet.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("message", ex);
        }
        
        forward();
    }
    
    private void createSchedule() {
        try {
            TournamentHelper tournamentHelper = new TournamentHelper();
            tournament.setSchedule(tournamentHelper.createTournamentSchedule(tournament));
            request.setAttribute("message", new MyException("The schedule was created successfully", MyException.SUCCESS));
                    
        } catch (TournamentNotExistingException | DatabaseConnectionException | TournamentUpdateException ex) {
            Logger.getLogger(TournamentServlet.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("message", ex);
        }
    }
    
    private void generateSchedule() {
        page = "tournament/generate_schedule";
        
        try {
            TournamentHelper tournamentHelper = new TournamentHelper();
            Schedule schedule = tournamentHelper.generateSchedule(tournament);
            
            request.setAttribute("schedule", schedule);
        } catch (DatabaseConnectionException | TournamentNotExistingException ex) {
            Logger.getLogger(TournamentServlet.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("message", ex);
        }
    }
    
    private boolean validInput(String input) {
        boolean result = true;
        
        if(input == null || input.trim().equals(""))
            result = false;
        
        return result;
    }
    
     private void inviteTeam() throws DatabaseConnectionException {

        // P A R A M E T E R S
        String new_team = request.getParameter("new_team");
        
        // O P E R A T I O N
        TournamentHelper tournamentHelper = new TournamentHelper();
        
        try {
            tournamentHelper.inviteTeam(new_team, tournament);
            tournament = tournamentHelper.getTournament(tournament.getName());
            request.setAttribute("message", new MyException("Team invited successfully", MyException.SUCCESS));
            request.setAttribute("tournament", tournament);
            
        } catch (TournamentUpdateException | TournamentNotExistingException ex) {
            Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("message", ex);
        }
    }
    
    private void kickTeam() throws DatabaseConnectionException {

        // P A R A M E T E R S
        int idx = Integer.valueOf(request.getParameter("team"));
        Team team = tournament.getTeams().get(idx);
        
        // O P E R A T I O N
        TournamentHelper tournamentHelper = new TournamentHelper();
        
        try {
            tournamentHelper.kickTeam(team, tournament);
            tournament = tournamentHelper.getTournament(tournament.getName());
            request.setAttribute("message", new MyException("Team kicked successfully", MyException.SUCCESS));
            request.setAttribute("tournament", tournament);
            
        } catch (TournamentUpdateException | TournamentNotExistingException ex) {
            Logger.getLogger(TournamentServlet.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("message", ex);
        }
    }
    
    private void updateProfile() throws DatabaseConnectionException {
            
        // P A R A M E T E R
        String name1 = request.getParameter("input_name_new1");
        String name2 = request.getParameter("input_name_new2");
        String description = request.getParameter("input_description_new");
        String venue = request.getParameter("input_venue_new");
        String rounds = request.getParameter("input_rounds_new");
        String start_date = request.getParameter("input_startdate_new");
        String end_date = request.getParameter("input_enddate_new");
        String deadline = request.getParameter("input_deadline_new");
            
        if(validInput(name1) && validInput(name2)) {
            updateName(name1, name2);
        } else if(validInput(description)) {
            updateDescription(description);
        } else if(validInput(venue)) {
            updateVenue(venue);
        } else if(validInput(rounds)) {
            updateRounds(Integer.valueOf(rounds));
        } else if(validInput(start_date)) {
            updateStart_date(start_date);
        } else if(validInput(end_date)) {
            updateEnd_date(end_date);
        } else if(validInput(deadline)) {
            updateDeadline(deadline);
        }
    }

    private void updateName(String input_name_new, String input_name_new2) throws DatabaseConnectionException {

        // O P E R A T I O N
        TournamentHelper tournamentHelper = new TournamentHelper();
        try {
            tournamentHelper.editTournamentName(tournament.getName(), input_name_new, input_name_new2);
            tournament = tournamentHelper.getTournament(input_name_new);
            redirect = true;
        } catch (TournamentUpdateException | TournamentNotExistingException ex) {
            request.setAttribute("value_name1", input_name_new);
            request.setAttribute("value_name2", input_name_new2);
            Logger.getLogger(TournamentServlet.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("message", ex);
        }

    }

    private void updateLeader(String input_leader_new) throws DatabaseConnectionException {

        // O P E R A T I O N
        TournamentHelper tournamentHelper = new TournamentHelper();
        try {
            tournamentHelper.editTournamentLeader(tournament.getName(), input_leader_new);
            tournament.setLeader(new User(input_leader_new));
            redirect = true;
        } catch (TournamentUpdateException ex) {
            request.setAttribute("value_leader", input_leader_new);
            Logger.getLogger(TournamentServlet.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("message", ex);
        }
    }

    private void updateDescription(String input_description_new) throws DatabaseConnectionException {

        // O P E R A T I O N
        TournamentHelper tournamentHelper = new TournamentHelper();
        try {
            tournamentHelper.editTournamentDescription(tournament.getName(), input_description_new);
            tournament.setDescription(input_description_new);
            request.setAttribute("message", new MyException("The description was updated successfully", MyException.SUCCESS));
        } catch (TournamentUpdateException ex) {
            request.setAttribute("value_description", input_description_new);
            Logger.getLogger(TournamentServlet.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("message", ex);
        }
    }

    private void updateVenue(String input_venue_new) throws DatabaseConnectionException {

        // O P E R A T I O N
        TournamentHelper tournamentHelper = new TournamentHelper();
        try {
            tournamentHelper.editTournamentVenue(tournament.getName(), input_venue_new);
            tournament.setVenue(input_venue_new);
            request.setAttribute("message", new MyException("The venue was updated successfully", MyException.SUCCESS));
        } catch (TournamentUpdateException ex) {
            request.setAttribute("value_venue", input_venue_new);
            Logger.getLogger(TournamentServlet.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("message", ex);
        }
    }

    private void updateRounds(int input_rounds_new) throws DatabaseConnectionException {

        // O P E R A T I O N
        TournamentHelper tournamentHelper = new TournamentHelper();
        try {
            tournamentHelper.editTournamentRounds(tournament.getName(), input_rounds_new);
            tournament.setRounds(input_rounds_new);
            request.setAttribute("message", new MyException("The amount of rounds was updated successfully", MyException.SUCCESS));
        } catch (TournamentUpdateException ex) {
            request.setAttribute("value_rounds", input_rounds_new);
            Logger.getLogger(TournamentServlet.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("message", ex);
        }
    }

    private void updateStart_date(String input_startdate_new) throws DatabaseConnectionException {

        // O P E R A T I O N
        TournamentHelper tournamentHelper = new TournamentHelper();
        try {
            Date dateStart = FORMATTER_DATE.parse(input_startdate_new.replace('T', ' '));
            tournamentHelper.editTournamentStartDate(tournament, dateStart);
            tournament.setStart_date(dateStart);
            request.setAttribute("message", new MyException("The start date was updated successfully", MyException.SUCCESS));
        } catch (TournamentUpdateException | ParseException ex) {
            request.setAttribute("value_start_date", input_startdate_new);
            Logger.getLogger(TournamentServlet.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("message", ex);
        }
    }

    private void updateEnd_date(String input_enddate_new) throws DatabaseConnectionException {

        // O P E R A T I O N
        TournamentHelper tournamentHelper = new TournamentHelper();
        try {
            Date dateEnd = FORMATTER_DATE.parse(input_enddate_new.replace('T', ' '));
            tournamentHelper.editTournamentEndDate(tournament, dateEnd);
            tournament.setEnd_date(dateEnd);
            request.setAttribute("message", new MyException("The end date was updated successfully", MyException.SUCCESS));
        } catch (TournamentUpdateException | ParseException ex) {
            request.setAttribute("value_end_date", input_enddate_new);
            Logger.getLogger(TournamentServlet.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("message", ex);
        }
    }

    private void updateDeadline(String input_deadline_new) throws DatabaseConnectionException {

        // O P E R A T I O N
        TournamentHelper tournamentHelper = new TournamentHelper();
        try {
            Date dateDeadline = FORMATTER_DATE.parse(input_deadline_new.replace('T', ' '));
            tournamentHelper.editTournamentDeadline(tournament, dateDeadline);
            tournament.setDeadline(dateDeadline);
            request.setAttribute("message", new MyException("The dateline was updated successfully", MyException.SUCCESS));
        } catch (TournamentUpdateException | ParseException ex) {
            request.setAttribute("value_deadline", input_deadline_new);
            Logger.getLogger(TournamentServlet.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("message", ex);
        }
    }

    private void forward() throws ServletException, IOException {

        // F O R W A R D I N G
        request.setAttribute("page", this.page);
        request.getRequestDispatcher(this.path).forward(request, response);
    }
    
    public String toDatetime_local(Date date) {
        String result = "";
        
        if(date != null) {
            SimpleDateFormat formatter1 = new SimpleDateFormat("yyyy-MM-dd");
            String day = formatter1.format(date);
            SimpleDateFormat formatter2 = new SimpleDateFormat("hh:MM:ss");
            String hour = formatter2.format(date);
            
            result = day + "T" + hour;
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
