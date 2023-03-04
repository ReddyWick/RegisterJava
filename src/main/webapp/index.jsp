<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PseudoColumnUsage"%>
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
	<form action="">
		<h1>Welcome to my world!!</h1>
		<a href="./Registration.jsp">Register</a>
		<a href="./Login.jsp">Login</a>
	</form>
	
	<%
	String userId = request.getParameter("userId");
	String userName = request.getParameter("userName");
	String firstName = request.getParameter("firstName");
	String lastName = request.getParameter("lastName");
	String userEmail = request.getParameter("userEmail");
	String userAge = request.getParameter("userAge");
	String userAddress = request.getParameter("userAddress");
	String userNumber = request.getParameter("userNumber");
	String userPassword = request.getParameter("userPassword");
	String userRepassword = request.getParameter("userRepassword");
	
	try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project_client", "root", "root");
	PreparedStatement ps = con.prepareStatement("insert into register values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
	
	
	ps.setInt(1, Integer.parseInt(userId));
	ps.setString(2, userName);
	ps.setString(3, firstName);
	ps.setString(4, lastName);
	ps.setString(5, userEmail);
	ps.setInt(6, Integer.parseInt(userAge));
	ps.setString(7, userAddress);
	ps.setInt(8, Integer.parseInt(userNumber));
	ps.setString(9, userPassword);
	ps.setString(10, userRepassword);
	
	if(userPassword.equals(userRepassword)) {
	ps.executeUpdate();
	} else {
		out.print("password not matching, please try again");
	}
	
	} catch(Exception e) {
		e.printStackTrace();		
	}
	%>
</body>
</html>