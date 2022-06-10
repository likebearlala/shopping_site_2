<%
session.removeAttribute("user_email");
response.sendRedirect("../pages/sign_in.html");
%>