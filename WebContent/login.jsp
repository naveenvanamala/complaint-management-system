<%@include file="home.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>CRM</title>
<style>
form {
    border: 3px solid #f1f1f1;
}

input[type=text], input[type=password], select {
    width: 100%;
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
    width: 100%;
}



#login-form {
	background-color 	: white;
	width 			: 300px;	
	height 			: 200px;
	border-radius  		: 5px;
	padding			: 30px;
	
}

button:hover {
    opacity: 0.8;
}

.imgcontainer {
    text-align: center;
    margin: 24px 0 12px 0;
}
.container {
    padding: 16px;
}

img.avatar {
    width: 40%;
    border-radius: 50%;
}





</style>
</head>
<body>

<h2>Login Page</h2>
<center>
<div id="login-form" >
<form action="logindb.jsp" method="post">
<div class="imgcontainer">
    <img src="images.jpe" alt="Avatar" class="avatar">
</div>

<div class="container">
    <label ><b >Username</b></label>
    <input type="text" placeholder="Enter Username" name="uname" required>

    <label><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="pwd" required>
<select name="utype">
<option value="admn">admin</option>
<option value="user">user</option>
<option value="sp">service provider</option>
</select>
<input type="submit" value="submit"><br/>
<a href="signup.jsp">sign up</a>
</div>

</form>

</div>
</center>
</body>
</html>
