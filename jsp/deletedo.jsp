<%@page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<%


if(session.getAttribute("admin") != null){
    if(request.getParameter("pid")!=null){
		sql = "DELETE FROM `product` WHERE `PID` = '" +request.getParameter("pid")+"';";
		int rec = con.createStatement().executeUpdate(sql);
    	if (rec>0){
		out.print("<script>alert('刪除成功！'); window.location='managedelete.jsp' </script>");
    	}
        else{
            out.print("<script>alert('刪除失敗！'); window.location='managedelete.jsp' </script>");
          }
          con.close();//結束資料庫連結
	}
	
}
else{
	con.close();//結束資料庫連結
%>
<h1><font color="red">您不是管理者！</font></h1>
<%
}
%>
