<%@ page import = "java.sql.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%><!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" type="image/x-icon" href="../img/logo.png" />
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">

    <title>新增許願罐</title>
    <style>
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
        .memo{
            text-align: center;
            margin-bottom: 30px;
        }
        .wishname{
            padding-bottom: 20px;
            border-bottom: 1px solid #96a48b;
        }
        .wishname-title>p{
            font-size: 12px;
            

        }
        input{
            outline-style: none;
            width: 100%;
            height: 40px;
            border:1px solid #96a48b;
            border-radius: 20px;
        }
        input::-webkit-input-placeholder{
            text-align: center;
        }
        .firstinsert{
            margin-top: 20px;
            margin-bottom: 15px;
        }
        label{
            font-size: 10px;
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
        <div class="ti-icon">
            <a href="../jsp/wish.jsp">
              <img src="../img/left-arrow.png" alt="">

            </a>
            
        </div>
    
        <div class="ti-txt">
            <p>許願罐新增</p>
        </div>
    </div>
    <main>
        <div class="memo">
            <p>設定後會顯示存入點數，</p>
            <p>點數集滿才可提領唷～</p>
        </div>
           <form name="increase_wish" method="post" action="increase_wish_det.jsp">
        <div class="wishname">
            <div class="wishname-title">
                <p>許願罐名稱</p>
                <input type="text" name="name" placeholder="許願罐名稱" style="text-align:center" required >
            </div>
        </div>

        <div class="firstinsert">
            <label>首次存入金額（非必填）</label><br>
            <label>點數尚餘500點</label>
            <input type="text" name="deposit" placeholder="請輸入點數" style="text-align:center" required>  
        </div>

        <div class="goal">
            <label for="">儲蓄目標</label>
            <input type="text"  name="target" placeholder="請輸入點數" style="text-align:center" required>  

        </div>
<br>
        <div class="goal">
            <input type="submit" value="新增">
            </div>
       
    </main>
     </form>

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