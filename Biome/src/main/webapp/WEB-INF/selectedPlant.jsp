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
<title>${plant.commonName}</title>
<link rel="stylesheet" href="css/myaccount.css">
</head>
<body style="background-color: #FFFCF1">
	<jsp:include page="navbar.jsp"></jsp:include>



	<div class="row h-100 justify-content-center align-items-center">
		<div class="card" style="max-width: 750px; margin: 100px;">
			<img src="${plant.imageUrl}" class="card-img-top">
			<div class="card-body">
				<h5 class="card-title">Common Name: ${plant.commonName}</h5>

			</div>
			<ul class="list-group list-group-flush">

				<li class="list-group-item">Scientific Name:
					${plant.scientificName}</li>
				<li class="list-group-item">Habitat: ${plant.habitat.name}</li>
				<li class="list-group-item">Plant Type: ${plant.plantType.name}
				</li>
				<li class="list-group-item">Edible: ${plant.edible}</li>
				<li class="list-group-item">Medicinal Properties:
					${plant.medicinalProperties}</li>
				<li class="list-group-item">Light Requirements:
					${plant.sunExposures}</li>
				<li class="list-group-item">${plant.environmentalNotes}</li>
			</ul>
			<div class="card-body row-inline">
				<div style="float: left;">
					<form action="updatePlant.do">
						<input type="hidden" value="${plant.id}" name="id">
						<button class="btn btn-info btn-lg" type="submit" value="Edit">Edit</button>
					</form>
				</div>
				<c:if test="${plant.user !null}">
					<c:if test="${plant.user.id eq user.id}">
						<div class="text-center">
							<form action="deletePlant.do">
								<input type="hidden" value="${plant.id}" name="id">
								<button class="btn btn-info btn-lg" type="submit" value="Delete">Delete</button>
							</form>
						</div>
					</c:if>
				</c:if>
				<div style="float: right;">
					<form action="plants.do">
						<button class="btn btn-info btn-lg" type="submit"
							value="Return to All Plants">Return to All Plants</button>
					</form>
				</div>

			</div>
		</div>


	</div>

</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>