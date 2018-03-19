<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>      
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Offers for you</title>
</head>
<body>
  <a href = "home.jsp">Home</a>
<%
	try {	
		String userid = (String)session.getAttribute( "userid" );
		String url = "jdbc:mysql://group28.caxv2nuxlyui.us-east-1.rds.amazonaws.com:3306/db28";
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection con = DriverManager.getConnection(url, "user28", "group28pass");
		
		Statement stmt = con.createStatement();
		
		String query = "SELECT * FROM offerGiven WHERE offerGiven.Passenger = '"+userid+"'";
		
		out.print("<table>");

		//make a row
		out.print("<tr>");
		//make a column
		out.print("<td>");
		out.print("Offer from Driver");
		out.print("</td>");
		
		out.print("<td>");
		out.print("Date");
		out.print("</td>");
		
		out.print("<td>");
		out.print("Time");
		out.print("</td>");
		
		out.print("<td>");
		out.print("Car");
		out.print("</td>");
		
		out.print("<td>");
		out.print("Number of Passengers");
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
			out.print(resultset.getString("Date"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(resultset.getString("Time"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(resultset.getString("carName"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(resultset.getString("numPassengers"));
			out.print("</td>");
		
			
			out.print("</tr>");
		}
		out.print("</table>");
		
		String rating = "SELECT registeredUsers.driverRating, registeredUsers.Username FROM registeredUsers, offerGiven WHERE offerGiven.Username = registeredUsers.Username and  offerGiven.Passenger = '"+userid+"'";
	    
		out.print("<table>");
		out.print("<tr>");
		
		out.print("<td>");
		out.print("Driver");
		out.print("</td>");
		
		out.print("<td>");
		out.print("Rating");
		out.print("</td>");
		
		
		out.print("</tr>");
		
		ResultSet rs = stmt.executeQuery(rating);
        while (rs.next()) {
			
			out.print("<tr>");
			out.print("<td>");
			out.print(rs.getString("Username"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(rs.getFloat("driverRating"));
			out.print("</td>");
			
			out.print("</tr>");
		
			
		
		}
		
		out.print("</table>");
		
		
		con.close();
		
	
			
		
	
	}catch (Exception ex) {
		out.print(ex);
	}
%>
<form method="post" action="acceptOffer.jsp">
Accept Username <input type="text" name = "driver">'s offer on <input type = "text" name = "date" > at time <input type = "text" name = "time" >?
<input type= "submit" value = "Submit">
</form>
</body>
</html>