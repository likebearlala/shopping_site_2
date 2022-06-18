<%@ page import = "java.sql.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="config.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>有料|購物車</title>
    <link rel="stylesheet" href="../assets/css/all.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <link rel="stylesheet" href="../assets/css/shopping_cart.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous">
    </script>
    <script src="../assets/js/jquery.min.js"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="icon" href="../assets/images/icon/favicon.ico" type="image/x-icon">
</head>

<body>
    <header>
        <!--網頁最上方固定欄-->
        <!--LOGO有料-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-amos" role="navigation">
            <div class="container-fluid">
              <a class="navbar-brand" href="index.jsp">
                <img src="../assets/images/icon/logo.png" width="100"  alt="有料" class="d-inline-block align-text-top" id="logo-img"></a>
              <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
              </button>
               <!--頁面選單-->
              <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0 ">
                  <li class="nav-item">
                    <a class="nav-link" href="products_ALL.jsp">有料的麵</a>
                  </li> 
                  <li class="nav-item">
                    <a class="nav-link" href="user.jsp">會員中心</a>
                  </li> 
                  <li class="nav-item">
                    <a class="nav-link" href="about_us.jsp">關於有料</a>
                  </li> 
                </ul>
                <!--會員及購物車圖標-->
                <div class="t-icon">
                    <div class="t-i-user">
<%
String a = "";
if(session.getAttribute("user_email") != null && !session.getAttribute("user_email").equals("")){
	a = "user.jsp";
}
else
	a = "sign_in.jsp";
%>
                        <a href="<%=a%>">
                            <!--前往會員登入註冊頁-->
                            <img src="../assets/images/icon/user.png" width="40px" alt="會員">
                        </a>
                    </div>
                    <div class="t-i-cart">
                        <a href="shopping_cart.jsp">
                            <!--前往購物車頁-->
                            <img src="../assets/images/icon/shopping-cart.png" width="40px" alt="購物車">
                        </a>
                    </div>
                </div>
                 <!--搜尋欄-->
                <div class="t-search">
                    <form class="searchForm" action="search.jsp">
                        <input type="text" class="searchText" placeholder="Search..." name="search">
                        <button type="submit" class="searchIcon">
                            <img src="../assets/images/icon/search.png" width="20px">
                        </button>
                    </form>
                </div>
              </div>
            </div>
          </nav>
           <!--網頁最上方固定欄結束-->
    </header>
<main>
    <!-- 購物車 -->
    <section>
        <span class="material-symbols-outlined">
            shopping_cart 購物車
            </span>
        <hr width="80%">
        <!--<form method="post" action="" class="shop_form">-->
            <table class="shop_cart">
                <tr>
                    <th>商品品項</th>
                    <th>單價</th>
                    <th>數量</th>
                    <th>總計</th>
                    <th>修改</th>
                </tr>
<%!int total;%>			
<%
	if(session.getAttribute("user_email") != null && !session.getAttribute("user_email").equals("")){
		sql = "SELECT count(*) FROM `cart` WHERE `CAccount`='" +session.getAttribute("user_email")+"';";
		ResultSet rs =con.createStatement().executeQuery(sql);
		rs.next();
		int count = Integer.parseInt(rs.getString("count(*)"));
		sql = "SELECT `PID`,`PName`, `PPrice`, SUM(`CartQ`), SUM(`CPrice`) FROM `cart` WHERE `CAccount`='" +session.getAttribute("user_email")+"' GROUP BY `PID`;"; 
		rs =con.createStatement().executeQuery(sql);
		total=0;
		while(rs.next()){
                out.print("<tr class='shop_cart'>");
                out.print("<td>"+rs.getString("PName")+"</td>");
                out.print("<td class='price'>"+rs.getString("PPrice")+"</td>");
                out.print("<td><p><div class='button'>");
                //購買數量
                out.print(rs.getString("SUM(`CartQ`)"));
                out.print("</div></p></td>");
                out.print("<td class='amount'>"+rs.getString("SUM(`CPrice`)"));
                out.print("<em class='show_amount'></em></td>");
                //刪除
                out.print("<td><form action='cartdel.jsp'>");
				out.print("<input type='submit' class='delete' value='刪除'>");
				out.print("<input type='hidden' name='PID' value='"+rs.getString("PID")+"'>");
				out.print("</form></td></tr>");
				//總價計算
				total += Integer.parseInt(rs.getString("SUM(`CPrice`)"));
		}
%>

                <tr class="shop_cart-tr">
                    <td colspan="4" style="text-align: right; padding-right:1em;">
                        商品總額:
                    </td>
                    <td id="total">$<%=total%></td>
                </tr>
            </table>
        <!--</form>-->
        </section>

        <section class="section-deliver">
                <!-- 運送資訊 -->
            <form method="post" action="cartcheck.jsp">
                <div class="text-center">
                    <span class="material-symbols-outlined">
                        local_shipping 填寫運送資訊</span><hr>
                </div>
                            <div class="form-lineheight">
                                <img src="../assets/images/others/point.png" width="24px" height="24px">&nbsp;&nbsp;寄送方式:&nbsp;
                                <input type="radio" name="SendWay" value="7-11取貨" />7-11取貨&nbsp;
                                <input type="radio" name="SendWay" value="全家取貨" />全家取貨&nbsp;
                                <input type="radio" name="SendWay" value="宅配到府" checked />宅配到府
                            </div>
                                <br>
                            <div class="form-lineheight">
                                <img src="../assets/images/others/point.png" width="24px" height="24px">&nbsp;&nbsp;付款方式:&nbsp;
                                <input type="radio" name="PayWay" value="貨到付款(現金)" checked />貨到付款(現金)&nbsp;
                                <input type="radio" name="PayWay" value="信用卡/金融" />信用卡/金融
                                <br><br>
                            </div>

                        <div class="NEXT">
                            <input type="submit" value="前往結帳" class="buttonLOOK"  onclick="success()" />
                            <input type="hidden" name="total" value="<%=total%>">
                        </div>          
            </form>
    </section>
</main>

    <footer>
        Copyright © since 2022 有料 All Rights Reserved.
    </footer>


</body>

</html>

<%
	con.close();//結束資料庫連結
	}
	else{
	con.close();//結束資料庫連結
	response.sendRedirect("sign_in.jsp");
}
%>