<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Character</title>
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
          <a class="nav-link" href="/logout">Sign out </a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<!-- Edit Coin -->
 
<div class="container justify-content-center mt-5">
<div class="row welcome text-center">
	<div class="col-12">
	<h1 class="display-4"> Edit Coin</h1>
</div>
</div>
<div class="row mt-4">
<div class="col">

	<form:form action="/${ character.id }/coin" method="post" modelAttribute="character">
		<form:input type="hidden" value="${ character.id }" path="id"/>
		<input type="hidden" name="_method" value="put">
		<div class="row">
		<div class="form-group col">
			<form:label path="gp">GP: </form:label>
			<form:errors path="gp"/>
			<form:input type="number" class="form-control" path="gp"/>
		</div>
		<div class="form-group col">
			<form:label path="sp">SP: </form:label>
			<form:errors path="sp"/>
			<form:input type="number" class="form-control" path="sp"/>
		</div>
		<div class="form-group col">
			<form:label path="cp">CP: </form:label>
			<form:errors path="cp"/>
			<form:input type="number" class="form-control" path="cp"/>
		</div>
		</div>
		<input class="btn btn-outline-success" type="submit" value="Submit"/>
		
	</form:form>
</div>
</div>

<!-- Carousel Gold Data Tables -->

<div class="container mt-3">
<div class="text-center">
<p class="lead"> Class and Backgrounds Starting Gold Tables
</div>
	<div class="row mt-4">
			<div class="col-12 col-sm-8 col-md-9">
				<p class="h5 text-danger">Character: <c:out value= "${ character.name }"></c:out> &emsp;Class: <c:out value= "${ character.charClass }"></c:out></p>
			</div>
			<div class="col-5 col-md-3">
				<p class="h5 text-danger">GP: <c:out value= "${ character.gp }"> </c:out> SP: <c:out value= "${ character.sp }"> </c:out> CP: <c:out value= "${ character.cp }"> </c:out> </p>
			</div>
	</div>

<div id="classBackgroundGp" class="carousel slide" data-ride="carousel" data-pause="hover">
  <ol class="carousel-indicators">
    <li data-target="#classBackgroundGp" data-slide-to="0" class="active"></li>
    <li data-target="#classBackgroundGp" data-slide-to="1"></li>
    <li data-target="#classBackgroundGp" data-slide-to="2"></li>
    <li data-target="#classBackgroundGp" data-slide-to="3"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
<table class="table table-dark table-sm table-hover">
  <thead class="thead-light">
    <tr>
      <th scope="col">Class</th>
      <th scope="col">Roll</th>
      <th scope="col">Low</th>
      <th scope="col">High</th>
      <th scope="col">Average</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">Artificer</th>
      <td>5d4 x 10 gp</td>
      <td>50 gp</td>
      <td>200 gp</td>
      <td>125 gp</td>
    </tr>
    <tr>
      <th scope="row">Barbarian</th>
      <td>2d4 x 10 gp</td>
      <td>20 gp</td>
      <td>80 gp</td>
      <td>50 gp</td>
    </tr>
    <tr>
      <th scope="row">Bard</th>
      <td>5d4 x 10 gp</td>
      <td>50 gp</td>
      <td>200 gp</td>
      <td>125 gp</td>
    </tr>
    <tr>
      <th scope="row">Cleric</th>
      <td>5d4 x 10 gp</td>
      <td>50 gp</td>
      <td>200 gp</td>
      <td>125 gp</td>
    </tr>
    <tr>
      <th scope="row">Druid</th>
      <td>2d4 x 10 gp</td>
      <td>20 gp</td>
      <td>80 gp</td>
      <td>50 gp</td>
    </tr>
    <tr>
      <th scope="row">Fighter</th>
      <td>5d4 x 10 gp</td>
      <td>50 gp</td>
      <td>200 gp</td>
      <td>125 gp</td>
    </tr>
    <tr>
      <th scope="row">Monk</th>
      <td>5d4</td>
      <td>5 gp</td>
      <td>20 gp</td>
      <td>12.5 gp</td>
    </tr>
    <tr>
      <th scope="row">Paladine</th>
      <td>5d4 x 10 gp</td>
      <td>50 gp</td>
      <td>200 gp</td>
      <td>125 gp</td>
    </tr>
    <tr>
      <th scope="row">Ranger</th>
      <td>5d4 x 10 gp</td>
      <td>50 gp</td>
      <td>200 gp</td>
      <td>125 gp</td>
    </tr>
    <tr>
      <th scope="row">Rogue</th>
      <td>4d4 x 10 gp</td>
      <td>40 gp</td>
      <td>160 gp</td>
      <td>100 gp</td>
    </tr>
    <tr>
      <th scope="row">Sorcerer</th>
      <td>3d4 x 10 gp</td>
      <td>30 gp</td>
      <td>120 gp</td>
      <td>75 gp</td>
    </tr>
     <tr>
      <th scope="row">Warlock</th>
      <td>4d4 x 10 gp</td>
      <td>40 gp</td>
      <td>160 gp</td>
      <td>100 gp</td>
    </tr>
     <tr>
      <th scope="row">Wizard</th>
      <td>4d4 x 10 gp</td>
      <td>40 gp</td>
      <td>160 gp</td>
      <td>100 gp</td>
    </tr>
  </tbody>
