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
		
		String departure = request.getParameter("departure");
		String destination = request.getParameter("destination");
		String depTime = request.getParameter("deptime");
		String isPassenger = "yes"; 
		String date = request.getParameter("date");
		
		String insert = "INSERT INTO passengerRequest(Username, Departure, Destination, Deptime, Date, isPassenger)"
				+ "VALUES (?, ?, ?, ?, ?, ?)";
		
		PreparedStatement ps = con.prepareStatement(insert);
		
		ps.setString(1, userid);
		ps.setString(2, departure);
		ps.setString(3, destination);
		ps.setString(4, depTime);
		ps.setString(5, date);
		ps.setString(6, isPassenger);
		
		ps.executeUpdate();
		
		con.close();
       %>
		
		<jsp:forward page="home.jsp"></jsp:forward>	
		<%
		
	}catch (Exception ex) {
		out.print("Failed");
		out.print(ex);
	}
%>
</body>
</html>