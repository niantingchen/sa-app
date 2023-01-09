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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>兌換券</title>
    <link rel="stylesheet" href="../css/footer.css">
    <style>
.voucher-name{
    size: 20%;
    text-align: center;
}
.m-section1{
    width: 100%;
    display: flex;
    justify-items: center;
    align-items: center;
    margin-top: 10%;
}

#tab {
    background: white;

    justify-content: center; 
    align-items: center; 
    text-align: center;

}
/* 頁籤ul */
#tab>ul{
overflow: hidden;

}

/* 頁籤上的文字 */      
#tab > ul > li > a { 
    text-decoration: none;
    color: black;
    display: block;
    padding: 5%;
    justify-content: center; 
    align-items: center; 
    text-align: center;
    width: 80%;

}
/*頁籤div內容*/
#tab > div {
    clear: both;
    padding: 0 15px;
    height: 0px;
    overflow: hidden;
    visibility: hidden;
}
/*第一筆的底色*/
span:target ~ #tab > ul li:first-child a {
    background: white;
}

span:target ~ #tab > div:first-of-type {
    visibility: hidden;

}

/*頁籤變換&第一筆*/
span ~ #tab > ul li:first-child a,      
#tab-1:target ~ #tab > ul li a[href$="#tab-1"],
#tab-2:target ~ #tab > ul li a[href$="#tab-2"]
 {
    background: gray;
    border-radius: 50px;    
}

span ~ #tab > ul li:first-child a::before,
#tab-1:target ~ #tab > ul li a[href$="#tab-1"]::before,
#tab-2:target ~ #tab > ul li a[href$="#tab-2"]::before{
    background-color: white;
    height: 500px;
}

/*頁籤內容顯示&第一筆*/
span ~ #tab > div:first-of-type,
#tab-1:target ~ #tab > div.tab-content-1,
#tab-2:target ~ #tab > div.tab-content-2{
    visibility: visible;
    height: 100%;
    width: 100%;
    background: white;
}
.tab-content-1{
    width: 100%;
    text-align: center;
    justify-content: center;

}

.t-c-2-one{
    border:  1px black solid;
    /*width: 80%;*/
    margin-top: 10%;
    border-radius: 10px;
    display: flex;
}
.t-c-2-o-pic{
    border: 1px;
    width: 30%;
    border-right:1px black dotted;
}
.t-c-2-o-text{
    width: 70%;
    display: flex;
    justify-content: center;
    align-items: center;

    
}
.t-c-2-o-text2{
    width: 70%;
    margin-top: 5%;
    justify-content: center;
    align-items: center;
}
.t-c-2-o-pic>img{
    max-width: 80%;
    height: auto;
    padding-top: -5px;

}
.btn{
    display: flex;
    font-size: 10%;
    
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
    <h1 class="voucher-name"><br>
        兌換券
    </h1>
    <div class="m-section1">
            <span id="tab-1" style="display: none;">可使用</span>
            <span id="tab-2" style="display: none;">已使用</span>       
        <!-- 頁籤按鈕 -->
        <div id="tab">
            <ul >
                <li style="list-style-type: none;float: left;width: 45%;"><a href="#tab-1">可使用</a></li>
                <li style="list-style-type: none;float: left;width: 45%;"><a href="#tab-2">已使用</a></li>
            </ul><br>
            <!-- 頁籤的內容區塊 -->
            <div class="tab-content-1" >
               <div class="t-c-2-one">
                    <div class="t-c-2-o-pic">
                        <img src="../img/sport-car.png">
                        <h6><%=request.getParameter("name")%></h6>
                    </div>
                    <div class="t-c-2-o-text">
                        <div class="t-c-2-o-t-one">
                            <div class="btn">
                                <button type="button" class="btn btn-light" data-bs-toggle="modal" data-bs-target="#exampleModal">
                                    開始使用
                                </button>
                                <button type="button" class="btn btn-light" data-bs-toggle="modal" data-bs-target="#exampleModal00">
                                    結束使用
                                </button>
                            </div>
                            <!-- Modal -->
                            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" >
                                <div class="modal-dialog modal-dialog-centered">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" ></button>
                                        </div>
                                        <div class="modal-body" style=" text-align: center; size: 40px; ">
                                            <br>
                                            <div class="mb-3">
                                                <label for="formGroupExampleInput" class="form-label" style="size: 20px;">車牌號碼</label>
                                                <input type="text" class="form-control" id="formGroupExampleInput" placeholder="請輸入您的車牌號碼">
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <a href="voucher.html">
                                                  <button type="button" class="btn btn-dark">開始使用</button>
                                            </a>
                                          
                                        </div>
                                    </div>
                                </div>
                            </div>     
                        </div>                            
                             <!-- Modal -->
                             <div class="modal fade" id="exampleModal00" tabindex="-1" aria-labelledby="exampleModalLabel00" aria-hidden="true" >
                                 <div class="modal-dialog modal-dialog-centered">
                                     <div class="modal-content">
                                         <div class="modal-header">
                                             <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" ></button>
                                         </div>
                                         <div class="modal-body" style=" text-align: center; size: 40px; ">
                                             <b></b><br>
                                             開車時間2小時<br>
                                             扣除炭點10000點<br>
                                         </div><br>
                                     </div>
                                 </div>
                             </div>     
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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.min.js" integrity="sha384-lpyLfhYuitXl2zRZ5Bn2fqnhNAKOAaM/0Kr9laMspuaMiZfGmfwRNFh8HlMy49eQ" crossorigin="anonymous"></script>
    -->
    
    
</body>
</html>