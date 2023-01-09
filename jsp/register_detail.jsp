<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8" %>
<%@page import="java.sql.*" %>
 <%@ page import = "java.io.*"%>
<%@include file="config.jsp" %>
<%
try{       
     connectMyQL();
//Step 3: 選擇資料庫   
           String sql="use question";
           con.createStatement().execute(sql);
           
		   String Email=request.getParameter("memberAc");
		   String Name=request.getParameter("name");
		   String Password=request.getParameter("memberPw");
		   String phone=request.getParameter("phone");

//Step 4: 執行 SQL 指令	

		   
			   String sql1 = "SELECT * FROM `member` WHERE`memberAc`='" +Email+ "'"  ; 
               ResultSet rs =con.createStatement().executeQuery(sql1);
               if(rs.next()){ 
                     out.print("<script>alert(decodeURIComponent('註冊失敗！帳號已存在'));location.href='../html/register.html'</script>");
				     if(request.getParameter("Password") != request.getParameter("Password_1")){
					     out.print("<script>alert(decodeURIComponent('密碼兩次輸入不相符'));location.href='../html/register.html'</script>");
				    }
	           }else{
			         sql="INSERT INTO `member`(`memberAc`,`name`,`memberPw`,`phone`) values('"+Email+"','"+Name+"','"+Password+"','"+phone+"')";
		             con.createStatement().execute(sql);
			        out.print("<script>location.href='../jsp/card.jsp'</script>");
	           }
		      
		       
		   
//Step 6: 關閉連線
			}catch(SQLException sExec){
			response.sendRedirect("../jsp/index.jsp");
		   }
       
    closeMySQL();
%>