<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>

<%
request.setCharacterEncoding("UTF-8");
             response.setCharacterEncoding("UTF-8");
if(request.getParameter("memberAc") !=null && !request.getParameter("memberAc").equals("")){
//&& request.getParameter("memberPw") !=null && !request.getParameter("memberPw").equals("")

//sql = "SELECT * FROM `member` WHERE `Email`='"+request.getParameter("Email") + 
//"' AND `Password`='"+request.getParameter("Password")+"'" ;
String sql = "SELECT * FROM `member` WHERE `memberAc`= ? ";        //AND `memberPw`=?
PreparedStatement pstmt = null;
connectMyQL();
pstmt=con.prepareStatement(sql);
pstmt.setString(1,request.getParameter("memberAc"));
//pstmt.setString(2,request.getParameter("memberPw"));



ResultSet rs =pstmt.executeQuery();
		
		if(rs.next()){
			session.setAttribute("memberAc",request.getParameter("memberAc"));
			session.setAttribute("access","y");
			session.setAttribute("memberId",rs.getString("memberId"));
			con.close();
			out.print("<script>alert('登入成功 !'); location.href='../index.jsp'</script>");
		}
		else{
			con.close();
			out.print("<script>alert('帳號或密碼不符 !');location.href='../html/login.html'</script>");
		}
	}
	
closeMySQL();
%>