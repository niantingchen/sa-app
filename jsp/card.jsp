<%@ page import = "java.sql.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>碳制郎</title>
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="../css/login.css" rel="stylesheet" />
        <link rel="icon" type="image/x-icon" href="../img/logo.png" />
        <%
        if(session.getAttribute("memberid")==null)
            out.print("<script>alert('請先登入 !');location.href='../html/login.html'</script>");
        else
            out.println("<a class= 'h' href='../jsp/logout.jsp'>登出</a>");
      
      %>
    </head>
    <body id="page-top">
      
        <!-- Contact Section-->
        <section class="page-section" id="contact">
            <div class="container">
              
                <!-- Contact Section Heading-->
                <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">card</h2>
                <!-- Icon Divider-->
                <div class="divider-custom">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon"><img src="../img/logo.png"></div>
                    <div class="divider-custom-line"></div>
                </div>
                <!-- Contact Section Form-->
                <div class="row justify-content-center">
                    <div class="col-lg-8 col-xl-7">
                        <form action="" id="contactForm" data-sb-form-api-token="API_TOKEN">
                            <!-- Name input-->
                            <div class="form-floating mb-3">
                               
                                <input class="form-control" id="name" type="text"  placeholder="帳號" required />
                                <label for="name">銀行代碼</label>
                         
                            </div>
                            <!-- Email address input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="name" type="text"  placeholder="帳號" required />
                                <label for="email">信用卡號</label>
                               
                            </div>
                  
                            <!-- Phone number input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="phone" type="date" placeholder="xxxx" required />
                                <label for="date">信用卡有效日期</label>
                              
                            </div>
                         
                        <div class="inputBox">
                            <form action="../index.jsp">
                            <input type="submit" value="確認"> 
                            </form>
                        </div>
                            
                        </form>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
