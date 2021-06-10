<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Accounts | Basic Banking System</title>
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
      <ul>
        <li><button class="btn btn-primary btn-info btn-lg" onclick='parent.location="show.jsp"'>TRANSFERS</button></li>
<br>
        <li><button class="btn btn-primary btn-info btn-lg" onclick='parent.location="transferform.html"'>Transfer money</button></li>
        </ul>
    </div>

    <!-- Modal send money -->
    
    <!-- Modal transaction History-->
    <div class="modal fade" id="transactionHistory" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Transaction History</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <ol id="transaction-history-body">

                    </ol>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <!-- table  -->
    <div class="container">
    <div class="table-responsive" style="background-color: aliceblue;">
            <table class="table table-hover table-bordered">
                <thead>
                    <tr class="table-danger">
                        <th scope="col"><h4>Sl. No.</h4></th>
                        <th scope="col"><h4>Name</h4></th>
                        <th scope="col"><h4>E-mail</h4></th>
                        <th scope="col"><h4>Bank Balance(in Rs)</h4></th>
                        <th><h4>View User</h4></th>
                    </tr>
                </thead>
    <%
	String to = (String)session.getAttribute("name");
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bank","root","root");
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select * from customers");
   while(rs.next()){
    %>
	<tdata>
	<tr>
	<td><%= rs.getString(1) %></td>
	<td><%= rs.getString(2) %></td>
	<td><%= rs.getString(3) %></td>
	<td><%= rs.getString(4) %></td>
  <form action="user.jsp" method="POST">
    <td>
      <input hidden type="text" value=<%= rs.getString(2)%> name="cname" />
      <input hidden type="text" value=<%= rs.getString(4)%> name="cbalance" />
      <input type="submit" value="View">
    </td>
  </form>
	</tr>
	</tdata>
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

    <!-- Footer -->
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
  background-image: url('img2.jpg');
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: cover;
}
</style>
</html>
