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
		String userid = (String)session.getAttribute( "userid" );
	
		String url = "jdbc:mysql://group28.caxv2nuxlyui.us-east-1.rds.amazonaws.com:3306/db28";
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection con = DriverManager.getConnection(url, "user28", "group28pass");
		
		String newModel = request.getParameter("model");
		String newlicense = request.getParameter("license");
	
		
		String insert = "INSERT INTO cars(Username, carName, License)"
				+ "VALUES (?, ?, ?)";
		
		PreparedStatement ps = con.prepareStatement(insert);
		
		ps.setString(1, userid);
		ps.setString(2, newModel);
		ps.setString(3, newlicense);
		
		ps.executeUpdate();
		
		con.close();
		%>
		<jsp:forward page="car.html"></jsp:forward>
		<%
	
	}catch (Exception ex) {
		out.print("Couldn't add car");
	}
%>
 
  
</body>
</html>