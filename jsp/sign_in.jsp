<%@ page import = "java.sql.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <link rel="stylesheet" href="../assets/css/all.css">
    <link rel="stylesheet" href="../assets/css/signIn.css">
    <link rel="icon" href="../assets/images/icon/favicon.ico" type="image/x-icon">
    <title>有料|會員登入</title>
</head>

<body>
    <header>
        <!--網頁最上方固定欄-->
        <!--LOGO有料-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-amos" role="navigation">
            <div class="container-fluid">
                <a class="navbar-brand" href="index.jsp">
                    <img src="../assets/images/icon/logo.png" width="100" alt="有料" class="d-inline-block align-text-top"
                        id="logo-img"></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
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
        <!-- 登入頁面 -->
        <section>
            <div class="sign_in">
                <form method="post" action="check.jsp">
                    <img src="../assets/images/others/others_noodles-1.png" width="7%">
                    <h1>會員登入</h1>
                    <p>帳號:<input type="email" name="user_email" placeholder="電子郵件" id="user_email" maxlength="40"
                            size="30" required /> </p>
                    <!--帳號-->
                    <p>密碼:<input type="password" name="user_password" placeholder="密碼" size="30" maxlength="20"
                            id="user_password" required /></p>
                    <!--密碼-->
                    <div class="button click">
                        <input class="buttonLOOK" type="submit" value="登入" onclick="IfNull()" />
                        <input class="buttonLOOK" type="reset" value="重填" />
                    </div>
                    <div class="register">
                        還沒註冊?<a href="register.jsp">前往註冊</a>
                    </div>
                </form>
            </div>
        </section>
    </main>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous">
    </script>
</body>

</html>