<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">

</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-light " style="background-color: #6EBEB3 ">
		<a class="navbar-brand" href="#">
		<img src="https://cdn.discordapp.com/attachments/1054906456043966619/1061378600265334925/Biome.jpeg" width="40" height="40" class="d-inline-block align-top" alt="logo"/>
		
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="home.do">Home
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> Search By </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="plants.do">Plants</a> <a
							class="dropdown-item" href="allUsers.do">Users</a> <a class="dropdown-item"
							href="allSightings.do">Sightings</a>
					</div></li>
				<li class="nav-item"><a class="nav-link" href="allSightings.do">Plant
						Sightings</a></li>
			</ul>
			<c:choose>
				<c:when test="${empty sessionScope.loggedInUser }">
					<form class="form-inline my-2 my-lg-0" action="login.do"
						method="POST">
						<input class="form-control mr-sm-2" type="text"
							placeholder="username" aria-label="Search" name="username">
						<input class="form-control mr-sm-2" type="text"
							placeholder="password" aria-label="Search" name="password">
						<button class="btn btn-secondary" type="submit">Log
							In</button>
					</form>

				</c:when>
				
				<c:otherwise>
				<ul class="navbar-nav topnav-right">
			
					<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> My Account </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="myAccount.do">My Account</a> 
						
						<a class="dropdown-item" href="followedUsers.do">Followed Users</a> 
						<a class="dropdown-item" href="mySightings.do">My Sightings</a> 
						<a class="dropdown-item" href="account.do">Account Preferences</a>
					</div></li>
				
					<li class="nav-item active"><a class="nav-link btn btn-secondary" href="logout.do">Logout</a></li>
			</ul>
				</c:otherwise>
			
			</c:choose>
		</div>
	</nav>

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js"
		integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"
		integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
		crossorigin="anonymous"></script>

</body>
</html>