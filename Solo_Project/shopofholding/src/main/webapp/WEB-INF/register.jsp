<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>D&D Shop of Holding</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
</head>
<body>

<!-- navigation bar -->

<nav class="navbar navbar-expand-md navbar-dark bg-dark sticky-top">
<div class="container-fluid">
	<img src="<c:url value='img/dnd_logo.png'/>" />
	<h1 class ="text-white"> &emsp;The Shop Of Holding</h1>
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
    <div class="collapse navbar-collapse" id="navbarResponsive">
      <ul class="navbar-nav ml-auto">
        <li class="nav-item active">
          <a class="nav-link" href="/home">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">The Shop</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<!-- Registration Form -->

<div class="container justify-content-center mt-5">
<div class="row welcome text-center">
	<div class="col-12">
	<h1 class="display-4"> Register </h1>
</div>
</div>
<div class="row">
<div class="col">

			<form:form action="/register" method="post" modelAttribute="user">
			    <div class="form-group">
			        <form:label path="firstName">First Name: </form:label>
			        <form:errors class="text-danger" path="firstName"/>
			        <form:input class="form-control" path="firstName"/>
			    </div>
			     <div class="form-group">
			        <form:label path="lastName">Last Name: </form:label>
			        <form:errors class="text-danger" path="lastName"/>
			        <form:input class="form-control" path="lastName"/>
			    </div>
			    <div class="form-group">
			        <form:label path="email">Email</form:label>
			        <form:errors class="text-danger" path="email"/>
			       <form:input type="email" class="form-control" path="email"/>
			    </div>
			    <div class="form-group">
			        <form:label path="password">Password</form:label>
			        <form:errors class="text-danger" path="password"/>
			       <form:input type="password" class="form-control" path="password"/>
			    </div>
			    <div class="form-group">
			        <form:label path="passwordConfirmation">Confirm Password</form:label>
			        <form:errors class="text-danger" path="passwordConfirmation"/>
			       <form:input type="passwordConfirmation" class="form-control" path="passwordConfirmation"/>
			    </div>
			    <input class="btn btn-outline-success" type="submit" value="Submit"/>
			</form:form>
</div>
</div>
</div>
</body>
</html>