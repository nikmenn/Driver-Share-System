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
		
		Statement stmt = con.createStatement();
		
		String driver = request.getParameter("driver");
		String date = request.getParameter("date");
		String time = request.getParameter("time");
		
		String query = "SELECT Username, Date, Time FROM offerGiven WHERE offerGiven.Passenger = '"+userid+"'";
		ResultSet resultset = stmt.executeQuery(query);
		
		while (resultset.next()) {
			if (driver.equals(resultset.getString("Username")) && date.equals(resultset.getString("Date"))
					&& time.equals(resultset.getString("Time"))){
				String insert = "INSERT INTO acceptedOffers(Driver, Passenger, Date, Time)"
						+ "VALUES (?, ?, ?, ?)";
			
				PreparedStatement ps = con.prepareStatement(insert);
				
				ps.setString(1, driver);
				ps.setString(2, userid);
				ps.setString(3, date);
				ps.setString(4, time);
	
				ps.executeUpdate();
				
				String updateOne = "UPDATE registeredUsers SET ridesGiven = ridesGiven + 1 WHERE Username = ?";
				PreparedStatement psOne = con.prepareStatement(updateOne);
				psOne.setString(1,driver);
				
				psOne.executeUpdate();
				
				String updateTwo = "UPDATE registeredUsers SET ridesTaken = ridesTaken + 1 WHERE Username = ?";
				PreparedStatement psTwo = con.prepareStatement(updateTwo);
				psTwo.setString(1,userid);
				
				psTwo.executeUpdate();
				
				session.setAttribute("driver",driver);
				
				String delete = "DELETE FROM offerGiven WHERE Username = ? and Passenger = ? and Date = ? and Time = ?";
                PreparedStatement psthree = con.prepareStatement(delete);
				
				psthree.setString(1, driver);
				psthree.setString(2, userid);
				psthree.setString(3, date);
				psthree.setString(4, time);
				
				psthree.executeUpdate();
				
				
				
			}
		}
		con.close();
		%>
		
		<jsp:forward page="ratingScreen.jsp"></jsp:forward>	
		<%
	
	}catch (Exception ex) {
		out.print(ex);
	}
%>
</body>
</html>