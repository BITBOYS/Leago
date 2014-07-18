/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package leago.helper;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import leago.error.MyException;
import leago.error.exceptions.DatabaseConnectionException;
import leago.error.exceptions.TournamentNotExistingException;
import leago.models.Tournament;
import leago.models.User;

/**
 *
 * @author v094702
 */
public class TournamentHelper {
    
    public Tournament getTournament(String name) throws DatabaseConnectionException, TournamentNotExistingException {
        Tournament tournament = null;
        try {
            Connection con = DatabaseHelper.connect();
            Statement statement = con.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT name, leader, start_date, end_date, create_date, password, description, nr_of_matchdays, venue, term_of_application, start_time, end_time "
                    + "FROM tournament "
                    + "WHERE name = '" + name.trim() + "' "
                    + "ORDER BY name, start_date, end_date");
            
            if(!resultSet.isBeforeFirst()) {
                throw new TournamentNotExistingException("There is no tournament with this name", MyException.INFO);
            } else {
                resultSet.first();
                String tournamentname = resultSet.getString("name");
                int nr_matchdays = resultSet.getInt("nr_of_matchdays");
                String password = resultSet.getString("password");
                String description = resultSet.getString("description");
                String venue = resultSet.getString("venue");
                Date start_date = resultSet.getDate("start_date");
                java.sql.Time start_time = resultSet.getTime("start_time");
                Date end_date = resultSet.getDate("end_date");
                java.sql.Time end_time = resultSet.getTime("end_time");
                Date create_date = resultSet.getDate("create_date");
                Date term_of_application = resultSet.getDate("term_of_application");
                User leader = new User(resultSet.getString("leader"));
                
                tournament = new Tournament(tournamentname, password, description, leader, start_date, start_time, end_date, end_time, create_date, nr_matchdays, venue, term_of_application);
            }

        } catch (SQLException ex) {
            Logger.getLogger(TournamentHelper.class.getName()).log(Level.SEVERE, null, ex);
            throw new DatabaseConnectionException("An error occured while getting the tournament information", MyException.ERROR);
        }
        
        return tournament;
    }    
    
}
