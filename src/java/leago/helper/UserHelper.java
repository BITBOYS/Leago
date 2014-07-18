/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package leago.helper;

import com.mysql.jdbc.exceptions.MySQLIntegrityConstraintViolationException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import leago.error.MyException;
import leago.error.exceptions.AuthenticationException;
import leago.error.exceptions.DatabaseConnectionException;
import leago.error.exceptions.UserCreationException;
import leago.error.exceptions.UserNotExistingException;
import leago.error.success.UserCreationSuccessful;
import leago.models.Statistics;
import leago.models.Team;
import leago.models.Tournament;
import leago.models.User;

/**
 *
 * @author v094702
 */
public class UserHelper {
    
    public UserHelper() {
        
    }
    
    public void createUser(String name, String email, String password, String reenter_password) throws DatabaseConnectionException, UserCreationException, UserCreationSuccessful {
        
        try {
            if(password.equals(reenter_password)) {
                if(isNameAlreadyTaken(name)) {
                    if(isEmailAlreadyTaken(email)) {

                            Connection con = DatabaseHelper.connect();
                            Statement statement = con.createStatement();

                            statement.execute("insert into user"
                                    + " (username, password, email)"
                                    + " VALUES ('" + name + "','" + password + "','" + email + "')");

                        // SIGN UP successful
                        throw new UserCreationSuccessful("Sign Up successful. You can now sign in.", MyException.SUCCESS);
                    // Username is already taken
                    } else {
                        throw new UserCreationException("Email already taken", MyException.ERROR);
                    }
                // Email address is already taken
                } else {
                    throw new UserCreationException("Username already taken", MyException.ERROR);
                }
            // passwords aren't equal
            } else {
                throw new UserCreationException("The passwords aren't matching", MyException.ERROR);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserHelper.class.getName()).log(Level.SEVERE, null, ex);
            throw new UserCreationException("User creation failed unexpectedly with an SQL error " + ex.getSQLState(), MyException.ERROR);
        }
    }
    
    private boolean isNameAlreadyTaken(String name) throws DatabaseConnectionException, SQLException {
        boolean result = false;
             
        Connection con = DatabaseHelper.connect();
        Statement statement = con.createStatement();         
        ResultSet resultSet = statement.executeQuery("SELECT * FROM user WHERE username = '" + name + "'");

        if(!resultSet.isBeforeFirst()) {
            result = true;
        }
        
        return result;
    }
    
    private boolean isEmailAlreadyTaken(String email) throws DatabaseConnectionException, SQLException {
        boolean result = false;
     
        Connection con = DatabaseHelper.connect();
        Statement statement = con.createStatement();         
        ResultSet resultSet = statement.executeQuery("SELECT * FROM user WHERE email = '" + email + "'");

        if(!resultSet.isBeforeFirst()) {
            result = true;
        }
        
        return result;
    }
    
    public boolean authenticate(String id, String password) throws AuthenticationException, DatabaseConnectionException {
       
        boolean result = false;
        
        try {
            Connection con = DatabaseHelper.connect();
            Statement statement = con.createStatement();
            ResultSet resultSet = statement.executeQuery("select COUNT(*) as count "
                    + " FROM user"
                    + " WHERE (email='" + id + "' OR username='" + id + "')"
                    + " AND password='" + password + "'");
            
            resultSet.first();
            
            if(resultSet.getInt("count") > 0 ) {
                result = true;
            } else {
                throw new AuthenticationException("Username and/or password are wrong", MyException.ERROR);
            }
           
        } catch (SQLException ex) {
            Logger.getLogger(UserHelper.class.getName()).log(Level.SEVERE, null, ex);
            throw new AuthenticationException("An error occured while forwarding your information", MyException.ERROR);
        }
        
        return result;
    }
    
