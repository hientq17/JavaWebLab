package edu.fpt.context;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author MrEnd
 */
public class ConnectDB {

    //private static String connectionUrl ="jdbc:sqlserver://QH:1433;databaseName=Cafe1989;";
    private static String connectionUrl = "jdbc:mysql://sql12.freemysqlhosting.net/sql12372769";
    private static String driverName = "com.mysql.jdbc.Driver";
    private static String user = "sql12372769";
    private static String password =  "Hien171200";

    public Connection openConnection() throws Exception{
        Class.forName(driverName).newInstance();
        Connection con = DriverManager.getConnection(connectionUrl,user,password);
        System.out.println("Open successfully");
        return con;
    }

}
