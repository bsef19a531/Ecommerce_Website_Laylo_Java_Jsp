import com.email.durgesh.Email;

public class javaMail
{
	public static void main(String args[])
	{
		try{
			   
			   Email email = new Email("mailforbusiness1113@gmail.com", "Bussiness1113@");
			   email.setFrom("mailforbussiness1113@gmail.com", "LayLo Shopping");
			   email.setSubject("Laylo change Password");
			   email.setContent("<h1>Details for changing password<h1> <br> <p>Your password changing code is 3456</p> <br> <a herf=''>Back to Login</a>", "text/html");
			   email.addRecipient("abdullahabid1113@gmail.com");
			   email.send();
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
}