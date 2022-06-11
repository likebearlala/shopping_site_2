<%@page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<%
if(session.getAttribute("user_email") != null ){
    sql = "SELECT * FROM `Client` WHERE `CAccount`='" +session.getAttribute("user_email")+"';"; 
	ResultSet rs =con.createStatement().executeQuery(sql);
	String username="", user_email="", user_password="", user_address="", user_phone="";
	//讀出user_email, user_password當成使用者要更改時的內定值
	while(rs.next()){
		username=rs.getString("CName");
	    user_email=rs.getString("CAccount");
		user_password=rs.getString("CPassword");
        user_address=rs.getString("CAddress");
        user_phone=rs.getString("CPhone");
	}

   
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>有料|會員中心</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
    <link rel="stylesheet" href="../assets/css/all.css">
    <link rel="stylesheet" href="../assets/css/member_center.css">

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
                <a href="about_us.html">關於有料</a>
            </div>
        </nav>
        <!--會員及購物車圖標-->
        <div class="t-icon">
            <div class="t-i-user">
                <a href="user.jsp">
                    <!--前往會員登入註冊頁-->
                    <img src="../assets/images/icon/user.png" width="40px" alt="會員">
                </a>
            </div>
            <div class="t-i-cart">
                <a href="shopping_cart.html">
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
    <main>
    <aside>
        <!--左側選單-->
        <div class="aside-member">
            <a href="#memberdata">會員資料</a>
        </div>
        <div class="aside-record">
            <a href="#orderRecord">訂單紀錄</a>
        </div>
        <div class="aside-star">
            <a href="#starRecord">評分紀錄</a>
        </div>
    </aside>
    <!--左側選單結束-->

    <section id="memberdata">
        <div class="memberdata">
            <div class="memberdata_tital">
                <!--會員資料標題-->
                會員資料
            </div>
            <hr>
            <div class="memberdata_all">
                <div class="memberout">
                    <!--頭貼及登出按鈕-->
                    <img src="../assets/images/others/avatar.png" width="180px">
                    <div class="sign_out">
                        <!--登出鈕-->
                        <a href="logout.jsp"><button type="submit" class="sign_out-button">登出</button></a>
                    </div>
                </div>
                <div class="memberdata_content">
                    <!--FORM 會員資料顯示-->
                    <!--method="post"-->
                    <form method="post" action="update.jsp">
                        <div class="changebtn">
                            <!-- 修改取消鈕 -->
                            <img src="../assets/images/others/pencil.png" width="35px">
                            <button class="activebtn" id="activebtn" onclick="lock(); changebtn();">
                                <div id="revise" class="">修改</div>
                                <div id="cancel">取消</div>
                            </button>
                        </div>
                        <div class="inputdata">
                            <div class="md-inputone">
                                <!--左側-->
                                <input type="email" placeholder="電子郵件" name="user_email" value="<%=user_email%>" disabled><br>
                                <input type="text" placeholder="地址" name="user_address" value="<%=user_address%>" disabled><br>
                                <input id="Name" type="text" placeholder="姓名" name="username" value="<%=username%>" required disabled>
                            </div>
                            <div class="md-inputtwo">
                                <!--右側-->
                                <input type="text" placeholder="電話" name="user_phone" value="<%=user_phone%>" disabled><br>
                                <input id="password" type="password" name="user_password" placeholder="密碼" value="" required disabled><br>
                                <input id="check_password" type="password" placeholder="確認密碼"  onblur="check()" required disabled>
                                <p>* 更改密碼請再次確認 *</p>
                            </div>
                        </div>
                        <div class="md-form_button">
                            <!--下方按鈕-->
                            <div>
                                <!--重設鈕-->
                                <button type="reset" class="reset_data">清除重設</button>
                            </div>
                            <div>
                                <!--確認鈕-->
                                <button type="submit" id="submit" class="reset_data">確認更改</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>

    <section class="section-2" id="orderRecord">
        <div class="orderRecord">
            <div class="orderRecord_tital">
                訂單紀錄
                <hr>
            </div>
            <div class="orderRecord_content">
                <form method="post" action="">
                    <table class="orderRecord-table">
                        <tr>
                            <th class="th-date">日期時間</th>
                            <th>訂單編號</th>
                            <th>商品內容</th>
                            <th>訂單總額</th>
                            <th>配送方式</th>
                        </tr>
                        <tr>
                            <td>2022-01-01 20:34:58</td>
                            <td>T000032</td>
                            <td>千拌麵∣辣豆瓣金盞花麵 (3包/袋)</td>
                            <td>NT$1161</td>
                            <td>宅配到府</td>
                        </tr>
                        <tr>
                            <td>2022-05-20 22:12:40</td>
                            <td>T000058</td>
                            <td>曾粉 海味叻沙 Seafood Laksa</td>
                            <td>NT$1161</td>
                            <td>全家取貨</td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </section>

    <section class="section-3" id="starRecord">
        <div class="starRecord">
            <div class="starRecord_tital">
                評分紀錄
                <hr>
            </div>
            <div class="starRecord_content">
                <form method="post" action="">
                    <table class="starRecord-table">
                        <tr>
                            <th>日期時間</th>
                            <th class="th-product">商品品項</th>
                            <th class="th-star">星級評分</th>
                            <th>評論</th>
                        </tr>
                        <tr>
                            <td>2022-01-01 14:32:33</td>
                            <td>千拌麵∣辣豆瓣金盞花麵 (3包/袋)</td>
                            <td>
                                <div class="star">
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star checked"></span>
                                </div>
                            </td>
                            <td>辣豆瓣很香，麵條Q彈有嚼勁，非常好吃一定會回購!</td>
                        </tr>
                        <tr>
                            <td>2022-01-05 10:24:45</td>
                            <td>千拌麵∣辣豆瓣金盞花麵 (3包/袋)</td>
                            <td>
                                <div class="star">
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star checked"></span>
                                </div>
                            </td>
                            <td>辣豆瓣很香，麵條Q彈有嚼勁，非常好吃一定會回購!</td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </section>
    </main>
    <footer>
		Copyright © since 2022 有料 All Rights Reserved.
    </footer>

    <script src="../assets/js/check_password.js"></script>
    <script src="../assets/js/memberdata_reset.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous">
    </script>
</body>

</html>
                    
                
<%
}
else{
	con.close();//結束資料庫連結
%>
<h1><font color="red">您尚未登入，請登入！</font></h1>

<%
response.sendRedirect("../pages/sign_in.html");
}
%>
