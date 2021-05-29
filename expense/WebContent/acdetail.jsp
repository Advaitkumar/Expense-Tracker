 <%@ page import="getdetails.*" %>
 <%@ page import="java.util.*" %>
 <%@ page import="register.*" %>
<!DOCTYPE html>
<html>
<head>
  <script>
        history.forward();
</script> 
<link rel="stylesheet" type="text/css" href="acdetail.css">
<title>Account detail page</title>
</head>
<body onload="myFunction()">
<div class="header">
  <a href="acdetail.jsp" class="logo">DailyExpenseTracker.com</a>
  <div class="header-right">
    <a href="login.jsp" style="float:right">Logout</a>
     <a href="main.jsp" style="float:right">Main page</a>    
     <div class="dropdown"style="float:right">
    <button class="dropbtn">Contact</button>
    <div class="dropdown-content">
      <a href="#" onclick="alert('9751579978')">Phone number</a>
      <a href="#" onclick="alert('advaitjayanth@gmail.com')">Email</a>
    </div>
    </div> 
   </div>
  <div class="pupdate" style="float:right;" >
          <a href="report.jsp">Report</a>
  </div>
   <a href="#" style="float:right;" >Welcome,<span id="nm"></span></a>
</div> 
<div class="box">
 <h1>Account details</h1>
 <div  class="form">
  <form id="retype" method="post" name="f2">
    <table  border="1">
      <tr>
         <th>Name</th>
         <td><INPUT TYPE="TEXT" NAME="hname" id="hname" value=""  maxlength="15" required="required"  oninput="this.setCustomValidity('')" disabled></td>
         <th>Country</th>
         <td><select id="country" name="country"  class="required" oninput="this.setCustomValidity('')" disabled>
         <option value="india">India</option>
         <option value="South Africa">South Africa</option>
         <option value="SriLanka">SriLanka</option>
    </select>
    </td>
       </tr>
       <tr>
         <th>Phone number</th>
         <td><input id="phone" maxlength="10" name="phone" type="tel" value=""  required="required"  oninput="this.setCustomValidity('')" disabled></td>
         <th>UserName(Email-id)</th>
         <td><INPUT TYPE="email" NAME="email" id="email" SIZE="20" value=""  maxlength="20" readonly onkeydown="test()" disabled></td>
       </tr>
       <tr id="re" >
         <td>Password</td>
         <td><INPUT TYPE="password" NAME="password" id="password" value=""  maxlength="8" onkeydown="ctab('password'); this.onkeydown=null;" required="required" oninput="this.setCustomValidity('')"  disabled></td>
       </tr>
        </table>
        <div id="check" style="margin-left:-510px;display:none;">             
       <input type="checkbox"  onclick="func1()">Show Password
    </div>
    <input type="submit" value="save" id="ch" style="display:none;" onclick="check()">
 </form>
 <div id="sub">
 <input type="submit" id="edit" value="Edit" onclick="edit(); this.onclick=null;">
 <input type="submit" value="Delete Account?" id="da">
 </div>
 
 </div>
</div>
<div class="pno" id="pno" style="display:none;" >
    <h1>Plan details</h1>
       <div class="form">
           <form >
              <table border="1">
                 <tr>
                    <td>
                      Plan opted:
                    </td>
                    <th>Status</th>
                    <td>
                     <INPUT TYPE="TEXT" NAME="hname" id="hname" value="NO"   maxlength="15" required="required" oninput="this.setCustomValidity('')" disabled>
                    </td>
                    <td>
                     <p><a href="onboard.jsp"> Click here</a> to opt.</p>
                    </td>
                 </tr>
              </table>
           </form>
       </div>
