/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package leago.filter;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import leago.error.exceptions.DatabaseConnectionException;
import leago.error.exceptions.TeamNotExistingException;
import leago.error.exceptions.TournamentNotExistingException;
import leago.helper.TeamHelper;
import leago.helper.TournamentHelper;
import leago.models.Team;
import leago.models.Tournament;
import leago.models.User;

/**
 *
 * @author v094702
 */
public class AuthenticatonFilter implements Filter {
    
    public AuthenticatonFilter() {
    }    

    @Override
    public void doFilter(ServletRequest req, ServletResponse res,
            FilterChain chain)
            throws IOException, ServletException {
        
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;
        HttpSession session = request.getSession();
        String[] pathinfo = (request.getPathInfo() == null)? new String[0] : request.getPathInfo().substring(1).split("/");
        String servletPath = request.getServletPath().substring(1);
        String id = "";
        boolean settings = false;
        boolean unauthorized = false;
        String link = "";
        
        for(int idx = 0; idx < pathinfo.length; idx++) {
            switch(idx) {
                case 0: 
                    id = pathinfo[idx]; 
                    break;
                case 1: 
                    if(pathinfo[idx].equals("settings"))
                        settings = true;
                    break;
                default: 
                    break;
            }
        }

        try {
            User user = (User) session.getAttribute("user");

            if(servletPath.equals("team") && !id.trim().equals("") && settings) {
                link = "/team/" + id;
                TeamHelper teamHelper = new TeamHelper();
                Team team = teamHelper.getTeam(id);
                if(user != null) {
                    if(!team.getLeader().getName().equals(user.getName())) 
                        unauthorized = true;
                } else {
                    unauthorized = true;
                }
            }

            if(servletPath.equals("tournament") & !id.trim().equals("") && settings) {
                link = "/tournament/" + id;
                TournamentHelper tournamentHelper = new TournamentHelper();
                Tournament tournament = tournamentHelper.getTournament(id);
                if(user != null) {
                    if(!tournament.getLeader().getName().equals(user.getName())) 
                        unauthorized = true;
                } else {
                    unauthorized = true;
                }
            }

            if (unauthorized)
                response.sendRedirect(request.getContextPath() + link); // Redirect to the Team / Tournament profile page
            else
                chain.doFilter(req, res);

        } catch (DatabaseConnectionException ex) {
            Logger.getLogger(AuthenticatonFilter.class.getName()).log(Level.SEVERE, null, ex);
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        } catch (TeamNotExistingException | TournamentNotExistingException ex) {
            Logger.getLogger(AuthenticatonFilter.class.getName()).log(Level.SEVERE, null, ex);
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
            
    }

    @Override
    public void destroy() {        
    }

    @Override
    public void init(FilterConfig filterConfig) {
    }
    
}
