<%
    String user = (String) session.getAttribute("username");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Apply for Leave</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container">
        <h2>Apply for Leave</h2>
        <div class="form-container">
            <form action="applyLeave" method="post">
                <div class="form-group">
                    <label>From Date:</label>
                    <input type="date" name="from" required>
                </div>
                <div class="form-group">
                    <label>To Date:</label>
                    <input type="date" name="to" required>
                </div>
                <div class="form-group">
                    <label>Reason:</label>
                    <textarea name="reason" required placeholder="Enter reason for leave..."></textarea>
                </div>
                <div class="button-group">
                    <button type="submit" class="btn btn-primary">Submit Request</button>
                    <a href="employeeDashboard.jsp" class="btn btn-secondary">Back</a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>