import java.sql.*;

import sql.Sql;

public class Login {
	public static boolean validate(String n, String p) {
		boolean status=false;
		try {
				Connection con=Sql.getcon();
			    Statement st=con.createStatement();		
				ResultSet rs=st.executeQuery("select * from user where username='"+n+"' and password='"+p+"'");	
				status=rs.next();
	}
	catch(Exception e){e.printStackTrace();}
	return status;
	}

	public static boolean admin(String n, String p) {
		boolean status=false;
		try {
				Connection con=Sql.getcon();
			    Statement st=con.createStatement();		
				ResultSet rs=st.executeQuery("select * from admin where username='"+n+"' and password='"+p+"'");	
				status=rs.next();
	}
	catch(Exception e){e.printStackTrace();}
	return status;
	}
	
}
