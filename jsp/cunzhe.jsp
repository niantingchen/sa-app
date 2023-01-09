<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
 <%@ page import = "java.io.*"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
    <link rel="icon" type="image/x-icon" href="../img/logo.png" />
    <!--下方固定欄位CSS-->
    <link rel="stylesheet" href="../css/footer.css">

    <title>碳權存摺</title>
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
            padding:50px;
            
        }
        a{
            text-decoration: none;
            color: black;
            /*background-color: #fff;*/
            
        }
        
        
        .count{
            /*background-color: antiquewhite;*/
            height: 100px;
            /*垂直置中*/
            margin:auto;
            display: flex;
            align-items: center;
            justify-content: center;
           
        }
        .pic>img{
            width: 30px;
            height: 30px;
            /*background-color: blue;*/
        }
        #star1{
            position: relative;
            bottom: -20px;
            z-index: 2;
            
        }
        #star2{
            position: relative;
            top: -30px;
            z-index: 2;
        }
        .countnum>p{
            font-size: 50px;
           /* background-color: #fff;*/
             
        }
        .record{
            height: 230px;
            /*background-color: #f0f0f0;*/
            overflow: scroll;
        }
        .txt a{
            display: flex;
            justify-content: space-around;
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
  </head>
  <body>
   
      <!--碳權存摺-->
      <div class="title">
        <div class="ti-icon">
            <a href="../jsp/member.jsp">
              <img src="../img/left-arrow.png" alt="">
            </a>
            
        </div>
        <div class="ti-txt">
            <p>碳權存摺</p>
        </div>
    </div>

    <main>
        <%
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8"); 
            //jsp連接前端範例
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
                    sql="select * from member_log";
                    PreparedStatement pstmt = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY );
                    ResultSet rs=pstmt.executeQuery();
            //先移到檔尾, getRow()後, 就可知道共有幾筆記錄
                    rs.last();
                    int totalNo=rs.getRow();
                    %>
        <!--用戶累計點數-->
        <div class="shadow-sm p-3 mb-4 bg-body rounded">
            <div class="count">
                <div class="pic" id="star1">
                    <img src="../img/sparkles.png" alt="">
                </div> 
        
                <div class="countnum">
                    <p>500</p>
        
                </div>
        
                <div class="pic" id="star2">
                    <img src="../img/sparkles.png" alt="">
                    </div>
                </div>
            </div>
        </div>


            <!--用戶累計碳足跡-->
            <div class="shadow-sm p-3 mb-4 bg-body rounded">
                <div class="count">
                    <div class="pic">
                        <img src="../img/footprints.png" alt="">
                    </div> 
        
                    <div class="countnum">
                        <p>5000</p>
        
                    </div>
                </div>
            </div>
          
            <!--點數累計紀錄-->
            <div class="shadow p-3 mb-4 bg-body rounded">
                <div class="record">
      <%
            sql="select * from `member_log`";
                    rs=con.createStatement().executeQuery(sql);
                    
                    while(rs.next()){
            %>
                    <div class="txt">
                        <a href="detail.jsp?total=<%=rs.getString(3)%>&bill=<%=rs.getString(4)%>&foot=<%=rs.getString(6)%>&point=<%=rs.getString(5)%>">
                            <p><%=rs.getDate(7)%></p>
                            <p>AI智慧洗</p>
                            <p>+<%=rs.getString(5)%>點</p>
                        </a>
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
                </div>
               
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