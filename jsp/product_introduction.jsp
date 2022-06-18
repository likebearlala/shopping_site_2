<%@ page import = "java.sql.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="config.jsp"%>
<%!
	String enter(String str){
		int index = 0;
		while((index=str.indexOf("\n")) != -1)
			str = str.substring(0,index) + "<br>" + str.substring(index+1);
		return(str);
	}
%>
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
    <script src="../assets/js/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
</head>
<style>
    body {
        margin: 0%;
        background-color: #EAE0D5;
    }
</style>

<body>
    <header>
        <!--網頁最上方固定欄-->
        <!--LOGO有料-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-amos" role="navigation">
            <div class="container-fluid">
                <a class="navbar-brand" href="index.jsp">
                    <img src="../assets/images/icon/logo.png" width="100" alt="有料"
                        class="d-inline-block align-text-top" id="logo-img"></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <!--頁面選單-->
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ">
                        <!-- <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">Home</a>
                  </li> -->
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
        <!-- 商品介紹頁面 -->

        <section class="product_top">
            <!--商品圖片-->
<%  
    try {
		if(con.isClosed())
            out.println("連線建立失敗");
        else{	
			sql = "SELECT * FROM `product` WHERE `PID`="+request.getParameter("name");
            ResultSet tmp =  con.createStatement().executeQuery(sql);
			tmp.next();
			String PID = tmp.getString("PID");
%>
            <div class="TOPbody">
                <div class="image">
                    <img src="<%out.println(tmp.getString("PImg"));%>" class="image-img">
                </div>
                <div class="text">
                    <form method="post" action="cartadd.jsp">
                        <h2><%out.println(tmp.getString("PName"));%></h2>
                        <!--商品名字--><br>
                        <h2 class="price">NT$<%out.println(tmp.getString("PPrice"));%></h2>
                        <!--商品價格-->


                        <div class="button">數量：
                            <!--購買數量-->
                            <input type="button" class="button-num" value="-" onclick="minusNUM(0)">
                            <input type="text" class="number" value="1" name="CartQ" oninput = "value=value.replace(/[^\d]/g,'')">
                            <input type="button" class="button-num" value="+" onclick="addNUM(0)">
                            <font class="inventory">庫存:<%out.println(tmp.getString("PQuantity"));%></font>
                            <!--商品剩餘庫存-->
                            <input type="submit" class="buttonLOOK" value="加到購物車" onclick="">
                            <input type="hidden" name="PID" value='<%out.println(PID);%>'>
                        </div>

                    </form>
                </div>
            </div>
        </section>


        <!--商品介紹-->

    </main>
    <section class="product_intro">
        <div class="title">
            <h2>商品介紹</h2>
        </div>
        <hr width="100%">

        <div class="introduction">
            <ul>
                <li><%out.println(enter(tmp.getString("PFeature")));%></li>
            </ul>
        </div>
    </section>


    <!-- 留言板 -->
    <br>

    <section class="product_comment">
        <h2 class="title">商品評論</h2>
        <form method="post" action="commentadd.jsp">
            <hr width="100%"><br><br><br>
            <p>
                <div class="comment-userphoto">
                    <img class="userphoto" src="../assets/images/others/avatar.png" width="125px" height="125px">
                    <!--使用者圖片-->
                </div>
<%
String user = "";
if(session.getAttribute("user_email") != null && !session.getAttribute("user_email").equals("")){
	sql = "SELECT CName FROM `Client` WHERE `CAccount`='"+session.getAttribute("user_email")+"'";
    tmp = con.createStatement().executeQuery(sql);
	tmp.next();
	user=tmp.getString("CName");
}
else{
	user="訪客";
}
%>
                <h3 class="username"><%=user%></h3>
                <!--使用者姓名-->
            </p>
            <p>
                <div class="star">
                    <div class="my-rating-6"></div>
                    <input type="hidden" id="test" name="star">
                    <!--會傳值的星星-->
                </div>
            </p>
            <p><textarea rows="5" cols="70" name="content" placeholder="留下您對於商品的評論...."></textarea></p> <!-- 輸入評論-->

            <p><input type="submit" class="buttonLOOK" value="留下評論"></p>
            <input type="hidden" name="PID" value='<%out.println(PID);%>'>
        </form>
        <br><br><br>
        <!--寫死的留言板-->
        <hr>

<%
			sql="SELECT * FROM `Comment` where `PID`="+PID; 
			ResultSet rs=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(sql);
			rs.last();
			int total_content=rs.getRow();
			sql="SELECT * FROM `Comment` where `PID`="+PID+" ORDER BY `Conum` DESC";
			ResultSet rs1=con.createStatement().executeQuery(sql);
			while(rs1.next())
					{
%>

        <!-- 範例評論開頭1 -->
        <br><br>
        <div class="comment-userphoto">
            <img src="../assets/images/others/avatar.png" width="75px" height="75px">
        </div>
        <div class="comment_name"><%out.print(rs1.getString(5));%></div>
        <div class="star">
<%
        int star=Integer.valueOf(rs1.getString(3));
        for(int i=0; i<star;i++){
         out.print("<span class='fa fa-star checked'></span>");
        }
		for(int j=0; j<(5-star);j++){
			out.print("<span class='fa fa-star'></span>");
		}
%>
            <!--to後端:5個checked就是5星，4個cheched就是4星，checked代表星星數量-->
        </div>
        <p class="comment-timestamp"><%out.print(rs1.getString(7));%></p>

        <%out.print(rs1.getString(6));%>
        <hr>
<%
}
    con.close();//關閉連線 
       }
    }
    catch (SQLException sExec) {
           out.println("SQL錯誤"+sExec.toString());
}%>
        <!-- 範例評論結尾 -->
    </section>





    <footer>
        Copyright © since 2022 有料 All Rights Reserved.
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

</body>

</html>