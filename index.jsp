<%@ page import = "java.sql.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="jsp/config.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>有料|首頁</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <link rel="stylesheet"  href="assets/css/all.css">
    <link rel="stylesheet"  href="assets/css/index.css">
</head>
<body>
    <header>
        <!--網頁最上方固定欄-->
        <!--LOGO有料-->
        <div class="t-logo">
            <a href="index.jsp">
                <img src="assets/images/icon/logo.png" width="100px" alt="有料">
            </a>
        </div>
        <!--頁面選單-->
        <nav>
            <div class="t-showProducts">
                <a href="jsp/products_ALL.jsp">有料的麵</a>
            </div>
            <div class="t-MemberCenter">
                <a href="pages/member_center.html">會員中心</a>
            </div>
            <div class="t-aboutUS">
                <a href="#">關於有料</a>
            </div>
        </nav>
        <!--會員及購物車圖標-->
        <div class="t-icon">
            <div class="t-i-user">
                <a href="pages/sign_in.html">
                    <!--前往會員登入註冊頁-->
                    <img src="assets/images/icon/user.png" width="40px" alt="會員">
                </a>
            </div>
            <div class="t-i-cart">
                <a href="pages/shopping_cart.html">
                    <!--前往購物車頁-->
                    <img src="assets/images/icon/shopping-cart.png" width="40px" alt="購物車">
                </a>
            </div>
        </div>
        <!--搜尋欄-->
        <div class="t-search">
            <form class="searchForm">
                <input type="text" class="searchText" placeholder="Search...">
                <button type="submit" class="searchIcon">
                    <img src="assets/images/icon/search.png" width="20px">
                </button>
            </form>
        </div>
    </header>
    <!--網頁最上方固定欄結束-->

    <section class="slide"> 
        <!--輪播圖-->
        <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">

            <div class="carousel-indicators"> <!--輪播圖下圖條-->
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active"
                    aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1"
                    aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2"
                    aria-label="Slide 3"></button>
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="3"
                    aria-label="Slide 4"></button>
            </div>

            <div class="carousel-inner"> <!--輪播圖內容-->
                <div class="carousel-item active">
                    <img src="assets/images/others/slide_zeng.jpg" class="d-block w-100" alt="曾拌麵">
                </div>
                <div class="carousel-item">
                    <img src="assets/images/others/slide_zeng1.jpg" class="d-block w-100" alt="曾拌麵">
                </div>
                <div class="carousel-item">
                    <img src="assets/images/others/slide_qian.jpg" class="d-block w-100" alt="千拌麵">
                </div>
                <div class="carousel-item">
                    <img src="assets/images/others/slide_chia.jpg" class="d-block w-100" alt="賈以食日">
                </div>
            </div>
        

            <!--左右箭頭-->
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions"
                data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions"
                data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
    </section>
    <!--輪播圖結束-->

    <section class="bestsell">
        <!--熱門商品排行-->
        <div class="bestsell-title">
            <img src="assets/images/others/podium.png" width="40px">熱門商品排行
        </div>
        <div class="bestsell-number">
            <div class="bestsellnum numberone">
                <img class="medal_img" src="assets/images/others/medal-1.png" width="26%">
                <img src="assets/images/products/chia02.jpg" width="400px">
            </div>
            <div class="bestsellnum numbertwo">
                <img class="medal_img" src="assets/images/others/medal-2.png" width="26%">
                <img src="assets/images/products/chia03.jpg" width="400px">
            </div>
            <div class="bestsellnum numberthree">
                <img class="medal_img" src="assets/images/others/medal-3.png" width="26%">
                <img src="assets/images/products/chia04.jpg" width="400px">
            </div>
        </div>
    </section>
    

    <footer>
		您是第<%@include file="jsp/count.jsp"%>個顧客<br>
        Copyright © since 2022 有料 All Rights Reserved.
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>