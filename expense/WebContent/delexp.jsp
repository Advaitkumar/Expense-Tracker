<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="expense.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>check</title>
</head>
<body>
<%
String sad=request.getParameter("sd");
String username=(String)session.getAttribute("User");
mains sde=new mains();
%>
<script>
var ch='<%= sde.deletemain(sad,username)%>';
if(ch==1)
	{
	window.location="main.jsp";
	}
else
	{
	alert("error");
	window.location="main.jsp";
	}
</script>
</body>
</html>