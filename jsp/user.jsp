<%@page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<%
if(session.getAttribute("user_email") != null ){
    sql = "SELECT * FROM `noodlemembers` WHERE `user_email`='" +session.getAttribute("user_email")+"';"; 
	ResultSet rs =con.createStatement().executeQuery(sql);
	String username="", user_email="", user_password="";
	//讀出user_email, user_password當成使用者要更改時的內定值
	while(rs.next()){
		username=rs.getString("username");
	    user_email=rs.getString("user_email");
		user_password=rs.getString("user_password");
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
    <link rel="stylesheet" href="../assets/css/all.css">
    <link rel="stylesheet" href="../assets/css/member_center.css">

</head>

<body>
    <header>
        <!--網頁最上方固定欄-->
        <!--LOGO有料-->
        <div class="t-logo">
            <a href="../index.html">
                <img src="../assets/images/icon/logo.png" width="100px" alt="有料">
            </a>
        </div>
        <!--頁面選單-->
        <nav>
            <div class="t-showProducts">
                <a href="#">有料的麵</a>
            </div>
            <div class="t-MemberCenter">
                <a href="#">會員中心</a>
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

    <aside>
        <!--左側選單-->
        <div class="aside-member">
            <a href="#">會員資料</a>
        </div>
        <div class="aside-record">
            <a href="#">訂單紀錄</a>
        </div>
        <div class="aside-record">
            <a href="logout.jsp">登出</a>
        </div>
    </aside>
    <!--左側選單結束-->

    <section>
        <div class="memberdata">
            <table>
                <tr>
                    <td class="memberdata_tital" colspan="2">
                        會員資料
                        <hr>
                    </td>
                </tr>
                <tr>
                    <td>
                        <img src="../assets/images/icon/user.png" width="240px">
                    </td>
                    <td>
                        <form action="update.jsp" method="POST">
                            <input type="text" placeholder="姓名" name="username" value="<%=username%>"><br>
                            <input type="text" placeholder="電子郵件" name="user_email"value="<%=user_email%>"><br>
                            <input type="password" placeholder="密碼" name="user_password" value=""><br>
                            <input type="password" placeholder="確認密碼" name="checkpwd" value="">
                            <button type="submit" class="reset_data">
                                <img src="assets/images/others/pencil.png" width="35px">
                                <h5>確認更改</h5>
                            </button>
                        </form>
                    </td>
                </tr>
            </table>
        </div>
    </section>

    <section class="section-2">
        <div class="orderRecord">
            <table>
                <tr>
                    <td class="orderRecord_tital" colspan="2">
                        訂單紀錄
                        <hr>
                    </td>
                </tr>
                <tr>
                    <td>
                        
                    </td>
                    <td>
                        
                    </td>
                </tr>
            </table>
        </div>
    </section>

    <footer>
        123456
    </footer>

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
