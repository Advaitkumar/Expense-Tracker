<!DOCTYPE html>
<html>
<head>
<script>
        history.forward();
</script>

<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Daily Expense Tracker</title>
<link rel="stylesheet" type="text/css" href="sign.css">
</head>
<body>
<div class="header">
  <a href="sign.jsp" class="logo">DailyExpenseTracker.com</a>
  <div class="header-right">
    <a href="about.html"style="float:right">About</a>
    <div class="dropdown"style="float:right">
    <button class="dropbtn">Contact</button>
    <div class="dropdown-content">
      <a href="#"onclick="alert('9751579978')">Phone number</a>
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
 <h1>Sign up form</h1>
 <div class="form">
  <form method="post" name="f2">
     <h5>Already have an account <a href="login.jsp">click here</a></h5>
     <table border="1">
     <tr>
    <th>Name:</th>
    <TD><INPUT TYPE="TEXT" NAME="hname" id="hname" placeholder="Enter name"  SIZE="15" maxlength="15" required="required" oninput="this.setCustomValidity('')"> </TD>
    <th>Country</th>
    <td style="height: 21px; width: 177px;">
    <select id="country" name="country" required oninput="this.setCustomValidity('')">
         <option value="clear">Select country</option>
         <option value="india">India</option>
         <option value="South Africa">South Africa</option>
         <option value="Sri Lanka">SriLanka</option>
    </select>
    </td>
    </tr>
    <tr>
    <th>Phone Number</th>
    <td><input id="phone" maxlength="10" name="phone" type="tel" placeholder="Enter mobilenumber"  required="required" oninput="this.setCustomValidity('')" /></td>
    <th>UserName(Email):</th>
    <TD><INPUT TYPE="email" NAME="email" id="email" SIZE="20" placeholder="Enter Email-id" maxlength="20"required="required" oninput="this.setCustomValidity('')" ></TD>
    </tr>
    <tr>
    <th>Password</th>
    <TD><INPUT TYPE="password" NAME="password" id="password" SIZE="8" style="width:100px;" placeholder="Enter password" maxlength="8" required="required" oninput="this.setCustomValidity('')"> </TD>
     <th>Confirm Password</th>
    <TD><INPUT TYPE="password" NAME="passworde" id="passworde" SIZE="8" style="width:150px;" maxlength="8" placeholder="Retype password" required="required" oninput="this.setCustomValidity('')"> </TD>
    </tr>
    <tr>
    </tr>
    </table>
     <div class="check">             
       <input type="checkbox"  onclick="func1()">Show Password
    </div>
    <P><INPUT TYPE="submit" VALUE="Register"  onclick="val()"> <INPUT TYPE="reset" VALUE="clear" > <input type="button" value="cancel" onclick="location.href='login.jsp';"></P>
   </form>
 </div>
</div>

</body>
<script type="text/javascript" >
function func1(){
	var x=document.getElementById("password");
	  var y=document.getElementById("passworde");
	  if(x.type==="password"||y.type==="password")
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
function val(){
	 var hna=document.f2.hname.value;
     var hn=document.querySelector("#hname");
     var hcount=hna.length;
     var nam=/^[a-zA-Z\s]+$/;
     var n=hna.match(nam);
     var spas=document.f2.password.value;
     var pas=document.f2.passworde.value;
     var e=document.f2.email.value;
     var em=document.querySelector("#email");
     var tel=document.f2.phone.value;
     var ph=document.querySelector("#phone");
     var b= /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
     var c=e.match(b);
     var sp=document.querySelector("#password");
     var ps=document.querySelector("#passworde");
     var d= /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,20}$/;
	 var pr=spas.match(d);
	 var pho= /^\d{10}$/;
	 var k=tel.match(pho);
	 var con=document.getElementById('country');
	if(!hna)
      	hn.setCustomValidity("Enter Your  Name");
     else if(hcount<4)
      	hn.setCustomValidity("Yourname should be atleast 5 letters");
     else if(!n)
     	hn.setCustomValidity("Your Name should consists only letters!!!");
     else if(con.selectedIndex == 0)
    	 con.setCustomValidity("Please select country");
     else if(!tel)
   	  ph.setCustomValidity("Enter mobile number");
	 else if(!k||tel==0)
      	  ph.setCustomValidity("Enter  valid mobile number,contains only numbers upto 10 digits)");
     else if(tel<10)
   	  ph.setCustomValidity("Mobile number should have 10 numbers");
     else if(!e)
         em.setCustomValidity("Enter email!!!");
     else if(!c)
   	  em.setCustomValidity("Enter correct emailid!!!");
     else if(!spas)
         sp.setCustomValidity("enter password!!");
     else if(!pr)
    	 sp.setCustomValidity("Must contain at least one number and one uppercase and lowercase letter, and atmost 8 characters");
     else if(!pas)
         ps.setCustomValidity("enter password!!");
     else if(spas !=pas)
  	   ps.setCustomValidity("password didn't match");
     else
     {
    	 f2.setAttribute('action',"reg.jsp" );
    	 
   	  }
 }

</script>
</html>