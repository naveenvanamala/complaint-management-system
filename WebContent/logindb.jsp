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
String pwd=request.getParameter("pwd");
String utype=request.getParameter("utype");
System.out.println(name+pwd+utype);
HttpSession session1=request.getSession(true);
session1.setAttribute("n", name);
session1.setAttribute("p", pwd);

try
{
	Class.forName("oracle.jdbc.OracleDriver");

	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","naveen");
	
	PreparedStatement stmt=con.prepareStatement("select * from users where uname='"+name+"' and password='"+pwd+"' and status='aproved' and type='"+utype+"'");
	ResultSet r=stmt.executeQuery();
	if(r.next())
	{
		if(utype.equals("admn")){
			%>
			<jsp:forward page="admin_home.jsp"></jsp:forward>
			<%
		}
		else if(utype.equals("sp"))
		{
			%>
			<jsp:forward page="service_provider.jsp"></jsp:forward>
			<%
		}
		else //if(utype.equals("user"))
		{
		%>
		<jsp:forward page="complaints.jsp"></jsp:forward>
		<% 
		}
		
	}
	else
	{
		
		%>
		
		<jsp:include page="login.jsp"></jsp:include>
		<script type="text/javascript">
		alert("login failed!!");
		</script>
		<%
	}
}
catch (Exception e) {
		System.out.println(e);
%>
		
		<jsp:include page="login.jsp"></jsp:include>
		<script type="text/javascript">
		alert("login failed");
		</script>
		<%
}

%>
</body>
</html>