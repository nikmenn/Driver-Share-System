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

<form method="post" action="ratingBuffer.jsp">
Give the Driver a rating between 0-5:
<input type="text" name = "rating">
Comments:
<input type="text" name = "comment">
<input type= "submit" value = "Submit">
</form>

</body>
</html>