<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>      
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home</title>
</head>
<body>

<form action="logout.jsp">
    <input type="submit" value="Logout"/>
</form>

<h1>Passenger Options</h1>
<br/>
<a href="passenger.html">Request a ride</a>
<br/>
<a href="changePassenger.jsp">Update/Delete a request</a>
<br/>
<a href="offersSubmitted.jsp"> See Offers for a ride</a>
<br/>

<h1>Driver Options</h1>
<br/>
<a href="car.html">Add Car</a>
<br />
<a href="driver.html">Submit a ride</a>
<br/>
<a href="changeDriver.jsp">Update/Delete a submitted ride</a>
<br/>
<a href="driverMatches.jsp">See Possible Passengers</a>
<br/>
<a href="deloffergiven.jsp">Delete an offer</a>
<br/>
<a href="ratePassenger.html">Rate Passenger</a>
<br/>
<br/>
<a href="driverIncome.jsp">Allocated Income Ratio</a>
<br />

<h1>General Options</h1>
<br/>
<a href="userStatistics.html">User Statistics</a>
<br/>
<a href="change.html">Change User Details</a>
<br />
<a href="leaderboard.jsp">Leaderboard Table</a>
<br/>
<a href="messaging.jsp">Messaging</a>
<br/>
<a href="comments.jsp">Comments on Users</a>
<br/>

<h3>Advertisement:</h3>
<%
	try {	
		String userid = (String)session.getAttribute( "userid" );
		String url = "jdbc:mysql://group28.caxv2nuxlyui.us-east-1.rds.amazonaws.com:3306/db28";
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection con = DriverManager.getConnection(url, "user28", "group28pass");
		
		Statement stmt = con.createStatement();
		
		String query = "SELECT * FROM adTable;";
		out.print("<table>");

		
		
		ResultSet resultset = stmt.executeQuery(query);
		
		while (resultset.next()) {
			
			out.print("<tr>");
			out.print("<td>");
			out.print(resultset.getString("Advertisement"));
			out.print("</td>");
			
			String newAd = resultset.getString("Advertisement");
			int displayed = resultset.getInt("Amount");
			int newDisplayed = displayed + 1;
			
			String update = "UPDATE adTable SET Amount = ? WHERE Advertisement = ?";
			
			PreparedStatement ps = con.prepareStatement(update);
			
			ps.setInt(1, newDisplayed);
			ps.setString(2, newAd);
			
			ps.executeUpdate();
		}
		out.print("</table>");
	
		con.close();
		
	
			
		
	
	}catch (Exception ex) {
		out.print(ex);
	}
%>
</body>
</html>