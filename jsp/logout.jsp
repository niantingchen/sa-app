
<%
session.removeAttribute("memberAc");
session.removeAttribute("name");
session.removeAttribute("memberPw");
response.sendRedirect("../html/login.html") ;
%>