<!DOCTYPE html>
<html>
<head>
    <title>Login - Leave Management System</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="auth-container">
        <div class="auth-form">
            <h2>Login</h2>
            <% if (request.getParameter("error") != null) { %>
                <div class="error-message">Invalid username or password!</div>
            <% } %>
            <% if (request.getParameter("msg") != null && "registered".equals(request.getParameter("msg"))) { %>
                <div class="success-message">Registration successful! Please login.</div>
            <% } %>
            <form action="login" method="post">
                <div class="form-group">
                    <label>Username:</label>
                    <input type="text" name="username" required>
                </div>
                <div class="form-group">
                    <label>Password:</label>
                    <input type="password" name="password" required>
                </div>
                <button type="submit" class="btn btn-primary">Login</button>
            </form>
            <p class="auth-link">New user? <a href="register.jsp">Register here</a></p>
        </div>
    </div>
</body>
</html>