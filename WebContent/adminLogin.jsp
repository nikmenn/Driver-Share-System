<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin Login</title>
</head>
<body>
<%
	String admin = request.getParameter("adminUser");
    String pass = request.getParameter("adminPassword");
    
    if((admin.equals("admin")) && (pass.equals("admin")) ){
    	%>
		
		<jsp:forward page="adminHome.html"></jsp:forward>	
		<%
    }
    else{
    	out.print("Wrong User/Pass for Admin");
    }

	
%>
</body>
</html>