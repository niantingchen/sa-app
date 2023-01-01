<%@ page import = "java.sql.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>會員中心</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="img/logo.jpg" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/style_1.css" rel="stylesheet" />

        <%
        if(session.getAttribute("memberid")==null)
            out.println("<a class= 'h' href='login.html'>登入</a>");
        else
            out.println("<a class= 'h' href='logout.jsp'>登出</a>");
      
      %>
    </head>
    <body>
        <!-- Navigation-->
        <div class="fixed-bottom">
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <!--<a class="navbar-brand" href="#!">Start Bootstrap</a>-->
                <!--<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>-->
                <!--<div class="collapse navbar-collapse" id="navbarSupportedContent">-->
                    <ul class="nav nav-tabs">
                        <li class="nav-item"><a class="nav-link" aria-current="page" href="#!">存摺</a></li>  <!--存摺導覽列-->
                        <li class="nav-item"><a class="nav-link" href="#!">商店</a></li>                             <!--商店導覽列-->
                        <li class="nav-item"><a class="nav-link" href="#!">首頁</a></li>                             <!--首頁導覽列-->
                        <li class="nav-item"><a class="nav-link" href="#!">會員</a></li>                             <!--會員導覽列-->
                        <!--<li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Shop</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#!">All Products</a></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="#!">Popular Items</a></li>
                                <li><a class="dropdown-item" href="#!">New Arrivals</a></li>
                            </ul>
                        </li>-->
                    </ul>
                    <!--<form class="d-flex">
                        <button class="btn btn-outline-dark" type="submit">
                            <i class="bi-cart-fill me-1"></i>
                            Cart
                            <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
                        </button>
                    </form>-->
                </div>
            </div>
        </nav>
        <!-- Header-->
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
	 String  name="",memberid="",password="";
	 while(rs.next()){
        name=rs.getString("name");
		memberid=rs.getString("memberid");
        password=rs.getString("password");		 
	 }
	 con.close();
	%>
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <img class="display-4 fw-bolder" src="img/logo.jpg">
                    <p class="lead fw-normal text-white-50 mb-0"> <%=name%> </p> 
                    <div class="point">
                        <p class="lead fw-normal-1 text-white-50 mb-0"><img class="display-7 fw-bolder" src="img/star.png">500<img class="display-8 fw-bolder" src="img/star.png"></p>
                    </div>
                </div>
            </div>
            
        </header>
        <%
}
else{
	
	con.close();//結束資料庫連結
%>

</form>
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
        <!-- Section-->
        <section class="py-5">
            
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <div class="col mb-5">
                        <div class="card h-100">
                            
                            <a href="information.jsp"><input type="button" style="border:2px none; width: 100%;" value="個人資訊 &nbsp;>"></a>
                            <!--Product image-->
                            <!--<img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />-->
                            <!-- Product details
                            <div class="card-body p-4">
                                <div class="text-center">-->
                                    <!-- Product name
                                    <h5 class="fw-bolder">Fancy Product</h5>-->
                                    <!-- Product price
                                    $40.00 - $80.00
                                </div>
                            </div>-->
                            <!-- Product actions
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">View options</a></div>
                            </div>-->
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <a href="mycard.jsp"><input type="button" style="border:2px none; width: 100%;" value="我的卡片 &nbsp;>"></a>
                             <!--Sale badge
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>-->
                            <!-- Product image
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />-->
                            <!-- Product details
                            <div class="card-body p-4">
                                <div class="text-center">-->
                                    <!-- Product name
                                    <h5 class="fw-bolder">Special Item</h5>-->
                                    <!-- Product reviews
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div>-->
                                    <!-- Product price
                                    <span class="text-muted text-decoration-line-through">$20.00</span>
                                    $18.00
                                </div>
                            </div>-->
                            <!-- Product actions
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a></div>
                            </div>-->
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <a href="question.html"><input type="button" style="border:2px none; width: 100%;" value="常見問題 &nbsp;>"></a>
                            <!-- Sale badge
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>-->
                            <!-- Product image
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />-->
                            <!-- Product details
                            <div class="card-body p-4">
                                <div class="text-center">-->
                                    <!-- Product name
                                    <h5 class="fw-bolder">Sale Item</h5>-->
                                    <!-- Product price
                                    <span class="text-muted text-decoration-line-through">$50.00</span>
                                    $25.00
                                </div>
                            </div>-->
                            <!-- Product actions
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a></div>
                            </div>-->
                        </div>
                    </div>
                    <div class="col mb-5">
                        <!--<div class="card h-100">-->
                            <a href="contactus.html"><input type="button" style="border:2px none; width: 100%;" value="聯絡我們 &nbsp;>"></a>
                             <!--Product image
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />-->
                            <!-- Product details
                            <div class="card-body p-4">
                                <div class="text-center">-->
                                    <!-- Product name
                                    <h5 class="fw-bolder">Popular Item</h5>-->
                                    <!-- Product reviews
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div>-->
                                    <!-- Product price
                                    $40.00
                                </div>
                            </div>-->
                            <!-- Product actions
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a></div>
                            </div>
                        </div>-->
                    </div>
                   
                         <!--<div class="card h-100">
                             Sale badge
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>-->
                            <!-- Product image
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />-->
                            <!-- Product details
                            <div class="card-body p-4">
                                <div class="text-center">-->
                                    <!-- Product name
                                    <h5 class="fw-bolder">Sale Item</h5>-->
                                    <!-- Product price
                                    <span class="text-muted text-decoration-line-through">$50.00</span>
                                    $25.00
                                </div>
                            </div>-->
                            <!-- Product actions
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a></div>
                            </div>
                        </div>
                    </div>-->
                    <!--<div class="col mb-5">
                        <div class="card h-100">
                             Product image
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />-->
                            <!-- Product details
                            <div class="card-body p-4">
                                <div class="text-center">-->
                                    <!-- Product name
                                    <h5 class="fw-bolder">Fancy Product</h5>-->
                                    <!-- Product price
                                    $120.00 - $280.00
                                </div>
                            </div>-->
                            <!-- Product actions
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">View options</a></div>
                            </div>
                        </div>
                    </div>-->
                     <!--<div class="col mb-5">
                        <div class="card h-100">
                            Sale badge
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>-->
                            <!-- Product image
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />-->
                            <!-- Product details
                            <div class="card-body p-4">
                                <div class="text-center">-->
                                    <!-- Product name
                                    <h5 class="fw-bolder">Special Item</h5>-->
                                    <!-- Product reviews
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div>-->
                                    <!-- Product price
                                    <span class="text-muted text-decoration-line-through">$20.00</span>
                                    $18.00
                                </div>
                            </div>-->
                            <!-- Product actions
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a></div>
                            </div>
                        </div>
                    </div>-->
                    <!--<div class="col mb-5">
                        <div class="card h-100">
                             Product image
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />-->
                            <!-- Product details
                            <div class="card-body p-4">
                                <div class="text-center">-->
                                    <!-- Product name
                                    <h5 class="fw-bolder">Popular Item</h5>-->
                                    <!-- Product reviews
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div>-->
                                    <!-- Product price
                                    $40.00
                                </div>
                            </div>-->
                            <!-- Product actions
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>-->
        </section>
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2022</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>
