/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author user
 */
public class databaseConnector {
    
    
        private static final String URL = "jdbc:mysql://localhost/Library";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "";

    
    
    
       public static Connection connectDB() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");  
            return DriverManager.getConnection(URL, USERNAME, PASSWORD);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            return null;
        }
    }
    


    
    
    
    
    
    
    
    
    
    
    
    
    
}
