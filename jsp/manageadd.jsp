<%@page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<%

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
                <a href="member_center.html">
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

    <aside>
        <!--左側選單-->
        <div class="aside-member">
            <a href="manage.jsp">商品資料</a>
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
            <table>
                <tr>
                    <td class="memberdata_tital" colspan="2">
                        <div>增加商品
                        <hr>
                    </td>
                </tr>
                <tr>
                    <td>
                        <form action="manageadddo.jsp" method="post" name="addForm">
                            <div>
                                <tr>
                                    <label>產品名稱：</label>
                                    <input type="text" name="pname" id="pname" placeholder="請輸入產品名稱">
                                </tr>
                            </div>
                            <div>
                                <tr>
                                    <label>廠商編號：</label>
                                    <input type="text" name="bid" id="bid" placeholder="請輸入廠編">
                                </tr>
                            </div>
                        
                            <div>
                                <tr>
                                    <label>產品價格：</label>
                                    <input type="text" name="price" id="price" placeholder="請輸入價格">
                                </tr>
                            </div>

                            <div>
                                <tr>
                                    <label>產品庫存：</label>
                                    <input type="text" name="total" id="total" placeholder="請輸入庫存">
                                </tr>
                            </div>

                            <div>
                                <tr>
                                    <label>產品內容：</label>
                                    <input type="text" name="pcontent" id="pcontent" placeholder="請輸入產品內容">
                                </tr>
                            </div>

                            <div>
                                <tr>
                                    <label>產品圖片：</label>
                                    <input type="text" name="img" id="img" placeholder="請輸入圖片路徑">
                                </tr>
                            </div>
                        
                            <br>
                            <div id="submit">
                                <tr>
                                    <button type="submit">增加</button>
                                    <button type="reset">重置</button>
                        
                                </tr>
                            </div>
                        </form>
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