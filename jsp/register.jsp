<%@page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<%
    String username=request.getParameter("username");
    String user_email=request.getParameter("user_email");
    String user_password=request.getParameter("user_password");
    String user_phone=request.getParameter("user_phone");
    String user_address=request.getParameter("user_address");

if( username !=null && !username.equals("") && user_email !=null && !user_email.equals("")
 && user_password != null && !user_password.equals("")){

    sql = "INSERT `Client`(`CName`,`CPhone`,`CAddress`,`CAccount`,`CPassword`)"+"VALUES('"+username+"','"+user_phone+"','"+user_address+"','"+user_email+"','"+user_password+"')";
    int no=con.createStatement().executeUpdate(sql); 
    if (no>0){
        response.sendRedirect("../pages/sign_in.html");
    }

    con.close();//結束資料庫連結
}else{
    con.close();//結束資料庫連結
    response.sendRedirect("../pages/register.html");
}
%>
