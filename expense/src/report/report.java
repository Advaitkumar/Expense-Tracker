package report;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import db.database;

public class report {
     public String hitot(String username)
     {
    	 String ans="0";
    	try
 		{
    		database dm=new database();
		    Connection con=dm.getConnect();
		    Statement st=con.createStatement();
 		    String querycheck="select max(qua) from(select date as dt,sum(price) as qua FROM main where username='"+ username +"' group by date(date))T";
         	 ResultSet rt=st.executeQuery(querycheck);
           if(rt.next())
         	{
         	   ans=rt.getString(1);
      		   return ans;
     	
         	}
           else
           {
        	   System.out.println(ans);
        	   return ans;
           }
           	}
 	   catch (Exception exception) {
 		     exception.printStackTrace();
 		     return ans;
 		    }
     }
     public String hidate(String username)
     {
    	 String ans="No data";
    	 int max=Integer.MIN_VALUE;
 		try
 		{
 			database dm=new database();
		    Connection con=dm.getConnect();
		    Statement st=con.createStatement();
 		    String querycheck="select date,sum(price) from main where username='"+ username +"'group by date(date)";
         	 ResultSet rt=st.executeQuery(querycheck);
           while(rt.next())
         	{
         	    int n=Integer.parseInt(rt.getString(2));
         	    if(n>max)
         	    {
         	    	max=n;
         	    	ans=rt.getString(1);
         	    }       	   
        	   
            }
           System.out.println(ans);
  		   return ans;
 	
           
           	}
 	   catch (Exception exception) {
 		     exception.printStackTrace();
 		     return ans;
 		    }
     }
     public String hisec(String username)
     {
    	 String ans="No data";
    	 int max=Integer.MIN_VALUE;
 		try
 		{
 			database dm=new database();
		    Connection con=dm.getConnect();
		    Statement st=con.createStatement();
 		    String querycheck="select sector,sum(price) from main where username='"+ username +"'group by sector";
         	 ResultSet rt=st.executeQuery(querycheck);
           while(rt.next())
         	{
         	    int n=Integer.parseInt(rt.getString(2));
         	    if(n>max)
         	    {
         	    	max=n;
         	    	ans=rt.getString(1);
         	    }       	   
        	   
            }
           //System.out.println(ans);
  		   return ans;
 	}
 	   catch (Exception exception) {
 		     exception.printStackTrace();
 		     return ans;
 		    }
     }
     public String freq(String username)
     {
    	 String ans="No data";
    	 String dt="";
    	try
 		{
    		database dm=new database();
		    Connection con=dm.getConnect();
		    Statement st=con.createStatement();
 		    String querycheck="select pname,count(pname) from main where username='"+ username +"'group by pname";
         	 ResultSet rt=st.executeQuery(querycheck);
           if(rt.next())
         	{    	   
        	   ans=rt.getString(1);
        	   dt=rt.getString(2);
        	   System.out.println(dt+ans);
      		   return ans; 
            }
           else
           {           
        	   System.out.println(ans);
               return ans;
           }
 	}
 	   catch (Exception exception) {
 		     exception.printStackTrace();
 		     return ans;
 		    }
     }


}