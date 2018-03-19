<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Track Advertisements</title>
</head>
<body>
<%
	try {	
		String url = "jdbc:mysql://group28.caxv2nuxlyui.us-east-1.rds.amazonaws.com:3306/db28";
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection con = DriverManager.getConnection(url, "user28", "group28pass");
		
		Statement stmt = con.createStatement();
		
		String query = "SELECT * FROM adTable";
		
		out.print("<table>");

		//make a row
		out.print("<tr>");
		//make a column
		out.print("<td>");
		out.print("Advertisement");
		out.print("</td>");
		
		out.print("<td>");
		out.print("Times Shown");
		out.print("</td>");
	
		
		
		out.print("</tr>");
		
		
		ResultSet resultset = stmt.executeQuery(query);
		
		while (resultset.next()) {
			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			out.print(resultset.getString("Advertisement"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(resultset.getString("Amount"));
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