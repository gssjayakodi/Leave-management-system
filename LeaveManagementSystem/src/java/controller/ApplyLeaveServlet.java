package controller;

import model.LeaveDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/applyLeave")
public class ApplyLeaveServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        String username = (String) session.getAttribute("username");
        String from = request.getParameter("from");
        String to = request.getParameter("to");
        String reason = request.getParameter("reason");

        boolean success = LeaveDAO.applyLeave(username, from, to, reason);

        if (success) {
            response.sendRedirect("employeeDashboard.jsp?msg=requested");
        } else {
            response.getWriter().println("Failed to apply leave.");
        }
    }
}
