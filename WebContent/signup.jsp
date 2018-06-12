<%@include file="home.jsp" %>
<!DOCTYPE html>


<html>
<head>
	
	<title>CRM</title>
	<style>
	input[type=text], input[type=password], select {
    width: 90%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
   
	}

	
	#login-form {
	background-color 	: white;
	width 			: 300px;	
	height 			: 200px;
	border-radius  		: 10px;
	padding			: 30px;
	
}
	form {
    border: 1px solid #ddd;
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
		
	</style>
	</head>
	<body ><p align="center">
	<h2>Registration Form</h2>
	
		<center>
		<div id="login-form" align="center">
		<form action="signupdb.jsp" method="post">
		
		<input type="text" placeholder="User Name" name="uname" ></input><br>
		
		<input type="password" placeholder="password(MAX-LENGTH=10)" name="password" maxlength=10></input><br>
		<input type="password" placeholder="enter password again(MAX-LENGTH=10)" name="rpassword" maxlength=10></input><br>
		
		<select id=utype name="utype">
		
		<option value="user">user</option>
		<option value="sp">service provider</option>
		</select>
		
		
		<input type="Submit" name="btn" value="Submit"><br>
		
		</form>
		</div></center>
		</p></body>

</html>