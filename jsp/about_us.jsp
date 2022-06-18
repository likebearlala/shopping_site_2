<%@ page import = "java.sql.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>有料|關於</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <link rel="stylesheet" href="../assets/css/all.css">
    <link rel="stylesheet" href="../assets/css/about_us.css">
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
                    <a class="nav-link active" href="about_us.jsp">關於有料</a>
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
        <section class="about">
            <div class="about_tital">
                <h1>有料</h1><hr>
            </div>
            <div class="about_content">
                <p>
                    「有料」，這個詞意不管在哪個場合的詞語涵義都是很正面的，而在我們這裡包含的意思，最初是取自我們其中一位組員的名字諧音「有廖」，也代表我們所精心挑選的幾種拌麵都很「有料」，希望透過這個網頁可以和大家分享好吃的品牌拌麵。
                </p>
                <p>
                    現在市場中的拌麵品牌越來越多，消費者的選擇也就不斷增加，每次要買拌麵的時候都會眼花撩亂，而我們的網站整合了幾個網友大推的拌麵品牌，在瀏覽時可以清楚的知道各種品牌的口味及網友評價，讓愛拌麵的大家在選擇購買時也是一種享受！
                </p>
            </div>
            <div class="mail">
                <span>
                <p>點擊小信件來聯絡我們！</p>
                <a href="mailto:lina10944222@gmail.com?subject=[有料]給予鼓勵或建議">
                    <img src="../assets/images/others/email.png" width="70px">
                </a>
                <p>小小的鼓勵都是使我們進步的最大動力 ❤️</p>
                </span>
            </div>
        </section>
        <section class="beauty">
            <div class="beauty-title">
                <img src="../assets/images/others/support.png" width="40px">網站成員
            </div>
            <div class="wrap">
                <div class="item">
                    <a href="https://www.instagram.com/uniiii_723/">
                    <img src="../assets/images/about_us/qian.jpg" width="370px">
                    <div class="txt">
                        製作一個完整的網站真的需要花費很多心力，從上學期擔任後端到這學期負責前端，都學到很多經驗，最重要的是整個過程中的團隊合作！終於迎來了下學期的尾聲，心中感慨萬千，需要兩班對於不同領域互相溝通協調非常不容易，感謝我的組員們如此強大，共同創建了「有料」這個購物網站，無論過程多麼辛酸，依舊展現出最好的成品，希望每一位瀏覽此網站的顧客都能感受到我們努力的成果 ❤
                    </div>
                    <div class="name">
                        <h4>黃仟儀</h4>
                        <p>資管二乙<br>
                            前端設計</p>
                    </div>
                    </a>
                </div>
                <div class="item">
                    <a href="https://www.instagram.com/likebearlala/">
                    <img src="../assets/images/about_us/xuan.jpg" width="370px">
                    <div class="txt">
                        上學期負責網頁的後端，和前端一起合作過後，因此比較清楚後端在做什麼、前端該怎麼做，這次再作為前端來和後端進行合作，就變得順利很多，有需要幫助的地方，組員也都可以互相協助、建議，這兩個學期以來最大的感受大概就是學會自學吧，很多比較複雜、不會的部分都需要自己再去網路上摸索學習，這次的經驗讓我學到很多。
                    </div>
                    <div class="name">
                        <h4>廖庭萱</h4>
                        <p>資管二乙<br>
                            前端設計</p>
                    </div>
                    </a>
                </div>
                <div class="item">
                    <a href="https://www.instagram.com/shliz13/">
                    <img src="../assets/images/about_us/zhunli.jpg" width="370px">
                    <div class="txt">
                        期末的專題比想像中的麻煩，幸好這學期除了學習jsp之外還有在學習資料庫，加上上學期學過前端內容，所以最後在做購物網站時不會完全沒有方向，在多利用上課教材和彼此間互相討論後，我們對於該如何去寫網站才能夠更有想法。很謝謝這次一起合作的夥伴，大家好優秀！
                    </div>
                    <div class="name">
                        <h4>曾順莉</h4>
                        <p>資管二甲<br>
                            後端開發</p>
                    </div>
                    </a>
                </div>
                <div class="item">
                    <a href="https://www.instagram.com/zhi_yun_s/">
                    <img src="../assets/images/about_us/ziyun.jpg" width="370px">
                    <div class="txt">
                        這次換我們做後端了！剛好這學期也有資料庫課程，所以在資料庫的連接上和語法都比較沒有什麼問題，做完這個專案後，了解到線上購物商城的系統，還有思考如何讓整個操作變得更順暢，才能留住消費者。感謝前端的美女組員，網頁做得很好，也傾聽我們的要求，並對此做一些調整，還有我的後端夥伴，一起探討如何讓購物的流程更順暢，真的非常感謝，最後一起做出成品真的很有成就感！
                    </div>
                    <div class="name">
                        <h4>楊芷昀</h4>
                        <p>資管二甲<br>
                            後端開發</p>
                    </div>
                    </a>
                </div>
            </div>
        </section>
    </main>
    <footer>
        Copyright © since 2022 有料 All Rights Reserved.
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous">
    </script>
</body>

</html>