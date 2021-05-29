<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 <%@ page import="expense.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Expense Tracking</title>
</head>
<body>
<% 
String prname=request.getParameter("pname");
String sector=request.getParameter("pk");
String cost=request.getParameter("cost");
String s=(String)session.getAttribute("User");
mains dt=new mains();
%>          
</body>
<script>
var ad='<%= dt.exp(prname, sector, cost, s) %>';
if(ad==1)
	{
	window.location="main.jsp";
	}
else if(ad==0)
	{
	alert("Product already exists!!,try to edit it");
	window.location="main.jsp";
	}
</script>
</html>