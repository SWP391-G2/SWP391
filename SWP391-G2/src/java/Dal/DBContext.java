/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dal;

/**
 *
 * @author nguye
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DBContext {

    public Connection connection;

    public DBContext() {
        try {
            //Change the username password and url to connect your own database
            String username = "sa";
            String password = "123";
<<<<<<< HEAD
<<<<<<< HEAD
            String url = "jdbc:sqlserver://localhost:1433;databaseName=TPS23";
=======
            String url = "jdbc:sqlserver://localhost:1433;databaseName=DEMO4";
>>>>>>> hoang
=======
            String url = "jdbc:sqlserver://localhost:1433;databaseName=TPS";
>>>>>>> e618cb242a2e22b3024d1cc5db33b9c9d1aae8f3
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
