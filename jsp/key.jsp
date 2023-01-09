<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
 <%@ page import = "java.io.*"%>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" type="image/x-icon" href="../img/logo.png" />
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">

    <!--下方固定欄位CSS-->
    <link rel="stylesheet" href="../css/footer.css">

    <title>加入好友</title>
    <style>
        a{
            text-decoration: none;
            color:green;
        }
        .title{
            padding: 18px 50px;
            background-color: beige;
            display: flex;
            justify-content: flex-start;
            align-items: center;

        }
        .ti-icon{
            margin-right: 30px;
        }

        .ti-icon a>img{
            width: 30px;
            height: 30px;
        }
        .ti-txt{
            margin-top: 15px;
        }
        .ti-txt>p{
            font-size: 18px;
        }

        main{
            padding: 50px;
        }

        input{
            outline-style: none;
            width: 100%;
            height: 40px;
            border:1px solid #96a48b;
            border-radius: 2px;
            margin-right: 10px;
        }
        input::-webkit-input-placeholder{
            text-align: center;
        }

         /*固定欄位*/
         a{
            text-decoration: none;
            color: black;
            /*background-color: #fff;*/
    
         }

        footer{
            padding: 20px;
            background-color: beige;
            position: fixed;
            bottom: 0;
            width: 100%;
            z-index: 2;
            
        }
        .nav1{
            display: flex;
            justify-content: space-around;
            align-items: center;
        }
        .navitem{
            /*width: 50px;
            height: 50px;
            background-color: cornsilk;
            border-radius: 50%;*/
            display: flex;
            justify-content: space-around;
            align-items: center;
        }
        
    </style>
  </head>
  <body>
    <div class="title">
        <div class="ti-icon">
            <a href="../jsp/friends.jsp">
              <img src="../img/left-arrow.png" alt="">
            </a>
            
        </div>
        <div class="ti-txt">
            <p>加入好友</p>
        </div>
    </div>
  

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
            
            <a href="../jsp/friends.jsp" class="navitem">
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

    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.1/dist/umd/popper.min.js" integrity="sha384-W8fXfP3gkOKtndU4JGtKDvXbO53Wy8SZCQHczT5FMiiqmQfUpWbYdTil/SxwZgAN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.min.js" integrity="sha384-skAcpIdS7UcVUC05LJ9Dxay8AXcDYfBJqt1CJ85S/CFujBsIzCIv+l9liuYLaMQ/" crossorigin="anonymous"></script>
    --><%
try{
    Class.forName("com.mysql.jdbc.Driver");
    try{
    String url="jdbc:mysql://localhost";
    Connection con=DriverManager.getConnection(url,"root","12345678");
    String sql="use question";
    con.createStatement().execute(sql);
    %>
    
    <%
          request.setCharacterEncoding("UTF-8");
        String phone = request.getParameter("phone");
        if(phone!=null && !phone.equals("")){
            sql = "SELECT * FROM `member` WHERE `phone` LIKE'%" +request.getParameter("phone") + "%'" ; //關鍵字搜尋
            ResultSet rs=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(sql);
            rs.last();
            request.setCharacterEncoding("UTF-8");
            int Count = rs.getRow();  //查詢結果數量
             while(rs.next()){
             session.setAttribute("phone",request.getParameter("phone"));
             }
            if(Count > 0){    
             session.setAttribute("Count", Integer.toString(Count));
             session.setAttribute("phone", phone);
             response.sendRedirect("search.jsp");
                }  
            else{
                out.print("<h2><center>查無該用戶<br><br>請<a href='increase-friends.jsp'><u>按此</u></a>重新查詢");
                }
        }
      
        }
        catch (SQLException sExec) {
               out.println("SQL錯誤"+sExec.toString());
        }
    }
    catch (ClassNotFoundException err) {
       out.println("class錯誤"+err.toString());
    }
    
    %>
  </body>
</html>