<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
       <%@ page import="expense.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Updating</title>
</head>
<body>
<%
String sec=request.getParameter("pk");
String ct=request.getParameter("cost");
String name=request.getParameter("pname");
String username=(String)session.getAttribute("User");
mains wer=new mains();
%>
<script>
 var sd='<%= wer.updmain(username, name, sec, ct)  %>';
 if(sd==1)
	 {
	 window.location="main.jsp";
	 }
 else
	 {
	 alert("You can");
	 window.location="main.jsp";
	 }
</script>
</body>
</html>