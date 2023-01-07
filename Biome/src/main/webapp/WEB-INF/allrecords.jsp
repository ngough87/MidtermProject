<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Plants</title>
</head>
<body>
	<jsp:include page="navbar.jsp"></jsp:include>

	<div class="col-auto" style="max-width: 600px; margin: auto;">
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


	<c:choose>

		<c:when test="${ !empty plants}">
			<div>
				<div class="col-auto" style="max-width: 750px; margin: auto;">

					<table id="transparentbackground"
						class="table .table-sm table-responsive">

						<c:set var="count" value="0" scope="page" />
						<c:set var="count" value="${count + 1}" scope="page" />


						<c:set var="numCols" value="3" />
						<c:forEach var="plant" items="${plants}" varStatus="status">
							<c:if test="${status.index % numCols == 0}">
								<tr>
							</c:if>
							<td class=".text-center" style="width: 200px;">
								<form action="selectedPlant.do">
									<br>
									<input type="hidden" value="${plant.id}" name="id">
									<input type="image" src="${plant.imageUrl}" width="200"
										height="200">
									<c:out value="${plant.commonName}">
									</c:out>
								</form>
							</td>
							<c:if test="${status.count % numCols == 0 or status.last}">
								</tr>
							</c:if>
						</c:forEach>



						<%-- <c:forEach var="plant" items="${plants}">
					<tr>
						<td>${plant.commonName}</td>
					</tr>
					<tr>

						<td>
							<form action="selectedPlant.do">
								<input type="hidden" value="${plant.id}" name="id">
								<input type="image" src="${plant.imageUrl}" width="200"
									height="200">
							</form>
						</td>
					</tr>
				</c:forEach>  --%>
					</table>

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