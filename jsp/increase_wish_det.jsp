<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8" %>
<%@page import="java.sql.*" %>
 <%@ page import = "java.io.*"%>
<%@include file="config.jsp" %>

<%

request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");  
        if(con.isClosed())
           out.println("連線建立失敗");
        else {
//Step 3: 選擇資料庫   
           sql="use question";
           con.createStatement().execute(sql);
		   String name=request.getParameter("name");
		   String deposit=request.getParameter("deposit");
		   String target=request.getParameter("target");
        
		

//Step 4: 執行 SQL 指令	
try{
   String sql1 = "SELECT * FROM `wish` WHERE`name`='" +name+ "'"  ; 
      ResultSet rs =con.createStatement().executeQuery(sql1);
      if(rs.next())
     { 
       out.print("<script>alert(decodeURIComponent('此願望已存在'));location.href='../jsp/increase_wish.jsp'</script>");
   
     }
      else
     {
      sql="INSERT INTO `wish`(`name`,`deposit`,`target`) values('"+name+"','"+deposit+"','"+target+"')";
    con.createStatement().execute(sql);
   out.print("<script>alert(decodeURIComponent('新增成功'));location.href='../jsp/wish.jsp'</script>");
     }
   }
//Step 6: 關閉連線
           catch(SQLException sExec)
		   {
			response.sendRedirect("../html/register.html");
		   }
       }
    
%>