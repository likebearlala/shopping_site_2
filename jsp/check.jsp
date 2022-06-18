<%@page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<%

String email = request.getParameter("user_email");
String pwd = request.getParameter("user_password");

if(email !=null && !email.equals("") 
	&& pwd != null && !pwd.equals("")){
    if(email.equals("1@admin")){
        sql = "SELECT * FROM `noodlemembers` WHERE `user_email`=? AND `user_password`=? "; 

        PreparedStatement pstmt = null;
        pstmt=con.prepareStatement(sql);
        pstmt.setString(1,request.getParameter("user_email"));
        pstmt.setString(2,request.getParameter("user_password"));
        ResultSet rs1 = pstmt.executeQuery();

        if(rs1.next()){ 
        session.setAttribute("admin",email);
        con.close();//結束資料庫連結
        response.sendRedirect("manage.jsp") ;
        }else{
            con.close();//結束資料庫連結
            response.sendRedirect("sign_in.jsp");
        }
    }else{
        sql = "SELECT * FROM `Client` WHERE `CAccount`=? AND `CPassword`=? "  ; 

        PreparedStatement pstmt2 = null;
        pstmt2=con.prepareStatement(sql);
        pstmt2.setString(1,request.getParameter("user_email"));
        pstmt2.setString(2,request.getParameter("user_password"));
        ResultSet rs2 = pstmt2.executeQuery();
  
        if(rs2.next()){  
            session.setAttribute("user_email",email);
            con.close();//結束資料庫連結
            response.sendRedirect("user.jsp") ;  
        }
        else{
            con.close();//結束資料庫連結
            response.sendRedirect("sign_in.jsp");
        }
  
    } 
   
  

}    
else{
response.sendRedirect("sign_in.jsp");
}
%>