   /**
    * @param id Id of the user
    * @return user - User object filled with the information from the database.
    * @throws DatabaseConnectionException
    * @throws leago.error.exceptions.UserNotExistingException
    */
   public User getUser(String id) throws DatabaseConnectionException, UserNotExistingException {
       
       User user = new User();
       
        try {
            Connection con = DatabaseHelper.connect();
            Statement statement = con.createStatement();
            ResultSet resultSet = statement.executeQuery("select * from user where username='" + id + "' OR email='" + id + "'");
            
             if(!resultSet.isBeforeFirst()) {
                throw new UserNotExistingException("There is no user with this name", MyException.INFO);
            } else {
                resultSet.first();
            
                Statistics statistics = new Statistics(resultSet.getInt("goals"),
                        resultSet.getInt("goals_conceded"),
                        resultSet.getInt("wins"),
                        resultSet.getInt("defeats"),
                        resultSet.getInt("tournament_wins"),
                        resultSet.getInt("tournament_participations"));

                user.setName(resultSet.getString("username"));
                user.setEmail(resultSet.getString("email"));
                user.setPassword(resultSet.getString("password"));
                user.setStatistics(statistics);
                user.setTeams(getTeams(user.getName()));
                user.setTournaments(getTournaments(user.getName()));
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(UserHelper.class.getName()).log(Level.SEVERE, null, ex);
            throw new DatabaseConnectionException("An error occured while getting the user information", MyException.ERROR);
        }
        
        return user;
        
    }
   
   
   /**
    * 
    * @param username Name of the user
    * @return List of the teams in which the user is currently active
    * @throws DatabaseConnectionException 
    */
   public List<Team> getTeams(String username) throws DatabaseConnectionException {
        List<Team> teams = new ArrayList<Team>();
        
        try {
            Connection con = DatabaseHelper.connect();
            Statement statement = con.createStatement();
            
            ResultSet resultSet = statement.executeQuery("SELECT name, tag, password, create_date, leader, team.wins, team.defeats, "
                                                    + "team.goals, team.goals_conceded, team.tournament_wins, team.tournament_participations"
                                            + " FROM  team, user_team"
                                            + " WHERE user = '" + username + "'"
                                            + "   AND team = name" );
            resultSet.first();
            
            while(!resultSet.isAfterLast()) {
                teams.add(new Team(resultSet.getString("name"), 
                                   resultSet.getString("tag"),
                                   resultSet.getString("password"), 
                                   new User(resultSet.getString("leader")), 
                                   new Statistics(resultSet.getInt("goals"), resultSet.getInt("goals_conceded"), 
                                                  resultSet.getInt("wins"), resultSet.getInt("defeats"), resultSet.getInt("tournament_wins"), 
                                                  resultSet.getInt("tournament_participations")), 
                                   resultSet.getDate("create_date")));
                resultSet.next();
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(UserHelper.class.getName()).log(Level.SEVERE, null, ex);
            throw new DatabaseConnectionException("An error occured while getting the user information", MyException.ERROR);
        }
        
        return teams;
    }
   
   /**
    * 
    * @param username Name of the user
    * @return List of alle tournaments in which the user is currently active
    * @throws DatabaseConnectionException 
    */
   public static ArrayList<Tournament> getTournaments(String username) throws DatabaseConnectionException {
        ArrayList<Tournament> tournaments = new ArrayList<Tournament>();
        
        try {
            Connection con = DatabaseHelper.connect();
            Statement statement = con.createStatement();
            
            ResultSet resultSet = statement.executeQuery("SELECT tou.name, tou.description, tou.create_date, tou.leader, tou.start_date, tou.start_time, tou.end_date, tou.end_time, tou.nr_of_matchdays, tou.venue, tou.term_of_application, tou.password"
                                            + " FROM  tournament tou, team_tournament teto, team te, user_team ut, user u"
                                            + " WHERE tou.name = teto.tournament"
                                            + "   AND teto.team = te.name" 
                                            + "   AND te.name = ut.team" 
                                            + "   AND ut.user = u.username" 
                                            + "   AND username = '" + username + "'"
                                            + " ORDER BY tou.name, tou.start_date, tou.start_time");
            resultSet.first();
            
            
            while(!resultSet.isAfterLast()) {
                tournaments.add(new Tournament(resultSet.getString("tou.name"),         resultSet.getString("tou.password"), resultSet.getString("description"), 
                                      new User(resultSet.getString("tou.leader")),      resultSet.getDate("tou.start_date"), resultSet.getTime("tou.start_time"),
                                               resultSet.getDate("tou.end_date"),       resultSet.getTime("tou.end_time"), resultSet.getDate("tou.create_date"), 
                                               resultSet.getInt("tou.nr_of_matchdays"), resultSet.getString("tou.venue"),    resultSet.getDate("tou.term_of_application")));
                resultSet.next();
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserHelper.class.getName()).log(Level.SEVERE, null, ex);
            throw new DatabaseConnectionException("An error occured while getting the user information", MyException.ERROR);
        }
        
        return tournaments;
    }
    
}
