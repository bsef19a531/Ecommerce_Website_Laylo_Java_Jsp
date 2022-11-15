public class Helper
{
	public static String get50Characters(String desc)
	{
		String newDesc = "";
		int size = desc.length();
		if(size < 50)
		{
			int i = 50 - size;
			 newDesc = desc;
			while(i >= 0)
			{
				newDesc += "...";
				i--;
			}
		}
		else{
			   String extra = (desc.substring(0, Math.min(desc.length(), 50)));
			   newDesc = extra +"...";
		}
		return newDesc;
	}
	
}