<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="background-color: #FFFCF1">
	<jsp:include page="navbar.jsp"></jsp:include>
<body>


	<!-- <div class="row" style="overflow: scroll;"> -->
	<div class="row h-100 justify-content-center align-items-center">
	<div class="col px-md-40" id="form-wrapper"
			style="max-width: 750px; margin: 100px; float: left; border: 3px solid #0ABE9A; padding: 40px; background-color: #C5D4D2">
			<form action="createSighting.do">
				
				<div class="form-row">
				<div class="form-group col-md-6">
					<label for="plantName">Plant Name:</label>
					
				<select class="form-control form-select" name="plantName" >
					<c:forEach items="${plants}" var="plant">
						<option selected value="${plant.id}">${plant.commonName}</option>
					</c:forEach>
				</select>
				</div>

				<div class="form-group col-md-6">




				<label for="imageURL">Add image to plant: </label>
				<input type="text" class="form-control" name="image"
					placeholder="Image URL" />
				</div>
				</div>
				
				<div class="form-row">
				<div class="form-group col-md-6">
						<label for="latitude">Latitude: </label>
						<input type="text" class="form-control" name="latitude"
							placeholder="Enter Latitude" value=""
							 />
					</div>
				<div class="form-group col-md-6">
						<label for="longitude">Longitude: </label>
						<input type="text" class="form-control" name="longitude"
							placeholder="Enter Longitude" value=""
							 />
					</div>
					</div>

				
					<div class="form-group ">
					<label for="sightingDescription">Sighting Description: </label>
						<textarea class="form-control" name="description"
							placeholder="Enter brief description"> </textarea>
					</div>
					<div>
					<div class="container my-3 ">
					<div class="col-md-12 text-center">
					<input type="hidden" value="${plant.id}" name="plantid">
						<button class="btn btn-info btn-lg" type="submit"
							value="submitDescription">Submit</button>
					</div>
</div>
</div>
				
			</form>
		</div>
	</div>


</body>
</html>