
<%
session.removeAttribute("memberid");
session.removeAttribute("name");
session.removeAttribute("password");
response.sendRedirect("../html/login.html") ;
%>