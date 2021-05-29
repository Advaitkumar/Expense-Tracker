<%@ page import="report.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="report.css">
<title>Daily expense Tracker</title>
<script type="text/javascript">
history.forward();
</script>
</head>
<body onload="myFunction()">
<div class="header">
  <a href="main.jsp" class="logo">DailyExpenseTracker.com</a>
  <div class="header-right">
    <a href="login.jsp" style="float:right">Logout</a>
    <div class="dropdown"style="float:right">
    <button class="dropbtn">Contact</button>
    <div class="dropdown-content">
      <a href="#" onclick="alert('9751579978')">Phone number</a>
      <a href="#" onclick="alert('advaitjayanth@gmail.com')">Email</a>
      </div>
   </div> 
   <a href="acdetail.jsp" style="float:right">Account details</a>
  </div>
  <div class="pupdate" style="float:right;" >
          <a href="main.jsp">Main page</a>
  </div>
   <a href="#" style="float:right;" >Welcome,<span id="nm"></span></a>
</div>
<div class="box">
<h1>Report with statistics</h1>
<table border="1">
       <tr>
       <th>Highest Expenditure Date</th>
       <td><input type="text" value="06/05/2021" id="myDate" disabled></td>   
       </tr>
       <tr>
       <th>Highest Expense Total</th>
       <td><input type="text" value="Rs.46" id="total" disabled></td>
       </tr>
       <tr>
       <th>Highest Expense in a Particular Sector</th>
       <td><input type="text" value="Milk" id="food" disabled></td>
       </tr>
       <tr>
       <th>Frequently Purchased Product</th>
       <td><input type="text" value="Milk" id="freq" disabled></td>
       </tr>
</table>
</div>
<%
String s=(String)session.getAttribute("User");
report nu=new report();
%>
</body>
<script>
function myFunction() {
    var w='<%= session.getAttribute("name") %>';
    document.getElementById("nm").innerHTML=w; 
    var de='<%= nu.hitot(s)  %>';
    if(de== "null")
    	{
    	 document.getElementById("total").value="Rs.0";
    	}
    else
    	{
    document.getElementById("total").value="Rs."+de;
    	}
    var dr='<%= nu.hidate(s)  %>';
    if(dr=="No data")
    	dt=dr;
    else
    	{
    var sp=dr.split('-');
    var dt=sp[2]+'/'+sp[1]+'/'+sp[0];
    	}
    document.getElementById("myDate").value=dt;
    var re='<%= nu.hisec(s)  %>';
    document.getElementById("food").value=re;
    var fr='<%= nu.freq(s)  %>';
    document.getElementById("freq").value=fr;
}
</script>
</html>