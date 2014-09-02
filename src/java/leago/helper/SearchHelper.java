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
import leago.models.Team;
import leago.models.Tournament;
import leago.models.User;

/**
 *
 * @author v094702
 */
public class SearchHelper {
    
    public List<User> getMatchingUser(String id) throws DatabaseConnectionException {
        List<User> user = new ArrayList<>();
        
        try {
            Connection con = DatabaseHelper.connect();
            Statement statement = con.createStatement();
            
            ResultSet resultSet = statement.executeQuery("SELECT username"
                                                      + " FROM  user"
                                                      + " WHERE username LIKE '%" + id + "%'"
                                                      + " ORDER BY username");
            
            while(resultSet.next()) {
                user.add(new User(resultSet.getString("username")));
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(SearchHelper.class.getName()).log(Level.SEVERE, null, ex);
            throw new DatabaseConnectionException("An error occured while searching for user", MyException.ERROR);
        }
        
        return user;
    }
    
    public List<Team> getMatchingTeams(String id) throws DatabaseConnectionException {
        List<Team> team = new ArrayList<>();
        
        try {
            Connection con = DatabaseHelper.connect();
            Statement statement = con.createStatement();
            
            ResultSet resultSet = statement.executeQuery("SELECT name"
                                                      + " FROM  team"
                                                      + " WHERE name LIKE '%" + id + "%'"
                                                      + " ORDER BY name");
            
            while(resultSet.next()) {
                team.add(new Team(resultSet.getString("name")));
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(SearchHelper.class.getName()).log(Level.SEVERE, null, ex);
            throw new DatabaseConnectionException("An error occured while searching for teams", MyException.ERROR);
        }
        
        return team;
    }
    
    public List<Tournament> getMatchingTournaments(String id) throws DatabaseConnectionException {
        List<Tournament> tournament = new ArrayList<>();
        
        try {
            Connection con = DatabaseHelper.connect();
            Statement statement = con.createStatement();
            
            ResultSet resultSet = statement.executeQuery("SELECT name"
                                                      + " FROM  tournament"
                                                      + " WHERE name LIKE '%" + id + "%'"
                                                      + " ORDER BY name");
            
            while(resultSet.next()) {
                tournament.add(new Tournament(resultSet.getString("name")));
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(SearchHelper.class.getName()).log(Level.SEVERE, null, ex);
            throw new DatabaseConnectionException("An error occured while searching for tournaments", MyException.ERROR);
        }
        
        return tournament;
    }
    
}
