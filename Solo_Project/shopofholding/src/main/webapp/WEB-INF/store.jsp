<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en"
      xmlns:th="http://www.thymeleaf.org"
      xmlns:layout="http://www.ultraq.net.nz/thymeleaf/layout">
<head>
<meta charset="ISO-8859-1">
<title>The Shop</title>
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
          <a class="nav-link" href="/home">Home </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/character/${ characters.id }">Inventory</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="/shop/${ characters.id }">Shop
          <span class="sr-only">(current)</span></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/logout">Sign out </a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<!-- introduction -->

<div class="container-fluid mt-5">
<div class="row welcome text-center">
	<div class="col-12">
	<h1 class="display-4"> Shop </h1>
	</div>
	<hr>
	<div class="col-12">
	<p class="lead"> Buy and Sell items for your Character </p>
	</div>
	
</div>
</div>


<!-- character select, info and search bar -->
<div class="container row justify-content-start mx-4">
<div class="col-4">
<div class="dropdown">
  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    Choose Character
  </button>
  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
  <c:forEach items="${ user.characters }" var="characters">
  	<a href="/shop/${ characters.id }" class="list-group-item list-group-item-action mt-1"><c:out value= "${ characters.name }"></c:out></a>
  </c:forEach>
  </div>
</div>
</div>
</div>

<div class="container-fluid row justify-content-center">
<p class="h5 text-warning"><c:out value="${ buyResult }"></c:out></p>
</div>

<div class="container mt-5">
	<div class="row">
			<div class="col-12 col-sm-6 col-md-5">
				<p class="h5 text-danger"> Inventory: <c:out value= "${ characters.name }"></c:out></p>
			</div>
			<div class="col-5 col-md-4">
				<p class="h5 text-danger">Carry Capacity:<c:out value= "${ characters.carryCapacity }"> </c:out> lbs</p>
			</div>
			<div class="col-5 col-md-3">
				<p class="h5 text-danger">GP:<c:out value= "${ characters.gp }"> </c:out> SP: <c:out value= "${ characters.sp }"> </c:out> CP: <c:out value= "${ characters.cp }"> </c:out> </p>
			</div>
	</div>

<div class="my-4">
<form th:action="@{/shop/${ characters.id } }" method="get">
	<div class = "row">
	<input id="txtSearch" type="text" name="keyword" placeholder="search item name or type" class="form-control col-4">
	<button type="submit" class="btn btn-sm btn-outline-info col-2 ml-3">Search</button>
	</div>
</form>
</div>
</div>

<!-- Sell Items Table -->


<div class="container">
<table class="table">
  <thead class="thead-dark">
    <tr>
      <th scope="col">Item Name</th>
      <th scope="col">Price GP</th>
      <th scope="col">Weight Lbs</th>
      <th scope="col">Rarity</th>
      <th scope="col">Type</th>
      <th scope="col">Sell</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach items="${ characters.inventories }" var="store">
    <tr th:each="store:${stores}">
      <td>${store.itemName}</td>
      <td>${store.priceGP}</td>
      <td>${store.weight}</td>
      <td>${store.rarity}</td>
      <td>${store.type}</td>
      <td><a class="btn btn-sm btn-outline-danger" href="/remove/${characters.id}/${store.id}" role="button">Sell</a></td>
    </tr>
    </c:forEach>
  </tbody>
</table>


<!-- Buy items -->

<table class="table">
  <thead class="thead-light">
    <tr>
      <th scope="col">Item Name</th>
      <th scope="col">Price GP</th>
      <th scope="col">Weight Lbs</th>
      <th scope="col">Rarity</th>
      <th scope="col">Type</th>
      <th scope="col">Buy</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach items="${stores}" var="store">
    <tr th:each="store:${stores}">
      <td>${store.itemName}</td>
      <td>${store.priceGP}</td>
      <td>${store.weight}</td>
      <td>${store.rarity}</td>
      <td>${store.type}</td>
      <td><a class="btn btn-sm btn-outline-success" href="/add/${characters.id}/${store.id}" role="button">Buy</a></td>
    </tr>
    </c:forEach>
  </tbody>
</table>
</div>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>