</div>
<div class="pyes" id="pyes" style="display:none;">
    <h1>Plan details</h1>
       <div class="form" >
           <form name="f3">
              <table border="1">
                 <tr>
                    <td>
                      Plan opted:
                    </td>
                    <th>Status</th>
                    <td>
                     <INPUT TYPE="TEXT" NAME="hname" id="hname" value="YES" maxlength="15" required="required" oninput="this.setCustomValidity('')" disabled>
                    </td>
                 </tr>
                 <tr>
                   <td>
                     Plan Name:
                   </td>
                     <td>
                    <select  id="plan" name="plan" class="required" oninput="this.setCustomValidity('')" disabled>
                     <option value="Budget">Budget</option>
                     <option value="Target">Target</option>
                    </select>
                    </td>
                    </tr>
                    <tr>
                    <th >Amount </th>
                    <TD><INPUT TYPE="text" NAME="hno" style="text-align:center;" id="hno" value="10000" maxlength="8" required="required" oninput="this.setCustomValidity('')" disabled> </TD>
                   </tr>
                   <tr>
                    <th><label for="cars" style="float:left;">Period:</label></th>
                    <td>
                      <select  id="per" name="per" class="required" onchange="func2()" oninput="this.setCustomValidity('')" disabled>
                           <option value="30days">1 month</option>
                           <option value="60days">2 month</option>
                           <option value="365days">1 year</option>
                      </select>
                     </td>
                   </tr>
                  <tr>
              <th>Start date</th>
             <td><input style="text-align:center;" type="date" id="myDate" name="myDate" onclick="res(); this.onclick=null;" value="2021-04-03"   disabled></td>
            </tr>
          <tr >
             <th>End date</th>
             <td> <input  style="text-align:center;"type="text" id="endd" name="endd" value="03/05/2021" readonly></td>
          </tr>
             </table>
              <input type="submit" value="save" id="ch2" style="display:none; float:left;" onclick="check2()">
           </form>
           <div id="su">
             <input type="submit" id="edit2" value="Edit" onclick="edit2(); this.onclick=null;">
              <input type="submit" value="Delete Plan" id="dp">
            </div>
                 
 </div>
</div>
<%
details bo=new details();
String s=(String)session.getAttribute("User");
List<String> strList=new ArrayList<>();
strList=bo.userdetails(s);
List<String> planList=new ArrayList<>();
planList=bo.fulldetails(s);
signin obj=new signin();
%>
</body>
<script>
document.getElementById("da").onclick=function dela()
{
	 if(confirm('All past track records will be deleted,are you sure?'))
	 window.location="delacc.jsp";
	 else
		 alert("You have cancelled the delete request!");
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
  

function res(){
	alert("Date can be changed from today!!!");
	}
function myFunction() {
	var detarr=[<% for (int i = 0; i < strList.size(); i++) { %>"<%= strList.get(i) %>"<%= i + 1 < strList.size() ? ",":"" %><% } %>];
    var w= detarr[0];
    document.getElementById("nm").innerHTML=w; 
    var board='<%= bo.checkupd(s) %>';
    document.getElementById("hname").setAttribute('value',detarr[0]);
	 document.getElementById("country").value=detarr[1];
	 document.getElementById("phone").setAttribute('value',detarr[2]);
	 document.getElementById("email").setAttribute('value',detarr[3]);
	 document.getElementById("password").setAttribute('value',detarr[4]);
    if(board==1)
    	{
    	 document.getElementById("pno").style.display="none";
    	 document.getElementById("pyes").style.display="block";
    	 var parr=[<% for (int i = 0; i < planList.size(); i++) { %>"<%= planList.get(i)  %>"<%= i + 1 < planList.size() ? ",":"" %><% } %>];
    	 document.getElementById("plan").value=parr[0];
    	 document.getElementById("hno").setAttribute('value',parr[1]);
    	 document.getElementById("per").value=parr[2];
    	 document.getElementById("myDate").setAttribute('value',parr[3]);
         document.getElementById("endd").setAttribute('value',parr[4]);
         document.getElementById("dp").onclick=function delp()
         {
        	 if(confirm('All past track records will be deleted,are you sure?'))
        	 window.location="delplan.jsp";
        	 else
        		 alert("You have cancelled the delete request!");
         }
        }
    else
    	{
    	document.getElementById("pno").style.display="block";
   	    document.getElementById("pyes").style.display="none";
    	}
}


function test()
{
	alert("Cannot change username ,contact admin");
	}
var ch=0;
function check()
{
	var hna=document.f2.hname.value;
	var hcount=hna.length;
	var hn=document.querySelector("#hname");
	var nam=/^[a-zA-Z\s]+$/;
	var n=hna.match(nam);
	 var e=document.f2.email.value;
	var em=document.querySelector("#email");
	var b= /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
	var c=e.match(b);
	var tel=document.f2.phone.value;
	var ph=document.querySelector("#phone");
	var pho= /^\d{10}$/;
	var k=tel.match(pho);
	var spas=document.f2.password.value;
     var sp=document.querySelector("#password");
     var d= /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,20}$/;
 	var pr=spas.match(d);
 	if(count==1)
		{
		var pas=document.f2.repass.value;
    var ps=document.querySelector("#repass");
    }
       if(hcount<4)
	        	hn.setCustomValidity("Yourname should be atleast 5 letters");
	  else if(!pr)
    	 sp.setCustomValidity("Must contain at least one number and one uppercase and lowercase letter, and atmost 8 characters");
	  else if(!n)
      	hn.setCustomValidity("Your Name should consists only letters!!!");
       else if(!k||tel==0)
          	  ph.setCustomValidity("Enter  valid mobile number,contains only numbers upto 10 digits)");
         else if(tel<10)
       	  ph.setCustomValidity("Mobile number should have 10 numbers");
        else if(!tel)
          	  ph.setCustomValidity("Enter mobile number");
       	 else if(!hna)
            	hn.setCustomValidity("Enter Your  Name");
       	else if(!spas)
            sp.setCustomValidity("enter password!!");
        else if(!pas && count==1)
            ps.setCustomValidity("enter password!!");
        else if(spas !=pas  && count==1)
     	   ps.setCustomValidity("password didn't match");
         else
        	 {
        	f2.setAttribute('action',"detupdate.jsp");
        	 }
}
function func1(){
	var x=document.getElementById("password");
	  var y=document.getElementById("repass");
	  if(x.type==="password" || y.type==="password")
		{
		  x.type="text";
         y.type="text";
		}
	  else
		{
		  x.type="password";
		  y.type="password";
       }
}
var count=0;
var od=document.getElementById('password').onkeypress;
function ctab(type) {
   	  var textnode = document.createTextNode("Retype password");  
	  var y = document.createElement("INPUT");
	  y.setAttribute("type", type);
	  y.setAttribute('id','repass');
	  y.oninput=function()
	  {
		repass.setCustomValidity('');  
	  };
	  var td = document.createElement('TD');
	  td.appendChild(textnode);
	  document.getElementById("re").appendChild(td);
	  var ye=document.createElement('TD');
	  ye.appendChild(y);
	  document.getElementById("re").appendChild(ye);
	  count=1;
	  document.getElementById("check").style.display="block";
    }
