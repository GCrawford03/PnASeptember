<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Character</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
</head>
<body>

<!-- navigation bar -->

<nav class="navbar navbar-expand-md navbar-dark bg-dark sticky-top">
<div class="container-fluid">
	<img src="<c:url value='\img/dnd_logo.png'/>" />
	<h1 class ="text-white"> &emsp;The Shop Of Holding</h1>
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
    <div class="collapse navbar-collapse" id="navbarResponsive">
      <ul class="navbar-nav ml-auto">
        <li class="nav-item">
          <a class="nav-link" href="/home">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="/character/${ character.id }">Inventory
          <span class="sr-only">(current)</span></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/shop/${ character.id }">Shop</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/logout">Sign out </a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<!-- Character Name Title -->

<div class="container justify-content-center mt-5">
<div class="row welcome text-center">
	<div class="col-12">
	<h1 class="display-4"><c:out value="${ character.name }"></c:out> </h1>
	<img class="img" src="<c:url value='\img/placeholder_face.jpg'/>" alt="Card image cap">
</div>
</div>
</div>

<!-- Character Data -->
<div class="container">
<ul class="list row justify-content-center mt-4">
  <li class="list media col">
    <img class="mr-3" src="\img/ClassSymb_Fighter.png" width="64" alt="Generic placeholder image">
    <div class="media-body">
      <h5 class="mt-0 mb-1">Class</h5>
      <c:out value="${ character.charClass }"></c:out>
      </div>
  </li>
  <li class="list media col">
    <img class="mr-3" src="\img/gold_bag.png" width="64" alt="Generic placeholder image">
    <div class="media-body">
      <h5 class="mt-0 mb-1">Currency</h5>
	<ul class="list-inline">
  		<li class="list-inline-item">GP: <c:out value="${ character.gp }"></c:out></li>
  		<li class="list-inline-item">SP: <c:out value="${ character.sp }"></c:out></li>
 		<li class="list-inline-item">CP: <c:out value="${ character.cp }"></c:out></li>
	</ul>
    </div>
  </li>
  <li class="list media col">
    <img class="mr-3" src="\img/lbs_measure_weight.png" width="64" alt="Generic placeholder image">
    <div class="media-body">
      <h5 class="mt-0 mb-1">Carry Capacity</h5>
	<c:out value="${ character.carryCapacity }"> </c:out> lbs
    </div>
  </li>
</ul>
</div>
<div class="container-fluid">
	<div class="row justify-content-center">
		<p><a class="text-danger h6" href="/${ character.id }/coin"> add/change currency</a></p>
	</div>
</div>

<!-- Items in Inventory -->

<div class="container justify-content-center mt-3">
<table class="table">
  <thead class="thead-dark">
    <tr>
      <th scope="col">Item Name</th>
      <th scope="col">Weight Lbs</th>
      <th scope="col">Rarity</th>
      <th scope="col">Type</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach items="${ character.inventories }" var="store">
    <tr>
      <td>${store.itemName}</td>
      <td>${store.weight}</td>
      <td>${store.rarity}</td>
      <td>${store.type}</td>
    </tr>
    </c:forEach>
  </tbody>
</table>


</div>
</body>
</html>