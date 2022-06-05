<%@ page import = "java.sql.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../assets/jsp/config.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>有料|商品介紹</title>
    <link rel="stylesheet" href="../assets/css/all.css">
    <link rel="stylesheet" href="../assets/css/product_introduction.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
                <a href="sign_in.html">
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
    <br><br>


<!-- 商品介紹頁面 -->
<%  
    try {
		if(con.isClosed())
            out.println("連線建立失敗");
        else{	
            //String PID=request.getParameter("PID");
			sql = "SELECT * FROM `product` WHERE `PID`="+request.getParameter("name");
            ResultSet tmp =  con.createStatement().executeQuery(sql);
			tmp.next();
			%>
<section class="product_top">
   <!--商品圖片-->
   <div class="TOPbody">
            <div class="image">
                <img src="<%out.println(tmp.getString("PImg"));%>" >
            </div>
            <div class="text">
                <form method="post" action="">
                        <h2><%out.println(tmp.getString("PName"));%></h2> <!--商品名字-->
                        <h2 class="price">NT$<%out.println(tmp.getString("PPrice"));%></h2> <!--商品價格-->

                    <p>
                        <div class="button">數量： <!--購買數量-->
                            <input type="button" class="button-num" value="-" onclick="minusNUM(0)">
                            <input type="text" class="number" value="1">
                            <input type="button" class="button-num" value="+" onclick="addNUM(0)"> 
                            <font class="inventory">庫存:<%out.println(tmp.getString("PQuantuty"));%></font>  <!--商品剩餘庫存-->
                            <input type="submit" class="buttonLOOK" value="加到購物車"  onclick="">
                        </div>
                    </p>
                </form>
            </div>
        </div>
</section>


 <!--商品介紹-->


    <section class="product_intro">
        <div class="title">
            <h2>商品介紹</h2>
        </div>
        <hr width="100%">
            
                <div class="introduction">
                    <ul>
                        <li><%out.println(tmp.getString("PFeature"));%></li>
                    </ul>
                </div>
    </section>


<!-- 留言板 -->
<br>

    <section class="product_comment">
        <h2 class="title">商品評論</h2>
                    <form method="post" action="">
                        <hr width="100%"><br><br><br>
                    <p>
                        <div class="comment-userphoto">
                            <img class="userphoto" src="../assets/images/others/user.png" 
                            width="125px" height="125px">  <!--使用者圖片-->
                        </div>
                        <h3 class="username">有廖美女</h3> <!--使用者姓名-->
                    </p>
                    <p> <div class="star">
                                <div class="my-rating-6"></div>
                                    <input type="hidden" id="test" name="star" > <!--會傳值的星星-->
                                </div>
                    </p> 
                        <p><textarea rows="5" cols="70" placeholder="留下您對於商品的評論...." ></textarea></p> <!-- 輸入評論-->
                        
                        <p><input type="submit" class="buttonLOOK" value="留下評論" ></p>
                    </form>
                    <br><br><br>
                    <!--寫死的留言板-->
                    <hr>


                <!-- 範例評論開頭1 -->
                <br><br>
                <div class="comment-userphoto">
                    <img  src="../assets/images/others/user.png"
                        width="75px" height="75px">
                </div>
                                <div>好順利</div>
                                    <div class="star">
                                        <span class="fa fa-star checked"></span>
                                        <span class="fa fa-star checked"></span>
                                        <span class="fa fa-star checked"></span>
                                        <span class="fa fa-star checked"></span>
                                        <span class="fa fa-star checked"></span> <!--to後端:5個checked就是5星，4個cheched就是4星，checked代表星星數量-->
                                    </div>
                                    <p class="comment-timestamp">2022-04-27 01:46:45 </p>
                      
                                拿到貨好快好順利!!拆封後煮來吃，確實很好吃!!
                            

                      
                <!-- 範例評論結尾 -->


               
    </section>

    <footer >
        您是第
<%
			sql="SELECT * FROM `counter`";
            ResultSet rs=con.createStatement().executeQuery(sql); 
            if (rs.next()){
                String countString = rs.getString(1);
	            int count = Integer.parseInt(countString);
                if(session.isNew()==true){
	                count++; //計數器加1
	                countString = String.valueOf(count); //寫回資料庫
	                sql="UPDATE `counter` SET `count` = " + countString ;
	                con.createStatement().execute(sql);
                }
                out.println(count);
                con.close();//關閉連線 
                }
       }
    }
    catch (SQLException sExec) {
           out.println("SQL錯誤"+sExec.toString());
    }
%>
		個顧客<br>
    </footer>
<script>



</script>


    <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
    <script src="../assets/js/jquery.star-rating-svg.js"></script>
    <script src="../assets/js/jquery.star-rating-svg.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/vue@2/dist/vue.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/vue@2"></script>

    <script src="../assets/js/star.js"></script>
    <script src="../assets/js/button_add_minus.js"></script>

    <!-- nav -->
      <!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script> -->
         <!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous"> -->
</body>

</html>