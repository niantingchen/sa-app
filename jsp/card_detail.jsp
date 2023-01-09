<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<%
        connectMyQL();
//Step 3: 選擇資料庫   
           String sql="use question";
           con.createStatement().execute(sql);
           
		   String Email=request.getParameter("cardid");
		   String name=request.getParameter("cardnum");
		   String Password=request.getParameter("carddate");
		   //String phone=request.getParameter("phone");
		   String mail=(String)session.getAttribute("Email");

//Step 4: 執行 SQL 指令	
 try
		   {
			   String sql1 = "SELECT * FROM `member_card` WHERE`cardid`='" +Email+ "'"  ; 
			   sql="select * from `member`, `member_card` where `memberAc`='" + mail + "' AND member.memberAc = member_card.memberAc";
               ResultSet rs =con.createStatement().executeQuery(sql1);
               if(rs.next())
	           { 
                out.print("<script>alert(decodeURIComponent('註冊失敗！卡片已存在'));location.href='../jsp/card.jsp'</script>");
				if(request.getParameter("Password") != request.getParameter("Password_1"))
				{
					out.print("<script>alert(decodeURIComponent('密碼兩次輸入不相符'));location.href='../jsp/card.jsp'</script>");
				}
	           }
               else
	           {
			   sql="INSERT INTO `member_card`(`cardid`,`cardnum`,`carddate`) values('"+Email+"','"+name+"','"+Password+"')";
		       con.createStatement().execute(sql);
			   sql="UPDATE `member_card` INNER JOIN `member` ON `member_card`.`id`=`member`.`memberAc` SET `member_card`.`memberAc`=`member`.`memberAc`";
			   con.createStatement().execute(sql);
			   out.print("<script>alert(decodeURIComponent('註冊成功,請再登入一次'));location.href='../html/login.html'</script>");
	           //response.sendRedirect("login.html");
	           }
		      
		       
		   }
//Step 6: 關閉連線
           catch(SQLException sExec)
		   {
			response.sendRedirect("../jsp/index.jsp");
		   }
       closeMySQL();
    
%>