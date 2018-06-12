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
</head>
<body>
<%
String name=request.getParameter("uname"); 
String pwd=request.getParameter("password");
String utype=request.getParameter("utype");

try{
	Class.forName("oracle.jdbc.driver.OracleDriver");

	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","naveen");
	
	PreparedStatement stmt=con.prepareStatement("insert into users(uname,password,type) values('"+name+"','"+pwd+"','"+utype+"')");
	int r=stmt.executeUpdate();	
	if(r>0)
	{
		
		%>
		<jsp:include page="home.jsp"></jsp:include>
			
		<b>registration is pending...</b>
	<% }
	
}
catch (Exception e) {
		System.out.println(e);
		
		%>
		
		<jsp:include page="signup.jsp"></jsp:include>
		<script type="text/javascript">
		alert("user name already exits");
		</script>
		
		<%
}

%>
</body>
</html>