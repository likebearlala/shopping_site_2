<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%
try {
    Class.forName("com.mysql.jdbc.Driver");
    try {
        url="jdbc:mysql://localhost/?serverTimezone=UTC";
        sql="";
        con=DriverManager.getConnection(url,"root","1234");
        if(con.isClosed())
			out.println("連線建立失敗");
        else {
			sql = "USE `final`";
			con.createStatement().execute(sql);
			sql="SELECT * FROM `counter`";
            ResultSet rs=con.createStatement().executeQuery(sql); 
            if (rs.next()){
                String countString = rs.getString(1);
	            int count = Integer.parseInt(countString);
                if(session.isNew()==true){
	                count++; //計數器加1
	                countString = String.valueOf(count); //寫回資料庫
	                sql="UPDATE `counter` SET `count` = " + countString ;
	                con.createStatement().execute(sql);
                }
                out.println(count);
                con.close();//關閉連線 
                }
       }
    }
    catch (SQLException sExec) {
           out.println("SQL錯誤"+sExec.toString());
    }
}
catch (ClassNotFoundException err) {
   out.println("class錯誤"+err.toString());
}
%>