 <%@ page import="register.*" %>
 <%@ page import="getdetails.*" %>
 <%@ page import="java.util.*" %>
 <%@ page import="expense.*" %>
<!DOCTYPE html>
<html> 
<script>
        history.forward();
</script>
<link rel="stylesheet" type="text/css" href="main.css">
<meta charset="ISO-8859-1">
<title>Expense Tracker</title>
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
      <a href="#"onclick="alert('advaitjayanth@gmail.com')">Email</a>
      </div>
   </div> 
   <a href="acdetail.jsp" style="float:right">Account details</a>
  </div>
  <div class="pupdate" style="float:right;" >
          <a href="report.jsp">Report</a>
  </div>
   <a href="#" style="float:right;" >Welcome,<span id="nm"></span></a>
</div>
<div class="pno" id="pno" style="display:none;">
    <h1>Plan details:</h1>
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
<div class="box" id="pyes" style="display:none;">
  <h1>Your Expense Here</h1>
  <div class="form">
     <h2>Plan details</h2>
  <form>
  <table border="1">
     <tr>
        <th>Date</th>
        <td><input type="date" id="myDate" disabled></td>
        <th>Plan</th>
        <td><input type="text" id="plan" value="" disabled></td>
        </tr>
    <tr>
       <th>Start Date</th>
       <td><input type="text" id="st" value="13/05/2021" disabled></td>
       <th>End Date</th>
       <td><input type="text" id="et" value="15/05/2021" disabled></td>
    </tr>
    <tr id="re">
     <th>Period</th>
        <td><input type="text" id="per" value="30 days" disabled></td>
    </tr>
    <tr>
      <td><a href="acdetail.jsp">Edit</a></td>
    </tr>
    </table>
    <div id="bud" style="display:none;">
         <h3>Amount Leftover</h3>
         <input type="text" id="am" value="13000" disabled>
    </div>
    <div id="tar" style="display:none;">
         <h3>Amount added</h3>
         <input type="text" id="amad" value="0" disabled>
    </div>
  </form>
  </div>
</div>
<div class="new"  id="new" style="display:none;">
   <p>The date is exceeded ,so update your plan using the<a href="onboard.jsp">Link</a></p>
</div>
<div class="main" id="main" style="margin-left:600px; margin-top:-350px; display:none;">
<h4>Enter your expense</h4>
 <form name="f2" method="post" >
<table id="mytab1" border="1">
  <tr>
    <th>Product name</th>
    <th>Sector</th>
    <th>Price</th>
  </tr>
  <tr>
    <td>
     <input type="text" name="pname" id="pname" maxlength="10" required="required"  oninput="this.setCustomValidity('')" >
    </td>
    <td>
   <select id="pk" name="pk" class="required" oninput="this.setCustomValidity('')" >
                <option value="clear">Select Sector</option>
                <OPTION value="Milk">Milk</OPTION>
                <OPTION value="Vegetable">Vegetable</OPTION>
                <OPTION value="Grocery">Grocery</OPTION>
                <OPTION value="Food">Food</OPTION>
                <OPTION value="Book">Books</OPTION>
                <OPTION value="Newspaper">Newspaper</OPTION>
                <OPTION value="Other">Other</OPTION>
        </select>    
    </td>
    <td>
     <input type="text" name="cost" id="cost" maxlength="6" required="required" oninput="this.setCustomValidity('')">
    </td>
    </tr>
  </table>
  <input type="submit" value="Add" onclick="onFormSubmit()" >
  </form>
  <form name="f5">
   <input type="text" id="sd" name="sd" style="display:none;">
  <table class="list" id="expense" border="1">
                    <thead>
                        <tr>
                            <th>S.no</th>
                            <th>Product Name</th>
                            <th>Sector</th>
                            <th>Price</th>
                        </tr>
                    </thead>
                    <tbody> 
                    </tbody> 
                </table>
                <div style="margin-left:120px;">
                <table>
                      <tr><td><h4>Total</h4> </td><td><input type="text" value="" size="8" id="total" disabled></td></tr>
                    </table>
                 </div>  
                  </form>
</div>
<%
details bo=new details();
signin obj=new signin();
String s=(String)session.getAttribute("User");
List<String> strList=new ArrayList<>();
strList=bo.fulldetails(s);
mains dt=new mains();
List<List<String>> mList=new ArrayList<>();
mList=dt.mdetails(s);
//System.out.println(mList.get(0).get(0));
%>

