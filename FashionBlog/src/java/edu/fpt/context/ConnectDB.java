package edu.fpt.context;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author MrEnd
 */
public class ConnectDB {

//    private static ConnectDB instance;

    private static String connectionUrl = "jdbc:sqlserver://QH:1433;databaseName=FashionBlog;";
    private static String user = "sa";
    private static String password = "1712";

    private Connection connection = null;

    public Connection getConnection() {
        return connection;
    }

    public Connection openConnection(){
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            this.connection = DriverManager.getConnection(connectionUrl,user,password);
            System.out.println("Open connection successfully");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return this.connection;
    }

    public void closeConnection(){
        try {
            if(connection!=null) {
                this.connection.close();
                System.out.println("Close connection successfully");
                connection = null;
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    }

    //Get instance of dbms only one time
//    public static ConnectDB getInstance() {
//        if (instance == null) instance = new ConnectDB();
//        return instance;
//    }
}
