<%@ page import = "java.sql.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="config.jsp"%>
<%
request.setCharacterEncoding("UTF-8");
String sendway=request.getParameter("SendWay");
String payway=request.getParameter("PayWay");
int total=Integer.parseInt(request.getParameter("total"));
java.sql.Date odate=new java.sql.Date(System.currentTimeMillis());
int i = 1;
String less = "";

if(session.getAttribute("user_email") != null && !session.getAttribute("user_email").equals("")){
	if(total != 0){
		sql = "SELECT * FROM `cart` WHERE `CAccount`='" +session.getAttribute("user_email")+"' GROUP BY PID;";
		ResultSet rs =con.createStatement().executeQuery(sql);
		while(rs.next()){
		sql = "SELECT * FROM `Product` WHERE `PID`='" +rs.getString("PID")+"';";
		ResultSet rs1 =con.createStatement().executeQuery(sql);
		rs1.next();
		String pname = rs1.getString("PName");
		int pq = Integer.parseInt(rs1.getString("PQuantity"));
		int ps = Integer.parseInt(rs1.getString("PSales"));
		
		sql = "SELECT PName, SUM(CartQ) FROM `cart` WHERE `PID`='" +rs.getString("PID")+"' GROUP BY PID;";
		ResultSet rs2 =con.createStatement().executeQuery(sql);
		rs2.next();
		int cq = Integer.parseInt(rs2.getString("SUM(CartQ)"));
		if(cq>pq){
			i *= 0;
			less += rs2.getString("PName")+" ";
		}
		else{
			i *=1;
			int newq = pq-cq;
			sql="UPDATE `Product` SET `PQuantity`='"+newq+"', `PSales`='"+(ps+cq)+"' WHERE `PID`='"+rs.getString("PID")+"';";
			con.createStatement().execute(sql);
		}
		}
		if(i!=0){
			sql = "SELECT PName, SUM(CartQ) FROM `cart` WHERE `CAccount`='" +session.getAttribute("user_email")+"' GROUP BY PID;";
			rs =con.createStatement().executeQuery(sql);
			sql="INSERT `Order`(`CAccount`,`ODate`,`PName`,`OTotal`,`OSendway`,`OPayway`) VALUE (";
			sql+="'"+session.getAttribute("user_email")+"',";
			sql+="'"+odate+"','";
			while(rs.next()){
				sql+=rs.getString("PName")+"*"+rs.getString("SUM(CartQ)")+"<br>";
			}
			sql+="','"+total+"',";
			sql+="'"+sendway+"',";
			sql+="'"+payway+"');";
			con.createStatement().execute(sql);
		
			sql="DELETE FROM `cart` WHERE `CAccount`='"+session.getAttribute("user_email")+"'";
			con.createStatement().execute(sql);
			con.close();
			out.println("<SCRIPT>alert('購買成功');");
			out.println("window.location='user.jsp'");
			out.println("</SCRIPT>");
		}
		else{
			out.println("<SCRIPT>alert('"+less+"庫存數量不足，請重新選購！');");
			out.println("window.location='shopping_cart.jsp'");
			out.println("</SCRIPT>");
			//sql="DELETE FROM `cart` WHERE `PName`='"+rs2.getString("PName")+"' AND `CAccount`='"+session.getAttribute("user_email")+"';";
			//con.createStatement().execute(sql);
		}
		con.close();
	}
	else{
		con.close();
		out.println("<SCRIPT>alert('請選購商品後再送出訂單！');");
		out.println("window.location='shopping_cart.jsp'");
		out.println("</SCRIPT>");
	}
}
else{
	con.close();//結束資料庫連結
	out.println("<SCRIPT>alert('請先登入會員！');");
    out.println("window.location='sign_in.jsp'");
    out.println("</SCRIPT>");
}
%>