<%@page import="java.sql.ResultSet"%>
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
	
	<%
		String idnumber = request.getParameter("idNumber");
		try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project_client", "root", "root");
		PreparedStatement ps = con.prepareStatement("select * from register where id =?");
		
		ps.setInt(1, Integer.parseInt(idnumber));
		
		
		ResultSet rs = ps.executeQuery();
		
		while(rs.next()) {
			
			out.println(rs.getInt("ID"));
			out.println(rs.getString("username"));
			out.println(rs.getString("firstname"));
			out.println(rs.getString("lastname"));
			out.println(rs.getString("email"));
			out.println(rs.getInt("age"));
			out.println(rs.getString("address"));
			out.println(rs.getInt("mobilenumber"));
		}
		} catch(Exception e) {
			e.printStackTrace();
		}
	%>
	<br>
	<a href="./Home.jsp">Home</a>
</body>
</html>