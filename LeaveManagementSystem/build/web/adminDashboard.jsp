<%
    String user = (String) session.getAttribute("username");
    String role = (String) session.getAttribute("role");
    if (user == null || !"admin".equals(role)) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container">
        <div class="header">
            <h2>Welcome, <%= user %> (Admin)</h2>
            <a href="logout.jsp" class="btn btn-logout">Logout</a>
        </div>
        <div class="dashboard-menu">
            <a href="leaveList.jsp" class="menu-item">
                <h3>View Leave Requests</h3>
                <p>Review and approve/reject leave requests</p>
            </a>
        </div>
    </div>
</body>
</html>