<%@page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<%if(session.getAttribute("admin") != null){
	sql="select * from Product";
    ResultSet rs=con.createStatement().executeQuery(sql);
%>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>有料|會員中心</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <link rel="stylesheet" href="../assets/css/all.css">
    <link rel="stylesheet" href="../assets/css/products_ALL.css">
    <style>
    td {
        text-align: center;
        padding: 2%;
    }
    aside {
        margin:0px;
    }
    </style>
</head>

<body>
    <header>
        <!--網頁最上方固定欄-->
        <!--LOGO有料-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-amos" role="navigation">
            <div class="container-fluid">
                <img src="../assets/images/icon/logo.png" width="100"  alt="有料" class="d-inline-block align-text-top" id="logo-img">
            </div>
        </nav>    
    </header>
    <!--網頁最上方固定欄結束-->

    <aside>
        <!--左側選單-->
        <div class="aside-member">
            <a href="manage.jsp">商品資料</a>
        </div>
		<div class="aside-member">
            <a href="order.jsp">訂單紀錄</a>
        </div>
        <div class="aside-record">
            <a href="manageadd.jsp">增加商品</a>
        </div>
        <div class="aside-record">
            <a href="modform.jsp">修改商品</a>
        </div>
        <div class="aside-record">
            <a href="managedelete.jsp">刪除商品</a>
        </div>
        <div class="aside-record">
            <a href="logoutadmin.jsp">登出</a>
        </div>
    </aside>
    <!--左側選單結束-->

    <section>
        <div class="memberdata">
            <table style="border: 3px solid; text-align: center;">
                <tr>
                    <td style="padding: 3% 0 0;text-align: center;font-size: 30px;font-weight: bolder;" colspan="8" >
                        商品資料
                        <hr>
                    </td>
                </tr>
                <tr style="border: 3px solid; font-weight: bolder;">
                    <td>產品編號</td>
                    <td>產品名稱</td>
                    <td>廠商編號</td>
                    <td>價格</td>
                    <td>庫存</td>
					<td>銷量</td>
                    <td>內容</td>
                    <td>圖片</td>
                </tr>
                <%
                while(rs.next()){
                    out.print("<tr style='border: 1px solid;'>");
                    out.print("<td>"+rs.getString(1)+"</td>");
                    out.print("<td>"+rs.getString(2)+"</td>");
                    out.print("<td>"+rs.getString(3)+"</td>");
                    out.print("<td>$"+rs.getString(4)+"</td>");
                    out.print("<td>"+rs.getString(5)+"</td>");
					out.print("<td>"+rs.getString(6)+"</td>");
                    out.print("<td style='width:400px;text-align:left;'>"+rs.getString(7)+"</td>");
                    out.print("<td style='width:200px;word-break:break-all;'>"+rs.getString(8)+"</td>");
                    out.print("</tr>");
                }
				con.close();
                %>
            </table>
        </div>
    </section>
	
    <footer>
        Copyright © since 2022 有料 All Rights Reserved.
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous">
    </script>
</body>

</html>
<%
}else{
	con.close();//結束資料庫連結
%>
<h1><font color="red">您不是管理者！</font></h1>
<%
}
%>
