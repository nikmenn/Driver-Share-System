<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Total Rides Made By Destination</title>
</head>
<body>
	<%
	try {	
		String userid = (String)session.getAttribute( "userid" );
		String url = "jdbc:mysql://group28.caxv2nuxlyui.us-east-1.rds.amazonaws.com:3306/db28";
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection con = DriverManager.getConnection(url, "user28", "group28pass");
		
		Statement stmt = con.createStatement();
		String destination = request.getParameter("destination");
		String query = "SELECT Count(*) FROM driverOffer INNER JOIN acceptedOffers ON acceptedOffers.Driver = driverOffer.Username AND acceptedOffers.Date = driverOffer.Date AND acceptedOffers.Time = driverOffer.depTime Where driverOffer.Destination = '"+destination+"'";
		ResultSet resultset = stmt.executeQuery(query);
		
		while (resultset.next()) {
			out.print(resultset.getInt("COUNT(*)"));
		}
	
		con.close();
	}catch (Exception ex) {
		out.print(ex);
	}
%>
</body>
</html>
