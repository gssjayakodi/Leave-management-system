<%-- 
    Document   : logout
    Created on : Jul 1, 2025, 12:07:26 PM
    Author     : shanu
--%>

<%
    session.invalidate();
    response.sendRedirect("login.jsp");
%>
