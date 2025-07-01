<%
    String user = (String) session.getAttribute("username");
    String role = (String) session.getAttribute("role");
    if (user == null || !"employee".equals(role)) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Employee Dashboard</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container">
        <div class="header">
            <h2>Welcome, <%= user %> (Employee)</h2>
            <a href="logout.jsp" class="btn btn-logout">Logout</a>
        </div>
        <% if (request.getParameter("msg") != null && "requested".equals(request.getParameter("msg"))) { %>
            <div class="success-message">Leave request submitted successfully!</div>
        <% } %>
        <div class="dashboard-menu">
            <a href="applyLeave.jsp" class="menu-item">
                <h3>Apply for Leave</h3>
                <p>Submit a new leave request</p>
            </a>
            <a href="viewLeaves.jsp" class="menu-item">
                <h3>View My Leave Status</h3>
                <p>Check status of your leave requests</p>
            </a>
        </div>
    </div>
</body>
</html>