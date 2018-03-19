<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Update/Delete Passenger Request</title>
</head>
<body>
<%
	try {	
		String userid = (String)session.getAttribute( "userid" );
		String url = "jdbc:mysql://group28.caxv2nuxlyui.us-east-1.rds.amazonaws.com:3306/db28";
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection con = DriverManager.getConnection(url, "user28", "group28pass");
		
		Statement stmt = con.createStatement();
		
		String query = "SELECT * FROM passengerRequest where Username = '" + userid + "'" ;
		
		out.print("<table>");

		//make a row
		out.print("<tr>");
		//make a column
		out.print("<td>");
		out.print("Departure");
		out.print("</td>");
		
		out.print("<td>");
		out.print("Destination");
		out.print("</td>");
		
		out.print("<td>");
		out.print("Time");
		out.print("</td>");
		
		out.print("<td>");
		out.print("Date");
		out.print("</td>");
		
		
		
		
		out.print("</tr>");
		
		
		ResultSet resultset = stmt.executeQuery(query);
		
		while (resultset.next()) {
			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			out.print(resultset.getString("Departure"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(resultset.getString("Destination"));
			out.print("</td>");
			
			
			out.print("<td>");
			out.print(resultset.getString("Deptime"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(resultset.getString("Date"));
			out.print("</td>");
			
		
			out.print("</tr>");
		}
		out.print("</table>");
	
		con.close();
		
	
			
		
	
	}catch (Exception ex) {
		out.print(ex);
	}
%>
<form method="post" action="updatePassenger.jsp">
Select the Passenger request you want to Update or Delete<br/> 
        
 
 
 <br/> Date: <input type = "text" name = "Cdate" > <br/> 
 Time: <input type ="text" name="Ctime" > <br/> 
 
 

 Input new value: <br/>  Departure: <div> 
         Select where you are leaving from <br />
            <select name="Udepart" id="Udepart">
            
             <option value="Busch">Busch</option>
             <option value="Livingston">Livingston</option>
             <option value="CollegeAvenue">College Avenue</option>
             <option value="CookDouglas">Cook/Douglass</option>
            </select> <br/>
        </div> 
 
 
 <br/> Date: <input type = "text" name = "Udate" > <br/> Time: <input type ="text" name="Utime" > <br/> 
 
 Destination: <div> 
         Select where you are leaving from <br />
            <select name="Udestination" id="Udestination">
            
             <option value="Busch">Busch</option>
             <option value="Livingston">Livingston</option>
             <option value="CollegeAvenue">College Avenue</option>
             <option value="CookDouglas">Cook/Douglass</option>
            </select> <br/>
        </div>
Would you like to delete this request instead:  <select name="del" id="del">
            
             <option value="no">no</option>
             <option value="yes">Yes</option>
            </select> <br/>

<input type= "submit" value = "Submit">
</form>

</body>
</html>