<%@page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<%!
String pid, pname, pbrand, price, total, pcontent, img;
%>
<%
if(session.getAttribute("admin") != null ){
    if(request.getParameter("Pid") != null && !request.getParameter("Pid").equals("")){
        sql = "SELECT * FROM `product` WHERE `PID`='" +request.getParameter("Pid")+"';"; 
        ResultSet rs =con.createStatement().executeQuery(sql);
		while(rs.next()){
			pid=rs.getString("PID");
			pname=rs.getString("PName");
			pbrand=rs.getString("PBrand");
			price=rs.getString("PPrice");
			total=rs.getString("PQuantity");
			pcontent=rs.getString("PFeature");
			img=rs.getString("PImg");
		}
		con.close();
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
            <form action="moddo.jsp" method="post" name="modForm">
                <table style="width:50%;">
                    <tr>
						<td style="padding: 3% 0 0;text-align: center;font-size: 30px;font-weight: bolder;" colspan="2">
                            <div>修改商品</div>
                            <hr>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="hidden" name="pid" id="pid" value="<%=pid%>">
                    <tr>
                        <td><label>產品名稱：</label></td>
                        <td><input type="text" name="pname" id="pname" value="<%=pname%>"></td>
                    </tr>
                    <tr>
                        <td><label>廠商名稱：</label></td>
                        <td><input type="text" name="pbrand" id="bid" value="<%=pbrand%>"></td>
                    </tr>
                    <tr>
                        <td><label>產品價格：</label></td>
                        <td><input type="text" name="price" id="price" value="<%=price%>"></td>
                    </tr>
                    <tr>
                        <td><label>產品庫存：</label></td>
                        <td><input type="text" name="total" id="total" value="<%=total%>"></td>
                    </tr>
                    <tr>
                        <td><label>產品內容：</label></td>
                        <td><input type="text" name="pcontent" id="pcontent" value="<%=pcontent%>"></td>
                    </tr>
                    <tr>
                        <td><label>產品圖片：</label></td>
                        <td><input type="text" name="img" id="img" value="<%=img%>"></td>
                    </tr>
                    <br>
                    <tr>
                        <td><button type="reset">重置</button></td>
						<td><button type="submit">修改</button></td>
                    </tr>
                </table>
            </form>    
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

}
else{
	con.close();
	out.print("<h1>請輸入產品編號！</h1>");
}
}
else{
	con.close();//結束資料庫連結
%>
<h1><font color="red">您不是管理者！</font></h1>

<%
}
%>