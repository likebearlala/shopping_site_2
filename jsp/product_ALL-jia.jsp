<%@ page import = "java.sql.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="config.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>有料|全部的麵</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <link rel="stylesheet" href="../assets/css/all.css">
    <link rel="stylesheet" href="../assets/css/products_ALL.css">
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
                <a href="../pages/sign_in.html">
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
        <!--商品陳列左側選單-->
        <div class="aside-noodles">
            <a href="products_ALL.jsp">全部的麵</a>
        </div>
        <div class="aside-Zeng">
            <a href="product_ALL-guochen.jsp">曾拌麵</a>
        </div>
        <div class="aside-Qian">
            <a href="product_ALL-qianqian.jsp">千拌麵</a>
        </div>
        <div class="aside-Chia">
            <a href="product_ALL-jia.jsp">賈以食日</a>
        </div>
        <div class="aside-Laoma">
            <a href="product_ALL-lao.jsp">老媽拌麵</a>
        </div>
    </aside>
    <!--商品陳列左側選單結束-->

    <section>
        <!--總商品陳列-->
<%  
    try {
		if(con.isClosed())
            out.println("連線建立失敗");
        else{	
            sql = "SELECT count(*) FROM product WHERE `BID` = 3;" ;
            ResultSet tmp = con.createStatement().executeQuery(sql);
			tmp.next();
%>
        <div class="section_Tital">
            <h2>賈以食日 </h2><h3><%out.println(tmp.getString("count(*)"));%></h3>
        </div>
		
		<!--tempalte start-->

<%
			sql = "SELECT * FROM product WHERE `BID` = 3;" ;
			tmp = con.createStatement().executeQuery(sql);
			for(int i=0;i<2;i++){
				out.println("<div class='Row'>");
				for(int j=1;j<4;j++){
					tmp.next();
					out.println("<div class='products'><a href='product_introduction.jsp?name="+tmp.getString("PID")+"'>");
					out.println("<img src='"+tmp.getString("PImg")+"'>");
					out.println("<p>"+tmp.getString("PName")+"</p>");
					out.println("<p>NT$"+tmp.getString("PPrice")+"</p>");
					out.println("</a></div>");
				}
				out.println("</div>");
			}
			con.close();//關閉連線 
	    }
    }
    catch (SQLException sExec) {
           out.println("SQL錯誤"+sExec.toString());
    }
%>
		<!--trmplate end-->
		
    </section>
    <!--商品陳列結束-->

    <footer>
        您是第<%@include file="count.jsp"%>個顧客<br>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>

</html>