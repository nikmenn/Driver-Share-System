<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Change Driver</title>
</head>
<body>

<%
	try {
		String userid = (String)session.getAttribute( "userid" );
		
		String url = "jdbc:mysql://group28.caxv2nuxlyui.us-east-1.rds.amazonaws.com:3306/db28";
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection con = DriverManager.getConnection(url, "user28", "group28pass");
		
	
	
	   
		String Tpassenger = request.getParameter("Cpassenger");
	    String Tdate = request.getParameter("Cdate");
	    String Ttime = request.getParameter("Ctime");
	    
	    
	    
	    
	    
	    
	   String dele = "DELETE FROM offerGiven WHERE Username = ? and Passenger = ? and Date = ? and Time = ? ";
		
		PreparedStatement ps = con.prepareStatement(dele);
		
		
		ps.setString(1, userid);
		ps.setString(2, Tpassenger);
		ps.setString(3, Tdate);
		ps.setString(4, Ttime);
		
		
		ps.executeUpdate();
		
	  
		%>
		
		<jsp:forward page="home.jsp"></jsp:forward>	
		<%
	   
			con.close();
	
	}catch (Exception ex) {
		out.print(ex);
	}
	
	
%>
</body>
</html>