</body>
<script>
function myFunction() {
	 var w='<%= obj.getname(s) %>';
    document.getElementById("nm").innerHTML=w; 
    var board='<%= bo.checkupd(s) %>';
    var detarr=[<% for (int i = 0; i < strList.size(); i++) { %>"<%= strList.get(i)   %>" <%= i + 1 < strList.size() ? ",":"" %><% } %>];
    if(board==1)
    	{
    	 document.getElementById("pyes").style.display="block";
         document.getElementById("main").style.display="block";
         document.getElementById("plan").setAttribute('value',detarr[0]);
         if(document.getElementById("plan").value=="Budget")
         {
         	document.getElementById("bud").style.display="block";
         	document.getElementById("tar").style.display="none";
          	document.getElementById("am").setAttribute('value',detarr[1]);
         }
         if(document.getElementById("plan").value=="Target")
         {
         document.getElementById("bud").style.display="none";
         document.getElementById("tar").style.display="block";
         var textnode = document.createTextNode("Target Amount");
         var y = document.createElement("INPUT");
         y.setAttribute("type", 'text');
         y.setAttribute('id','due');
         y.setAttribute('value',detarr[1]);
         y.setAttribute('disabled',"true");
         var td = document.createElement('TH');
         td.appendChild(textnode);
         document.getElementById("re").appendChild(td);
         var ye=document.createElement('TD');
         ye.appendChild(y);
         document.getElementById("re").appendChild(ye);
         }
         var dr='<%= dt.gntotalup(s) %>';
         if(dr=="null")
        	 updateamount(0);
         else
         updateamount(-dr);
         
         document.getElementById("per").setAttribute('value',detarr[2]);
         var std=detarr[3].split('-');
         var stde=std[2]+"/"+std[1]+"/"+std[0];
         document.getElementById("st").setAttribute('value',stde);
         document.getElementById("et").setAttribute('value',detarr[4]);
    	 document.getElementById("pno").style.display="none";
    	 var x = document.getElementById("myDate");
    	 x.valueAsDate = new Date();
    	 var g1 = new Date();
    	 var parts =document.getElementById("st").value.split('/');
    	 var eparts=document.getElementById("et").value.split('/');
    	 var sdate = new Date(parts[2], parts[1]-1, parseInt(parts[0])); 
    	 var edate=new Date(eparts[2], eparts[1]-1, parseInt(eparts[0]));
    	 g1.setHours(0, 0, 0, 0);
    	 if(g1.getTime() <sdate.getTime() || g1.getTime() > edate.getTime())
    	 	{
    	 	//alert(sdate+","+g1);
    	 	document.getElementById("main").style.display="none";
    	 	document.getElementById("new").style.display="block";
    	 	}
    	 else
    	 	{
    	 	//alert(sdate);
    	 	document.getElementById("main").style.display="block";
    	 	document.getElementById("new").style.display="none";
    	 	var marr=[<% for (int i = 0; i < mList.size(); i++) { %>"<%= mList.get(i)  %>" <%= i + 1 < mList.size() ? ",":"" %><% } %>];
    	 	if(marr[0].replace("[","").replace("]","")==1)
    	 		{
    	 		  alert("You can");
    	 		}
    	 	else
    	 		{
    	 	for(var i=0;i<marr.length;i++)
    	     {
    	 	var table = document.getElementById("expense").getElementsByTagName('tbody')[0];
    	    var newRow = table.insertRow(table.length);
    	    var count= document.getElementById("expense").rows.length;  
    	    var tem=marr[i].split(',');
    	    cell1 = newRow.insertCell(0);
    	    cell1.innerHTML = count-1;
    	    cell2 = newRow.insertCell(1);
    	    cell2.innerHTML = tem[0].substring(1);
    	    cell3 = newRow.insertCell(2);
    	    cell3.innerHTML = tem[1];
    	    cell4 = newRow.insertCell(3);
    	    cell4.innerHTML = tem[2].replace("]","");
    	    cell4 = newRow.insertCell(4);
    	    cell4.innerHTML ="<button  onclick='onEdit(this)' id='btndel'; >Edit</button>";
    	    cell5= newRow.insertCell(5);
    	    cell5.innerHTML ="<button type='submit' onclick='onDelete(this)' id='btnEdit';>Delete</button>";
    	    //updatetotal(tem[2].replace("]",""));
    	    //updateamount(-tem[2].replace("]",""));
    	    var de='<%= dt.total(s) %>';
    	    document.getElementById("total").value=de;
             }
    	 		}
    	   }

    	}
    else
    	{
    	document.getElementById("pno").style.display="block";
    	document.getElementById("pyes").style.display="none";
    	document.getElementById("main").style.display="none";
    	}
}
	

