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
import java.util.logging.Level;
import java.util.logging.Logger;
import leago.error.exceptions.DatabaseConnectionException;

/**
 *
 * @author v094702
 */
public class IndexHelper {

    public IndexHelper() {
    }
    
    public int amountUser() throws DatabaseConnectionException {
        
        int amountUser = 0;
        
        try {
            Connection con = DatabaseHelper.connect();
            Statement statement = con.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT COUNT(*) as user FROM user");
            
            resultSet.first();
            amountUser = resultSet.getInt("user");
            
        } catch (SQLException ex) {
            Logger.getLogger(IndexHelper.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return amountUser;        
    }
    
    public int amountTeams() throws DatabaseConnectionException {
        
        int amountTeams = 0;
        
        try {
            Connection con = DatabaseHelper.connect();
            Statement statement = con.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT COUNT(*) as teams FROM team");
            
            resultSet.first();
            amountTeams = resultSet.getInt("teams");
            
        } catch (SQLException ex) {
            Logger.getLogger(IndexHelper.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return amountTeams;        
    }
    
    public int amountTournaments() throws DatabaseConnectionException {
        
        int amountTournaments = 0;
        
        try {
            Connection con = DatabaseHelper.connect();
            Statement statement = con.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT COUNT(*) as tournaments FROM tournament");
            
            resultSet.first();
            amountTournaments = resultSet.getInt("tournaments");
            
        } catch (SQLException ex) {
            Logger.getLogger(IndexHelper.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return amountTournaments;        
    }
    
}
