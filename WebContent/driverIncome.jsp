<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>    
       
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Allocated Income</title>
</head>
<body>
 <a href = "home.jsp">Home</a>
The advertising income (ratio) you are allocated is the number from the first table divided by the number in the 2nd table.
<%
	try {	
		String userid = (String)session.getAttribute( "userid" );
		
		String url = "jdbc:mysql://group28.caxv2nuxlyui.us-east-1.rds.amazonaws.com:3306/db28";
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection con = DriverManager.getConnection(url, "user28", "group28pass");
		
		Statement stmt = con.createStatement();
		
		String query = "SELECT * FROM registeredUsers WHERE Username = '"+userid+"'";
		
		out.print("<table>");

		//make a row
		out.print("<tr>");
		//make a column
		out.print("<td>");
		out.print("Rides Given by you");
		out.print("</td>");
		out.print("</tr>");
		
		
		ResultSet resultset = stmt.executeQuery(query);
		
		while (resultset.next()) {
			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			out.print(resultset.getString("ridesGiven"));
			out.print("</td>");
			
			
			out.print("</tr>");
		}
		out.print("</table>");
		
		
     String total = "SELECT SUM(ridesGiven) FROM registeredUsers";
		
		out.print("<table>");

		//make a row
		out.print("<tr>");
		//make a column
		out.print("<td>");
		out.print("Total Rides Given by Every User");
		out.print("</td>");
		out.print("</tr>");
		
		
		ResultSet rs = stmt.executeQuery(total);
		
		while (rs.next()) {
			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			out.print(rs.getInt("SUM(ridesGiven)"));
			out.print("</td>");
			
			
			out.print("</tr>");
		}
		out.print("</table>");
		
		
	
		con.close();
		
	
			
		
	
	}catch (Exception ex) {
		out.print(ex);
	}
%>
</body>
</html>