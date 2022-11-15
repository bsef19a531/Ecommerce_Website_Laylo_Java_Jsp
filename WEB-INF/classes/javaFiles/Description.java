public class Description
{
	public static String get10Words(String desc)
	{
		//String str [] = desc.split(" ");
		
		//if(str.length > 10)
		//{
			//String res = "";
			//for(int i = 0; i<10; i++)
			//{
			//	res = res + str[i] + " ";
			//}
			//return (res+"...");
		//}
		//else
		//{
			//return (desc+"...");
		//}
		
		String newDesc = null;
		int size = desc.length();
		if(size < 50)
		{
			int i = 50 - size;
			 newDesc = desc;
			while(i >= 0)
			{
				newDesc += "-";
			}
		}
		else{
			   String extra = (desc.substring(0, Math.min(desc.length(), 50)));
			   newDesc = extra +"...";
		}
		return newDesc;
		
	}
	
	
	public static String get50Characters(String desc)
	{
		String newDesc = null;
		int size = desc.length();
		if(size < 50)
		{
			int i = 50 - size;
			 newDesc = desc;
			while(i >= 0)
			{
				newDesc += " ";
			}
		}
		else{
			   String extra = (desc.substring(0, Math.min(desc.length(), 50)));
			   newDesc = extra +"...";
		}
		return newDesc;
	}
	
	
} 