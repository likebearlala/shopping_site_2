<%@page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<%
String pid = request.getParameter("pid");
String pname = request.getParameter("pname");
String pbrand = request.getParameter("pbrand");
String price = request.getParameter("price");
String total = request.getParameter("total");
String pcontent = request.getParameter("pcontent");
String img = request.getParameter("img");
if(session.getAttribute("admin") != null){
    if(pid!=null){
        sql = "UPDATE `product` SET `PName`='"+pname+"', `PBrand`='"+pbrand+"', `PPrice`='"+price+"', `PQuantity`='"+total+"', `PFeature`='"+pcontent+"', `PImg`='"+img+"' WHERE `PID`='"+pid+"'";	
        int no=con.createStatement().executeUpdate(sql); 
        if (no>0){
        con.close();//結束資料庫連結
        response.sendRedirect("manage.jsp");
        }
    }
    else{
        con.close();//結束資料庫連結	
        response.sendRedirect("manage.jsp");
      }

}
else{
	con.close();//結束資料庫連結
%>
<h1><font color="red">您不是管理者！</font></h1>
<%
}
%>
