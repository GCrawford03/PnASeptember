<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New Character</title>
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
          <a class="nav-link" href="/home">Home</a>
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


<!-- Create Form -->


<div class="container justify-content-center mt-5">
<div class="row welcome text-center">
	<div class="col-12">
	<h1 class="display-4"> Create a Character </h1>
</div>
</div>
<div class="row">
<div class="col">

	<form:form action="/character/new" method="post" modelAttribute="character">
		<form:input type="hidden" value="${ user.id }" path="user"/>
		<div class="form-group">
			<form:label path="name">Character Name: </form:label>
			<form:errors path="name"/>
			<form:input class="form-control" path="name"/>
		</div>
		<div class="form-group">
    	<label>Character Class</label>
    	<select class="form-control" id="charClass" name="charClass">
      		<option>Artificer</option>
      		<option>Barbarian</option>
      		<option>Bard</option>
      		<option>Cleric</option>
      		<option>Druid</option>
      		<option>Fighter</option>
      		<option>Monk</option>
      		<option>Paladin</option>
      		<option>Ranger</option>
      		<option>Rogue</option>
      		<option>Sorcerer</option>
      		<option>Warlock</option>
      		<option>Wizard</option>
    	</select>
  		</div>
		<div class="form-group">
			<form:label path="strengthScore">Strength Score: </form:label>
			<form:errors path="strengthScore"/>
			<form:input type="number" class="form-control" path="strengthScore"/>
		</div>
		<input class="btn btn-outline-success" type="submit" value="Submit"/>
	</form:form>
</div>
</div>
</div>
</body>
</html>