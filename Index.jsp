<%@page import="com.helper.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Page</title>
<!-- CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link href="CSS/mystyle.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.banner-background{

clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 90%, 71% 100%, 33% 93%, 0 100%, 0 0);
}

</style>


</head>
<body>
<!-- navbar -->
<%@include file="normal_navbar.jsp" %>
<!-- banner -->
<div class="container-fluid p-0 m-0">

  <div class="jumbotron primary-background text-white banner-background">
    <div class="container">
      <h3 class="display-3"> Welcome to our site</h3>
       <p>Disaster management occupies an important place in India's policy framework, 
        as poor people are most affected by disaster and they are India's predominant population.
      </p>

<p>The steps being taken by the Government emanate from the approach that has been outlined above. 
The approach has been translated into a National Disaster Framework (a roadmap) covering institutional 
mechanisms, disaster prevention, early warning systems, disaster mitigation, preparedness and response,
 and human resource development. 
 </p>
 
 <a href="register_page.jsp" class="btn btn-outline-light btn-lg"> Sign Up! <span class="	fa fa-user-plus"></span> </button>
 <a href="login_page.jsp" class="btn btn-outline-light btn-lg">Login <span class="fa fa-sign-in"></span></a>
    </div>
   </div>

</div>
<div class ="container">



</div>

<!-- javascripts -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="js/myjs.js" type="text/javascript"></script>

</body>
</html>