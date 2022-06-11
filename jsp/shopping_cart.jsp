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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>

<body>
    <header>
        <!--網頁最上方固定欄-->
        <!--LOGO有料-->
        <div class="t-logo">
            <a href="../index.jsp">
                <img src="../assets/images/icon/logo.png" width="100px" alt="有料">
            </a>
        </div>
        <!--頁面選單-->
        <nav>
            <div class="t-showProducts">
                <a href="products_ALL.jsp">有料的麵</a>
            </div>
            <div class="t-MemberCenter">
                <a href="member_center.html">會員中心</a>
            </div>
            <div class="t-aboutUS">
                <a href="#">關於有料</a>
            </div>
        </nav>
        <!--會員及購物車圖標-->
        <div class="t-icon">
            <div class="t-i-user">
                <a href="#">
                    <!--前往會員登入註冊頁-->
                    <img src="../assets/images/icon/user.png" width="40px" alt="會員">
                </a>
            </div>
            <div class="t-i-cart">
                <a href="#">
                    <!--前往購物車頁-->
                    <img src="../assets/images/icon/shopping-cart.png" width="40px" alt="購物車">
                </a>
            </div>
        </div>
        <!--搜尋欄-->
        <div class="t-search">
            <form class="searchForm">
                <input type="text" class="searchText" placeholder="Search...">
                <button type="submit" class="searchIcon">
                    <img src="../assets/images/icon/search.png" width="20px">
                </button>
            </form>
        </div>
    </header>
    <!--網頁最上方固定欄結束-->


    <!-- 購物車 -->
    <section class="Cart-section">
        <img src="../assets/images/icon/shopping-cart.png" width="50px" height="50px">購物車
        <form method="post" action="cart_checkout.html" class="">
            <table class="shop_cart">
                <tr class="shop_cart-tr">
                    <th>商品品項</th>
                    <th>單價</th>
                    <th>數量</th>
                    <th>總計</th>
                    <th>修改</th>
                </tr>
<%  
    try {
		if(con.isClosed())
            out.println("連線建立失敗");
        else{	
            sql = "SELECT * FROM cart;" ;
            ResultSet tmp = con.createStatement().executeQuery(sql);
			tmp.next();
%>
                <tr class="shop_cart-tr">
                    <td><%out.println(tmp.getString("PName"));%></td>
                    <td class="price"><%out.println(tmp.getString("PPrice"));%></td>
                    <td>
                        <p>
                            <div class="button">
                                <!--購買數量-->
                                <input type="button" class="button-num-add" value="-" onclick="minusNUM(0)">
                                <input type="text" class="number" value="<%out.println(tmp.getString("CartQ"));%>"
                                    onkeyup="value=value.replace(/^(0+)|[^\d]+/g,'')">
                                <input type="button" class="button-num-minus" value="+" onclick="addNUM(0)">
                            </div>
                        </p>
                    </td>
                    <td class="amount"><%out.println(tmp.getString("CPrice"));%>
                        <em class="show_amount"></em>
                        <!--cart_count.js 自動算出總價-->
                    </td>
                    <!--總價-->
                    <td><input type="button" class="delete" value="刪除" onclick="deleteTR(this)"></td>
                </tr>

                <tr class="shop_cart-tr">
                    <td>千拌麵∣醋香麻醬 (3包/袋)</td>
                    <td class="price">189</td>
                    <td>
                        <p>
                            <div class="button">
                                <!--購買數量-->
                                <input type="button" class="button-num-add" value="-" onclick="minusNUM(1)">
                                <!--onclick裡面的數字為商品品項數量(從0開始算)-->
                                <input type="text" class="number" value="1"
                                    onkeyup="value=value.replace(/^(0+)|[^\d]+/g,'')">
                                <input type="button" class="button-num-minus" value="+" onclick="addNUM(1)">
                            </div>
                        </p>
                    </td>
                    <td class="amount">189</td>
                    <!--總價-->
                    <td><input type="button" value="刪除" class="delete"></td>
                    <!--刪除商品-->
                </tr>

                <tr class="shop_cart-tr">
                    <td colspan="4" style="text-align: right; padding-right:1em;">
                        商品總額:
                    </td>
                    <td id="total">1161</td>
                </tr>
<%
con.close();//關閉連線 
	    }
    }
    catch (SQLException sExec) {
           out.println("SQL錯誤"+sExec.toString());
    }
%>
                <!-- 下一步按鈕 -->

                <tr>
                    <td colspan="5">
                        <div class="NEXT">
                            <input type="submit" value="前往結帳" class="buttonLOOK" onsubmit="return validateForm()"/>
                        </div>
                    </td>
                </tr>
            </table>


        </form>
    </section>
    <footer>
		您是第<%@include file="count.jsp"%>個顧客<br>
        Copyright © since 2022 有料 All Rights Reserved.
    </footer>

<script src="../assets/js/button_add_minus.js"></script>
<script src="../assets/js/cart_delete.js"></script>

</body>

</html>