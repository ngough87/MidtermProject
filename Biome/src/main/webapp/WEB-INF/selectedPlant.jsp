<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="css/selectedPlant.css">
</head>
<body>
	<jsp:include page="navbar.jsp"></jsp:include>

	<div class="backgroundcolor">



		<div class="row">
			<div class="column">

				<div class="selectedPlant">
					<input type="image" src="${plant.imageUrl}" width="300"
						height="300">
				</div>
			</div>
			<div class="column">



				<div class="plantdetails">
					Common Name: ${plant.commonName} <br> Scientific Name:
					${plant.scientificName} <br> Habitat: ${plant.habitat.name} <br>
					Plant Type: ${plant.plantType.name} <br> Season:
					${plant.season.name} <br> Edible: ${plant.edible} <br>
					Zones: ${plant.zones} <br> Medicinal Properties:
					${plant.medicinalProperties} <br> Light Requirements:
					${plant.sunExposures} <br> Environmental Notes:
					${plant.environmentalNotes}


				</div>
			</div>




		</div>

		<div class="col-auto button-container">
			<div style="margin: auto; float: left;">
				<form action="updatePlant.do">
					<input type="hidden" value="${plant.id}" name="id">
					<button type="submit" value="Edit">Edit</button>
				</form>
			</div>
		</div>		
	</div>
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>