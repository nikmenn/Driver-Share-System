<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>        
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Rate Driver</title>
</head>
<body>
<%
	try {	
		String userid = (String)session.getAttribute( "userid" );
		String driver = (String)session.getAttribute("driver");
		
		String url = "jdbc:mysql://group28.caxv2nuxlyui.us-east-1.rds.amazonaws.com:3306/db28";
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection con = DriverManager.getConnection(url, "user28", "group28pass");
		Statement stmt = con.createStatement();
		
		String query = "SELECT ridesGiven, driverRating FROM registeredUsers WHERE Username = '"+driver+"'";
		
		ResultSet resultset = stmt.executeQuery(query);
		while (resultset.next()) {
		int ridesGiven = resultset.getInt("ridesGiven");
		float driverRating = resultset.getFloat("driverRating");
		
		String rating = request.getParameter("rating"); 
		int result = Integer.parseInt(rating);
		
		float newRating = ((driverRating + result) / ridesGiven);
		
		String update = "UPDATE registeredUsers SET driverRating = ? WHERE Username = ?";
		PreparedStatement ps = con.prepareStatement(update);
		
		ps.setFloat(1, newRating);
		ps.setString(2, driver);
		
		ps.executeUpdate();
		
		String comm = request.getParameter("comment"); 
		
		String insert = "INSERT INTO commentTable(Username, Comment)"
				+ "VALUES (?, ?)";
		PreparedStatement pstwo = con.prepareStatement(insert);
		
		pstwo.setString(1, driver);
		pstwo.setString(2, comm);
		
		pstwo.executeUpdate();
		
		
		
		}
	
		
		
		con.close();
		
		%>
		<jsp:forward page="home.jsp"></jsp:forward>
		<%
		
		}catch (Exception ex) {
			out.print(ex);
		}
	%>

</body>
</html>