<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="getdetails.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Deleting Account</title>
</head>
<body>
<%
String s=(String)session.getAttribute("User");
details se=new details();
%>
<script>
var ad='<%= se.deleteacc(s) %>';
if(ad==1)
	{
	  alert("all deleted");
	  window.location="welcome.html";
	}
</script>

</body>
</html>