var selectedRow = null;
function onFormSubmit(){
	    var hna=document.f2.pname.value;
		var hcount=hna.length;
	    var hn=document.querySelector("#pname");
	    var nam=/^[a-zA-Z\s]+$/;
		var n=hna.match(nam);
	    var pr=document.f2.cost.value;
	    var p=document.querySelector("#cost");
	    var hono=/^[0-9/]*$/;
	    var h=pr.match(hono);
	    var pk=document.getElementById("pk");
	    if(!hna)
	           hn.setCustomValidity("Enter Product  Name");
	    else if(!n)
	      	hn.setCustomValidity("Product Name should consists only letters!!!");
	    else if(hcount<3)
		       	hn.setCustomValidity("Productname should be atleast 3 letters");
		else if(pk.selectedIndex == 0)
    	  pk.setCustomValidity("Please Select Sector");
        else if(!pr)
	           p.setCustomValidity("Enter number");
	    else if(!h||pr==0||pr<1)
	   	 p.setCustomValidity("Price includes numbers only and not 0 and greater than or = 1"); 
	   else
	     {
		   if(selectedRow==null)
			   {
		         f2.setAttribute('action',"mainexp.jsp");
		       }
		  }
	     }
	
function resetForm() {
    document.getElementById("pname").value = "";
    document.getElementById("pk").selectedIndex =0;
    document.getElementById("cost").value = "";
    selectedRow = null;
}
var old=0;
var che=0;
function updateRecord(formData) {
    selectedRow.cells[1].innerHTML = formData.pname;
    selectedRow.cells[2].innerHTML = formData.pk;
    selectedRow.cells[3].innerHTML = formData.cost;
    updatetotal(formData.cost);
    updateamount(-formData.cost);
    old.removeAttribute('disabled');
    che=0;
}

function insertNewRecord(data) {
    }
function onEdit(td) {
	if(che==0)
		{
    selectedRow = td.parentElement.parentElement;
    document.getElementById("pname").value = selectedRow.cells[1].innerHTML;
    document.getElementById("pname").readOnly = true;
    document.getElementById("pname").onkeydown = function() {alert("Cannot alter product name,delete it")};
    var tr=selectedRow.cells[2].innerHTML.replace(" ","");
    document.getElementById("pk").value =tr;
    var tr2=selectedRow.cells[3].innerHTML.replace(" ","");
    document.getElementById("cost").value =tr2;
    var dec=selectedRow.cells[3].innerHTML;
    td.setAttribute('disabled',"true");
    old=td;
    che=1;
    f2.setAttribute('action',"mainupd.jsp");
    //updatetotal(-tr2);
    //updateamount(tr2);
		}
	else
		{
		alert("update record");
		 event.preventDefault();
		}
}
function onDelete(td) {
	if(che==0)
		{
    if (confirm('Are you sure to delete this record ?')) {
        row = td.parentElement.parentElement;
        var dect=row.cells[3].innerHTML;
        //updatetotal(-dect);
        //updateamount(dect);
        var d=row.cells[1].innerHTML;
        document.getElementById("sd").setAttribute('value',d);
       // document.getElementById("expense")
        f5.setAttribute('action',"delexp.jsp");
        /*document.getElementById("expense").deleteRow(row.rowIndex);
        updateRowCount();
        resetForm();*/
    }
		}
	else
		{
		alert("update record");
		 event.preventDefault();
		}
}
function updateRowCount(){
    var table = document.getElementById("expense");
    var rowcountAfterDelete = document.getElementById("expense").rows.length;  
    for(var i=1;i<rowcountAfterDelete;i++){    
         table.rows[i].cells[0].innerHTML=i;
     }
    }
function readFormData() {
    var formData = {};
    formData["pname"] = document.getElementById("pname").value;
    formData["pk"] = document.getElementById("pk").value;
    formData["cost"] = document.getElementById("cost").value;
    return formData;
}
var tot=0;
function updatetotal(price)
{
	tot=tot+parseFloat(price);
	document.getElementById("total").value=tot;
}

function updateamount(to)
{
	if(document.getElementById("plan").value=="Budget")
		{
		var left= document.getElementById("am").value;
		left=parseFloat(left)+parseFloat(to);
        if(left<=0)
        	{
        	  alert("Your expense crosses the budget");
        	  document.getElementById("am").value=-left+parseFloat(document.getElementById("am").value);
        	}
        else
        document.getElementById("am").value=left;
		}
	if(document.getElementById("plan").value=="Target")
	{
    var right= document.getElementById("amad").value;
	right=parseFloat(right)-parseFloat(to);
	document.getElementById("amad").value=right;
	if(right>=parseInt(document.getElementById("due").value))
		{
		alert("Your limit of expense is exceeded,please try to reduce it!!!");
		}
	}

}
function test()
{
	alert("hi");
	}	

</script>

</html>