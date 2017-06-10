<%@page import="monfox.toolkit.snmp.agent.modules.SnmpV2Mib.SysOREntry"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %> 
   <%@page import=" java.sql.Connection,java.sql.DriverManager,java.sql.ResultSet,java.sql.SQLException,java.sql.Statement" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Bill</title>
</head>
<body>
<%-- <%
String billid=request.getParameter("billid");

			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521:xe",
					"system",
					"system");
	String query="select appid,firstname,lastname,age,dob,mobileno,pno,docname,tname,amt,duration from testDatabase t,booking b,PatientAppForm p where fk_appid=p.appid and t.tid=b.fk_tid and b.bid=?";
							
			PreparedStatement ps=con.prepareStatement(query);
				
				ps.setString(1,billid);
				
				
				ResultSet rs=ps.executeQuery(); 
				
				%>
				
				<center><h1>AKASH DIAGNOSTIC CENTER</h1></center>
				
				
				Patient ID:<%=rs.getString(1)%>
				Patient Name:<%=rs.getString(2)%> <%=rs.getString(3)%>
				Age:<%=rs.getInt(4)%>
				Date of Birth:<%=rs.getString(5)%>
				Contact:<%=rs.getInt(6)%>
				<br><br><br>
				
			<table border="2" width="1000" height="50">
<tr>
<th>Prescription Number</th>
<th> Referred By</th>
<th>Test</th>
<th>Amount(in INR)</th>
</tr>

	
			
			
				
				
<TR>
<TD><%=rs.getString(7)%></TD>
<TD><%=rs.getString(8)%></TD>
<TD><%=rs.getString(9)%></TD>
<TD><%=rs.getInt(10)%></TD>
</TR>
				
				
				
			
	<h1>NOTE:REPORT WILL BE DELIVERED AFTER<%=rs.getString(11)%>hrs</h1> --%>


<% 
String billid=request.getParameter("billid");

Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection(
		"jdbc:oracle:thin:@localhost:1521:xe",
		"system",
		"system");

String query1="select appid,firstname,lastname,age,dob,mobileno from PatientAppForm p,booking b where b.fk_appid=p.appid and b.bid=?";


PreparedStatement ps1=con.prepareStatement(query1);

ps1.setString(1,billid);


ResultSet rs1=ps1.executeQuery(); 
while(rs1.next()){%>
	<h3><b>Patient ID: <%=rs1.getString(1) %><br>
	Patient Name: <%=rs1.getString(2) %> <%=rs1.getString(3) %><br>
	Age: <%=rs1.getInt(4) %><br>
	Date of Birth: <%=rs1.getString(5) %><br>
	Contact Number: <%=rs1.getInt(6) %></b></h3>
<% }

%>



<% 
String billid1=request.getParameter("billid");




String query2="select pno,docname,tname,amt,duration from PatientAppForm p,testDatabase t,booking b where b.fk_appid=p.appid and b.fk_tid=t.tid and b.bid=?";


PreparedStatement ps2=con.prepareStatement(query2);

ps2.setString(1,billid1);

ResultSet rs2=ps2.executeQuery(); %>
<table border="2" width="1000" height="50">
<tr>
<th>Prescription Number</th>
<th>Referred By:</th>
<th>Test NAME</th>
<th>AMOUNT(in INR)</th>

</tr>

<% while(rs2.next()){%>
<TR>

<TD>	<%=rs2.getString(1) %></TD>
<TD>	 <%=rs2.getString(2) %></TD>
<TD>     <%=rs2.getString(3)%></TD>
<TD>	 <%=rs2.getInt(4)%></TD>

</TR>


<% }

%>

</table>
<%-- <br><br><br><br><br>
<h1><b>NOTE:TEST RESULTS WILL BE AVALIBLE AFTER:<%=rs2.getString(5) %> </b></h1> --%>



<% 
String billid3=request.getParameter("billid");



String query3="select duration from testDatabase t,booking b where b.fk_tid=t.tid and b.bid=?";


PreparedStatement ps3=con.prepareStatement(query3);

ps3.setString(1,billid3);


ResultSet rs3=ps3.executeQuery(); 
while(rs3.next()){%>
	<h1><b>NOTE:TEST RESULTS WILL BE AVALIBLE AFTER:<%=rs3.getString(1)%> hrs</b></h1>
<% }

%>
</body>
</html>