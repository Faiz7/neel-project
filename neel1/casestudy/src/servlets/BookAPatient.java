package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class BookAPatient extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int i=0;
		
		PrintWriter pw=response.getWriter();
		
		String applicationid=request.getParameter("appid");
		
		String testid=request.getParameter("tid");
		int tempid=(int) ((Math.random())*100000000);
		String bookingid=String.valueOf(tempid);
		String bookingDate=(request.getParameter("dob"));
		
		String hours=request.getParameter("hh");
		String min=request.getParameter("mm");
		
		String hrmin=hours+":"+min;
			
	
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521:xe",
					"system",
					"system");
			
			String query="insert into booking values(?,?,?,?,?)";
			
			PreparedStatement ps=con.prepareStatement(query);
			
			
			ps.setString(1, bookingid);
			ps.setString(2, applicationid);
			ps.setString(3,testid);
			ps.setString(4,bookingDate);
			ps.setString(5, hrmin);
			
			
			i=ps.executeUpdate();
			
			if(i>0){
				/*RequestDispatcher rd=request.getRequestDispatcher("PatientAddedSuccess.html");

				 rd.forward(request, response);*/
				
				response.sendRedirect("GenerateBill.html");
			}else{
				
				/*RequestDispatcher rd=request.getRequestDispatcher("PatientAddedUnsuccessful.html");

				 rd.forward(request, response);*/
				response.sendRedirect("PatientAddedUnsuccess.html");
			}
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
	
	
	
	
	}

	

}
