<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>The Shop</title>
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
        <li class="nav-item">
          <a class="nav-link active" href="/shop">The Shop
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
	<h1 class="display-4"> The Shop </h1>
	</div>
	<hr>
	<div class="col-12">
	<p class="lead"> Buy and Sell items for your Character </p>
	</div>
	
</div>
</div>

<!-- character select and search bar -->
<form>
  <div class="form-row align-items-center">
    <div class="col-auto my-1">
      <label class="mr-sm-2" for="inlineFormCustomSelect">My Characters</label>
      <select class="custom-select mr-sm-2" id="inlineFormCustomSelect">
        <option selected>Choose...</option>
        <option value="1">Character 1</option>
        <option value="2">Character 2</option>
        <option value="3">Character 3</option>
      </select>
    </div>
    <div class="col-auto my-1">
      <button type="submit" class="btn-sm btn-primary">Submit</button>
    </div>
  </div>
</form>

<!-- Sell Items -->

<div class="container mt-5">
<table class="table">
  <thead class="thead-dark">
    <tr>
      <th scope="col">Item Name</th>
      <th scope="col">Price GP</th>
      <th scope="col">Weight Lbs</th>
      <th scope="col">Rarity</th>
      <th scope="col">Type</th>
      <th scope="col">Buy/Sell</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach items="${stores}" var="store">
    <tr>
      <td>${store.itemName}</td>
      <td>${store.priceGP}</td>
      <td>${store.weight}</td>
      <td>${store.rarity}</td>
      <td>${store.type}</td>
      <td><a class="btn btn-sm btn-outline-danger" href="#" role="button">Sell</a></td>
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
      <th scope="col">Purchase</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach items="${stores}" var="store">
    <tr>
      <td>${store.itemName}</td>
      <td>${store.priceGP}</td>
      <td>${store.weight}</td>
      <td>${store.rarity}</td>
      <td>${store.type}</td>
      <td><a class="btn btn-sm btn-outline-success" href="#" role="button">Buy</a></td>
    </tr>
    </c:forEach>
  </tbody>
</table>
</div>


</body>
</html>