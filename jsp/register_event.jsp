<%@ page import = "java.sql.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="config.jsp"%>
<%
    String username=request.getParameter("username");
    String user_email=request.getParameter("user_email");
    String user_password=request.getParameter("user_password");
    String user_phone=request.getParameter("user_phone");
    String user_address=request.getParameter("user_address");

	sql = "SELECT * FROM `Client` WHERE `CAccount`='"+user_email+"'";
	ResultSet rs =con.createStatement().executeQuery(sql);
	if(rs.next()==true){
		con.close();//結束資料庫連結
		out.println("<SCRIPT>alert('此email已被註冊！');");
		out.println("window.location='../pages/register.html'");
		out.println("</SCRIPT>");
	}
	else{
		if( username !=null && !username.equals("") && user_email !=null && !user_email.equals("") && user_password != null && !user_password.equals("")){

			sql = "INSERT `Client`(`CName`,`CPhone`,`CAddress`,`CAccount`,`CPassword`)"+"VALUES('"+username+"','"+user_phone+"','"+user_address+"','"+user_email+"','"+user_password+"')";
			int no=con.createStatement().executeUpdate(sql); 
			if (no>0){
				response.sendRedirect("sign_in.jsp");
			}
			con.close();//結束資料庫連結
		}
		else{
			con.close();//結束資料庫連結
			response.sendRedirect("register.jsp");
		}
	}
%>
