<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CRM</title>
<style>
table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 50%;
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
<jsp:include page="admin_home.jsp"></jsp:include>
<%
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");

	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","naveen");
	
	PreparedStatement stmt=con.prepareStatement("select uname,type from users");
	ResultSet rs=stmt.executeQuery();
	%>
	<form action="delete.jsp">
	<br><br>
	<table border="1px" >
	<tr style="background-color:#333;color: white;">
	<td></td>
	<td>User Name</td>
	<td>Type of user</td>
	
	</tr>
	<%	
	while(rs.next())
	{
		
	%>
			<tr>
			<td><input type="checkbox" name="name" value=<%= rs.getString(1)%>></td>
						
			<td><%= rs.getString(1)%></td>
			<td><%= rs.getString(2)%></td>
			</tr>	
	<%} %>	
	</table>
	<input type="submit" value="delete"/>
	
	</form>
	
	<%
	
}
catch(Exception e) {
		
		System.out.println(e);
}
%>
</body>
</html>