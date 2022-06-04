<%@page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<%
if(request.getParameter("user_email") !=null && !request.getParameter("user_email").equals("") 
	&& request.getParameter("user_password") != null && !request.getParameter("user_password").equals("")){

    sql = "SELECT * FROM `noodlemembers` WHERE `user_email`='" +request.getParameter("user_email") + 
	      "'  AND `user_password`='" + request.getParameter("user_password") + "'"  ; 
	
    ResultSet rs =con.createStatement().executeQuery(sql);
    
    if(rs.next()){            
        session.setAttribute("user_email",request.getParameter("user_email"));
		con.close();//結束資料庫連結
        response.sendRedirect("user.jsp") ;
    }
    else{
		con.close();//結束資料庫連結
        response.sendRedirect("../pages/sign_in.html");
    }
}    
else{
response.sendRedirect("../pages/sign_in.html");
}
%>
