<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Rides Taken By Semester</title>
</head>
  <a href = "home.jsp">Home</a>
<body>
<%
	try {	
		String userid = (String)session.getAttribute( "userid" );
		String url = "jdbc:mysql://group28.caxv2nuxlyui.us-east-1.rds.amazonaws.com:3306/db28";
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection con = DriverManager.getConnection(url, "user28", "group28pass");
		
		Statement stmt = con.createStatement();
		int semester = Integer.parseInt(request.getParameter("semester"));
		String query = "SELECT COUNT(*) FROM acceptedOffers WHERE Extract(QUARTER FROM acceptedOffers.Date) = '"+semester+"' and acceptedOffers.Passenger = '"+userid+"'";
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