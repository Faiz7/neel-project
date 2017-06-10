<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import ="java.sql.*"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Staff</title>
</head>
<body>
<%

String frname=request.getParameter("firstname");
String lsname=request.getParameter("lastname");
String gen=request.getParameter("gender");
String qua=request.getParameter("qualification");
String addr=request.getParameter("add");
String dob=request.getParameter("dob");
int num=Integer.parseInt(request.getParameter("mobileno"));
String id=request.getParameter("iden");



Class.forName("oracle.jdbc.driver.OracleDriver");

Connection con=DriverManager.getConnection(
		"jdbc:oracle:thin:@localhost:1521:xe",
		"system",
		"system");

PreparedStatement pspmt=con.prepareStatement("insert into staffDetails values(?,?,?,?,?,?,?,?)");
pspmt.setString(1,id);
pspmt.setString(2,frname);
pspmt.setString(3,lsname);
pspmt.setString(4,gen);
pspmt.setString(5,dob);
pspmt.setString(6,qua);
pspmt.setInt(7,num);
pspmt.setString(8,addr);

int i=pspmt.executeUpdate();

if(i>0){
	RequestDispatcher rd=request.getRequestDispatcher("StaffAddedSuccessful.html");
	rd.forward(request, response);
}else
{
	RequestDispatcher rd=request.getRequestDispatcher("AddStaffForm.html");
	rd.forward(request, response);
	
	}


pspmt.close();

%>
</body>
</html>
</body>
</html>