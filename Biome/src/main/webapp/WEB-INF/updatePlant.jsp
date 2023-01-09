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
<title>Update Plant</title>
</head>
<jsp:include page="navbar.jsp"></jsp:include>
<body>
<body style="background-color: #FFFCF1">
	<div class="row h-100 justify-content-center align-items-center">

		<!-- <div class="row" style="overflow: scroll;"> -->
		<div class="col px-md-40" id="form-wrapper"
			style="max-width: 750px; margin: 100px; float: left; border: 3px solid #0ABE9A; padding: 40px; background-color: #C5D4D2">
			<h2 class="text-center">Update Plant</h2>


			<form action="updatedPlant.do" method="GET">

				<input type="hidden" value="${plant.id}" name="id">


				<div>


					<label for="imageURL">Add image to plant: </label>
					<input type="text" class="form-control" name="imageURL"
						value="${plant.imageUrl}" placeholder="Image URL" />



				</div>


				<div class="form-row">

					<div class="form-group col-md-6">
						<label for="commonName">Common Name: </label>
						<input type="text" class="form-control" name="commonName"
							placeholder="Common Name" value="${plant.commonName}"
							placeholder="Common Name" />
					</div>
					<div class="form-group col-md-6">
						<label for="scientificName">Scientific Name: </label>
						<input type="text" class="form-control" name="scientificName"
							placeholder="Scientific Name" value="${plant.scientificName}"
							placeholder="Scientific Name" />
					</div>
				</div>


				<div class="form-row">
					<div class="form-group col-md-6">

						<label for="endangeredStat">Endangered Status:</label>
						<select class="form-control form-select" name="endangeredStat">

							<c:forEach items="${endangeredStatuses}" var="status">
								<c:choose>
									<c:when test="${plant.endangeredStatus.id eq status.id}">
										<option value="${status.id}" selected>
											${status.description}</option>
									</c:when>
									<c:otherwise>
										<option value="${status.id}">${status.description}</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</select>
					</div>


					<div class="form-group col-md-6">



						<label for="hab">Habitat:</label>
						<select class="form-control form-select" name="hab">
							<c:forEach var="habitat" items="${habitats }">
								<c:choose>
									<c:when test="${plant.habitat.id eq habitat.id}">
										<option value="${habitat.id }" selected>${habitat.name}</option>
									</c:when>
									<c:otherwise>
										<option value="${habitat.id }">${habitat.name}</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</select>
					</div>





				</div>






				<div class="form-group col-md-6">
					<label for="plant.Zone">Zone: </label>
					<div class="form-check form-check-inline ">
						<c:forEach items="${zones}" var="zone">

							<c:set var="avail" value="true" />
							<c:forEach items="${plant.zones}" var="plantZone">

								<c:if test="${plantZone.id eq zone.id }">
									<div>
										<input class="form-check-input" type="checkbox"
											value="${zone.id}" id="flexCheckDefault" name="zone" checked>
										<label class="form-check-label" for="flexCheckDefault">
											${zone.id} </label>
									</div>
									<c:remove var="avail" />
								</c:if>
							</c:forEach>

							<c:if test="${avail}">
								<div>
									<input class="form-check-input" type="checkbox"
										value="${zone.id}" id="flexCheckDefault" name="zone">
									<label class="form-check-label" for="flexCheckDefault">
										${zone.id} </label>
								</div>
							</c:if>
						</c:forEach>
					</div>
				</div>


				<div class="form-row">
					<div class="form-group col-md-6">
						<label for="sun">Sun Amount: </label>
						<div class="form-check ">
							<c:forEach items="${sun}" var="sunEx">
								<c:set var="avail" value="true" />
								<c:forEach items="${plant.sunExposures}" var="sunExposure">
									<c:if test="${sunExposure.id eq sunEx.id}">

										<div class="form-check">
											<input class="form-check-input" type="checkbox"
												value="${sunEx.id}" id="flexCheckDefault" name="sun" checked>
											<label class="form-check-label" for="flexCheckDefault">
												${sunEx.name} </label>
										</div>

										<c:remove var="avail" />

									</c:if>
								</c:forEach>

								<c:if test="${avail}">
									<div class="form-check">
										<input class="form-check-input" type="checkbox"
											value="${sunEx.id}" id="flexCheckDefault" name="sun">
										<label class="form-check-label" for="flexCheckDefault">
											${sunEx.name} </label>
									</div>
								</c:if>
							</c:forEach>
						</div>
					</div>




					<div class="form-group col-md-6">
						<label for="sea">Season: </label>
						<c:forEach items="${seasons}" var="season">
							<c:choose>
								<c:when test="${plant.season.id eq season.id }">
									<div class="form-check">
										<input class="form-check-input" type="checkbox"
											value="${season.id }" id="flexCheckDefault" name="sea"
											checked>
										<label class="form-check-label" for="flexCheckDefault">
											${season.name} </label>
									</div>
								</c:when>
								<c:otherwise>
									<div class="form-check">
										<input class="form-check-input" type="checkbox"
											value="${season.id }" id="flexCheckDefault" name="sea">
										<label class="form-check-label" for="flexCheckDefault">
											${season.name} </label>
									</div>
								</c:otherwise>
							</c:choose>
						</c:forEach>

					</div>
				</div>



				<div class="form-row">
					<div class="form-group col-md-6">
						<label for="plantT">Plant Type:</label>
						<select class="form-control form-select" name="plantT">
							<c:forEach var="plantTy" items="${plantTypes}">
								<c:choose>
									<c:when test="${plant.plantType.id eq plantTy.id}">
										<option value="${plantTy.id }" selected>${plantTy.name}</option>
									</c:when>
									<c:otherwise>
										<option value="${plantTy.id }">${plantTy.name}</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>

						</select>
					</div>

					
						<div class="form-group col-md-6">
							<label for="edible">Edible:</label>

							<select class="form-control form-select" name="edible">
								<c:choose>

									<c:when test="${plant.edible eq true}">

										<option value="0">Yes</option>

									</c:when>
									<c:otherwise>
										<option value="0">Yes</option>
									</c:otherwise>
								</c:choose>
								<c:choose>

									<c:when test="${plant.edible eq false}">
										<option value="1">No</option>
									</c:when>
									<c:otherwise>
										<option value="1">No</option>
									</c:otherwise>
								</c:choose>
							</select>
						</div>
					</div>

				



				<div class="form-row">
					<div class="form-group col-md-6">
						<label for="environmetnalNotes">Environmental notes: </label>
						<textarea class="form-control" name="environmentalNotes"
							placeholder="ex: attracts insects or animals, drought tolerant">${plant.environmentalNotes } </textarea>

					</div>
					<br>
					<div class="form-group col-md-6">
						<label for="medicinalProperties">Medicinal Properties: </label>
						<textarea class="form-control" name="medicinalProperties"
							placeholder="ex: when consumed, known to relieve headaches or mild cramps">${plant.medicinalProperties}</textarea>
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