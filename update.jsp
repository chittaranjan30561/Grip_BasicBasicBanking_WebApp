<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@page import="java.sql.*" %>
        <%@page import="java.sql.Date"%>
 <%@ page import="java.io.*, java.util.*" %><!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Global Bank | Basic Banking System</title>
</head>
<body>

<% 
String amt= session.getAttribute("amt").toString();
String user = session.getAttribute("user").toString();
String to = session.getAttribute("to").toString();
try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn=DriverManager.getConnection( "jdbc:mysql://localhost:3306/bank","root","root");
    PreparedStatement ps=conn.prepareStatement("insert into transfers values(?,?,?)");
    ps.setString(1,user);
    ps.setString(2,to);
    ps.setString(3,amt);
    int x=ps.executeUpdate();
    if(x!=0)
    {

    	response.sendRedirect("show.jsp");
    	//out.println("Hurray!!!! Your booking is successfull ,  You will get a confirmation mail to your registered email from our team shortly");
    }
    else{
    	//response.sendRedirect("register.html");
    	//request.getRequestDispatcher("register.html");
    	out.println("Invalid details");
    	
    }
}
catch(Exception e){
    out.print(e);
}
%>
</body>

</html>