<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Total Rides Made By User</title>
</head>
<body>
	<%
	try {	
		String userid = (String)session.getAttribute( "userid" );
		String url = "jdbc:mysql://group28.caxv2nuxlyui.us-east-1.rds.amazonaws.com:3306/db28";
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection con = DriverManager.getConnection(url, "user28", "group28pass");
		
		Statement stmt = con.createStatement();
		String username = request.getParameter("username");
		String query = "SELECT COUNT(*) FROM acceptedOffers Where acceptedOffers.Driver='"+username+"'";
		//PreparedStatement ps = con.prepareStatement(query);
		//ps.setString(1, username);
		ResultSet resultset = stmt.executeQuery(query);
		
		while (resultset.next()) {
			//make a row
			//make a column
			out.print(resultset.getInt("COUNT(*)"));
		}
	
		con.close();
	}catch (Exception ex) {
		out.print(ex);
	}
%>
</body>
</html>