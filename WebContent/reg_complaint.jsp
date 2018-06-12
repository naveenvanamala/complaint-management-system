<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="complaints.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CRM</title>
<style>
form {
    border: 3px solid #f1f1f1;
}

textarea{
width:80%;
padding-left: 10px;}

select {
    width: 90%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
}
button, input[type=submit] {
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 90%;
	}
#comp {
	background-color 	: white;
	width 			: 300px;	
	height 			: 200px;
	border-radius  		: 5px;
	padding			: 30px;
	
	
}
</style>
</head>
<body><center>
<% HttpSession session1=request.getSession(true); %>
<div id="comp" align="center">
<form action="reg_complaintdb.jsp">
Complaint Box:<textarea class "cols="50" rows="5" name="msg" ></textarea><br/>
Complaints Type:<select name="complaint_type">
<option value="Tech">Techincal</option>
<option value="Fun">Functional</option>
<option value="none">None</option>
</select><br/>
email:<input type="email" name="to" required>
<br><input type="submit"  value="Register your complaint"/><br>
</form>
</div>
</center>
</body>
</html>