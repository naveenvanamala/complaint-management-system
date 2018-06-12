<%@page import="java.io.PrintWriter"%>
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
String []name=request.getParameterValues("name");
System.out.println(name);

try{
	Class.forName("oracle.jdbc.driver.OracleDriver");

	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","naveen");
	if(name != null){
		for(int i=0;i<name.length;i++){
	PreparedStatement stmt=con.prepareStatement("delete from users where uname='"+name[i]+"'");
	int r=stmt.executeUpdate();
	if(r>0)
	{
		%>
		<jsp:forward page="admin_home.jsp"></jsp:forward>
		deleted successfully
		<%
	}
	else{
		%>
	<jsp:forward page="admin_home.jsp"></jsp:forward>
	deletion failed!!!!!
	<%
	}
	}
	}
	
	%>
	<jsp:forward page="admin_home.jsp"></jsp:forward>
	<%
	
}
catch (Exception e) {
		System.out.print(e);
		%>
		<jsp:forward page="admin_home.jsp"></jsp:forward>
		<p>some error in deleting</p>
		<%
}



%>
</body>
</html>