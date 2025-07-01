<%@ page import="model.LeaveDAO, model.LeaveRequest, java.util.*" %>
<%
    String user = (String) session.getAttribute("username");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    List<LeaveRequest> leaves = LeaveDAO.getRequestsByUser(user);
%>
<!DOCTYPE html>
<html>
<head>
    <title>My Leave Status</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container">
        <h2>My Leave Requests</h2>
        <div class="table-container">
            <table>
                <tr>
                    <th>ID</th>
                    <th>From Date</th>
                    <th>To Date</th>
                    <th>Reason</th>
                    <th>Status</th>
                </tr>
                <% if (leaves.isEmpty()) { %>
                    <tr><td colspan="5" class="no-data">No leave requests found</td></tr>
                <% } else { %>
                    <% for (LeaveRequest l : leaves) { %>
                    <tr>
                        <td><%= l.getId() %></td>
                        <td><%= l.getFromDate() %></td>
                        <td><%= l.getToDate() %></td>
                        <td><%= l.getReason() %></td>
                        <td><span class="status <%= l.getStatus().toLowerCase() %>"><%= l.getStatus() %></span></td>
                    </tr>
                    <% } %>
                <% } %>
            </table>
        </div>
        <div class="button-group">
            <a href="employeeDashboard.jsp" class="btn btn-secondary">Back to Dashboard</a>
        </div>
    </div>
</body>
</html>