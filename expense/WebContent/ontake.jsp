<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="register.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Updating</title>
</head>
<body>
<% 
String plan=request.getParameter("bal");
String amount=request.getParameter("hno");
String period=request.getParameter("per");
String date1=request.getParameter("myDate");
String date2=request.getParameter("endd");
System.out.print(date2);
String username=(String)session.getAttribute("User");
signin on=new signin();
%>
<script>
var ret='<%= on.onboard(plan,amount,period,date1,date2,username) %>';
if(ret==0)
	{
	alert("Already updated");
	window.location="main.jsp;";
	}
if(ret==1)
	{
	alert("successful");
    window.location="main.jsp";
	}
else
	alert("error");

</script>
</body>
</html>