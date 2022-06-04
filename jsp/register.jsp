<%@page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<%
    String username=request.getParameter("username");
    String user_email=request.getParameter("user_email");
    String user_password=request.getParameter("user_password");

if( username !=null && !username.equals("") && user_email !=null && !user_email.equals("")
 && user_password != null && !user_password.equals("")){

    sql = "INSERT `noodlemembers`(`username`,`user_email`,`user_password`)"+"VALUES('"+username+"','"+user_email+"','"+user_password+"')";
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
