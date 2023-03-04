<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		String idnumber2 = request.getParameter("idNumber2");
		
		try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project_client", "root", "root");
		PreparedStatement ps1 = con.prepareStatement("select * from register where id =?");
		ps1.setInt(1, Integer.parseInt(idnumber2));
		ResultSet rs = ps1.executeQuery();
		while(rs.next()) {
			%>
			<form action="updated" method="post">
			ID: <input type="number" name="userId" value="<%= rs.getInt("ID") %>" /> <br> <br>
			Username: <input type="text" name="userName" value="<%= rs.getString("username") %>" /> <br> <br>
			FirstName: <input type="text" name="firstName" value="<%= rs.getString("firstname") %>" /> <br> <br> 
			LastName: <input type="text" name="lastName" value="<%= rs.getString("lastname") %>" /> <br> <br>
			E-mail: <input type="email" name="userEmail" value="<%= rs.getString("email") %>" /> <br> <br> 
			Age: <input type="number" name="userAge" value="<%= rs.getInt("age") %>" /> <br> <br> 
			Address: <input type="text" name="userAddress" value="<%= rs.getString("address") %>" /> <br> <br> 
			MobileNumber: <input type="number" name="userNumber" value="<%= rs.getInt("mobilenumber") %>" /> <br> <br>
			<input type="submit"/>
		</form>
		
		<%
		ps1.executeUpdate();	
		}
		} catch(Exception e) {
			e.printStackTrace();
		}
		%>
	
	
	
</body>
</html>