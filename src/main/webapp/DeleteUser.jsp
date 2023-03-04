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
		String idnumber1 = request.getParameter("idNumber1");
		try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project_client", "root", "root");
		PreparedStatement ps = con.prepareStatement("Delete FROM register where ID =?");
		
		ps.setInt(1, Integer.parseInt(idnumber1));
		
		ps.execute();
		} catch(Exception e) {
			e.printStackTrace();
		}
		out.print("Successfully deleted data with id "+idnumber1);
		RequestDispatcher rd = request.getRequestDispatcher("Home.jsp");
		rd.include(request, response);
	%>
</body>
</html>