<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@ page import = "java.io.*"%>
<%@include file="config.jsp" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>我的卡片</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="../img/logo.jpg" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="../css/style_1.css" rel="stylesheet" />
        <link rel="stylesheet" href="../css/footer.css">
        <style>
            footer{
            padding: 20px;
            background-color: beige;
            position:fixed;
            bottom: 0;
            width: 100%;
            
        }
        .nav1{
            display: flex;
            justify-content: space-around;
            align-items: center;
        }
        .navitem{
            width: 50px;
            height: 50px;
            background-color: antiquewhite;
            border-radius: 50%;
            display: flex;
            justify-content: space-around;
            align-items: center;
        }
      
        </style>
    </head>
    <body>
        <!-- Navigation-->
        <div class="fixed-bottom">
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <!--<a class="navbar-brand" href="#!">Start Bootstrap</a>-->
                <!--<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>-->
                <!--<div class="collapse navbar-collapse" id="navbarSupportedContent">-->
                    
                    
                </div>
            </div>
        </nav>
<%
connectMyQL();
	if(session.getAttribute("access")==null)
    	out.println("<a class= 'h' href='../html/login.html'>登入</a>");
%>
        <!-- Header-->
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <!--<img class="display-4 fw-bolder" src="assets/logo.jpg">-->
                    <p class="lead fw-normal text-white-50 mb-0">我的卡片</p>
                    <!--<div class="point">
                        <p class="lead fw-normal-1 text-white-51 mb-0">帳號:M123xxxxxx</p>
                    </div>
                </div>-->
				<%		   
	String sql = "SELECT * FROM `member` WHERE `memberAc`= '"+session.getAttribute("memberAc")+"'";
	ResultSet rs=con.createStatement().executeQuery(sql);
	int a=0;
	while(rs.next()){
%>
                        <p class="lead fw-normal-1 text-white-51 mb-0">帳號:<%=rs.getString(2)%></p>
						<input type="hidden" name="id">
						<%}%>
            </div>
            
        </header>
        <!-- Section-->
        <section class="py-5">
            <form name="updatecard" method="post" action="Cupdate.jsp">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <div class="col mb-5">
                        <!--<div class="card h-100">-->
                            <div class="change" style="border-width: 2px; border-style: outset; border-color: #F0F0F0; border-radius: 10px;">
                                <p>銀行代碼</p>
                                <p><input type="text" placeholder="請輸入銀行代碼" name="cardid1" style=" border-bottom: 2px soild;border-left-width:0px; border-right-width:0px;border-top-width:0px;"></p>
                                <p>信用卡號</p>
                                <p><input type="text" placeholder="請輸入信用卡號" name="cardnum1" style=" border-bottom: 2px soild;border-left-width:0px; border-right-width:0px;border-top-width:0px;"></p>
                                <p>信用卡有效日期</p>
                                <p><input type="date" name="carddate1" style=" border-bottom: 2px soild;border-left-width:0px; border-right-width:0px;border-top-width:0px;"></p>
                           
                            </div>
                        </div>
                    </div>
                    
                    </div>
                    
                        </div>
                    </div>
                    
                   <div class="col mb-5">
                       <input type="submit" value="儲存" style="margin-left: 43%; font-size: 20px;">
                        
        </section>
       
    </body>
    <!--固定欄位-->
<footer>         
    <ul class="nav1">
        <a href="../index.jsp" class="navitem">
            <li>
                <img src="../img/home-button.png" alt="">
                <p>首頁</p>
            </li>
        </a>

        <a href="../jsp/shop.jsp" class="navitem">
            <li>
                <img src="../img/shop.png" alt="">
                <p>店家</p>
            </li>
        </a>
        
        <a href="../jsp/store.jsp" class="navitem">
            <li>
                <img src="../img/shopping-cart.png" alt="">
                <p>商城</p>
            </li>
        </a>
        
        <a href="../html/friends.html" class="navitem">
            <li>
                <img src="../img/dog.png" alt="">
                <p>好友</p>
            </li>
        </a>

        <a href="../jsp/member.jsp" class="navitem">
            <li>
                <img src="../img/user.png" alt="">
                <p>會員</p>
            </li>
        </a>   
    </ul>
</footer>
<%
closeMySQL();
%>
</html>
