package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddPatientServlet
 */
public class AddPatientServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
			PrintWriter pw=response.getWriter();

			String aid=request.getParameter("appid");
			String pno=request.getParameter("pno");
			String fname=request.getParameter("firstname");
			String lname=request.getParameter("lastname");
			String gender=request.getParameter("gender");
			int age=Integer.parseInt(request.getParameter("age"));
			String add=request.getParameter("add");
			String dob=request.getParameter("dob");
			int mob=Integer.parseInt(request.getParameter("mobileno"));
			String dname=request.getParameter("docname");
			String reason=request.getParameter("reason");
			
			
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con=DriverManager.getConnection(
						"jdbc:oracle:thin:@localhost:1521:xe",
						"system",
						"system");
				
				String query="insert into PatientAppForm values(?,?,?,?,?,?,?,?,?,?,?)";
				
				PreparedStatement ps=con.prepareStatement(query);
				
				ps.setString(1, aid);
				ps.setString(2, pno);
				ps.setString(3, fname);
				ps.setString(4, lname);
				ps.setString(5, gender);
				ps.setInt(6, age);
				ps.setString(7, add);
				ps.setString(8, dob);
				ps.setInt(9, mob);
				ps.setString(10, dname);
				ps.setString(11, reason);
				
				int i=0;
				
				i=ps.executeUpdate();
				
				if(i>0){
					RequestDispatcher rd=request.getRequestDispatcher("PatientAddedSuccess.html");

					 rd.forward(request, response);
				}else{
					
					RequestDispatcher rd=request.getRequestDispatcher("AddPatientForm.html");

					 rd.forward(request, response);
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
