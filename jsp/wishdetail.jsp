<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8" %>
<%@page import="java.sql.*" %>
 <%@ page import = "java.io.*"%>
<%@include file="config.jsp" %>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" type="image/x-icon" href="../img/logo.png" />
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">

    <title>許願罐內容</title>
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
      
        .miti-txt{
            text-align: center;
            font-size:x-large;
            font-weight: bolder;
        }
        .miti-icon>img{
            width: 20px;
            height: 20px;
        }
        /*進度條*/
        .miti-jindu{
            padding: 10px 50px;
        }
        .progress,.progress-bar{
            border-radius: 10px;
        }
        .progress-bar{
            background-color: #96a48b;
        }

        .miti-bottom{
            padding:10px 50px;
            font-size: small;
            
            display: flex;
            justify-content: space-between;
        }
        .cunru{
            padding:10px 20px;
            display: flex;
            justify-content: space-between;
        }
        .cr-right{
            display: flex;
        }
        .cr-icon{
            margin-right: 20px;
        }
        .cr-icon>img{
            width: 20px;
            height: 20px;
        }
        
        .cr-icon2>img{
            width: 20px;
            height: 20px;

        }
        
        a{
            text-decoration: none;
            color: black;
            /*background-color: #fff;*/ 
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
              <p>許願罐內容</p>
          </div>
      </div>
     
      <main>
          <div class="maintitle">
              <div class="miti-txt">
                 
                    <p><%=request.getParameter("name")%></p>
                  
              </div>
              <div class="miti-jindu">
                <div class="progress">
                    <div class="progress-bar" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                  </div>

              </div>
              <div class="miti-bottom">
                  <div class="miti-bottom-left">
                      <span>已達成：</span>
                      <span>50%</span>
                  </div>
                  <div class="miti-bottom-right">
                      <span>目標點數：</span>
                      <span><%=request.getParameter("target")%></span>
                  </div>
              </div>
          </div>


          <!--自動存入-->
          <a href="../html/automatic.html">
            <div class="shadow p-3 mb-4 bg-body rounded">
                <div class="cunru">
                    <div class="cr-right">
                      <div class="cr-icon">
                          <img src="../img/replace.png" alt="">
                      </div>
                      <div class="cr-txt">
                          <p>設定自動存入</p>
                      </div>
  
                    </div>
                    
                    <div class="cr-icon2">
                        <img src="../img/chevron.png" alt="">
                    </div>
                </div>
            </div>

          </a>
          
          
        <!--存入金額-->
        <a href="../html/deposit.html">
            <div class="shadow p-3 mb-4 bg-body rounded">
                <div class="cunru">
                    <div class="cr-right">
                      <div class="cr-icon">
                          <img src="../img/deposit.png" alt="">
                      </div>
                      <div class="cr-txt">
                          <p>存入點數</p>
                      </div>
    
                    </div>
                    
                    <div class="cr-icon2">
                        <img src="../img/chevron.png" alt="">
                    </div>
                </div>
            </div>
        </a>
        

        <!--提領金額-->
        <a href="../html/withdraw.html">
            <div class="shadow p-3 mb-4 bg-body rounded">
                <div class="cunru">
                    <div class="cr-right">
                      <div class="cr-icon">
                          <img src="../img/money-withdrawal.png" alt="">
                      </div>
                      <div class="cr-txt">
                          <p>提領點數</p>
                      </div>
    
                    </div>
                    
                    <div class="cr-icon2">
                        <img src="../img/chevron.png" alt="">
                    </div>
                </div>
            </div>

        </a>
        

        <!--查看明細-->
        <a href="../html/receipt.html">
            <div class="shadow p-3 mb-4 bg-body rounded">
                <div class="cunru">
                    <div class="cr-right">
                      <div class="cr-icon">
                          <img src="../img/bill.png" alt="">
                      </div>
                      <div class="cr-txt">
                          <p>查看明細</p>
                      </div>
    
                    </div>
                    
                    <div class="cr-icon2">
                        <img src="../img/chevron.png" alt="">
                    </div>
                </div>
            </div>

        </a>
        

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