<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<title>Selected Sighting</title>
</head>
<body style="background-color: #FFFCF1">
	<jsp:include page="navbar.jsp"></jsp:include>


<div class="row h-100 justify-content-center align-items-center">
		<div class="card" style="max-width: 750px; margin: 100px;">
			<img src="${sighting.image}" class="card-img-top">
			<div class="card-body">
				<h5 class="card-title">Common Name: ${sighting.plant.commonName}</h5>

			</div>
			
			
			<ul class="list-group list-group-flush">
				
				<li class="list-group-item" ><a href = "selectedUser.do?id=${sighting.user.id}">Created By: ${sighting.user.username} </a></li>
			
				<li class="list-group-item">Latitude: ${sighting.latitude}</li>
				<li class="list-group-item">Longitude: ${sighting.longitude}</li>
				<li class="list-group-item">Description: ${sighting.description}</li>
				<li class="list-group-item">Date Posted: ${sighting.datePosted}</li>
				
			</ul>
			
				<div style="float: right;">
					<form action="allSightings.do">
						<button class="btn btn-info btn-lg" type="submit"
							value="Return to All Plants">Return to All Plants Sightings</button>
					</form>
				</div>

			</div>
		</div>





</body>

<jsp:include page="footer.jsp"></jsp:include>
</html>