<%@page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<%
String pname = request.getParameter("pname");
String pbrand = request.getParameter("pbrand");
String price = request.getParameter("price");
String total = request.getParameter("total");
String pcontent = request.getParameter("pcontent");
String img = request.getParameter("img");

if(session.getAttribute("admin") != null){
	
	if(pname != null && !pname.equals("") && pbrand != null && !pbrand.equals("")){
		sql = "INSERT `product`(`PName`,`PBrand`,`PPrice`,`PQuantity`,`PSales`,`PFeature`,`PImg`)"+"VALUES('"+pname+"','"+pbrand+"','"+price+"','"+total+"','0','"+pcontent+"', '"+img+"')";	
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
		out.println("<h1>請輸入產品名稱和廠商編號！</h1>");
   }		
}
else{
	con.close();//結束資料庫連結
%>
<h1><font color="red">您不是管理者！</font></h1>
<%
}
%>
