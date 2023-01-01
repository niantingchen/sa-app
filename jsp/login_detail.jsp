<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<%
if(request.getParameter("memberid").equals("manager@123") && request.getParameter("password").equals("12345678"))
{
	out.print("<script>alert('後台登入成功 !');location.href='manage.jsp'</script>");
}
else{
	if(request.getParameter("memberid") !=null && !request.getParameter("memberid").equals("")
		&& request.getParameter("phone") !=null && !request.getParameter("phone").equals("")){
		
		//sql = "SELECT * FROM `member` WHERE `memberid`='"+request.getParameter("memberid") + 
		//"' AND `phone`='"+request.getParameter("phone")+"'" ;
		sql = "SELECT * FROM `member` WHERE `memberid`= ? AND `password`=?";
		PreparedStatement pstmt = null;
		pstmt=con.prepareStatement(sql);
		pstmt.setString(1,request.getParameter("memberid"));
		pstmt.setString(2,request.getParameter("phone"));
		
		
		
		ResultSet rs =pstmt.executeQuery();
		
		if(rs.next()){
			session.setAttribute("memberid",request.getParameter("memberid"));
			session.setAttribute("access","y");
			con.close();
			out.print("<script>alert('登入成功 !');location.href='../index.jsp'</script>");
		}
		else{
			con.close();
			out.print("<script>alert('帳號或密碼不符 !');location.href='../../html/login.html'</script>");
		}
	}
	
}
%>