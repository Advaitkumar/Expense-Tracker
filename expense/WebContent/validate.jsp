<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="register.*" %>
    <%@ page import="getdetails.*" %>
<!DOCTYPE html>
<html>
<head>
<script>
        history.forward();
</script>

<meta charset="ISO-8859-1">
<title>Validation</title>
</head>
<body>
<%
String user=request.getParameter("username");
String pass=request.getParameter("password");
session.setAttribute("User",user);
signin obj=new signin();
session.setAttribute("name",obj.getname(user));
details bo=new details();
%>
<script >
var a='<%= obj.validate(user,pass)%>';
	if(a==1)
		{
		 window.alert("Login succesful");
		 var board='<%= bo.checkupd(user) %>';
			if(board==1)
				{
				window.location="main.jsp";
				}
			else
		        window.location="onboard.jsp";
		}
	else if(a==2)
		{
		window.alert("Password and Username mismatches");
		window.location="login.jsp";
		}
	else if(a==4)
		{

		window.alert("Username does not exists!!!!");
		window.location="sign.jsp";
		}
	else
		{
		window.alert("Error Occured");
        window.location="login.jsp";
		}
</script>

</body>
</html>