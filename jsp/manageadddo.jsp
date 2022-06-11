<%@page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<%
String pname = request.getParameter("pname");
String bid = request.getParameter("bid");
String price = request.getParameter("price");
String total = request.getParameter("total");
String pcontent = request.getParameter("pcontent");
String img = request.getParameter("img");

if(session.getAttribute("admin") != null){
   
		sql = "INSERT `product`(`PName`,`BID`,`PPrice`,`PQuantuty`,`PFeature`,`PImg`)"+"VALUES('"+pname+"','"+bid+"','"+price+"','"+total+"','"+pcontent+"', '"+img+"')";	
		int no=con.createStatement().executeUpdate(sql); 
    	if (no>0){
		con.close();//結束資料庫連結
		out.print("<script>alert('新增成功！'); window.location='manageadd.jsp' </script>");

    	
	
	}
	else{
	  con.close();//結束資料庫連結	
	  out.print("<script>alert('新增失敗！'); window.location='manageadd.jsp' </script>");
	}
}
else{
	con.close();//結束資料庫連結
%>
<h1><font color="red">您不是管理者！</font></h1>
<%
}
%>
