<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>All Plants</title>

<link rel="stylesheet" href="css/allrecords.css">

</head>
<body>
	<jsp:include page="navbar.jsp"></jsp:include>

	<div class="backgroundcolor">



		
	<div class="backgroundcolor center">

	<div class="card-body row">
			   <div class="col-md-4">
				<c:if test="${user != null}">
				<div style="margin: auto; float: left;">
					<form action="uploadedPlant.do">
						<button type="submit" class="btn btn-info btn-md">Upload
							New Plant</button>
					</form>
				</div>
			</c:if>
				</div>
				  <div class="col-md-4">
				<!--   <a href="plants.do?sortBy=commonName"></a> -->
					<form action="plants.do" class="in-line">
				<input type="hidden" name="sortBy" value="commonName">
				<input type="submit" value="Sort Alphabetically" class="btn btn-info btn-md"
						role="button" />
			
				</form>
				</div>
	
				  <div class="col-md-4">
						<form action="searchPlants.do" class="in-line">

					<input type="text" name="searchTerm" placeholder="Search" />

					<input type="submit" value="Submit" class="btn btn-info btn-md"
						role="button" />
				</form>
				</div>


</div>
	<br>
	<br>
	<br>
		<h3>${headerString}</h3>
		<c:choose>

			<c:when test="${ !empty plants}">

				<div class="container">
					<div class="grid-container" id="alpha">
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


	</div>
</div>
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>