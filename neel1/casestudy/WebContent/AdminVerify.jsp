<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@page import="java.sql.*" %> 
   <%@ page import = "javax.servlet.RequestDispatcher" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Verification</title>
</head>
<body>
<%


Class.forName("oracle.jdbc.driver.OracleDriver");

Connection con=DriverManager.getConnection(
		"jdbc:oracle:thin:@localhost:1521:xe",
		"system",
		"system");

String query="select * from adminDetails";

Statement st=con.createStatement();

ResultSet rs=st.executeQuery(query);

String user=request.getParameter("auname");
//out.print(user);

 String pass=request.getParameter("apass");
 //out.print(pass);
 int count=0;
while(rs.next()){
	
	String un=rs.getString(1);
	String pw=rs.getString(3);
	
	if(user.equalsIgnoreCase(un)){
		
		if(pass.equalsIgnoreCase(pw)){
			count++;
			
		}
	}
	}
if(count==1)
{
	
RequestDispatcher rd=request.getRequestDispatcher("AdminFunc.jsp");

 rd.forward(request, response);

}
else
{
	RequestDispatcher rd=request.getRequestDispatcher("AdminLoginError.html");

 rd.forward(request, response);

}%>



</body>
</html>