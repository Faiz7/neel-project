

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
   <%@page import="java.io.IOException" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Patient Details</title>
</head>
<body>
<% 
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521:xe",
					"system",
					"system");

			String query="select appid,pno,firstname,lastname,gender,age,address,dob,mobileno,docname,reason from PatientAppForm";

			Statement st=con.createStatement();

			ResultSet rs=st.executeQuery(query);%>
			<table border="2" width="1000" height="50">
<tr>
<th>Application ID</th>
<th>Prescription Number</th>
<th>FIRST NAME</th>
<th>LAST NAME</th>
<th>Gender</th>
<th>Age</th>
<th>Address</th>
<th>Date of Birth</th>
<th>Mobile number</th>
<th>Doctor Name</th>
<th>Reason</th>
</tr>

	
			
			<% while(rs.next()){%>
				
				
<TR>
<TD><%=rs.getString(1)%></TD>
<TD><%=rs.getString(2)%></TD>
<TD><%=rs.getString(3)%></TD>
<TD><%=rs.getString(4)%></TD>
<TD><%=rs.getString(5)%></TD>
<TD><%=rs.getInt(6)%></TD>
<TD><%=rs.getString(7)%></TD>
<TD><%=rs.getString(8)%></TD>
<TD><%=rs.getInt(9)%></TD>
<TD><%=rs.getString(10)%></TD>
<TD><%=rs.getString(11)%></TD>
</TR>
				
				
				
			<%	
			}
		
		
	%>
	
	</table>
</body>
</html>