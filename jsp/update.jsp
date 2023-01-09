<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<%@ page import = "java.io.*"%>
<%
connectMyQL();
//Step 3: 選擇資料庫   
          

//Step 4: 執行 SQL 指令	
 try
		   {	
		   String qqq = "SELECT * FROM `member` WHERE`memberPw`='" +request.getParameter("password")+ "'"  ; 
               ResultSet rs =con.createStatement().executeQuery(qqq);
		   if(rs.next())
				{
						if(request.getParameter("password_1") != request.getParameter("password"))
						{
							String sql = "UPDATE member SET `memberPw`='"+request.getParameter("password_1")+"' WHERE `memberAc`='"+session.getAttribute("memberAc")+"'";
							con.createStatement().execute(sql); 

							con.close();
							session.removeAttribute("access");
							session.removeAttribute("memberAc");
							out.print("<script>alert('修改成功 ! 請重新登入 ! ');location.href='../html/login.html'</script>");
							
						}
						else
						{
							
							out.print("<script>alert('新舊密碼不可相同');location.href='../html/information.jsp'</script>");
						}				   
				   
		   } 
               else
	           {
				   out.print("<script>alert(decodeURIComponent('修改失敗！原密碼不相服'));location.href='../html/information.jsp'</script>");
					
				
	           }
		      
		       
		   }
//Step 6: 關閉連線
           catch(SQLException sExec)
		   {
			response.sendRedirect("../jsp/memberall.jsp");
		   }
       
	   closeMySQL();
%>