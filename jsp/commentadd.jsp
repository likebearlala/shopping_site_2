<%@ page import = "java.sql.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="config.jsp"%>
<%!
	String enter(String str){
		int index = 0;
		while((index=str.indexOf("\n")) != -1)
			str = str.substring(0,index) + "<br>" + str.substring(index+1);
		return(str);
	}
%>
<%
if(session.getAttribute("user_email") != null ){
	sql = "SELECT `CName` FROM `Client` WHERE `CAccount`='" +session.getAttribute("user_email")+"';"; 
	ResultSet rs =con.createStatement().executeQuery(sql);
	request.setCharacterEncoding("UTF-8");
	String username="";
	rs.next();
	username=rs.getString("CName");
    String PID=request.getParameter("PID");
    String star=request.getParameter("star");
    String content=request.getParameter("content");
	content = enter(content);
	java.sql.Date date=new java.sql.Date(System.currentTimeMillis());
	if(star != null && !star.equals("") && content != null && !content.equals("")){
		sql = "INSERT `Comment`(`Star`,`CoAccount`,`CoName`,`Cocontent`,`CoDate`,`PID`) VALUES('"+star+"','"+session.getAttribute("user_email")+"','"+username+"','"+content+"','"+date+"','"+PID+"')";
		int no=con.createStatement().executeUpdate(sql); 
		if (no>0){
			response.sendRedirect("product_introduction.jsp?name="+PID);
		}
		else{
			con.close();//結束資料庫連結
		}
	}
	else{
		con.close();//結束資料庫連結
		out.println("<h1 style='text-align:center;'>請輸入完整評分和評論！</h1>");
	}
}
      else{
         con.close();//結束資料庫連結
      %>
      <h1><font color="red">您尚未登入，請登入！</font></h1>
      
      <%
      response.sendRedirect("sign_in.jsp");
      }
      %>
      


