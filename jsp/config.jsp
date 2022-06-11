<%
Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost/?serverTimezone=UTC";
Connection con=DriverManager.getConnection(url,"root","yang910826");
String sql="USE `final`";
con.createStatement().execute(sql);
%>