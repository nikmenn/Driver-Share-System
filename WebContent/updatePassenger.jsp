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
		
	
	
	   
		String Tdep = request.getParameter("Cdepart");
	    String Tdate = request.getParameter("Cdate");
	    String Ttime = request.getParameter("Ctime");
	    String Tdes = request.getParameter("Cdeparture");
	    
	    
	    String xdep = request.getParameter("Udepart");
	    String xdate = request.getParameter("Udate");
	    String xtime = request.getParameter("Utime");
	    String xdes = request.getParameter("Udestination");
	    String xdelete = request.getParameter("del");
	    
	    
	    if(xdelete.equals("yes") ) {
	        String dele = "DELETE FROM passengerRequest WHERE Username = ? and Date = ? and Deptime = ? ";
		
		PreparedStatement ps = con.prepareStatement(dele);
		
		
		ps.setString(1, userid);
		
		ps.setString(2, Tdate);
		ps.setString(3, Ttime);
		
		
		ps.executeUpdate();
		
	    } else {
	  
	        String update = "UPDATE passengerRequest SET Departure = ?, Date = ?, Deptime = ?, Destination = ? WHERE Username = ? and Date = ? and Deptime = ?";
		
		PreparedStatement ps = con.prepareStatement(update);
		
		
		ps.setString(1, xdep);
		ps.setString(2, xdate);
		ps.setString(3, xtime);
		ps.setString(4, xdes);
		ps.setString(5, userid);
		ps.setString(6, Tdate);
		ps.setString(7, Ttime);
		
		
		ps.executeUpdate();
		
	    }
	    
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