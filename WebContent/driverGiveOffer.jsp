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
		
		String passenger = request.getParameter("passenger");
		String date = request.getParameter("date");
		String time = request.getParameter("time");
		String car = request.getParameter("car");
		String num = request.getParameter("num");
		int numPass = Integer.parseInt(num);

		
		String query = "SELECT passengerRequest.Username, passengerRequest.Date, passengerRequest.Deptime FROM driverOffer, passengerRequest WHERE driverOffer.Date = passengerRequest.Date and driverOffer.Deptime = passengerRequest.Deptime and driverOffer.Departure = passengerRequest.Departure  and driverOffer.Destination = passengerRequest.Destination and passengerRequest.isPassenger = 'yes' and passengerRequest.Username <> '"+userid+"'";
		
		ResultSet resultset = stmt.executeQuery(query);
		
		while (resultset.next()) {
			if (passenger.equals(resultset.getString("Username")) && date.equals(resultset.getString("Date"))
					&& time.equals(resultset.getString("Deptime"))){
				String insert = "INSERT INTO offerGiven(Username, Passenger, Date, Time, carName, numPassengers)"
						+ "VALUES (?, ?, ?, ?, ?, ?)";
			
				PreparedStatement ps = con.prepareStatement(insert);
				
				ps.setString(1, userid);
				ps.setString(2, passenger);
				ps.setString(3, date);
				ps.setString(4, time);
				ps.setString(5, car);
				ps.setInt(6, numPass);
	
				ps.executeUpdate();
			}
		}
				
			
				con.close();
		
				%>
				<jsp:forward page="driverMatches.jsp"></jsp:forward>
				<%
	
	}catch (Exception ex) {
		out.print(ex);
	}
%>
</body>
</html>