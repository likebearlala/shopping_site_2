<%@ page import = "java.sql.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="config.jsp"%>
<%
if(session.getAttribute("user_email") != null && !session.getAttribute("user_email").equals("")){
	String PID = request.getParameter("PID");
	sql = "DELETE FROM `cart` WHERE `PID`="+PID;
	con.createStatement().execute(sql);
	out.println("<SCRIPT>alert('刪除成功！');");
    out.println("window.location='shopping_cart.jsp'");
    out.println("</SCRIPT>");
}
else{
	con.close();//結束資料庫連結
	out.println("<SCRIPT>alert('請先登入會員！');");
    out.println("window.location='sign_in.jsp'");
    out.println("</SCRIPT>");
}
%>