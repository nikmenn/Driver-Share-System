<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>      
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Leaderboard</title>
</head>
<body>
  <a href = "home.jsp">Home</a>
<%
	try {	
		String url = "jdbc:mysql://group28.caxv2nuxlyui.us-east-1.rds.amazonaws.com:3306/db28";
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection con = DriverManager.getConnection(url, "user28", "group28pass");
		
		Statement stmt = con.createStatement();
		
		String query = "SELECT Username, RidesGiven, driverRating FROM db28.registeredUsers Where ridesGiven > 0 ORDER BY ridesGiven DESC";
		
		out.print("<h1>Driver Leaderboard</h1>");
		out.print("<table>");

		//make a row
		out.print("<tr>");
		//make a column
		out.print("<td>");
		out.print("Username");
		out.print("</td>");
		
		out.print("<td>");
		out.print("Rides Given");
		out.print("</td>");
		
		out.print("<td>");
		out.print("Driver Rating");
		out.print("</td>");
		
		
		
		out.print("</tr>");
		
		
		ResultSet resultset = stmt.executeQuery(query);
		
		while (resultset.next()) {
			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			out.print(resultset.getString("Username"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(resultset.getString("RidesGiven"));
			out.print("</td>");
			
			
			out.print("<td>");
			out.print(resultset.getString("driverRating"));
			out.print("</td>");
			
			out.print("</tr>");
		}
		out.print("</table>");
		
		
String pass = "SELECT Username, ridesTaken, passengerRating FROM db28.registeredUsers Where ridesTaken > 0 ORDER BY ridesTaken DESC";
		
		out.print("<h1>Passenger Leaderboard</h1>");
		out.print("<table>");

		//make a row
		out.print("<tr>");
		//make a column
		out.print("<td>");
		out.print("Username");
		out.print("</td>");
		
		out.print("<td>");
		out.print("Rides Taken");
		out.print("</td>");
		
		out.print("<td>");
		out.print("Passenger Rating");
		out.print("</td>");
		
		
		
		out.print("</tr>");
		
		
		ResultSet rs = stmt.executeQuery(pass);
		
		while (rs.next()) {
			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			out.print(rs.getString("Username"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(rs.getString("ridesTaken"));
			out.print("</td>");
			
			
			out.print("<td>");
			out.print(rs.getString("passengerRating"));
			out.print("</td>");
			
			out.print("</tr>");
		}
		out.print("</table>");
	
		con.close();
		
	
			
		
	
	}catch (Exception ex) {
		out.print(ex);
	}
%>
</body>
</html>