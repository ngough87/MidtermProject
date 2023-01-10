<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome</title>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">

<link rel="stylesheet" href="css/selectedPlant.css">

</head>
<body>

	<jsp:include page="navbar.jsp"></jsp:include>
	<jsp:include page="header.jsp"></jsp:include>




	<div class="row h-100 justify-content-center align-items-center">
		<div class="card" style="max-width: 750px; margin: 100px;">

			<img src="${user.profileImage.imageUrl}" class="card-img-top">


			<div class="card-body">
				<h3 class="card-title">Welcome, ${user.username}!</h3>
			</div>

			<ul class="list-group list-group-flush">
				<li class="list-group-item">
					<h5>Name</h5>
					<c:out value="${user.firstName } ${user.lastName }"></c:out>
				</li>
				<li class="list-group-item">
					<h5>Address</h5>
					<c:out value="${user.address.street}"></c:out>
					<br>
					<c:out
						value="${user.address.city}, ${user.address.state} ${user.address.zip}"></c:out>

				</li>
				<li class="list-group-item">

					<h5>Zone</h5>
					<a href="searchByZone.do?zoneId=${user.address.zone.id}">
					<c:out value="${user.address.zone}"></c:out>
					</a>

				</li>

				<li class="list-group-item">
					<a href="followedUsers.do">
						<button class="btn btn-info btn-lg" type="submit" value="followedUsers">Followed Users</button>
					</a>
					<a href="mySightings.do">
						<button class="btn btn-info btn-lg" type="submit" value="mySightings">My Sightings</button>
					</a>
					<a href="account.do">
						<button class="btn btn-info btn-lg" type="submit" value="updateAccount">Update Account</button>
					
						
					</a>
					
				</li>

			</ul>


		</div>
		<div></div>
	</div>




</body>

<jsp:include page="footer.jsp"></jsp:include>


</html>