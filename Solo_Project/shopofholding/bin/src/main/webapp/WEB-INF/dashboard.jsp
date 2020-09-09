<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dashboard</title>
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
          <a class="nav-link" href="/home">Home
                <span class="sr-only">(current)</span>
              </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/shop">The Shop</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/logout">Sign out </a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<!-- header -->

<div class="container-fluid my-3 mx-3">
<div class="row welcome">
	<div class="col-12">
	<p class="h2">Welcome <c:out value="${ user.firstName } ${ user.lastName }"/></p>
	</div>
</div>
<div class="container justify-content-center mt-5">
<div class="row welcome text-center">
	<div class="col-12">
	<h1 class="display-4"> My Characters </h1>
</div>
</div>

<!-- Character Cards -->

<div class="row text-left">
<p><a href="/character/new" class="text-primary">Create a Character</a></p>
</div>
<div class="row">
<div class="card m-5" style="width: 18rem;">
<img class="card-img-top" src="<c:url value='img/placeholder_face.jpg'/>" alt="Card image cap">	
  <div class="card-body">
    <h5 class="card-title">Character Name</h5>
    <h6 class="card-subtitle mb-2 text-muted">Character Class</h6>
    <a href="#" class="card-link">View Inventory</a>
    <a href="#" class="card-link">Edit</a>
    <a href="#" class="card-link">Delete</a>
  </div>
</div>

<div class="card m-5" style="width: 18rem;">
<img class="card-img-top" src="<c:url value='img/placeholder_face.jpg'/>" alt="Card image cap">	
  <div class="card-body">
    <h5 class="card-title">Character Name</h5>
    <h6 class="card-subtitle mb-2 text-muted">Character Class</h6>
    <a href="#" class="card-link">View Inventory</a>
    <a href="#" class="card-link">Edit</a>
    <a href="#" class="card-link">Delete</a>
  </div>
</div>
</div>
</div>
</div>
</body>
</html>