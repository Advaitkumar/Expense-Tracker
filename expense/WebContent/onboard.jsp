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
    
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="onboard.css">
</head>
<body onload="myFunction()" >
<div class="header">
  <a href="onboard.jsp" class="logo">DailyExpenseTracker.com</a>
  <div class="header-right">
    <a href="login.jsp" style="float:right" >Logout</a>
    <div class="dropdown"style="float:right">
    <button class="dropbtn">Contact</button>
    <div class="dropdown-content">
      <a href="#" onclick="alert('9751579978')">Phone number</a>
      <a href="#" onclick="alert('advaitjayanth@gmail.com')">Email</a>
     </div>
   </div> 
   <a href="acdetail.jsp" style="float:right">Account details</a>
   <a href="main.jsp" style="float:right">Main page</a>
  </div>
  <div class="pupdate" style="float:right; display:none;" >
          <a href="#">Report</a>
     </div>
 <a href="#" style="float:right;" >Welcome,<span id="nm" ></span></a>
</div>
<div class="box">
 <h1>Boarding Plan to Calculate Expense</h1>
 <div class="form">
 <form  method="post" name="f2">
     <table border="1">
    <tr>
   <td>
   <label for="bl">Budget Plan</label>
   </td>
  <td>
   <input type="radio" id="bl" name="bal" value="Budget" required="required" oninput="this.setCustomValidity('')">
  </td>
  <td>
 <label for="ab">Target Plan</label>
  </td>
  <td>
  <input type="radio" id="ab" name="bal" value="Target" required="required" oninput="this.setCustomValidity('')">
     </td>
   </tr>
    <tr>
      <th style="float:left;">Enter Amount </th>
      <TD><INPUT TYPE="text" NAME="hno" id="hno"  SIZE="10" maxlength="8" required="required" oninput="this.setCustomValidity('')"> </TD>
    <th><label for="cars" style="float:left;">Period:</label></th>
   <td>
    <select  id="per" name="per" class="required" onchange="func2()" oninput="this.setCustomValidity('')">
    <option value="clear">Select an option</option>
    <option value="30days">1 month</option>
    <option value="60days">2 month</option>
    <option value="365days">1 year</option>
  </select>
   </td>
   </tr>
   <tr>
     <th>Start date</th>
     <td><input type="date" id="myDate" name="myDate" required></td>
     <th>End date</th>
     <td> <input type="text" id="endd" name="endd" required readonly></td>
   </tr>
   </table>
   <div class="but">
     <input type="button" value="Skip" onclick="location.href='main.jsp';">
     <input type="reset" value="clear">
     <input type="submit" value="Let's track" onclick="val()">
     </div>
   </form>
   </div>
</div>
<%
signin obj=new signin();
String us=(String)session.getAttribute("User");
%>
<script>
function myFunction() {
	var w='<%= obj.getname(us) %>';
    document.getElementById("nm").innerHTML=w;
	}

Date.prototype.addDays = function(days) {
    var date = new Date(this.valueOf());
    date.setDate(date.getDate() + days);
    return date;
}
var today = new Date();
  var dd = today.getDate();
  var mm= today.getMonth()+1;
  var y=today.getFullYear();
   var per=document.getElementById("per");
  if(dd<10)
    dd='0'+dd;
  if(mm<10)
    mm='0'+mm;
  today=y+'-'+mm+'-'+dd;
  mday=y+1+'-'+mm+'-'+dd;
  document.getElementById("myDate").setAttribute("min",today);
  document.getElementById("myDate").setAttribute("max",mday);

  var x = document.getElementById("myDate");
  x.valueAsDate = new Date();
  
  function func2(){
   var k = document.getElementById("myDate").value;
     var str=k.toString();
     var y=new Date(str);
      var per=document.getElementById("per");
      if(per.selectedIndex == 1)
    	{
    	  var t= y.addDays(30);
    	}
    
      if(per.selectedIndex == 2)
    	{
    	  var t= y.addDays(60);
    	}
        
      if(per.selectedIndex ==3)
    	{
    	  var t= y.addDays(365);
    	}
     var d=t.getDate();
     var m=t.getMonth()+1;
     if(d<10)
     {
       d='0'+d;
     }
     if(m<10)
     {
      m='0'+m;
     }
   document.getElementById("endd").value =d+'/'+m+'/'+t.getFullYear();
 x.onchange = function(){
	  var k = document.getElementById("myDate").value;
     var str=k.toString();
     var y=new Date(str);
     var per=document.getElementById("per");
      if(per.selectedIndex == 1)
    	{
    	  var t= y.addDays(30);
    	}
    
      if(per.selectedIndex == 2)
    	{
    	  var t= y.addDays(60);
    	}
        
      if(per.selectedIndex ==3)
    	{
    	  var t= y.addDays(365);
    	}
        var d=t.getDate();
     var m=t.getMonth()+1;
     if(d<10)
     {
       d='0'+d;
     }
     if(m<10)
     {
      m='0'+m;
     }
   document.getElementById("endd").value =d+'/'+m+'/'+t.getFullYear();
   
   }
   }
   

function val(){
    var hno=document.f2.hno.value;
    var hnu=document.querySelector("#hno");
    var hono=/^[0-9/]*$/;
    var h=hno.match(hono);
    var per=document.getElementById("per");
    if(!hno)
        hnu.setCustomValidity("Set Target");
    else if(!h||hno==0||hno<1000)
   	 hnu.setCustomValidity("Target includes numbers only and not 0 and greater than 1000"); 
    else if(per.selectedIndex == 0)
    	{
    	  per.setCustomValidity("Please Select Period");
    	}
    else
    	{
    	 f2.setAttribute('action',"ontake.jsp" );
    	}
}
</script>
   
</body>
</html> 
