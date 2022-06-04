<%@page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<%

if(session.getAttribute("user_email") != null ){
	if(request.getParameter("user_email")!=null){
		sql = "UPDATE `noodlemembers` SET `username`='"+request.getParameter("username")+"', `user_email`='"+request.getParameter("user_email")+"', `user_password`='"+request.getParameter("user_password")+"' WHERE `user_email`='"+session.getAttribute("user_email")+"'";	
		int no=con.createStatement().executeUpdate(sql); 
    	if (no>0){
		con.close();//結束資料庫連結
		out.print("<script>alert('更新成功！'); window.location='user.jsp' </script>");
		
	
    	}
	
	}
	else{
	  con.close();//結束資料庫連結	
	  out.print("<script>alert('更新失敗！'); window.location='user.jsp' </script>");
	}
}
else{
	con.close();//結束資料庫連結
%>
<h1><font color="red">您尚未登入，請登入！</font></h1>
<%
response.sendRedirect("../pages/sign_in.html");
}
%>
