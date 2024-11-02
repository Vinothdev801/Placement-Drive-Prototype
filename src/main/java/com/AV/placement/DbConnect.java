package com.AV.placement;

import java.sql.*;

import com.mysql.cj.exceptions.RSAException;
public class DbConnect{
	private static final String url="jdbc:mysql://localhost:3306/project";
	private static final String pass="";
	private static final String uname="root";
	
	public static ResultSet fetchQ(String query) throws SQLException {
		ResultSet result=null;
		
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection(url,uname,pass);
			Statement st = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			result=st.executeQuery(query);
	
			if(con!=null) 
				System.out.println("Database Connected...");
			boolean v=result.next();
			if(v)
				return result;
			else {
				return null;
			}
			
				
		} catch ( Exception e) {
			
			System.out.println("Database not connected");
			System.out.println(e);
			return null;
		}
		
	}
	
    public static Connection connect() throws SQLException {

			try {
				
				Class.forName("com.mysql.jdbc.Driver");
				return DriverManager.getConnection(url,uname,pass);
				
			} catch ( Exception e) {
				
				System.out.println("Database not connected");
				System.out.println(e);
				return null;
				
			}
	}

}
