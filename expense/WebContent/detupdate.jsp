<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
       <%@ page import="register.*" %>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Updating</title>
</head>
<body>
<%
String name=request.getParameter("hname");
String country=request.getParameter("country");
String phno=request.getParameter("phone");
String s=(String)session.getAttribute("User");
String password=request.getParameter("password");
signin obj=new signin();
%>


</body>
<script type="text/javascript">
  var a='<%= obj.update(name,country,phno,s,password) %>';
  if(a==1)
	  {
	   alert("Success");
	   window.location="acdetail.jsp";
	  }
  else
	  {
	  alert("error");
	  window.location="acdetail.jsp";
	  }
</script>
</html>