<%@ page import = "java.sql.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
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

    <title>我的許願罐</title>

    <style>
        a{
            text-decoration: none;
            color: black;
        }

        .title{
            padding: 20px 50px 20px 50px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: beige;
        }
        .ti-txt{
            /*margin-top: 15px;*/
            font-size: 18px;
            padding-left: 10px;
        }
        .ti-icon1{
            margin-right: 30px;
            padding-top: 20px;
            display: flex;
        }

        .ti-icon1 a>img{
            width: 30px;
            height: 30px;
        }
        .icon>img{
            width: 40px;
            height: 40px;
        }

        main{
            padding: 40px 50px;
        }
        .wi-name{
            margin: 0 20px 0 20px;
            display: flex;
            justify-content: space-between;
        }
        .winame-right a{
            margin-left: 10px;
        }
        .winame-right >img{
            width: 20px;
            height:20px;
        }
        .winame-right>span{
            font-size: 15px;
        }
        .wi-goal{
            margin: 0 20px 0 20px;
            display: flex;
            justify-content: space-between;
            /*align-items: center;*/
        }
        .cunru a{
            font-size: 10px;
            
        }
        .goal span{
            font-size: 10px;
            font-weight: bold;
        }
        /*進度條*/
        .jindu{
            margin: 10px 20px 0 20px;
            
        }
        .progress,.progress-bar{
            border-radius: 10px;
        }
        .progress-bar{
            background-color: #96a48b;
        }
        .increase{
            display: flex;
            justify-content: center;
            align-items: center;   
        }

        .increase-icon>img{
            width: 50px;
            height: 50px;
        }
        .increase-txt{
            margin-top: 15px;
            margin-left: 20px;
        }
        .increase-txt>p{
            font-size: 18px;
        }

       
    </style>
  </head>
  <body>
    <%
    //jsp連接前端範例
    request.setCharacterEncoding("UTF-8");
                response.setCharacterEncoding("UTF-8");
    try {
    //Step 1: 載入資料庫驅動程式 
        Class.forName("com.mysql.jdbc.Driver");
        try {
    //Step 2: 建立連線 	
            String url="jdbc:mysql://127.0.0.1:3306/?serverTimezone=UTC";
            String sql="";
            Connection con=DriverManager.getConnection(url,"root","12345678");
            if(con.isClosed())
                out.println("連線建立失敗");
            else {
    //Step 3: 選擇資料庫   
            sql="USE `question`";
            con.createStatement().execute(sql);
    //Step 4: 執行 SQL 指令, 若要操作記錄集, 需使用executeQuery, 才能傳回ResultSet	
            sql="select * from wish";
            PreparedStatement pstmt = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY );
            ResultSet rs2=pstmt.executeQuery();
    //先移到檔尾, getRow()後, 就可知道共有幾筆記錄
            rs2.last();
            int totalNo=rs2.getRow();
            %>
    <div class="title">
        <div class="ti-icon1">
              <a href="../jsp/member.jsp">
                <img src="../img/left-arrow.png" alt="">

              </a>
              <div class="ti-txt">
                <p>我的許願罐</p>
              </div>
              
        </div>
        
        <div class="icon">
          <img src="../img/jar2.png" alt="">
          
        </div>
    </div>

    <main>
        <%
		sql="select * from `wish`";
				rs2=con.createStatement().executeQuery(sql);
				
				while(rs2.next()){
		%>
        <div class="shadow p-3 mb-5 bg-body rounded">
            <a href="../jsp/wishdetail.jsp?name=<%=rs2.getString(2)%>&target=<%=rs2.getString(4)%>">
                <div class="wi-name">
                    <div class="winame-left">
                        <p><%=rs2.getString(2)%></p>
                    </div>
                    <div class="winame-right">
                        <span>目前點數：<br><%=rs2.getString(3)%></span>
                       
                        <img src="../img/chevron.png" alt="">
                    </div>
                </div>

            </a>
            

            <div class="wi-goal">
                <div class="cunru">
                    <a href="../html/deposit.html">立即存入</a>
                </div>
                <div class="goal">
                    <span>目標：</span>
                    <span><%=rs2.getString(4)%></span>
                </div>
            </div>

            <div class="jindu">
                <div class="progress">
                    <div class="progress-bar" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                  </div>
            </div>
        </div>
        <%}	
        //Step 6: 關閉連線
                  con.close();
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
        <div class="shadow p-3 mb-5 bg-body rounded">
            <a href="increase_wish.jsp">
                <div class="increase">
                    <div class="increase-icon">
                        <img src="../img/add-2.png" alt="">
                    </div>
                    <div class="increase-txt">
                        <p>新增其他許願罐</p>
                    </div>
                </div>

            </a>
            
        </div>


    </main>

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
    -->
  </body>
</html>