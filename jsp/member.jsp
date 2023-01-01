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

    <title>member</title>
    <%
    if(session.getAttribute("memberid")==null)
        out.print("<script>alert('請先登入 !');location.href='../html/login.html'</script>");
    else
        out.println("<a class= 'h' href='../jsp/logout.jsp'>登出</a>");
  
  %>
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
     <%
     try{
     Class.forName("com.mysql.jdbc.Driver");
     try{
     String url="jdbc:mysql://localhost";
     Connection con=DriverManager.getConnection(url,"root","12345678");
     String sql="use question";
     con.createStatement().execute(sql);
     %>
     <%	 
       if(session.getAttribute("memberid") != null ){
          sql = "SELECT*FROM `member`WHERE `memberid`='"+session.getAttribute("memberid")+"'";
          ResultSet rs=con.createStatement().executeQuery(sql);
          String  name="",memberid="";
          while(rs.next()){
             name=rs.getString("name");
             memberid=rs.getString("memberid");
           
          }
          con.close();
         %>
  </head>
<body>
  

  <div class="title">
      <div class="icon">
        <a href="../html/cunzhe.html"><img src="../img/bear.png" alt="">會員</a>
      </div>
      <div class="ti-txt">
        <p><%=name%> </p>
      </div>
      <div class="icon">
        <a href="../jsp/memberall.jsp"><img src="../img/setting.png" alt=""></a>
      </div>
    </div>

  <main>
      <!--點數/碳足跡-->
    <a href="../html/cunzhe.html">
        <div class="shadow p-3 mb-5 bg-body rounded">

          <div class="count">
            <div class="left">
              <div class="pic" id="star">
                <img src="../img/sparkles.png" alt="">
              </div>
              <p>500</p>
            </div>
  
            <div class="right">
              <div class="pic" id="foot">
                <img src="../img/footprints.png" alt="">
              </div> 
              <p>10000</p>
            </div>
          </div>
        </div>

      </a>
      

      <!--我的許願罐-->
      <div class="shadow p-3 mb-5 bg-body rounded">
        <a href="../html/wish.html">
          <div class="wish">
            <div class="wi-txt">
              <p>我的許願罐</p>
            </div>
            <div class="wishpic">
              <img src="../img/jar2.png" alt="">
            </div>
          </div>
        </a>  
      </div>
 
      <!--排行榜-->
      <div class="line">
        <p>排行榜</p>
      </div>
      <div class="shadow p-3 mb-5 bg-body rounded">
        <table class="table">
          <thead>
            <tr>
              <th scope="col">#</th>
              <th scope="col">Name</th>
              <th scope="col">Points</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <th scope="row">1</th>
              <td>NianTing</td>
              <td>1500</td>
              
            </tr>
            <tr>
              <th scope="row">2</th>
              <td>CaiiCaii</td>
              <td>500</td>
              
            </tr>
            <tr>
              <th scope="row">3</th>
              <td>Ru</td>
              <td>100</td>
            </tr>
          </tbody>
        </table>
      </div>
  </main>
  <%
}
else{
    
    con.close();//結束資料庫連結
%>


<%
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