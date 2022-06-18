<%@page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<%
String userpsw = request.getParameter("user_password");
String checkpsw = request.getParameter("check_password");
String cname = request.getParameter("cname");
if(session.getAttribute("user_email") != null ){
	if(userpsw != null && !userpsw.equals("") && checkpsw != null && !checkpsw.equals("")){
		sql = "UPDATE `Client` SET `CName`='"+cname+"', `CPassword`='"+userpsw+"' WHERE `CAccount`='"+session.getAttribute("user_email")+"'";	
		int no=con.createStatement().executeUpdate(sql); 
    	if (no>0){
		con.close();//結束資料庫連結
		out.print("<script>alert('更新成功！'); window.location='user.jsp' </script>");
    	}
	
	}
	else{
	  con.close();//結束資料庫連結	
	  out.print("<script>alert('請輸入密碼和確認密碼！'); window.location='user.jsp' </script>");
	}
}
else{
	con.close();//結束資料庫連結
%>
<h1><font color="red">您尚未登入，請登入！</font></h1>
<%
response.sendRedirect("../pages/sign_in.jsp");
}
%>
