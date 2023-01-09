<%@ page import = "java.sql.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" type="image/x-icon" href="../sa-app/img/logo.png" />
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
    <link rel="stylesheet" href="../sa-app/css/footer.css">
    <%
Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://127.0.0.1:3306/question?serverTimezone=UTC";
Connection con=DriverManager.getConnection(url,"root","12345678");
String sql="USE `question`";
con.createStatement().execute(sql);
%>
  

    <title>首頁</title>
    <style>
        main{
            padding:40px;
        }
        
        .top{
            padding: 50px;
            background-color: beige;
            display: flex;
            justify-content: flex-start;
            align-items: center;
            height: 90px;

        }
    
        .top>p{
            font-size: 20px;
           padding-top: 20px;
           
            /*background-color: aliceblue;*/
        }
        .top>img{
            width: 40px;
            height: 40px;
            margin-right: 20px;
           
        }
        /*會員欄位*/
        .huiyuan{
            /*background-color: azure;*/
            height: 70px;
            display: flex;
            justify-content: space-evenly;
            align-items: center;
        }
        .hy-pic>img{
            width: 40px;
            height: 40px;
        }
     
        .pic>img{
            width: 20px;
            height: 20px;
            /*background-color: blue;*/
        }
        #star1{
            position: relative;
            right: -55px;
            bottom: -15px;
            z-index: 2;
            
        }
        #star2{
            position: relative;
            left: -20px;
            top:-25px;
            z-index: 2;
        }

        /*隨機廣告*/
        .more{
            text-align: right;
        }
        .more>a{
            font-size: 1px;
            margin-right: 10px;
            color:blue;
            
        }
     

        /*商店欄位*/
        .storename>p{
            font-size: 5px;
            /*background-color: chocolate;*/
            border-radius: 15px;
            text-align: center;

        }
        .p-3{
            background-color: #bfdaaa;
            border-radius: 15px;
         
        }
        .p3-pic{
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .p3-pic>img{
            width: 40px;
            height: 40px;
            
        }
        .name>p{
            font-size: 20px;
            font-weight: 800;
            padding-top: 12px;
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
      .h{
        margin-left: 100px;
      }

       
        
        
    </style>
      
      
  </head>
  <body>
   
    <div class="top">
        
        <img src="../sa-app/img/logo.png" alt="">
        <p>碳制郎</p>
        
        <%
        if(session.getAttribute("memberAc")==null)
            out.print("<script>alert('請先登入 !');location.href='../sa-app/html/login.html'</script>");
        else
            out.println("<a class= 'h' href='../sa-app/jsp/logout.jsp'>登出</a>");
      
      %>
    </div>

    <main>

        <!--會員-->
        <a href="../sa-app/html/cunzhe-2.html">
            <div class="shadow p-3 mb-4 bg-body rounded ">
                <div class="huiyuan">
                    <div class="hy-pic">
                        <img src="../sa-app/img/bear.png" alt="">
                    </div>
                    <%		   
                    sql = "SELECT * FROM `member` WHERE `memberAc`= '"+session.getAttribute("memberAc")+"'";
                    ResultSet rs1=con.createStatement().executeQuery(sql);
                    int a=0;
                    while(rs1.next()){
                %>
                    <div class="name">
                        <p><%=rs1.getString(3)%> </p>
                    </div>
                    <%}%>
                    <div class="count">
                        <div class="pic" id="star1">
                            <img src="../sa-app/img/sparkles.png" alt="">
                        </div>      
                        <h2>500</h2>
                        <div class="pic" id="star2">
                            <img src="../sa-app/img/sparkles.png" alt="">
                        </div> 
    
                    </div>
                    
                </div>
    
            </div>

        </a>
        

        <!--隨機廣告-->
        <div class="shadow p-3 mb-4 bg-body rounded">
            <div id="carouselExampleSlidesOnly" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-inner">
                  <div class="carousel-item active">
                    <img src="../sa-app/img/globe.png" class=" w-100" alt="...">
                  </div>
                  <div class="carousel-item">
                    <img src="../sa-app/img/number.png" class="w-100" alt="...">
                  </div>
                
                </div>
            </div>

        </div>

        <!--商店欄-->
        <div class="shadow p-3 mb-4 bg-body rounded">
            <div class="more"> 
            
                    <a href="../sa-app/html/shop.html">更多</a>
                
            </div>

            <div class="container">
                <div class="row row-cols-3 row-cols-lg-5 g-2 g-lg-3">
                    <a href="#">
                        <div class="col">
                            <div class="p-3">
                                <div class="p3-pic">
                                    <img src="../sa-app/img/laundry-machine.png" alt="">
                                </div>
                                
                            </div>
                            <div class="storename">
                                <p>AI智慧洗</p>
                            </div>
                        </div>
                    </a>

                    <a href="#">
                        <div class="col">
                            <div class="p-3">
                                <div class="p3-pic">
                                    <img src="../sa-app/img/laundry-machine.png" alt="">
                                </div>
                                
                            </div>
                            <div class="storename">
                                <p>AI智慧洗</p>
                            </div>
                        </div>
                    </a>
                    <a href="#">
                        <div class="col">
                            <div class="p-3">
                                <div class="p3-pic">
                                    <img src="../sa-app/img/laundry-machine.png" alt="">
                                </div>
                                
                            </div>
                            <div class="storename">
                                <p>AI智慧洗</p>
                            </div>
                        </div>
                    </a>
                    <a href="#">
                        <div class="col">
                            <div class="p-3">
                                <div class="p3-pic">
                                    <img src="../sa-app/img/laundry-machine.png" alt="">
                                </div>
                                
                            </div>
                            <div class="storename">
                                <p>AI智慧洗</p>
                            </div>
                        </div>
                    </a>
                    <a href="#">
                        <div class="col">
                            <div class="p-3">
                                <div class="p3-pic">
                                    <img src="../sa-app/img/laundry-machine.png" alt="">
                                </div>
                                
                            </div>
                            <div class="storename">
                                <p>AI智慧洗</p>
                            </div>
                        </div>
                    </a>
                    <a href="#">
                        <div class="col">
                            <div class="p-3">
                                <div class="p3-pic">
                                    <img src="../sa-app/img/laundry-machine.png" alt="">
                                </div>
                                
                            </div>
                            <div class="storename">
                                <p>AI智慧洗</p>
                            </div>
                        </div>
                    </a>
                    
                    
                    

                  
                  
                  
                </div>
            </div>
        </div>  
    </main>

    <!--固定欄位-->
    <footer>         
        <ul class="nav1">
            <a href="../sa-app/index.jsp" class="navitem">
                <li>
                    <img src="../sa-app/img/home-button.png" alt="">
                    <p>首頁</p>
                </li>
            </a>

            <a href="../sa-app/jsp/shop.jsp" class="navitem">
                <li>
                    <img src="../sa-app/img/shop.png" alt="">
                    <p>店家</p>
                </li>
            </a>
            
            <a href="../sa-app/jsp/store.jsp" class="navitem">
                <li>
                    <img src="../sa-app/img/shopping-cart.png" alt="">
                    <p>商城</p>
                </li>
            </a>
            
            <a href="../sa-app/html/friends.html" class="navitem">
                <li>
                    <img src="../sa-app/img/dog.png" alt="">
                    <p>好友</p>
                </li>
            </a>

            <a href="../sa-app/jsp/member.jsp" class="navitem">
                <li>
                    <img src="../sa-app/img/user.png" alt="">
                    <p>會員</p>
                </li>
            </a>
            
            
        </ul>
    </footer>


    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.1/dist/umd/popper.min.js" integrity="sha384-W8fXfP3gkOKtndU4JGtKDvXbO53Wy8SZCQHczT5FMiiqmQfUpWbYdTil/SxwZgAN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.min.js" integrity="sha384-skAcpIdS7UcVUC05LJ9Dxay8AXcDYfBJqt1CJ85S/CFujBsIzCIv+l9liuYLaMQ/" crossorigin="anonymous"></script>
    -->
  </body>
</html>