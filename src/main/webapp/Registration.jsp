<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action="index.jsp" method="post">
		ID: <input type="number" name="userId" /> <br> <br>
		Username: <input type="text" name="userName" /> <br> <br>
		FirstName: <input type="text" name="firstName" /> <br> <br> 
		LastName: <input type="text" name="lastName" /> <br> <br>
		E-mail: <input type="email" name="userEmail" /> <br> <br> 
		Age: <input type="number" name="userAge" /> <br> <br> 
		Address: <input type="text" name="userAddress" /> <br> <br> 
		MobileNumber: <input type="number" name="userNumber" /> <br> <br> 
		Password: <input type="password" name="userPassword" /> <br> <br> 
		Re-Enter Password: <input type="password" name="userRepassword" /> <br> <br> 
		<input type="submit"/>
	</form>
	
	
</body>
</html>