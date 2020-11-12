package edu.fpt.context;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author MrEnd
 */
public class ConnectDB {

    private static ConnectDB instance;

    public Connection openConnection() throws Exception{
        String connectionUrl ="jdbc:sqlserver://QH:1433;"+
                "databaseName=SimpleBlog;User=sa;Password=1712;";
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        Connection con = DriverManager.getConnection(connectionUrl);
        return con;
    }

    //Get instance of dbms only one time
    public static ConnectDB getInstance(){
        if(instance==null) instance = new ConnectDB();
        return instance;
    }
}
