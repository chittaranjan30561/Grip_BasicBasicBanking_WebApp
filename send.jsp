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
String name=request.getParameter("duser");
String amt=request.getParameter("damt");
try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bank","root","root");
    PreparedStatement ps=conn.prepareStatement("update customers set bank_balance_in_rs=bank_balance_in_rs+? where name=?");
    ps.setString(1,amt);
    ps.setString(2,name);
    int x=ps.executeUpdate();
    if(x!=0)
    {
    	response.sendRedirect("customers.jsp");
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