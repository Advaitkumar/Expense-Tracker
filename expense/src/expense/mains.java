package expense;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import db.database;
public class mains {
	public String gntotalup(String username)
	{
		String ans="0";
		try
		{
			System.out.println(username);
			database dm=new database();
		    Connection con=dm.getConnect();
		    Statement st=con.createStatement();
		    String querycheck="SELECT sum(price) FROM main where username='"+ username +"'";
        	 ResultSet rt=st.executeQuery(querycheck);
        	 while(rt.next())
 		    {
 			  ans=rt.getString(1);
 			}
        	
 		   System.out.println(ans);
 		   return ans;
		}
	   catch (Exception exception) {
		     exception.printStackTrace();
		     return ans;
		    }
	}
	public String total(String username){
		String ans="0";
		try
		{
			System.out.println(username);
			LocalDate date=now();
			database dm=new database();
		    Connection con=dm.getConnect();
		    Statement st=con.createStatement();
		    String querycheck="SELECT sum(price) FROM main where username='"+ username +"' and date='"+ date +"'";
        	 ResultSet rt=st.executeQuery(querycheck);
		   while(rt.next())
		    {
			  ans=rt.getString(1);
			}
		   System.out.println(ans);
		   return ans;
		    
		}
	   catch (Exception exception) {
		     exception.printStackTrace();
		     return ans;
		    }
	}
	public int updmain(String username, String pname,String sector,String cost)
	{
		try
		{
			System.out.println(pname+username);
			LocalDate date=now();
			database dm=new database();
		    Connection con=dm.getConnect();
		    
		    Statement st=con.createStatement();
		    String querycheck="Select * from main where username='"+ username +"' and date='"+ date +"' and pname='"+ pname +"'";
        	 ResultSet rt=st.executeQuery(querycheck);
		   String query2="update main set sector=?,price=? where username='"+ username +"'and date='"+ date +"' and pname='"+ pname +"'";
		   if(rt.next())
		    {
			   PreparedStatement ps=con.prepareStatement(query2);
			   ps.setString(1,sector);
			   ps.setString(2, cost);
			   ps.executeUpdate();
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
	public int deletemain(String pname,String username)
	{
		try
		{
			System.out.println(pname);
			database dm=new database();
		    Connection con=dm.getConnect();
		    Statement st=con.createStatement();
		    LocalDate date=now();
		    String querycheck="Select * from main where username='"+ username +"' and pname='"+ pname +"' and date='"+ date +"'";
        	ResultSet rt=st.executeQuery(querycheck);
		   String query2="delete from main where username='"+ username +"'and pname='"+ pname +"' and date='"+ date +"'";
		   if(rt.next())
		    {
			   st.executeUpdate(query2);
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
	
	
	public int exp(String pname,String sector,String cost,String username) {
		try
		{
			System.out.println(pname+username);
			database dm=new database();
		    Connection con=dm.getConnect();
		    
		    LocalDate date=now();
		    String query="Insert into main values('" + pname + "','" + sector + "','" + cost + "','" + username + "','" + date + "')";
		    Statement st=con.createStatement();
		    String querycheck="Select * from main where pname='"+ pname +"' and username='"+ username +"' and date='"+ date +"'";
		    ResultSet rt=st.executeQuery(querycheck);
		    if(rt.next())
		    {
		      return(0);
		    }
		    else
		    {
			st.executeUpdate(query);
		     return(1);
		    }
         }
	   catch (Exception exception) {
		     exception.printStackTrace();
		     return(3);
		    }
	}
	public List<List<String>> mdetails(String user)
	{
		List<List<String>> dum=new ArrayList<>();
		List<List<String>> gans=new ArrayList<>();
		List<String> ansn= new ArrayList<>();
		ansn.add("1");
		dum.add(ansn);
		try {
			database dm=new database();
	        Connection con=dm.getConnect();
	    
		    LocalDate date=now();
		    String query="Select * from main where username='"+ user +"'and date='"+ date +"'";
            Statement st= con.createStatement();
   		    ResultSet rt=st.executeQuery(query);
   		    
            while(rt.next())
            {
            	List<String>ans=new ArrayList<>();
            	ans.add(rt.getString("pname"));
            	ans.add(rt.getString("sector"));
            	ans.add(rt.getString("price"));
            	gans.add(ans);
            	
            }
            return gans;
		}
		catch (Exception exception) {
		    exception.printStackTrace();
		    return dum;
		}
	}
	

	private LocalDate now() {
		return java.time.LocalDate.now();
	}

	
	
}