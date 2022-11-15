import java.sql.*;
import java.util.*;
import java.io.*;
import javax.servlet.http.*;
import javax.servlet.*;

public class Product
{
	public String name;
	public String description;
	public String price;
	public String discount;
	public String quantity;
	public String category;
	public String img;
	
	
	public Product(String name, String description, String price, String discount, String quantity, String category, String img)
	{
		this.name = name;
		this.description = description;
		this.price = price;
		this.discount = discount;
		this.quantity = quantity;
		this.category = category;
		this.img = img;
	}
	
	public static Boolean ifExist(String pName, String dbAddress, String dbDriver) throws Exception
	{
		Class.forName(dbDriver);
		String url = dbAddress;
		Connection con=DriverManager.getConnection(url,"root","root");
		Statement st = con.createStatement();
		
		String query = "select product_name from product where product_name = '"+pName+"'";
		
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
	
	public static Boolean addProduct(String name, String description, String price, String discount, String quantity, String category, String img, String dbAddress, String dbDriver) throws Exception
	{
		Class.forName(dbDriver);
		String url = dbAddress;
		Connection con=DriverManager.getConnection(url,"root","root");
		
		if(ifExist(name, dbAddress, dbDriver))
		{
			return false;
		}
		else
		{
			Statement st=con.createStatement();
			
			String query="insert into product(product_name,product_description,product_price,product_discount,product_quantity,product_category,product_img) values('"+name+"', '"+description+"','"+price+"','"+discount+"','"+quantity+"','"+category+"','"+img+"' )";
			//INSERT INTO product(product_name,product_description,product_price,product_discount,product_quantity,product_category,product_img) VALUES('laptop','hala','100','20','100','laptop','src')
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
	
	public static List<Product> getProducts(String dbAddress,String dbDriver) throws Exception
	{
		Class.forName(dbDriver);
		String url = dbAddress;
		Connection con=DriverManager.getConnection(url,"root","root");
		
		Statement st=con.createStatement();
			
		String query = "select * from product";
		
		ResultSet rs = st.executeQuery(query);
		
		List<Product> lst = new ArrayList<Product>();
		
		while(rs.next())
		{ 
			//String dis = rs.getString("product_discount");
			lst.add(new Product(rs.getString("product_name"),rs.getString("product_description"),rs.getString("product_price"),rs.getString("product_discount"),rs.getString("product_quantity"),rs.getString("product_category"),rs.getString("product_img")));
			//lst.add(Product(rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8)));
		}
		
		return lst;
	}
	
}