<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">


<meta charset="UTF-8">
<title>Update Sighting</title>
<link rel="stylesheet" href="css/selectedUser.css">

</head>


<body style="background-color: #FFFCF1">

	<jsp:include page="navbar.jsp"></jsp:include>


	<div class="row h-100 justify-content-center align-items-center">
	
		<div class="col px-md-40" id="form-wrapper"
			style="max-width: 750px; margin: 100px; float: left; border: 3px solid #0ABE9A; padding: 40px; background-color: #C5D4D2">
			<h2 class="text-center">Update Sighting</h2>
			
			
			<form action="updatedSighting.do">
			
			
			<div class="Aligner">
				<div class="Aligner-item">

					<div>

						<div class="card-header-img-img">
							<div class="card-header-img">
								<img class="card-img-top img-fluid"
									src="${sighting.image}">
							</div>
						</div>
					</div>
				</div>
				</div>
			

				<input type="hidden" value="${sighting.id}" name="id">
				<h2 class="text-center">${plant.commonName}</h2>
				<div class="form-row">
					<div class="form-group col-md-6">
						<label for="latitude">Latitude: </label>
						<input type="text" class="form-control" name="latitude"
							placeholder="Enter Latitude" value="${sighting.latitude }" />
					</div>
					<div class="form-group col-md-6">
						<label for="longitude">Longitude: </label>
						<input type="text" class="form-control" name="longitude"
							placeholder="Enter Longitude" value="${sighting.longitude }" />
					</div>
				</div>

					
				<div class="form-group ">
					<label for="sightingDescription">Sighting Description: </label>
					<textarea class="form-control" name="description"
						placeholder="Enter brief description">${sighting.description} </textarea>
				</div>
				<div>
					<div class="container my-3 ">
						<div class="col-md-12 text-center">
							<input type="hidden" value="${sighting.id}" name="id">
							<button class="btn btn-info btn-lg" type="submit"
								value="submitUpdateSighting">Submit</button>
						</div>
					</div>
				</div>

			</form>
		</div>
	</div>
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>