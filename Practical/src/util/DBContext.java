package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBContext {
    static final String url = "jdbc:mysql://localhost:3306/practical";
    static final String user = "root";
    static final String pass = "macServer123";

    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.cj.jdbc.Driver");

        return DriverManager.getConnection(url,user,pass);
    }

    public static void main(String[] args) {
        try {
            System.out.println(getConnection());
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
