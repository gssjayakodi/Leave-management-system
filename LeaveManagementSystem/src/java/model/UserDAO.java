package model;
import java.sql.*;

public class UserDAO {
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/leave_management";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASS = "";
    
    public static String validate(String username, String password) {
        String role = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASS);
            String sql = "SELECT role FROM users WHERE username=? AND password=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                role = rs.getString("role");
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return role;
    }
    
    public static boolean registerUser(String username, String password, String role) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASS);
            String sql = "INSERT INTO users (username, password, role) VALUES (?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, role);
            boolean inserted = ps.executeUpdate() > 0;
            con.close();
            return inserted;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}