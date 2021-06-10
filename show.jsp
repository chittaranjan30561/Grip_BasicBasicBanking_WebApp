<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Transfers | Basic Banking System</title>
    <link rel="stylesheet"
        href="https://unpkg.com/bootstrap-material-design@4.1.1/dist/css/bootstrap-material-design.min.css">
    <link rel="stylesheet" href="assets/css/customer.css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+JP:wght@500&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Sansita+Swashed:wght@700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@500&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="source/bootstrap-3.3.6-dist/css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="style/slider.css">
        <link rel="stylesheet" type="text/css" href="style/mystyle.css">
    
</head>

<body>
<%

%>

     <!--Navbar Starts Here-->
  <div class="allcontain">
    <!-- Navbar Up -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <a class="navbar-brand" href="#"><font size="+2">Royal Bank</font></a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav">
          <li class="nav-item active">
            <a class="nav-link" href="index.html"><font size="+1">Home </font> <span class="sr-only">(current)</span></a>
          </li>
          &nbsp;&nbsp;&nbsp;
          <li class="nav-item">
            <a class="nav-link" href="customers.jsp"><font size="+1">View Customers</font></a>
          </li>
          &nbsp;&nbsp;&nbsp;
          <li class="nav-item">
            <a class="nav-link" href="send.html"><font size="+1">Add Money <i class="fas fa-money-bill-wave-alt    "></i></font></a>
          </li>
          &nbsp;&nbsp;&nbsp;
          <li class="nav-item">
            <a class="nav-link" href="transferform.html"><font size="+1">Transfer Money <i class="fas fa-money-bill-wave-alt    "></i></font></a>
          </li>
          &nbsp;&nbsp;&nbsp;
          <li class="nav-item">
            <a class="nav-link" href="show.jsp"><font size="+1">All Transfers </font></a>
          </li>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         
        </ul>
      </div>
    </nav>
  </div>
  <img src="brand.gif">
  <!-- navbar ends here  -->
 
    
    <div class="my-info text-center">
        <button class="btn btn-primary btn-info btn-lg" onclick='parent.location="index.html"'>Back Home</button>
    </div>
<br>
<br>
<br>

    <!-- table  -->
    <div class="container">
    <div class="table-responsive" style="background-color: aliceblue;">
            <table class="table table-hover table-bordered">
                <thead>
                    <tr class="table-danger">
                        <th scope="col"><h4>TRANSFERED FROM</h4></th>
                        <th scope="col"><h4>TRANSFERED TO</h4></th>
                        <th scope="col"><h4>AMOUNT TRANSFERED</h4></th>
                    </tr>
                </thead>
    <%
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bank","root","root");
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select * from transfers"); 
		while(rs.next())
	{
 	%>
            
                <tbody>
 				<tr>
 						<td width="25%"><%=rs.getString(1) %></td>
 						<td width="25%"><%=rs.getString(2) %></td>
 						<td width="25%"><%=rs.getString(3) %></td>
 				</tr>
                </tbody>
           <%
           }

}
catch(Exception e)
{
e.printStackTrace();
}
 %>
           
            </table>
        </div>
    </div>
    <!-- Footer -->
  
    <script src="assets/js/script.js"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://unpkg.com/popper.js@1.12.6/dist/umd/popper.js"></script>
    <script src="https://unpkg.com/bootstrap-material-design@4.1.1/dist/js/bootstrap-material-design.js"></script>

    <footer class="bg-light text-center text-lg-start" style="margin-top: 300px;" margin-top="20px">
      <!-- Grid container -->
      
      <!-- Copyright -->
      <div class="text-center p-3" style="background-color: rgb(85, 190, 190)" >
        © 2021 Copyright:
        <p class="love">Made <i class="fa fa-heart pulse"></i>  by Chittaranjan</p>
      </div>
      <!-- Copyright -->
    </footer>
</body>
<style>
  body {
  background-image: url('img4.jpg');
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: cover;
}
</style>

</html>
