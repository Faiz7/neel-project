package MethodImplementations;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.beans.Login;
public class LoginImpl {

		public String validate(Login login){
			String result1="";
			
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con=DriverManager.getConnection(
						"jdbc:oracle:thin:@localhost:1521:xe",
						"system",
						"system");
				String query="select * from dcemployee";
				Statement st=con.createStatement();
				ResultSet rs=st.executeQuery(query);
				
				String uname=login.getUsername();
				String pwd=login.getPassword();
				
					
					
					
					while(rs.next()){
						
						String un=rs.getString(2);
						String pw=rs.getString(3);
						
						if(uname.equals(un)){
							
							if(pwd.equals(pw)){
								
								result1=rs.getString(4);
								return result1;
								
							}
						
						}
					
				}
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return result1;
			
		}//end of method
		
		
			
		
		
}
