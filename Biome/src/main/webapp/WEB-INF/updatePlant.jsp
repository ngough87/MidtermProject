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

	<form action="updatedPlant.do" method="GET">

		<input type="hidden" value="${plant.id}" name="id">


		<div>
			<input type="text" name="imageURL" value="${plant.imageUrl}"
				placeholder="Image URL" />
		</div>
		<br>
		<div>
			<input type="text" name="commonName" value="${plant.commonName}"
				placeholder="Common Name" />
		</div>
		<br>
		<div>
			<input type="text" name="scientificName"
				value="${plant.scientificName}" placeholder="Scientific Name" />
		</div>
		<br>
		<div>



			<label for="endangeredStat">Endangered Status:</label>
			<select name="endangeredStat">

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
		<br>
		<h3>Zone</h3>
		<div class="form-check form-check-inline">
			<div class="form-check ">
				<c:forEach items="${zones}" var="zone">

					<c:set var="avail" value="true" />
					<c:forEach items="${plant.zones}" var="plantZone">

						<c:if test="${plantZone.id eq zone.id }">
							<div>
								<input class="form-check-input" type="checkbox"
									value="${zone.id}" id="flexCheckDefault" name="plant.zone"
									checked>
								<label class="form-check-label" for="flexCheckDefault">
									${zone.id} </label>
							</div>
							<c:remove var="avail" />
						</c:if>
					</c:forEach>

					<c:if test="${avail}">
						<div>
							<input class="form-check-input" type="checkbox"
								value="${zone.id}" id="flexCheckDefault" name="plant.zone">
							<label class="form-check-label" for="flexCheckDefault">
								${zone.id} </label>
						</div>
					</c:if>
				</c:forEach>
			</div>
		</div>
		<br>
		<div>

			<label for="hab">Habitat:</label>
			<select name="hab">
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

		<h3>Sun Exposure</h3>
		<div class="form-check form-check-inline">
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

		<br>



		<c:forEach items="${seasons}" var="season">
			<c:choose>
				<c:when test="${plant.season.id eq season.id }">
					<div class="form-check">
						<input class="form-check-input" type="checkbox"
							value="${season.id }" id="flexCheckDefault" name="sea" checked>
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

		<br>
		<div>
			<textarea name="environmentalNotes"> Plant Environmental Notes</textarea>
		</div>
		<br>
		<div>
			<textarea name="medicinalProperties"> Medicinal Properties</textarea>
		</div>
		<br>
		<div>
			<label for="edible">Edible:</label>
			<c:choose>

				<c:when test="${plant.edible eq true}">
					<div class="form-check">
						<input class="form-check-input" type="radio" value="0"
							id="flexCheckDefault" name="edible" checked>
						<label class="form-check-label" for="flexCheckDefault">
							Yes </label>
					</div>
				</c:when>
				<c:otherwise>
					<div class="form-check">
						<input class="form-check-input" type="radio" value="0"
							id="flexCheckDefault" name="edible">
						<label class="form-check-label" for="flexCheckDefault">
							Yes </label>
					</div>
				</c:otherwise>
			</c:choose>
			<c:choose>

				<c:when test="${plant.edible eq false}">
					<div class="form-check">
						<input class="form-check-input" type="radio" value="1"
							id="flexCheckDefault" name="edible" checked>
						<label class="form-check-label" for="flexCheckDefault"> No
						</label>
					</div>
				</c:when>
				<c:otherwise>
					<div class="form-check">
						<input class="form-check-input" type="radio" value="1"
							id="flexCheckDefault" name="edible">
						<label class="form-check-label" for="flexCheckDefault"> No
						</label>
					</div>
				</c:otherwise>
			</c:choose>
		</div>

		<br>

		<div>
			<label for="plantT">Plant Type:</label>
			<select name="plantT">
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
		
		<input type="hidden" value="${plant.id}" name = "id">
		<input type="submit" value="Submit" class="btn btn-primary"
			role="button" />
		
		

	</form>
</body>
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