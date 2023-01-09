<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
 <%@ page import = "java.io.*"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" type="image/x-icon" href="../img/logo.png" />
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">

    <title>新增結果</title>
    <style>
        .title{
            /*padding: 18px 50px;*/
            height: 80px;
            padding-top: 20px;
            background-color: beige;
            display: flex;
            justify-content: center;
            align-items: center;
            border-bottom: 1px solid #96a48b;

        }
    
        .title>p{
            font-size: 18px;
            font-weight: bolder;
            
        }
        main{
            margin-top: 30px;
            padding: 00px 50px 0px 50px;
        }
        .mititle{
            /*padding-left: 70px;*/
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .miti-icon>img{
            width: 30px;
            height: 30px;
        }
        .miti-txt{
            margin-top: 13px;
            margin-left: 10px;
        
            
        }
        .miti-txt>p{
            font-size: medium;
            font-weight: bold;
        }
        .logo{
            padding-bottom: 40px;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .logo>img{
            width: 125px;
            height: 125px;
        }
        .indere-box{
            border-top: 1px solid #96a48b;
        }
        .inde-receipt{
            padding: 5px 20px 0 20px;
            display: flex;
            justify-content: space-between;
            align-content: center;
        }
        #indere-tit1{
            padding-top: 50px;
            
        }
        .btn{
            margin-top: 100px;
            display: flex;
            justify-content: center;
        }
        button{
            border:none;
            height: 40px;
            width: 250px;
            border:1px solid  #aab8ba;
            background-color: white;
            border-radius: 20px;
            
        }
        button>a{
            text-decoration: none;
            color: #96a48b;

        }

    </style>
    
  </head>
  <body>
    <div class="title">

        <p>新增結果</p>
        
    </div>
    <main>
        <div class="mititle">
            <div class="miti-icon">
                <img src="../img/check.png" alt="">
            </div>
            <div class="miti-txt">
                <p>新增成功</p>
            </div>
            
        </div>

        <div class="logo">
            <img src="../img/logo.png" alt="">
        </div>

        <div class="indere-box">
            <div class="inde-receipt" id="indere-tit1">
                <div class="indere-title" >
                    <p>許願罐名稱</p>
                </div>
                <div class="indere-count">
                    <p>遊樂園</p>
                </div>
            </div>
            <div class="inde-receipt">
                <div class="indere-title">
                    <p>首次存入點數</p>
                </div>
                <div class="indere-count">
                    <p>100</p>
                </div>
            </div>
            <div class="inde-receipt">
                <div class="indere-title">
                    <p>儲蓄目標點數</p>
                </div>
                <div class="indere-count">
                    <p>500</p>
                </div>
            </div>
        </div>

        <div class="btn">
            <button><a href="../html/wish-2.html">完成</a></button>
        </div>
    </main>
    

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