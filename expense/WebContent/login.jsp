<!DOCTYPE html>
<html>
<head>
<script>
        history.forward();
</script>  
 <meta name="viewport" content="width=device-width, initial-scale=1">
 <meta http-equiv="Content-Type" content="jsp; charset=utf-8" />
    <meta http-equiv="cache-control" content="no-cache" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Expires" content="-1" />
<title>Daily Expense Tracker</title>
<link rel="stylesheet" type="text/css" href="login.css">
</head>
<body>
<div class="header">
  <a href="login.jsp" class="logo">DailyExpenseTracker.com</a>
  <div class="header-right">
    <a href="about.html"style="float:right">About</a>
    <div class="dropdown"style="float:right">
    <button class="dropbtn">Contact</button>
    <div class="dropdown-content">
      <a href="#" onclick="alert('9751579978')">Phone number</a>
      <a href="#" onclick="alert('advaitjayanth@gmail.com')">Email</a>
      </div>
   </div> 
  </div>
    <a  href="welcome.html" style="float:right">Home</a>
</div>
<div class="box1">
 <h1> Daily expense Tracker</h1>
 <h2>Description:</h2>
       <p> You are now free from your own expense issues,here comes a Daily Expense Tracker ,to solve your Real time problems.</p>
       <p>Benefits of this tracker system,</p>
    <ol>
       <li>Tracks your expense daily</li>
       <li>User friendly</li>
       <li>Helps to manage your expenses efficiently</li>
       <li>Decrease your expenditure by sector-wise report</li>
    </ol> 
       <p>Sign up for free......</p>
</div>

<div class="box">
  <h1>Login</h1>
  <div class="form">
    <form method="post" name="f1">
     <table border="1">
      <tr>
      <th>UserName(Email-id):</th>
    <TD><INPUT TYPE="email" NAME="username" placeholder="Enter username" id="username" SIZE="20" maxlength="20"required="required" oninput="this.setCustomValidity('')" ></TD>
    </tr>
    <tr>
    <th>Password</th>
    <TD><INPUT TYPE="password" NAME="password" placeholder="Enter password" id="password" SIZE="8" maxlength="8" style="width:100px; float:left;" required="required" oninput="this.setCustomValidity('')"> </TD>
    </tr>
    </table>
    <div class="check">             
       <input type="checkbox"  onclick="func1()">Show Password
    </div>
    <P><INPUT TYPE="submit" VALUE="Login" onclick="val()" > <INPUT TYPE="reset" VALUE="clear" > <input type="button" value="cancel" onclick="location.href='welcome.html';"></P>
  </form>
    <h5 style="text-align:left;">Click here to,<a href="sign.jsp">register.</a></h5>
    <h5 style="text-align:left;"><a href="" onclick="ale()">Forgot password?</a></h5>
  </div>
</div>
</body>
<script type="text/javascript">
function ale()
{
	alert("contact support");
}
function func1(){
	var x=document.getElementById("password");
	if(x.type=="password")
		{
		x.type="text";
		}
	else
		x.type="password";
}
function val()
{
	var us=document.f1.username.value;
	var ps=document.f1.password.value;
	var user=document.querySelector("#username");
	var pass=document.querySelector("#password");
	var pslen=ps.length;
	var a= /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
	var u=us.match(a);
	var b= /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,20}$/;
	var p=ps.match(b);
	if(!us)
		{
	    user.setCustomValidity("Enter Emailid");
		}
	else if(!u)
		{
		user.setCustomValidity("Please enter correct emaild");
		}
   else if(!ps)
		{
		pass.setCustomValidity("Enter password");
		}
	else if(!p)
		{
		pass.setCustomValidity("Must contain at least one number and one uppercase and lowercase letter, and atmost 8 characters");
		}	
	else
		f1.setAttribute('action',"validate.jsp");
}

</script>
</html>
