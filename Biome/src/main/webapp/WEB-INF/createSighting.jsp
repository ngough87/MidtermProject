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
		<div class="card" style="max-width: 750px; margin: 100px;">
		<form action="createSighting.do">
			<label for="imageURL">Add image to plant: </label>
						<input type="text" class="form-control" name="imageURL"
							placeholder="Image URL" />
			<div class="card-body">
				<h5 class="card-title">Common Name: ${plant.commonName}</h5>

			</div>
			<ul class="list-group list-group-flush">

				<li class="list-group-item">Scientific Name:
					${plant.scientificName}</li>
				<li class="list-group-item">Habitat: ${plant.habitat.name}</li>
				
			</ul>
			<div class="form-row">
					<div class="form-group col-md-6">
			<textarea class="form-control" name="comments" placeholder="Enter brief description"> </textarea>
				</div>
						<input type="hidden" value="${plant.id}" name="id">
					
				<button class="btn btn-info btn-lg" type="submit" value="submitComment">Submit Comment</button>
				</div>
					</form>
				</div>
				</div>
				

</body>
</html>