/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package leago.helper;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import leago.error.MyException;
import leago.error.exceptions.DatabaseConnectionException;
import leago.error.exceptions.TeamCreationException;
import leago.error.exceptions.TeamNotExistingException;
import leago.error.exceptions.TeamUpdateException;
import leago.error.exceptions.UserUpdateException;
import leago.models.Statistics;
import leago.models.Team;
import leago.models.Tournament;
import leago.models.User;

/**
 *
 * @author v094702
 */
public class TeamHelper {
    
    public void deleteTeam(Team team) throws DatabaseConnectionException, TeamUpdateException {
        try {
            int result;

            Connection con = DatabaseHelper.connect();
            Statement statement = con.createStatement();
            result = statement.executeUpdate("DELETE FROM team WHERE name = '" + team.getName() + "'"); 

            if(result < 1) {
                throw new TeamUpdateException("The team couldn't be deleted", MyException.ERROR);
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(UserHelper.class.getName()).log(Level.SEVERE, null, ex);
            throw new TeamUpdateException("An error occured while deleting the team", MyException.ERROR);
        }
    }
    
    public void addPlayer(User user, String teamname) throws DatabaseConnectionException, TeamUpdateException {
              
        try {
            int result;
            Connection con = DatabaseHelper.connect();
            Statement statement = con.createStatement();
            
            result = statement.executeUpdate("INSERT INTO user_team"
                    + " (user, team)"
                    + " VALUES ('" + user.getName() + "','" + teamname + "')");
            
            if(result < 1) {
                throw new TeamUpdateException("The user couldn't be added to the team!", MyException.ERROR);
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(TeamHelper.class.getName()).log(Level.SEVERE, null, ex);
            throw new TeamUpdateException("The user couldn't be added to the team!", MyException.ERROR);
        }

    }
        
    
    public void createTeam(User leader, String name, String tag, String password, String reenter_password) throws TeamCreationException, DatabaseConnectionException {

        try {
            int result;
            
            if(password.equals(reenter_password)) {
                if(!isTeamExisting(name)) {
                    Connection con = DatabaseHelper.connect();
                    Statement statement = con.createStatement();

                    result = statement.executeUpdate("insert into team"
                            + " (name, tag, password, leader)"
                            + " VALUES ('" + name + "','" + tag + "','" + password + "','" + leader.getName() + "')");

                    if(result < 1) {
                        throw new TeamCreationException("Team team creation failed!", MyException.ERROR);
                    }
                } else {
                    throw new TeamCreationException("The name is already taken", MyException.ERROR);
                }
            } else {
                throw new TeamCreationException("The passwords aren't matching", MyException.ERROR);
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(TeamHelper.class.getName()).log(Level.SEVERE, null, ex);
            throw new TeamCreationException("Team creation failed!", MyException.ERROR);
        }
    }
            
         
    
    public Team getTeam(String id) throws DatabaseConnectionException, TeamNotExistingException {
        
        Team team = new Team();
        
        try {
            Connection con = DatabaseHelper.connect();
            Statement statement = con.createStatement();
            ResultSet resultSet = statement.executeQuery("select * from team where name='" + id + "'");
            
            if(!resultSet.isBeforeFirst()) {
                throw new TeamNotExistingException("There is no team with this name", MyException.INFO);
            } else {
                resultSet.first();
                team.setName(resultSet.getString("name"));
                team.setTag(resultSet.getString("tag"));
                team.setLeader(new User(resultSet.getString("leader")));
                team.setPassword(resultSet.getString("password"));
                team.setCreate_date(resultSet.getDate("create_date"));
                
                Statistics statistics = new Statistics(resultSet.getInt("goals"), resultSet.getInt("goals_conceded"), resultSet.getInt("wins"), 
                        resultSet.getInt("defeats"), resultSet.getInt("tournament_wins"), resultSet.getInt("tournament_participations"));
                team.setStatistics(statistics);
                
                team.setMember(getUserFromTeam(id));
                team.setTournaments(getTournamentsFromTeam(id));
            }
            
            return team;
        } catch (SQLException ex) {
            Logger.getLogger(TeamHelper.class.getName()).log(Level.SEVERE, null, ex);
            throw new DatabaseConnectionException("An error occured while getting the team information", MyException.ERROR);
        }
    }
    
    public  List<User> getUserFromTeam(String teamname) throws DatabaseConnectionException {
        List<User> member = new ArrayList<User>();
        
        try {
            Connection con = DatabaseHelper.connect();
            Statement statement = con.createStatement();
            
            ResultSet resultSet = statement.executeQuery("SELECT username"
                    + " FROM  user, user_team"
                    + " WHERE team = '" + teamname + "'"
                    + " AND username = user");
            
            while(resultSet.next()) {
                User user = new User();
                user.setName(resultSet.getString("username"));
                
                member.add(user);
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(TeamHelper.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return member;
    }
    
    public ArrayList<Tournament> getTournamentsFromTeam(String teamname) throws DatabaseConnectionException {
        ArrayList<Tournament> tournaments = new ArrayList<Tournament>();
        
        try {
            Connection con = DatabaseHelper.connect();
            Statement statement = con.createStatement();
            
            ResultSet resultSet = statement.executeQuery("SELECT name, description, leader, start_date, end_date, create_date" +
                    " FROM tournament, team_tournament" +
                    " WHERE team =  '" + teamname + "'" +
                    " AND tournament = name" +
                    " ORDER BY name");
            
            while(resultSet.next()) {
                Tournament tournament = new Tournament();
                tournament.setName(resultSet.getString("name"));
                tournament.setLeader(new User(resultSet.getString("leader")));
                tournament.setDescription(resultSet.getString("description"));
                tournament.setStart_date(resultSet.getDate("start_date"));
                tournament.setEnd_date(resultSet.getDate("end_date"));

                tournaments.add(tournament);
            }
        } catch (SQLException ex) {
            Logger.getLogger(TeamHelper.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return tournaments;
    }   
    
    public boolean isTeamExisting(String name) throws DatabaseConnectionException {
        boolean result = false;
        
        try {
            Connection con = DatabaseHelper.connect();
            Statement statement = con.createStatement();
            ResultSet resultSet = statement.executeQuery("select COUNT(*) as count from team where name='" + name + "'");
            resultSet.first();
            
            if(resultSet.getInt("count") > 0) {
                result = true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(TeamHelper.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }
    
    public boolean isUserInTeam(String team, String user) throws DatabaseConnectionException {
        boolean result = false;
        
        try {
            Connection con = DatabaseHelper.connect();
            Statement statement = con.createStatement();
            ResultSet resultSet = statement.executeQuery("select COUNT(*) as count from team, user_team where name='" + team + "' AND user ='" + user + "'");
            resultSet.first();
            
            if(resultSet.getInt("count") > 0) {
                result = true;
            } else {
                result = false;
            }
        } catch (SQLException ex) {
            Logger.getLogger(TeamHelper.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }
    
    public void updateName(Team team, String name1, String name2) throws DatabaseConnectionException, TeamUpdateException {
        try {
            int result;
            
            if(name1.equals(name2)) {
                if(!isTeamExisting(name1)) {
                    Connection con = DatabaseHelper.connect();
                    Statement statement = con.createStatement();
                    result = statement.executeUpdate("update team set name='" + name1 + "' where name = '" + team.getName() + "'"); 

                    if(result < 1) {
                        throw new TeamUpdateException("The teamname couldn't be updated", MyException.ERROR);
                    }
                } else {
                    throw new TeamUpdateException("The name is already taken", MyException.ERROR);
                }
            } else {
                throw new TeamUpdateException("The names aren't matching", MyException.ERROR);
            }
        } catch (SQLException ex) {
            Logger.getLogger(TeamHelper.class.getName()).log(Level.SEVERE, null, ex);
            throw new TeamUpdateException("An error occured while updating the team", MyException.ERROR);
        }
    }
    
    public void updateTag(Team team, String tag1, String tag2) throws DatabaseConnectionException, TeamUpdateException {
        try {
            int result;
            
            if(tag1.equals(tag2)) {
                Connection con = DatabaseHelper.connect();
                Statement statement = con.createStatement();
                result = statement.executeUpdate("update team set tag='" + tag1 + "' where name = '" + team.getName() + "'"); 

                if(result < 1) {
                    throw new TeamUpdateException("The teamtag couldn't be updated", MyException.ERROR);
                }
            } else {
                throw new TeamUpdateException("The tags aren't matching", MyException.ERROR);
            }
        } catch (SQLException ex) {
            Logger.getLogger(TeamHelper.class.getName()).log(Level.SEVERE, null, ex);
            throw new TeamUpdateException("An error occured while updating the team", MyException.ERROR);
        }
    }
    
    public void updateLeader(String team, String leader) throws DatabaseConnectionException, TeamUpdateException {
        try {
            int result;
            
            Connection con = DatabaseHelper.connect();
            Statement statement = con.createStatement();
            result = statement.executeUpdate("update team set leader='" + leader + "' where name = '" + team + "'"); 

            if(result < 1) {
                throw new TeamUpdateException("The leader couldn't be changed", MyException.ERROR);
            }
        } catch (SQLException ex) {
            Logger.getLogger(TeamHelper.class.getName()).log(Level.SEVERE, null, ex);
            throw new TeamUpdateException("An error occured while updating the team", MyException.ERROR);
        }
    }
    
    public void kickUser(User user, Team team) throws DatabaseConnectionException, TeamUpdateException {
        
        try {
            Connection con = DatabaseHelper.connect();
            Statement statement = con.createStatement();
            
            statement.execute("DELETE FROM user_team WHERE user = '" + user.getName() + "' AND team = '" + team.getName() + "'");

        } catch (SQLException ex) {
            Logger.getLogger(TeamHelper.class.getName()).log(Level.SEVERE, null, ex);
            throw new TeamUpdateException("User update failed unexpectedly with an SQL error " + ex.getSQLState(), MyException.ERROR);
        }
    }
       
    
}
