<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Global Bank | Basic Banking System</title>
  <!-- Bootstrap CDN -->
  <link rel="stylesheet"
    href="https://unpkg.com/bootstrap-material-design@4.1.1/dist/css/bootstrap-material-design.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">

  <!-- Fonts -->
  <link rel="stylesheet" href="assets/css/style.css">
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+JP:wght@500&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Sansita+Swashed:wght@700&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@500&display=swap" rel="stylesheet">

  <!-- AOS  -->
  <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
  <link rel="stylesheet" type="text/css" href="source/bootstrap-3.3.6-dist/css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="source/font-awesome-4.5.0/css/font-awesome.css">
        <link rel="stylesheet" type="text/css" href="style/slider.css">
        <link rel="stylesheet" type="text/css" href="style/mystyle.css">

</head>

<body onload="loader()">
   
  <!-- loader for splash screen -->
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


  <!-- here content starts here -->
  
  <div class="container-fluid hero-content" id="hello">
    <img src="brand.gif">
    
    <div class="row align-items-center">
      <div class="col-md-6 col-sm-12 text-center" data-aos="fade-up">
        <h1><span id="sp" class="font-weight-bold">Welcome!!!  <%=request.getParameter("cname") %></span></h1>
        <h1><span id="sp" class="font-weight-bold">Your Account Balance:  <%=request.getParameter("cbalance") %> Rs</span></h1>
        <p class="lead muted" style="color: blue;">TRANSFER MONEY <span id="sp" class="font-weight-bold">IN SECONDS</span></p>

        <br>
        <br>
        <button type="button" class="btn btn-primary btn-lg" onclick="location.href = './customers.jsp';">View Customers
         </button><br><br>
         
        <button type="button" class="btn btn-primary btn-lg" onclick="location.href = './transferform.html';">Transfer
          Money</button>
      </div>
      <div class="col-md-6 col-sm-12 text-center" data-aos="fade-left">
        
      </div>
    
    </div>

    

    <br><br><br><br>
    <center><h1 style="color: rgb(238, 14, 14);background-color: aliceblue;">Your Transfers/Transfered To You</h1></center>
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
      PreparedStatement st=con.prepareStatement("select * from transfers where sender=? or reciever=?");
      String ccname=request.getParameter("cname");
      st.setString(1,ccname);
      st.setString(2,ccname);

      //ResultSet rs=st.executeQuery("select * from transfers where sender=ccname or reciever=ccname");
      ResultSet rs=st.executeQuery();
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
      <br><br><br><br><br><br>
  </div>
  


  <!-- here content ends here -->

  <!--===== ABOUT =====-->
  <section class="about section " id="about">
    <h2 class="section-title" style="color:#008cba;font-weight: bolder;text-align: center;">About</h2>

    <div class="about__container bd-grid">
        <div class="about__img">
            <img src="img6.jpg" alt="" style="width: 450px;height: 250px; border-radius: 14%;margin-left: 200px;display: inline-block;vertical-align: middle;float: left;">
        </div>
        <div>
            <h3 class="about__subtitle" style="margin-left: 700px;margin-top: 50px;font-weight: bolder;">Welcome to Royal Bank</h3>
            <p class="about__text" style="margin-left: 700px;">We provide loans, accept deposits and many more!</p> 
        </div>
        
        
                      
                                         
    </div>
</section>
  <!-- Footer -->
  <footer class="bg-light text-center text-lg-start" style="margin-top: 300px;" margin-top="20px">
    <!-- Grid container -->
    
    <!-- Copyright -->
    <div class="text-center p-3" style="background-color: rgb(247, 248, 248)" >
      © 2021 Copyright:
      <p class="love">Made with  <i class="fa fa-heart pulse"></i>  by Chittaranjan</p>
    </div>
    <!-- Copyright -->
  </footer>



  <!-- spalsh screen js -->
  <script>
    var preloader = document.getElementById("loading");
    function loader() {
      preloader.style.display = 'none';
    }
  </script>

  <script src="assets/js/script.js"></script>
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
  <script src="https://unpkg.com/popper.js@1.12.6/dist/umd/popper.js"></script>
  <script src="https://unpkg.com/bootstrap-material-design@4.1.1/dist/js/bootstrap-material-design.js"></script>

  <!-- aos data  -->
  <script src="https://unpkg.com/aos@next/dist/aos.js"></script>
  <script>
    AOS.init({
      duration: 700,
    });
  </script>

</body>
<style>
  #hello {
  background-image: url('img10.jpg');
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: cover;
}
</style>

</html>