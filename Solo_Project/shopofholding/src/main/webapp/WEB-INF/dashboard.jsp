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
<p class="h4"><a class="text-danger" href="/new">Create a Character</a></p>
</div>
<div class="row">
<c:forEach items="${ user.characters }" var="characters">
<div class="col-4">
<div class="card text-white bg-dark m-5" style="width: 18rem;">
<img class="card-img-top" src="<c:url value='img/placeholder_face.jpg'/>" alt="Card image cap">	
  <div class="card-body form-group">
    <h5 class="card-title"><c:out value="${ characters.name }"></c:out></h5>
    <h6 class="card-subtitle mb-3 text-muted"><c:out value="${ characters.charClass }"></c:out></h6>
    <div class= "row ml-2">
    <a href="/character/${ characters.id }" class="btn btn-info btn-sm">Play</a>
    <a href="/${ characters.id }" class="btn btn-info btn-sm ml-4">Edit</a>
    <form class="delete-form" action="/${ characters.id }" method="post"></form>
	<input type="hidden" name="_method" value="delete" />
	<button type="button" class="btn btn-danger btn-sm ml-4" onclick="location.href='/${characters.id}/delete'">Delete</button>
	</div>
  </div>
</div>
</div>
</c:forEach>
</div>
</div>
</div>
</body>
</html>