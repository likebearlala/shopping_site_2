<%@page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
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
			<form action="manageadddo.jsp" method="post" name="addForm">
				<table style="width:50%;">
					<tr>
						<td style="padding: 3% 0 0;text-align: center;font-size: 30px;font-weight: bolder;" colspan="2">
							<div>增加商品
							<hr>
						</td>
					</tr>
					<tr>
						<td><label>產品名稱：</label></td>
						<td><input type="text" name="pname" id="pname" placeholder="請輸入產品名稱"></td>
					</tr>
					<tr>
						<td><label>廠商名稱：</label></td>
						<td><input type="text" name="pbrand" id="bid" placeholder="請輸入廠商名稱"></td>
					</tr>
						<td><label>產品價格：</label></td>
						<td><input type="text" name="price" id="price" placeholder="請輸入價格"></td>
					<tr>
						<td><label>產品庫存：</label></td>
						<td><input type="text" name="total" id="total" placeholder="請輸入庫存"></td>
					</tr>
					<tr>
						<td><label>產品內容：</label></td>
						<td><input type="text" name="pcontent" id="pcontent" placeholder="請輸入產品內容"></td>
					</tr>
					<tr>
						<td><label>產品圖片：</label></td>
						<td><input type="text" name="img" id="img" placeholder="請輸入圖片路徑"></td>
					</tr>
					<tr>
                        <td><button type="reset">重置</button></td>
						<td><button type="submit">增加</button></td>
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