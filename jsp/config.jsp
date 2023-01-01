<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
 <%@ page import = "java.io.*"%>
<%
Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://127.0.0.1:3306/question?serverTimezone=UTC";
Connection con=DriverManager.getConnection(url,"root","12345678");
String sql="USE `question`";
con.createStatement().execute(sql);
%>