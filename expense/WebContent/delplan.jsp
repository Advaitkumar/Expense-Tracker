<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="getdetails.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Deleting plan</title>
</head>
<body>
<%
String s=(String)session.getAttribute("User");
details se=new details();
%>
<script>
var ad='<%= se.deleteplan(s) %>';
if(ad==1)
	{
	  alert("all deleted");
	  window.location="acdetail.jsp";
	}
</script>
</body>
</html>