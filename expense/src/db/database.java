package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class database{
	static Connection co=null;
	public Connection getConnect() throws SQLException
    {
        if (co!= null) return co;
        database dm=new database();
        return dm.getConnection();
    }
	public  Connection getConnection() throws SQLException{
		Connection re= null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
			co=DriverManager.getConnection("jdbc:mysql://tvcpw8tpu4jvgnnq.cbetxkdyhwsb.us-east-1.rds.amazonaws.com:3306/qj25pocrceo4kvfd","lx42oaq1ej289u2f","voeltkfbbtashk1o");
			return co;
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return re;
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return re;
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return re;
		}
		
	}
	
}