/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package leago.controller;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Pattern;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import leago.error.MyException;
import leago.error.exceptions.DatabaseConnectionException;
import leago.error.exceptions.UserCreationException;
import leago.error.exceptions.UserNotExistingException;
import leago.error.exceptions.UserUpdateException;
import leago.helper.UserHelper;
import leago.models.Team;
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

//    private static final Pattern generalPattern = Pattern.compile("^[A-Za-z0-9+-*/, =!?<>]++$");
    private static final Pattern MAIL_PATTERN = Pattern.compile("^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-+]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$");
    private static final Pattern PASSWORD_PATTERN = Pattern.compile("^(?=.*[_A-Za-z0-9-+!?@%$§&€])(?=\\S+$).{8,}$");
//^                 # start-of-string
//(?=.*[0-9])       # a digit must occur at least once
//(?=.*[a-z])       # a lower case letter must occur at least once
//(?=.*[A-Z])       # an upper case letter must occur at least once
//(?=.*[@#$%^&+=])  # a special character must occur at least once
//(?=\S+$)          # no whitespace allowed in the entire string
//.{8,}             # anything, at least eight places though
//$                 # end-of-string

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
            throws ServletException, IOException, UserCreationException {
        this.request = request;
        this.response = response;

        String servletPath = request.getServletPath().substring(1);
        String[] pathinfo = (request.getPathInfo() == null) ? new String[0] : request.getPathInfo().substring(1).split("/");
        String id = "";

        for (int idx = 0; idx < pathinfo.length; idx++) {

            switch (idx) {
                case 0:
                    id = pathinfo[idx];
                    break;
                default:
                    break;
            }
        }

        if (servletPath.equals("register") && id.equals("create")) {
            _create();
        } else if (servletPath.equals("register")) {
            _new();
        } else if (servletPath.equals("settings") && id.trim().equals("delete")) {
            _destroy();
        } else if (servletPath.equals("settings")) {
            _change(id);
        } else if (!id.trim().equals("")) {
            _show(id);
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
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

    private void _create() throws IOException, ServletException, UserCreationException {
        page = "/login";

        // P A R A M E T E R S
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String reenter_password = request.getParameter("reenter_password");

        if (MAIL_PATTERN.matcher(email).matches()) {
            if (PASSWORD_PATTERN.matcher(password).matches()) {
                try {
                    // O P E R A T I O N
                    UserHelper userHelper = new UserHelper();
                    userHelper.createUser(name, email, password, reenter_password);
                    request.setAttribute("message", new MyException("Sign Up successful. You can now sign in.", MyException.SUCCESS));

                } catch (UserCreationException | DatabaseConnectionException ex) {
                    Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
                    request.setAttribute("message", ex);
                    page = "/user/create";
                }
            } else {
                page = "/user/create";
                request.setAttribute("message", new MyException("Password must occure: "
                        + "<ul><li>at least eight characters</li>"
                        + "<li>no whitespaces</li></ul>", MyException.INFO));
            }
        } else {
            page = "/user/create";
            request.setAttribute("message", new MyException("Please give us your real Mail address", MyException.SUCCESS));
        }

        forward();
    }

    private void _change(String id) throws IOException, ServletException {
        try {

            switch (id) {
                case "profile":
                    page = "user/update_profile";

                    if (request.getParameter("input_name_new1") != null
                            && !request.getParameter("input_name_new1").trim().equals("")
                            && request.getParameter("input_name_new2") != null
                            && !request.getParameter("input_name_new2").trim().equals("")) {
                        updateName();
                    } else if (request.getParameter("input_email_new1") != null
                            && !request.getParameter("input_email_new1").trim().equals("")
                            && request.getParameter("input_email_new2") != null
                            && !request.getParameter("input_email_new2").trim().equals("")) {
                        updateEmail();
                    } else if (request.getParameter("input_password_new1") != null
                            && !request.getParameter("input_password_new1").trim().equals("")
                            && request.getParameter("input_password_new2") != null
                            && !request.getParameter("input_password_new2").trim().equals("")
                            && request.getParameter("input_password_old") != null
                            && !request.getParameter("input_password_old").trim().equals("")) {
                        updatePassword();
                    }
                    break;

                case "teams":
                    page = "user/update_teams";
                    if (request.getParameter("action") != null && request.getParameter("action").equals("exit")) {
                        leaveTeam();
                    }
                    break;

                case "tournaments":
                    page = "user/update_tournaments";
                    break;

                default:
                    page = "user/update_profile";
            }

            request.setAttribute("settings_action", id);

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
            request.getSession().invalidate();
        } catch (UserUpdateException | DatabaseConnectionException ex) {
            Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("message", ex);
        }

        // R E D I R E C T I N G
        forward();
    }

    private void leaveTeam() throws DatabaseConnectionException {

        // P A R A M E T E R S
        User user = (User) request.getSession().getAttribute("user");
        int idx = Integer.valueOf(request.getParameter("team"));
        Team team = ((User) request.getSession().getAttribute("user")).getTeams().get(idx);

        // O P E R A T I O N
        UserHelper userHelper = new UserHelper();
        try {
            userHelper.leaveTeam(user, team);
            user = userHelper.getUser(user.getName());
            request.setAttribute("message", new MyException("Team successfully left", MyException.SUCCESS));
            request.getSession().setAttribute("user", user);

        } catch (UserUpdateException | UserNotExistingException ex) {
            Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("message", ex);
        }
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
            user = userHelper.getUser(input_name_new1);
            request.setAttribute("message", new MyException("Username update successful", MyException.SUCCESS));
            request.getSession().setAttribute("user", user);
        } catch (UserUpdateException | UserNotExistingException ex) {
            Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("message", ex);
        }
    }

    private void updateEmail() throws DatabaseConnectionException {

        // P A R A M E T E R S
        String input_email_new1 = request.getParameter("input_email_new1");
        String input_email_new2 = request.getParameter("input_email_new2");
        User user = (User) request.getSession().getAttribute("user");

        // O P E R A T I O N
        UserHelper userHelper = new UserHelper();
        try {
            userHelper.updateEmail(user.getName(), input_email_new1, input_email_new2);
            user = userHelper.getUser(input_email_new1);
            request.setAttribute("message", new MyException("Email update successful", MyException.SUCCESS));
            request.getSession().setAttribute("user", user);
        } catch (UserUpdateException | UserNotExistingException ex) {
            Logger.getLogger(UserServlet.class.getName()).log(Level.INFO, null, ex);
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
            user = userHelper.getUser(user.getName());
            request.getSession().setAttribute("user", user);
            request.setAttribute("message", new MyException("Password update successful", MyException.SUCCESS));

        } catch (UserUpdateException | UserNotExistingException ex) {
            Logger.getLogger(UserServlet.class.getName()).log(Level.INFO, null, ex);
            request.setAttribute("message", ex);
        }
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
        try {
            processRequest(request, response);
        } catch (UserCreationException ex) {
            Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (UserCreationException ex) {
            Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
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
