<%
session.removeAttribute("user_email");
response.sendRedirect("sign_in.jsp");
%>