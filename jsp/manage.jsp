<%@page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>


<%if(session.getAttribute("admin") != null){
    sql="select * from Product";
    PreparedStatement pstmt = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY );
    ResultSet rs=pstmt.executeQuery();
    //先移到檔尾, getRow()後, 就可知道共有幾筆記錄
    rs.last();
    int totalNo=rs.getRow();
					
	sql="select * from Product";
    rs=con.createStatement().executeQuery(sql);
    
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
            <table style="border: 3px solid; width: 900px; text-align: center;">
                <tr>
                    <td class="memberdata_tital" colspan="2" >
                        商品資料
                        <hr>
                    </td>
                </tr>
                <tr style="border: 3px solid; font-weight: bolder;">
                    <td width="100px">
                       產品編號
                    </td>
                    <td width="200px">
                        產品名稱
                    </td>
                    <td width="100px">
                        廠商編號
                    </td>
                    <td width="100px">
                        價格
                    </td>
                    <td width="100px">
                        庫存
                    </td>
                    <td width="400px">
                        內容
                    </td>
                    <td width="100px">
                        圖片
                    </td>
                    <td width="50px">
              
                    </td>
                    <td width="50px">
              
                    </td>
                </tr>
                <%
                for (int i=0; i<totalNo; i++){
                    rs.next();
                    out.print("<tr style='border: 1px solid;'>");
                    out.print("<td>"+rs.getString(1)+"</td>");
                    out.print("<td>"+rs.getString(2)+"</td>");
                    out.print("<td>"+rs.getString(3)+"</td>");
                    out.print("<td>"+rs.getString(4)+"</td>");
                    out.print("<td>"+rs.getString(5)+"</td>");
                    out.print("<td>"+rs.getString(6)+"</td>");
                    out.print("<td>"+rs.getString(7)+"</td>");
                    out.print("</tr>");
                }
                %>
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
}else{
	con.close();//結束資料庫連結
%>
<h1><font color="red">您不是管理者！</font></h1>
<%
}
%>
