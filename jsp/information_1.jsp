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
        <title>個人資訊</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="../img/logo.jpg" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="../css/style_1.css" rel="stylesheet" />
        <link rel="stylesheet" href="../css/footer.css">
    </head>
    <style>           
        .title{
        padding: 20px 40px 15px 60px;
        background-color: beige;
        display: flex;
        justify-content: space-between;
        /*align-items: center;*/
      }
      .ti-txt>p{
        font-size: 25px;
      }
      .icon{
        margin-top: 5px;
      }
      .icon>a{
        padding: 10px;
      }
      .icon a >img{
        width: 30px;
        height: 30px;
      }

      /*點數/碳足跡*/
      .count{
        margin-top: 15px;
        display: flex;
        justify-content: space-evenly;
        align-items: center;
      }
      .left,.right{
        display: flex;
      }
      .left>p,.right>p{
        font-size: 28px;
      }
      .pic>img{
        width: 30px;
        height: 30px;
        
      }

      main{
        padding: 50px;
      }
      .wish{
        display: flex;
        justify-content: space-around;
      }
      .wishpic>img{
        width: 60px;
        height: 60px;
      }
      .wi-txt{
        margin-top: 15px;
        display: flex;
        justify-content: center;
        align-items: center;

      }
      .wi-txt>p{
        font-size: 20px;
      }
  
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
    <body>
<%
	if(session.getAttribute("access")==null)
    	out.println("<a class= 'h' href='../html/login.html'>登入</a>");
        if (connectMyQL()==false){
            out.print("DB connect fail");
            return;
        }   
%>
	
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
        <!-- Header-->
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <!--<img class="display-4 fw-bolder" src="assets/logo.jpg">-->
                    <p class="lead fw-normal text-white-50 mb-0">個人資訊</p>
                    <div class="point">
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
                </div>
            </div>
            
        </header>
        <!-- Section-->
        <section class="py-5">
<%		   
    //String mail=(String)session.getAttribute("memberAc");
	sql = "SELECT * FROM `member`, `member_card` WHERE `member`.`memberAc`= '"+session.getAttribute("memberAc")+"' AND `member`.`memberAc` = `member_card`. `id`";
	//sql="SELECT * FROM `member`, `member_card` WHERE `member`.`memberAc` = `member_card`. `id`;";
	ResultSet rs2=con.createStatement().executeQuery(sql);
	while(rs2.next()){
%>
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <div class="col mb-5">
                        <!--<div class="card h-100">-->
                            <div class="change" style="border-width: 2px; border-style: outset; border-color: #F0F0F0; border-radius: 10px;">
                                <p>信用卡號</p>
                                <p><%=rs2.getString("cardid")%></p>
                                <p>信用卡有效日期</p>
                                <p><%=rs2.getString("carddate")%></p>
                               <%}%>
                           
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                       
                        </div>
                    </div>
                    
                        </div>
                   
                   <!--<div class="col mb-5">
                       <input type="submit" value="儲存" style="margin-left: 43%; font-size: 20px;">-->

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


        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="../js/scripts.js"></script>
    </body>
    <%
    closeMySQL();
    %> 

</html>
