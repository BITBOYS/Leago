/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package leago.helper;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import leago.error.MyException;
import leago.error.exceptions.DatabaseConnectionException;

/**
 *
 * @author v094702
 */
public class DatabaseHelper {
    
    private static String host = null;
    private static String username = null;
    private static String password = null;
    private static Connection con = null;
    
    public static Connection connect() throws DatabaseConnectionException {
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            if(con == null) {
                readProperties();
                con = DriverManager.getConnection(host, username, password);
            }            
        } catch (ClassNotFoundException | IOException | SQLException ex) {
            Logger.getLogger(DatabaseHelper.class.getName()).log(Level.SEVERE, null, ex);
            throw new DatabaseConnectionException("An error occured while connecting to the database", MyException.ERROR);
        } 
        
        return con;
    }
    
    private static void readProperties() throws IOException {
        Properties properties = new Properties();
	InputStream inputStream = DatabaseHelper.class.getResourceAsStream("database.properties");
	properties.load(inputStream);
                                
        host = properties.getProperty("host");
        username = properties.getProperty("id");
        password = properties.getProperty("password");
        inputStream.close();
    }
    
}