function edit(){
    document.getElementById('phone').removeAttribute('disabled');
    document.getElementById('email').removeAttribute('disabled');
    document.getElementById('country').removeAttribute('disabled');
    document.getElementById('hname').removeAttribute('disabled');
    document.getElementById('password').removeAttribute('disabled');
    var old=document.getElementById('edit').onclick;
    document.getElementById('ch').style.display="block";
  }
function edit2()
{
	document.getElementById('plan').removeAttribute('disabled');
	 document.getElementById('hno').removeAttribute('disabled');
    document.getElementById('per').removeAttribute('disabled');
    document.getElementById('myDate').removeAttribute('disabled');
   var old=document.getElementById('edit2').onclick;
   document.getElementById('ch2').style.display="block";
}
 function check2()
 {
	  var hno=document.f3.hno.value;
	    var hnu=document.querySelector("#hno");
	    var hono=/^[0-9/]*$/;
	    var h=hno.match(hono);
	    if(!hno)
	        hnu.setCustomValidity("Set Target");
	    else if(!h||hno==0||hno<1000)
	   	 hnu.setCustomValidity("Target includes numbers only and not 0 and greater than 1000"); 
	    else
	    	{
	    	f3.setAttribute('action',"planupd.jsp");
	    	}
 }
 function func2(){
	   var k = document.getElementById("myDate").value;
	     var str=k.toString();
	     var y=new Date(str);
	      var per=document.getElementById("per");
	      if(per.selectedIndex == 0)
	    	{
	    	  var t= y.addDays(30);
	    	}
	    
	      if(per.selectedIndex == 1)
	    	{
	    	  var t= y.addDays(60);
	    	}
	        
	      if(per.selectedIndex ==2)
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
 var x = document.getElementById("myDate");
 x.onchange = function(){
	 document.getElementById("myDate").setAttribute("min",today);
		document.getElementById("myDate").setAttribute("max",mday);
     var k = document.getElementById("myDate").value;
    var str=k.toString();
    var y=new Date(str);
    var per=document.getElementById("per");
     if(per.selectedIndex == 0)
   	{
   	  var t= y.addDays(30);
   	}
   
     if(per.selectedIndex == 1)
   	{
   	  var t= y.addDays(60);
   	}
       
     if(per.selectedIndex ==2)
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
 
</script>
<script>

</script>
</html>