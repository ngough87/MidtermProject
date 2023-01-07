<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Plants</title>

<link rel="stylesheet" href="css/allrecords.css">

</head>
<body>
	<jsp:include page="navbar.jsp"></jsp:include>

	<div class="col-auto button-container">
		<div style="margin: auto; float: left;">

			<form action="uploadedPlant.do">
				<button type="submit" class="btn btn-primary">Upload New
					Plant</button>

			</form>
		</div>
		<div style="margin: auto; float: right;">
			<form action="searchPlants.do" class="in-line">

				<input type="text" name="searchTerm" placeholder="Search" />

				<input type="submit" value="Submit" class="btn btn-primary"
					role="button" />
			</form>
		</div>
	</div>

	<br>
	<br>
	<br>


	<c:choose>

		<c:when test="${ !empty plants}">

			<div class="container">
				<div class="grid-container">
					<c:forEach var="plant" items="${plants}" varStatus="status">
						<div class="grid-item">
							<form action="selectedPlant.do">
								<br>
								<input type="hidden" value="${plant.id}" name="id">
								<input type="image" src="${plant.imageUrl}" width="200"
									height="200">
								<br>
								<c:out value="${plant.commonName}">
								</c:out>
							</form>
						</div>

					</c:forEach>


				</div>
			</div>


		</c:when>
		<c:otherwise>
			<div class="container">
				<h3>No Results Found</h3>
			</div>
		</c:otherwise>


	</c:choose>




</body>
</html>