<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
   <%@page import="java.io.IOException" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>List Of Tests</title>
</head>
<body>
<% 
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521:xe",
					"system",
					"system");

			String query="select tid,tname,amt,duration from testDatabase";

			Statement st=con.createStatement();

			ResultSet rs=st.executeQuery(query);%>
			<table border="2" width="1000" height="50">
<tr>
<th>TEST ID</th>
<th>TEST NAME</th>
<th>AMOUNT</th>
<th>TIME TO GET RESULTS(IN HOURS)</th>

</tr>

	
			
			<% while(rs.next()){%>
				
				
<TR>
<TD><%=rs.getString(1)%></TD>
<TD><%=rs.getString(2)%></TD>
<TD><%=rs.getInt(3)%></TD>
<TD><%=rs.getString(4)%></TD>

</TR>
				
				
				
			<%	
			}
		
		
	%>
	
	</table>
</body>
</html>