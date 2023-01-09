<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
 <%@ page import = "java.io.*"%>
<%!
Connection con=null;
 boolean connectMyQL(){
  try{
    Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://127.0.0.1:3306/question?serverTimezone=UTC";
con=DriverManager.getConnection(url,"root","12345678");
   return true;
  }catch(Exception ex){
     return false;
  }

    
}
//------------------------------------------------------
 void closeMySQL(){
    try{
      con.close();
    }catch(Exception ex){}
}

%>