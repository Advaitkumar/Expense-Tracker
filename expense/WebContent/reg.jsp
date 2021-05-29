<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="register.*" %>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registering</title>
</head>
<body>
<%
String name=request.getParameter("hname");
String country=request.getParameter("country");
String pno=request.getParameter("phone");
String username=request.getParameter("email");
String password=request.getParameter("password");
signin obj=new signin();
%>

</body>
<script >
var a='<%= obj.store(name,country,pno,username,password) %>';
var b='<%=  request.getParameter("hname") %>';
if(a==0)
{
	window.alert("Username already exits!!!!");
	window.location="sign.jsp";
}
else if(a==1)
{
	
  window.alert("Successfully logged in," +b);
  window.location="login.jsp";
}
else
{
	window.alert("Error occured!!!");
	window.location="sign.jsp";
}

</script>
</html>