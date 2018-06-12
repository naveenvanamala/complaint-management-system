<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.util.*" %>
<%@ page import="javax.mail.*" %>
<%@ page import="javax.mail.internet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="java.io.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%

String to = request.getParameter("to");//change accordingly
String msg ="your complaint is registered succesfully";

// Sender's email ID needs to be mentioned
String from = "naveenv.vanamala@gmail.com";//change accordingly
final String username = "naveenv.vanamala";//change accordingly
final String password = "vnk@3598";//change accordingly

// Assuming you are sending email through relay.jangosmtp.net
String host = "smtp.gmail.com";

Properties props = new Properties();
props.put("mail.smtp.auth", "true");
props.put("mail.smtp.starttls.enable", "true");

props.put("mail.smtp.host", host);
props.put("mail.smtp.port", "587");

// Get the Session object.
Session ses = Session.getInstance(props,
new javax.mail.Authenticator() {
   protected PasswordAuthentication getPasswordAuthentication() {
      return new PasswordAuthentication(username, password);
   }
});

try {
   // Create a default MimeMessage object.
   Message message = new MimeMessage(ses);

   // Set From: header field of the header.
   message.setFrom(new InternetAddress(from));

   // Set To: header field of the header.
   message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(to));

   // Set Subject: header field
   message.setSubject("complaint registration ack...");

   // Now set the actual message
   message.setText(msg);

   // Send message
   Transport.send(message);



} catch (MessagingException e) {
      throw new RuntimeException(e);
}







HttpSession session1=request.getSession(true); 
String type=request.getParameter("complaint_type"); 
String name=(String)session1.getAttribute("n");
System.out.println(name);
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");

	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","naveen");
	
	PreparedStatement stmt=con.prepareStatement("insert into complaints(uname,complaint_id) values('"+name+"',id.nextval)");
	int r=stmt.executeUpdate();
	%>
	<jsp:forward page="complaints.jsp"></jsp:forward>
	
	<%
}
catch (Exception e) {
		
		System.out.println(e);
}
%>

</body>
</html>