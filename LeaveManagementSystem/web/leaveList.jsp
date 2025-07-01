<%@ page import="model.LeaveDAO, model.LeaveRequest, java.util.*" %>
<%
    String role = (String) session.getAttribute("role");
    if (role == null || !role.equals("admin")) {
        response.sendRedirect("login.jsp");
        return;
    }
    List<LeaveRequest> leaves = LeaveDAO.getAllRequests();
%>
<!DOCTYPE html>
<html>
<head>
    <title>Leave Requests</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container">
        <h2>All Leave Requests</h2>
        <div class="table-container">
            <table>
                <tr>
                    <th>ID</th>
                    <th>Employee</th>
                    <th>From Date</th>
                    <th>To Date</th>
                    <th>Reason</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
                <% if (leaves.isEmpty()) { %>
                    <tr><td colspan="7" class="no-data">No leave requests found</td></tr>
                <% } else { %>
                    <% for (LeaveRequest l : leaves) { %>
                    <tr>
                        <td><%= l.getId() %></td>
                        <td><%= l.getUsername() %></td>
                        <td><%= l.getFromDate() %></td>
                        <td><%= l.getToDate() %></td>
                        <td><%= l.getReason() %></td>
                        <td><span class="status <%= l.getStatus().toLowerCase() %>"><%= l.getStatus() %></span></td>
                        <td>
                            <form action="updateLeave" method="post" class="status-form">
                                <input type="hidden" name="id" value="<%= l.getId() %>">
                                <select name="status" class="status-select">
                                    <option value="Pending" <%= "Pending".equals(l.getStatus()) ? "selected" : "" %>>Pending</option>
                                    <option value="Approved" <%= "Approved".equals(l.getStatus()) ? "selected" : "" %>>Approved</option>
                                    <option value="Rejected" <%= "Rejected".equals(l.getStatus()) ? "selected" : "" %>>Rejected</option>
                                </select>
                                <input type="submit" value="Update" class="btn btn-small">
                            </form>
                        </td>
                    </tr>
                    <% } %>
                <% } %>
            </table>
        </div>
        <div class="button-group">
            <a href="adminDashboard.jsp" class="btn btn-secondary">Back to Dashboard</a>
        </div>
    </div>
</body>
</html>