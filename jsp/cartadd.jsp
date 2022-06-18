<%@ page import = "java.sql.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="config.jsp"%>
<%if(session.getAttribute("user_email") != null && !session.getAttribute("user_email").equals("")){
	String PID = request.getParameter("PID");
	int CartQ, PPrice, CPrice, PQuantity, PSale;
	CartQ = Integer.parseInt(request.getParameter("CartQ"));
	sql = "SELECT * FROM `product` WHERE `PID`="+PID;
	ResultSet tmp =  con.createStatement().executeQuery(sql);
	tmp.next();
	PQuantity = Integer.parseInt(tmp.getString("PQuantity"));
	if(CartQ <= PQuantity){
		String PName = tmp.getString("PName");
		PPrice = Integer.parseInt(tmp.getString("PPrice"));
		Object  CAccount = session.getAttribute("user_email");
		CPrice = PPrice*CartQ;
		sql = "INSERT cart(`CAccount`,`PID`,`PName`,`PPrice`,`CartQ`,`CPrice`) VALUES ('"+CAccount+"','"+PID+"','"+PName+"','"+PPrice+"','"+CartQ+"','"+CPrice+"')";
		con.createStatement().execute(sql);
		//sql = "UPDATE `product` SET `PQuantity`='"+(PQuantity-CartQ)+"' WHERE `PID`='"+PID+"';";
		//con.createStatement().executeUpdate(sql);
		con.close();//結束資料庫連結
		out.println("<SCRIPT>alert('已加入購物車！');");
		out.println("window.location='products_ALL.jsp'");
		out.println("</SCRIPT>");
	}
	else{
		con.close();
		out.println("<h1 style='text-align:center;'>");
		out.println("庫存不足，請重新選擇數量！<br>");
		out.println("<a href='product_introduction.jsp?name="+PID+"'>");
		out.println("點此回到上一頁</a></h1>");
	}
}
else{
	con.close();//結束資料庫連結
	out.println("<SCRIPT>alert('請先登入會員！');");
    out.println("window.location='sign_in.jsp'");
    out.println("</SCRIPT>");
}
%>