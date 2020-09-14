<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>DnD Shop of Holding</title>
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
        <li class="nav-item">
          <a class="nav-link" href="/home">Home </a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<!--  Welcome info-->

<div class="container-fluid m-5">
<div class="row welcome text-center">
	<div class="col-12">
	<h1 class="display-4"> Welcome to The Shop of Holding</h1>
	</div>
	<hr>
	<div class="col-12">
	<p class="lead"> A Dungeons and Dragons Inventory Management tool.<br> That makes buying, selling and managing items in your characters inventory a breeze.</p>
	</div>
	
</div>
</div>

<!-- Login and register -->

<div class="container-fluid m-5">
				<div class="text-center">
				<h4 class="display-6">Login</h4>
				<div class="text-danger">
				<p>${ loginError }</p>
				</div>
				</div>
				<form method="POST" action="/login">
					<div class="form-row justify-content-center">
					<div class="form-group col-md-3">
						<label>Email:</label>
						<input class="form-control" type="email" name="email">
					</div>
					<div class="form-group col-lg-3">
						<label>Password:</label>
						<input class="form-control" type="password" name="password">
					</div>
					</div>
					<div class="row justify-content-center">
					<button class="btn btn-outline-success">Login</button>
					<div class="ml-2">
					<a class="btn btn-md btn-outline-danger" href="/register" role="button">Register</a>
					</div>
					</div>
				</form>
</div>
</body>
</html>