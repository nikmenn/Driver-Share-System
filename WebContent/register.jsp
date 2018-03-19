<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	try {
	
		String url = "jdbc:mysql://group28.caxv2nuxlyui.us-east-1.rds.amazonaws.com:3306/db28";
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection con = DriverManager.getConnection(url, "user28", "group28pass");
		
		String newUser = request.getParameter("username");
		String newPass = request.getParameter("password");
		String newEmail = request.getParameter("email");
		String newName = request.getParameter("name");
		String newAddress = request.getParameter("address");
		String newPhone = request.getParameter("phone");
		
		
		String insert = "INSERT INTO registeredUsers(Username, Password, Email, Name, Address, Phone)"
				+ "VALUES (?, ?, ?, ?, ?, ?)";
		
		PreparedStatement ps = con.prepareStatement(insert);
		
		ps.setString(1, newUser);
		ps.setString(2, newPass);
		ps.setString(3, newEmail);
		ps.setString(4, newName);
		ps.setString(5, newAddress);
		ps.setString(6, newPhone);
		
	
		
		ps.executeUpdate();
		
		con.close();
		out.print("Registered Succesfully");
		%>
		<jsp:forward page="login.html"></jsp:forward>
		<%
	
	}catch (Exception ex) {
		out.print(ex);
		out.print("Registration Failed");
	}
%>

</body>
</html>