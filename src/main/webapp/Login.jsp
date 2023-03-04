<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.servlet.annotation.WebServlet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action="log" method="post">
		Username: <input type="text" name="userName" /> <br> <br>
		Password: <input type="password" name="userPassword" /> <br> <br> 
		Re-Enter Password: <input type="password" name="userRepassword" /> <br> <br>
		
		<input type="submit"/>
	</form>
	
	
</body>
</html>