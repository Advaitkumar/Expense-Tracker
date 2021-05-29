<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ page import="register.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Plan updating</title>
</head>
<body>
<%
String plan=request.getParameter("plan");
String amount=request.getParameter("hno");
String period=request.getParameter("per");
String date1=request.getParameter("myDate");
String date2=request.getParameter("endd");
String username=(String)session.getAttribute("User");
signin on=new signin();
%>
</body>
<script>
var a='<%= on.plnupdate(plan,amount,period,date1,date2,username) %>';
if(a==1)
	{
	alert("success");
	window.location="acdetail.jsp";
	}
else
	{
	alert("error");
	window.location="acdetail.jsp";
	}

</script>
</html>