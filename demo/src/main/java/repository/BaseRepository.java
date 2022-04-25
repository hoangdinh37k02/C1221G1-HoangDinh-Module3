package repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class BaseRepository {
    private  static String jdbcUrl = "jdbc:mysql://localhost:3306/product";
    private  static String username = "root";
    private static String password = "codegym";

    public BaseRepository() {
    }

    public Connection getConnectionJavaToDB() {
        Connection connection =null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcUrl, username, password);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }
}
