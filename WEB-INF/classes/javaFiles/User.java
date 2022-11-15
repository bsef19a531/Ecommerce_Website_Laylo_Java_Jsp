import java.sql.*;
import java.util.*;
import java.io.*;

public class User
{
	public String name;
	public String email;
	public String password;
	public String phone;
	public String address;
	public String role;
	
	User(String name, String email, String password, String phone, String address, String role)
	{
		this.name = name;
		this.email = email;
		this.password = password;
		this.phone = phone;
		this.address = address;
		this.role = role;
	}
	
		public static int getTotalUsers(String dbAddress,String dbDriver) throws Exception
	{
		Class.forName(dbDriver);
		String url = dbAddress;
		Connection con=DriverManager.getConnection(url,"root","root");
		
		Statement st=con.createStatement();
			
		String query = "SELECT COUNT(*) FROM clientdata";
		
		ResultSet rs = st.executeQuery(query);
		
		rs.next();
		
		int total = rs.getInt("count(*)");
		
		
		return total;
	}
}