<%@ page import = "java.sql.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="config.jsp"%>
<%if(session.getAttribute("user_email") != null && !session.getAttribute("user_email").equals("")){
	int CartQ, PPrice, CPrice;
	sql = "SELECT * FROM `product` WHERE `PID`="+request.getParameter("PID");
	ResultSet tmp =  con.createStatement().executeQuery(sql);
	tmp.next();
	String PName = tmp.getString("PName");
	PPrice = Integer.parseInt(tmp.getString("PPrice"));
	CartQ = Integer.parseInt(request.getParameter("CartQ"));
	Object  CAccount = session.getAttribute("user_email");
	CPrice = PPrice*CartQ;
	sql = "SELECT * FROM `cart` ";
	tmp =  con.createStatement().executeQuery(sql);
	tmp.next();
    sql = "INSERT cart(`CAccount`,`PName`,`PPrice`,`CartQ`,`CPrice`) VALUES ('"+CAccount+"','"+PName+"','"+PPrice+"','"+CartQ+"','"+CPrice+"')";
	con.createStatement().execute(sql);
	con.close();//結束資料庫連結
	out.println("<SCRIPT>alert('已加入購物車！');");
    out.println("window.location='products_ALL.jsp'");
    out.println("</SCRIPT>");
}
else{
	con.close();//結束資料庫連結
	out.println("<SCRIPT>alert('請先登入會員！');");
    out.println("window.location='../pages/sign_in.html'");
    out.println("</SCRIPT>");
}
%>