<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
</head>
<body>
<%
	try {
	
		String url = "jdbc:mysql://group28.caxv2nuxlyui.us-east-1.rds.amazonaws.com:3306/db28";
		Class.forName("com.mysql.jdbc.Driver"); 
		Connection con = DriverManager.getConnection(url, "user28", "group28pass");
		
		String userid = request.getParameter("Loginuser"); 
		session.setAttribute("userid",userid);
		String password = request.getParameter("Loginpassword"); 
		
		Statement stmt= con.createStatement(); 
		ResultSet rs= stmt.executeQuery("select * from registeredUsers where Username='"+userid+"'"); 
		
		
		if(rs.next()) {
			if(rs.getString(2).equals(password)){
				if (rs.getString("lockedOut").equals("Yes")){
					out.print("You are Locked Out");
				}
				else{
				
				%>
				
				<jsp:forward page="home.jsp"></jsp:forward>	
				<%
			}
		}
			
		}else {
			out.print("invalid password");
		}
		con.close();
	
	
	}catch (Exception ex) {
		out.print(ex);
	}
%>
</body>
</html>