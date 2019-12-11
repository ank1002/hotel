<%-- 
    Document   : ho
    Created on : Oct 1, 2019, 11:44:21 AM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    </head>
    <body>
        


<nav class="navbar navbar-icon-top navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="Hotel.jsp">Hotels</a>
 
    <span class="navbar-toggler-icon"></span>
  

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
         <c:if test="${user==null}">
      <li class="nav-item active">
          <a class="nav-link" href="Abour.jsp">
          <i class="fa fa-home"></i>
          About Farply
          <span class="sr-only">(current)</span>
          </a>
      </li>
      <li class="nav-item">
          <a class="nav-link" href="Home.jsp">
          <i class="fa fa-envelope-o">
            <span class="badge badge-danger">11</span>
          </i>
          Home
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="contactus.jsp">
          <i class="fa fa-envelope-o">
            <span class="badge badge-warning">11</span>
          </i>
          Contact us
        </a>
      </li>
      
     <!-- <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true">
          <i class="fa fa-envelope-o">
            <span class="badge badge-primary">11</span>
          </i>
          Dropdown
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li> -->
    
      <li class="nav-item">
          <a class="nav-link" href="Login.jsp">
          <i class="fa fa-bell">
            <span class="badge badge-info">11</span>
          </i>
          Login
        </a>
      </li>
      <li class="nav-item">
          <a class="nav-link" href="Registration.jsp">
          <i class="fa fa-globe">
            <span class="badge badge-success">11</span>
          </i>
          Registration
        </a>
      </li>
    </c:if>
       <c:if test="${user!=null}">
            <c:if test="${user.role=='admin'}">
                 <li class="nav-item">
                     <a class="nav-link" href="AddHotel.jsp">
          <i class="fa fa-bell">
            <span class="badge badge-info">11</span>
          </i>
          Add Hotels
        </a>
      </li>
                 <li class="nav-item">
                     <a class="nav-link" href="displayorder.jsp">
          <i class="fa fa-bell">
            <span class="badge badge-info">11</span>
          </i>
          View cart
        </a>
      </li>
       <li class="nav-item">
           <a class="nav-link" href="Login.jsp">
          <i class="fa fa-bell">
            <span class="badge badge-info">11</span>
          </i>
          Logout
        </a>
      </li>
            </c:if>
       </c:if>
     </ul>
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav>

    </body>
</html>
