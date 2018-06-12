<%@page import="java.io.PrintWriter"%>
<%@page import="java.security.interfaces.RSAKey"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="complaints.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CRM</title>
<style>
table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 75%;
}

td, th {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
}

tr:nth-child(even) {
    background-color: #dddddd;
}
</style>
</head>
<body>

<% 
HttpSession session1=request.getSession(true); 
String name=(String)session1.getAttribute("n");
PrintWriter o=response.getWriter();
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");

	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","naveen");
	
	PreparedStatement stmt=con.prepareStatement("select complaint_id,status,time,curr_date from complaints where uname='"+name+"'");
	ResultSet rs=stmt.executeQuery();
	%><br><br>
	<table border=0 cellspacing="10">
	<tr style="background-color:#333;color: white;">
	<td>Complaint_id</td>
	<td>Status</td>
	<td>Time</td>
	<td>Date</td>
	</tr>
	<%
	while(rs.next())
	{
		%>
			<tr>
			<td><%= rs.getInt(1)%></td>
			<td><%= rs.getString(2)%></td>
			<td><%= rs.getTime(3)%></td>
			<td><%= rs.getDate(4)%></td>
			</tr>	
		<%
	}

}
catch (Exception e) {
		
		System.out.println(e);
}
%>

</table>
</body>



</html>