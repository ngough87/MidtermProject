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
<title>Create Plant</title>
<link rel="stylesheet" href="css/createPlant.css">
</head>
<body style="background-color: #FFFCF1">
	<jsp:include page="navbar.jsp"></jsp:include>
<body>
	<div class="bg-image" id="background" class="text-center">

	<div class="row h-100 justify-content-center align-items-center">
		<div>
		<c:if test="${user == null}">
			<h3 id="warning">You must be logged in to upload new plants</h3>
		</c:if>
		</div>
		<!-- <div class="row" style="overflow: scroll;"> -->
		<div class="col px-md-40" id="form-wrapper"
			style="max-width: 750px; margin: 100px; float: left; border: 3px solid #0ABE9A; padding: 40px; background-color: #C5D4D2">
			<h2 class="text-center">Add a plant</h2>


			<form action="createPlant.do" method="POST">

			
						<label for="imageURL">Add image to plant: </label>
						<input type="text" class="form-control" name="imageUrl"
							placeholder="Image URL" />
					
				<div class="form-row">

					<div class="form-group col-md-6">
						<label for="commonName">*Common Name: </label>
						<input type="text" class="form-control" name="commonName"
							placeholder="Common Name" required="required"/>
					</div>
					<div class="form-group col-md-6">
						<label for="scientificName">Scientific Name: </label>
						<input type="text" class="form-control" name="scientificName"
							placeholder="Scientific Name" />
					</div>
				</div>

				<div class="form-row">
					<div class="form-group col-md-6">

						<label for="endangeredStat">*Endangered Status:</label>
						<select class="form-control form-select" name="endangeredStat">
							<option value="1">Presumed Extinct</option>
							<option value="2">Possibly Extinct</option>
							<option value="3">Critically imperiled</option>
							<option value="4">Imperiled</option>
							<option value="5">Vulnerable</option>
							<option value="6">Apparently Secure</option>
							<option value="7">Secure</option>
							<option value="8">No Status</option>
						</select>
					</div>


					<div class="form-group col-md-6">

						<label for="hab">*Habitat:</label>
						<select class="form-control form-select" name="hab">
							<option value="1">Woodland</option>
							<option value="2">Prairie</option>
							<option value="3">Wetland</option>
							<option value="4">Savannah</option>
							<option value="5">High Desert</option>

						</select>
					</div>




				</div>






				<div class="form-group col-md-6">
					<label for="plant.Zone">Zone: </label>
					<div class="form-check form-check-inline">
						<div class="form-check ">

							<input class="form-check-input" type="checkbox" value="1"
								id="flexCheckDefault" name="plant.zone">
							<label class="form-check-label" for="flexCheckDefault"> 1
							</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="checkbox" value="2"
								id="flexCheckDefault" name="plant.zone">
							<label class="form-check-label" for="flexCheckDefault"> 2
							</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="checkbox" value="3"
								id="flexCheckDefault" name="plant.zone">
							<label class="form-check-label" for="flexCheckDefault"> 3
							</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="checkbox" value="4"
								id="flexCheckDefault" name="plant.zone">
							<label class="form-check-label" for="flexCheckDefault"> 4
							</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="checkbox" value="5"
								id="flexCheckDefault" name="plant.zone">
							<label class="form-check-label" for="flexCheckDefault"> 5
							</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="checkbox" value="6"
								id="flexCheckDefault" name="plant.zone">
							<label class="form-check-label" for="flexCheckDefault"> 6
							</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="checkbox" value="7"
								id="flexCheckDefault" name="plant.zone">
							<label class="form-check-label" for="flexCheckDefault"> 7
							</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="checkbox" value="8"
								id="flexCheckDefault" name="plant.zone">
							<label class="form-check-label" for="flexCheckDefault"> 8
							</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="checkbox" value="9"
								id="flexCheckDefault" name="plant.zone">
							<label class="form-check-label" for="flexCheckDefault"> 9
							</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="checkbox" value="10"
								id="flexCheckDefault" name="plant.zone">
							<label class="form-check-label" for="flexCheckDefault">
								10 </label>
						</div>
					</div>
				</div>






				<div class="form-row">
					<div class="form-group col-md-6">
						<label for="sun">*Sun Amount: </label>
						<div class="form-check">
							<input class="form-check-input" type="checkbox" value="1"
								id="flexCheckDefault" name="sun">
							<label class="form-check-label" for="flexCheckDefault">
								Full Sun </label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="checkbox" value="2"
								id="flexCheckDefault" name="sun">
							<label class="form-check-label" for="flexCheckDefault">
								Partial Sun </label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="checkbox" value="3"
								id="flexCheckDefault" name="sun">
							<label class="form-check-label" for="flexCheckDefault">
								Partial Shade </label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="checkbox" value="4"
								id="flexCheckDefault" name="sun">
							<label class="form-check-label" for="flexCheckDefault">
								Shade </label>
						</div>


					</div>

					<br>

					<div class="form-group col-md-6">
						<label for="sea">*Season: </label>
						<div class="form-check">

							<input class="form-check-input" type="checkbox" value="1"
								id="flexCheckDefault" name="sea">
							<label class="form-check-label" for="flexCheckDefault">
								Perennial </label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="checkbox" value="2"
								id="flexCheckDefault" name="sea">
							<label class="form-check-label" for="flexCheckDefault">
								Annual </label>
						</div>
					</div>
				</div>







				<div class="form-row">
					<div class="form-group col-md-6">
						<label for="plantT">*Plant Type:</label>
						<select class="form-control form-select" name="plantT">
							<option value="1">Herbaceous</option>
							<option value="2">Tree</option>
							<option value="3">Shrub</option>
							<option value="4">Grass</option>
							<option value="5">Rush</option>

						</select>
					</div>

					<div class="form-group col-md-6">
						<label for="edible">Edible:</label>
						<select class="form-control form-select" name="edible">
							<option value="1">Yes</option>
							<option value="0">No</option>
						</select>
					</div>
				</div>




				<div class="form-row">
					<div class="form-group col-md-6">
						<label for="environmetnalNotes">Environmental notes: </label>
						<textarea class="form-control" name="environmentalNotes"
							placeholder="ex: attracts insects or animals, drought tolerant"></textarea>

					</div>
					<br>
					<div class="form-group col-md-6">
						<label for="medicinalProperties">Medicinal Properties: </label>
						<textarea class="form-control" name="medicinalProperties" placeholder="ex: when consumed, known to relieve headaches or mild cramps"></textarea>
					</div>
				</div>

				<div class="container my-3 ">
					<div class="col-md-12 text-center">
						<input type="submit" value="Submit" class="btn btn-info btn-lg"
							role="button" />
					</div>
				</div>
			</form>

		</div>
	</div>
	<!-- </div> -->
	</div>

<!-- 	<div class="column">
		<div class="zoneimage"></div>
	</div> -->
</body>
<jsp:include page="footer.jsp"></jsp:include>
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

</html>