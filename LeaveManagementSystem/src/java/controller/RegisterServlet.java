package controller;

import model.UserDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        boolean success = UserDAO.registerUser(username, password, role);

        if (success) {
            response.sendRedirect("login.jsp?msg=registered");
        } else {
            response.getWriter().println("Username already exists or registration failed.");
        }
    }
}
