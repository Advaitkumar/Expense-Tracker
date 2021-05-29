package getdetails;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import db.database;
import encrypt.pass;

public class details {
	public int checkupd(String user)
	{
		try {
			database dm=new database();
		    Connection con=dm.getConnect();
		    String query="Select planupd from register where username='"+ user +"'";
            Statement st= con.createStatement();
   		    ResultSet rt=st.executeQuery(query);
            if(rt.next())
            {
            	 String pas=rt.getString("planupd");
                 //System.out.println(pas);
                 String s="YES";
                    if(pas.equals(s))
                    	return (1);
                    else
                    	return (0);
	   		 
   		    }	
            else
            	return (2);
		}
		catch (Exception exception) {
		    exception.printStackTrace();
		    return(4);
		}
	}
	public List<String> fulldetails(String user)
	{
		List<String> dum=new ArrayList<>();
		dum.add("1");
		try {
			database dm=new database();
		    Connection con=dm.getConnect();
		    String query="Select * from planboard where username='"+ user +"'";
            Statement st= con.createStatement();
   		    ResultSet rt=st.executeQuery(query);
            if(rt.next())
            {
            	List<String>ans=new ArrayList<>();
            	ans.add(rt.getString("plan"));
            	ans.add(rt.getString("amount"));
            	ans.add(rt.getString("period"));
            	ans.add(rt.getString("stdate"));
            	ans.add(rt.getString("endate"));
            	return ans;
   		    }	
            else
            	return dum;
		}
		catch (Exception exception) {
		    exception.printStackTrace();
		    return dum;
		}
	}
	public List<String> userdetails(String user)
	{
		List<String> dum=new ArrayList<>();
		dum.add("1");
		try {
			database dm=new database();
		    Connection con=dm.getConnect();
		    String query="Select * from register where username='"+ user +"'";
            Statement st= con.createStatement();
   		    ResultSet rt=st.executeQuery(query);
            if(rt.next())
            {
            	List<String>ans=new ArrayList<>();
            	ans.add(rt.getString("name"));
            	ans.add(rt.getString("country"));
            	ans.add(rt.getString("phno"));
            	ans.add(user);
            	String pas=rt.getString("password");
            	String dec=pass.decrypt(pas, user);
            	ans.add(dec);
            	return ans;
   		    }	
            else
            	return dum;
		}
		catch (Exception exception) {
		    exception.printStackTrace();
		    return dum;
		}
	}
	public int deleteplan(String username)
	{
		try
		{
			database dm=new database();
		    Connection con=dm.getConnect();
		    Statement st=con.createStatement();
		    String querycheck="Select * from planboard where username='"+ username +"'";
        	ResultSet rt=st.executeQuery(querycheck);
		   String query2="delete from planboard where username='"+ username +"'";
		   String query3="update register set planupd='NO' where username='"+ username +"'";
		   String query4="delete from main where username='"+ username +"'";
		   if(rt.next())
		    {
			   st.executeUpdate(query2);
               st.executeUpdate(query3);
			   st.executeUpdate(query4);
			   	
		       return(1);
		    }
		    else
		    {
			return(0);
		   }
		}
	   catch (Exception exception) {
		     exception.printStackTrace();
		     return(3);
		    }
	}
	public int deleteacc(String username)
	{
		try
		{
			database dm=new database();
		    Connection con=dm.getConnect();
		    Statement st=con.createStatement();
		    String querycheck="Select * from register where username='"+ username +"'";
        	ResultSet rt=st.executeQuery(querycheck);
		   String query2="delete from register where username='"+ username +"'";
		   String query3="delete from planboard where username='"+ username +"'";
		   String query4="delete from main where username='"+ username +"'";
		   if(rt.next())
		    {
			   st.executeUpdate(query2);
               st.executeUpdate(query3);
			   st.executeUpdate(query4);
		       return(1);
		    }
		    else
		    {
			return(0);
		   }
		}
	   catch (Exception exception) {
		     exception.printStackTrace();
		     return(3);
		    }
	}
	
	
	
}
