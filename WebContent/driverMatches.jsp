<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>      
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Driver Matches</title>
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
		
		String query = "SELECT passengerRequest.Username, passengerRequest.Date,  passengerRequest.Departure, passengerRequest.Destination, passengerRequest.Deptime FROM driverOffer, passengerRequest WHERE driverOffer.Date = passengerRequest.Date and driverOffer.Deptime = passengerRequest.Deptime and driverOffer.Departure = passengerRequest.Departure  and driverOffer.Destination = passengerRequest.Destination and passengerRequest.isPassenger = 'yes' and passengerRequest.Username <> '"+userid+"'";
		
		out.print("<table>");

		//make a row
		out.print("<tr>");
		//make a column
		out.print("<td>");
		out.print("Possible Passenger");
		out.print("</td>");
		
		out.print("<td>");
		out.print("Date");
		out.print("</td>");
		
		out.print("<td>");
		out.print("Departure");
		out.print("</td>");
		
		out.print("<td>");
		out.print("Destination");
		out.print("</td>");
		
		out.print("<td>");
		out.print("Time");
		out.print("</td>");
		
		
		out.print("</tr>");
		
		
		ResultSet resultset = stmt.executeQuery(query);
		
		
		while (resultset.next()) {
			out.print("<tr>");
			//make a column
			out.print("<td>");
			out.print(resultset.getString("Username"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(resultset.getString("Date"));
			out.print("</td>");
			
			
			out.print("<td>");
			out.print(resultset.getString("Departure"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(resultset.getString("Destination"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(resultset.getString("Deptime"));
			out.print("</td>");
			
		}
       
		out.print("</table>");
		
		
		String rating = "SELECT registeredUsers.passengerRating, registeredUsers.Username FROM registeredUsers, passengerRequest, driverOffer WHERE driverOffer.Date = passengerRequest.Date and driverOffer.Deptime = passengerRequest.Deptime and driverOffer.Departure = passengerRequest.Departure  and driverOffer.Destination = passengerRequest.Destination and passengerRequest.Username = registeredUsers.Username and passengerRequest.isPassenger = 'yes' and passengerRequest.Username <> '"+userid+"'";
		
		out.print("<table>");
		out.print("<tr>");
		
		out.print("<td>");
		out.print("Passenger");
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
			out.print(rs.getFloat("passengerRating"));
			out.print("</td>");
			
			out.print("</tr>");
		
			
		
		}
		
		out.print("</table>");
		
		con.close();
		
	
	}catch (Exception ex) {
		out.print(ex);
	}
%>
<form method="post" action="driverGiveOffer.jsp">
Offer Username: <input type="text" name = "passenger"> a ride on <input type = "text" name = "date" > at time <input type = "text" name = "time" >?
<br />
What car will you be using? <input type="text" name = "car"><br />
Number of passengers? <input type="text" name = "num"><br />
<input type= "submit" value = "Submit">
</form>

<form method ="post">
<input type="checkbox" name="vehicle" value="Bike">Recurring Monthly<br/>
<input type="checkbox" name="vehicle" value="Car">Recurring Weekly<br/>
<input type="checkbox" name="vehicle" value="Car">Recurring Yearly<br/>
</form>

</body>
</html>