</table>
    </div>
    <div class="carousel-item">
<table class="table table-dark table-sm table-hover">
  <thead class="thead-light">
    <tr>
      <th scope="col">Background</th>
      <th scope="col">Starting GP</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">Acolyte</th>
      <td>15 gp</td>
    </tr>
    <tr>
      <th scope="row">Anthropologist</th>
      <td>10 gp</td>
    </tr>
    <tr>
      <th scope="row">Archaeologist</th>
      <td>25 gp</td>
    </tr>
    <tr>
      <th scope="row">Charlatan</th>
      <td>15 gp</td>
    </tr>
    <tr>
      <th scope="row">City Watch / Investigator</th>
      <td>10 gp</td>
    </tr>
    <tr>
      <th scope="row">Clan Crafter</th>
      <td>5 gp gem and 10 gp</td>
    </tr>
    <tr>
      <th scope="row">Cloistered Scholar</th>
      <td>10 gp</td>
    </tr>
    <tr>
      <th scope="row">Courtier</th>
      <td>5 gp</td>
    </tr>
    <tr>
      <th scope="row">Criminal / Spy</th>
      <td>15 gp</td>
    </tr>
    <tr>
      <th scope="row">Entertainer</th>
      <td>15 gp</td>
    </tr>
    <tr>
      <th scope="row">Faction Agent</th>
      <td>15 gp</td>
    </tr>
    <tr>
      <th scope="row">Far Traveler</th>
      <td>10 gp jewelry and 5 gp</td>
    </tr>
    <tr>
      <th scope="row">Folk Hero</th>
      <td>10 gp</td>
    </tr>
  </tbody>
</table>
    </div>
        <div class="carousel-item">
<table class="table  table-dark table-sm table-hover">
  <thead class="thead-light">
    <tr>
      <th scope="col">Background</th>
      <th scope="col">Starting GP</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">Gladiator</th>
      <td>15 gp</td>
    </tr>
    <tr>
      <th scope="row">Guild Artisan / Merchant</th>
      <td>15 gp</td>
    </tr>
    <tr>
      <th scope="row">Haunted One</th>
      <td>None</td>
    </tr>
    <tr>
      <th scope="row">Hermit</th>
      <td>5 gp</td>
    </tr>
    <tr>
      <th scope="row">Inheritor</th>
      <td>15 gp</td>
    </tr>
    <tr>
      <th scope="row">Knight</th>
      <td>25 gp</td>
    </tr>
    <tr>
      <th scope="row">Knight of the Order</th>
      <td>10 gp</td>
    </tr>
    <tr>
      <th scope="row">Mercenary Veteran</th>
      <td>10 gp</td>
    </tr>
    <tr>
      <th scope="row">Noble</th>
      <td>25 gp</td>
    </tr>
    <tr>
      <th scope="row">Outlander</th>
      <td>10 gp</td>
    </tr>
    <tr>
      <th scope="row">Pirate</th>
      <td>10 gp</td>
    </tr>
    <tr>
      <th scope="row">Sage</th>
      <td>10 gp</td>
    </tr>
    <tr>
      <th scope="row">Sailor</th>
      <td>10 gp</td>
    </tr>
  </tbody>
</table>
    </div>
            <div class="carousel-item">
<table class="table table-dark table-sm table-hover">
  <thead class="thead-light">
    <tr>
      <th scope="col">Background</th>
      <th scope="col">Starting GP</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">Soldier</th>
      <td>10 gp</td>
    </tr>
    <tr>
      <th scope="row">Urban Bounty Hunter</th>
      <td>20 gp</td>
    </tr>
    <tr>
      <th scope="row">Urchin</th>
      <td>10 gp</td>
    </tr>
    <tr>
      <th scope="row">Uthgardt Tribe Member</th>
      <td>10 gp</td>
    </tr>
    <tr>
      <th scope="row">Waterdhavian Noble</th>
      <td>20 gp</td>
    </tr>
  </tbody>
</table>
    </div>
  </div>
  <a class="carousel-control-prev" href="#classBackgroundGp" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#classBackgroundGp" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
</div>
</div>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>