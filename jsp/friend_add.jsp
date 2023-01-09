<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8" %>
<%@page import="java.sql.*" %>
 <%@ page import = "java.io.*"%>
<%@include file="config.jsp" %>
<%
        if(con.isClosed())
           out.println("連線建立失敗");
        else {
//Step 3: 選擇資料庫   
           sql="use question";
           con.createStatement().execute(sql);
		   String friends=request.getParameter("friends");
	
		  
		

//Step 4: 執行 SQL 指令	
 try
		   {
            String sql1 = "SELECT * FROM `member` WHERE`friends`='" +friends+ "'"  ; 
            ResultSet rs =con.createStatement().executeQuery(sql1);
            if(rs.next())
            { 
                sql="INSERT INTO `member`(`friends`) values('"+friends+"')";
                con.createStatement().execute(sql);
                out.print("<script>alert('加入好友成功 !');location.href='../jsp/friends.jsp'</script>");
            
            
            }
            else
            {
	            out.print("<script>alert(decodeURIComponent('好友已存在'));location.href='../jsp/friends.jsp'</script>");
			 
            }
		            
        }
//Step 6: 關閉連線
           catch(SQLException sExec)
		   {
			response.sendRedirect("../html/increase-wish.html");
		   }
       }
    
%>