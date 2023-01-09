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
    <link rel="stylesheet" href="../css/footer.css">
    <title>商城</title>

    <script> 
      document.onclick=function()
      { var obj = event.srcElement; 
      if(obj.type == "button"){ 
      alert(obj.id); } 
      } 
      </script> 
      
  </head>
  <style>
    .p-3{
      border-radius: 10px;
      text-align: center;
      margin: 10px;
      background-color:  #b4d09f
      
    }
  
    .store-btn {
      display: flex;
      justify-content: center; 
      align-items: center; 
      text-align: center;
      border-color:gray;
     
    }

    .btn-primary{
      background-color:  #9ad071;
      border: #127436;;
      color: black;
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
        .nav{
            display: flex;
            justify-content: space-around;
            align-items: center;
            border:1px solid ;
            border-color:#9ad071
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
        .title{
            padding: 20px 30px;
            background-color: beige;
            display: flex;
            justify-content: space-between;
            align-items: center;

        }
        
        .ti-icon{
            padding-top: 9px;
            display: flex;
            padding-left: 30px;
        }

        .ti-icon >img{
            width: 35px;
            height: 35px;
        }
        
        .ti-icon>p{
            padding-top: 5px;
            padding-left: 20px;
            font-size: 20px;
            color:#127436;
            font-weight: 900;
        }
        
        .d-flex>input{
            outline-style: none;
            width: 70px;
            height: 30px;
            font-size: 15px;
            border:1px solid #96a48b;
            
        }
        .d-flex>input::-webkit-input-placeholder{
            text-align: center;
        }
        .btn{
            width: 70px;
            height: 30px;
            font-size: 15px;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .container{
          padding: 5px;
        }
  </style>
    

  <body>
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
                sql="select * from voucher";
				PreparedStatement pstmt = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY );
				ResultSet rs=pstmt.executeQuery();
        //先移到檔尾, getRow()後, 就可知道共有幾筆記錄
                rs.last();
                int totalNo=rs.getRow();
                %>
    <div class="title">
      <div class="ti-icon">
          <img src="../img/shopping-cart.png" alt="">
          <p>商城</p>
      </div>
    
      <nav class="navbar navbar-expand-lg navbar-light">              
          <form class="d-flex">
              <input class="form-control me-2" type="search" placeholder="..." aria-label="Search">
              <button class="btn btn-outline-success" type="submit">搜尋</button>
          </form>
      </nav>
      <%
      if(session.getAttribute("memberAc")==null)
          out.print("<script>alert('請先登入 !');location.href='../html/login.html'</script>");
      else
          out.println("<a class= 'h' href='../jsp/logout.jsp'>登出</a>");
    
    %>
    </div>
    <%
		sql="select * from `voucher`";
				rs=con.createStatement().executeQuery(sql);
				
				while(rs.next()){
		%>
    <div class="container">
   
        
          <div class="nav">
            <%=rs.getString(2)%><br>
            
            <%=rs.getString(3)%><br>
         
      
          <div class="store-btn">

            <a href="voucher.jsp?name=<%=rs.getString(2)%>">
                          <button type="button" class="btn btn-primary" name="name"  id= <%=rs.getString(2)%> data-bs-toggle="modal" data-bs-target="#exampleModal3">
             兌換    
              
      </div>
      </div>  
     
     </div>  
            </button>  </a>
     
          
           
         
       

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