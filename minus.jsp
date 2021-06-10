<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
String amt= session.getAttribute("amt").toString();
String user = session.getAttribute("user").toString();
try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bank","root","root");
    PreparedStatement ps=conn.prepareStatement("update customers set bank_balance_in_rs=bank_balance_in_rs-? where name=?");
    ps.setString(1,amt);
    ps.setString(2,user);
    int x=ps.executeUpdate();
    if(x!=0)
    {
    	response.sendRedirect("update.jsp");
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