<!DOCTYPE html>
<html>
<head>
    <title>Register - Leave Management System</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="auth-container">
        <div class="auth-form">
            <h2>Register</h2>
            <form action="register" method="post">

                <div class="form-group">
                    <label>Username:</label>
                    <input type="text" name="username" required>
                </div>

                <div class="form-group">
                    <label>Password:</label>
                    <input type="password" name="password" required>
                </div>

                <!-- Role is fixed to Employee, no dropdown shown -->
                <input type="hidden" name="role" value="employee">

                <button type="submit" class="btn btn-primary">Register</button>
            </form>

            <p class="auth-link"><a href="login.jsp">Back to Login</a></p>
        </div>
    </div>
</body>
</html>
