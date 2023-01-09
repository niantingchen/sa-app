<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@ page import = "java.io.*"%>
<%@include file="config.jsp" %>
<html>
<head>
<title>addtocart</title>
</head>
<body>

		
	<%
                
	String point= request.getParameter("point");//庫存
	
  %>
	<%
	
	if(session.getAttribute("access")==null)//沒有登入
	{
	%>
	<script type="text/javascript" language="javascript">
	alert("請先登入！");
	window.document.location.href="login.jsp";
	</script>
	<%
	}
	else{
                        
	con.createStatement().execute("use question");
	sql = "SELECT * FROM voucher` WHERE `voucherID`='"+voucherp+"'";
	ResultSet rs =  con.createStatement().executeQuery(sql); 
	rs.next();	
	sql = "insert into 
	sql+="values ('"+tmp.getString(2)+"', ";  
	sql+="'" +rs.getString(3)+ "') ;";         
	Boolean rs = con.createStatement().execute(sql);
	if(rs==true)
	{
		out.print("兌換失敗");
	}
	else
	{			
		out.println("<script>alert('兌換成功');location.href='productall.jsp'</script>");            
	}
		con.close();//關閉連線
	
	}
%>
  
</body>
</html>