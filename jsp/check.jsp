<%@page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<%

String email = request.getParameter("user_email");
String pwd = request.getParameter("user_password");

if(email !=null && !email.equals("") 
	&& pwd != null && !pwd.equals("")){
    if(email.equals("1@admin")){
        sql = "SELECT * FROM `noodlemembers` WHERE `user_email`='" + email + "'  AND `user_password`='" + pwd + "'"  ; 
        ResultSet rs1 =con.createStatement().executeQuery(sql);
        if(rs1.next()){ 
        session.setAttribute("admin",email);
        con.close();//結束資料庫連結
        response.sendRedirect("manage.jsp") ;
        }else{
            con.close();//結束資料庫連結
            response.sendRedirect("../pages/sign_in.html");
        }
    }else{
        sql = "SELECT * FROM `Client` WHERE `CAccount`='" + email + 
        "'  AND `CPassword`='" + pwd + "'"  ; 
  
        ResultSet rs =con.createStatement().executeQuery(sql);
  
        if(rs.next()){  
            session.setAttribute("user_email",email);
            con.close();//結束資料庫連結
            response.sendRedirect("user.jsp") ;  
        }
        else{
            con.close();//結束資料庫連結
            response.sendRedirect("../pages/sign_in.html");
        }
  
    } 
   
  

}    
else{
response.sendRedirect("../pages/sign_in.html");
}
%>
