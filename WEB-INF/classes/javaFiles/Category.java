import java.sql.*;
import java.util.*;
import java.io.*;
import javax.servlet.http.*;
import javax.servlet.*;

public class Category
{
	public String title;
	public String description;
	
	Category(String title, String desc)
	{
		this.title = title;
		this.description = desc;
	}
	
		public static Boolean ifExist(String category, String dbAddress, String dbDriver) throws Exception
	{
		Class.forName(dbDriver);
		String url = dbAddress;
		Connection con=DriverManager.getConnection(url,"root","root");
		Statement st = con.createStatement();
		
		String query = "select category_title from category where category_title = '"+category+"'";
		
		ResultSet rs = st.executeQuery(query);

		if(rs.next())
		{
			return true;
		}
		else 
		{
			return false;
		}
	}
	
	public static Boolean addCategory(String title, String desc, String dbAddress, String dbDriver) throws Exception
	{
		Class.forName(dbDriver);
		String url = dbAddress;
		Connection con=DriverManager.getConnection(url,"root","root");
		
		if(ifExist(title, dbAddress, dbDriver))
		{
			return false;
		}
		else
		{
			Statement st=con.createStatement();
			
			String query="insert into category(category_title,category_description) values('"+title+"', '"+desc+"')";
			
			int rs = st.executeUpdate(query); 
			
			if(rs > 0)
			{
				return true;
			}
			else 
			{
				return false;
			}
		}
		
	}
	
	public static List<String> getCategory(String dbAddress,String dbDriver) throws Exception
	{
		Class.forName(dbDriver);
		String url = dbAddress;
		Connection con=DriverManager.getConnection(url,"root","root");
		
		Statement st=con.createStatement();
			
		String query = "select category_title from category";
		
		ResultSet rs = st.executeQuery(query);
		
		List<String> lst = new ArrayList<String>();
		
		while(rs.next())
		{ 
			lst.add(rs.getString("category_title"));
		}
		
		return lst;
	}
}