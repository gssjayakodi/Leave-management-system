package model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class LeaveDAO {

    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/leave_management";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASS = "";

    public static boolean applyLeave(String username, String from, String to, String reason) {
        boolean result = false;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASS);

            String sql = "INSERT INTO leave_requests (username, from_date, to_date, reason) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setDate(2, Date.valueOf(from));
            ps.setDate(3, Date.valueOf(to));
            ps.setString(4, reason);

            result = ps.executeUpdate() > 0;
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public static List<LeaveRequest> getAllRequests() {
        List<LeaveRequest> list = new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASS);

            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM leave_requests ORDER BY id DESC");

            while (rs.next()) {
                LeaveRequest lr = new LeaveRequest(
                        rs.getInt("id"),
                        rs.getString("username"),
                        rs.getDate("from_date"),
                        rs.getDate("to_date"),
                        rs.getString("reason"),
                        rs.getString("status")
                );
                list.add(lr);
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static List<LeaveRequest> getRequestsByUser(String username) {
        List<LeaveRequest> list = new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASS);

            String sql = "SELECT * FROM leave_requests WHERE username=? ORDER BY id DESC";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                LeaveRequest lr = new LeaveRequest(
                        rs.getInt("id"),
                        rs.getString("username"),
                        rs.getDate("from_date"),
                        rs.getDate("to_date"),
                        rs.getString("reason"),
                        rs.getString("status")
                );
                list.add(lr);
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static boolean updateStatus(int id, String status) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASS);

            String sql = "UPDATE leave_requests SET status=? WHERE id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, status);
            ps.setInt(2, id);

            boolean updated = ps.executeUpdate() > 0;
            con.close();
            return updated;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
