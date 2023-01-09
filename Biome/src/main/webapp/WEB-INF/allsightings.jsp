<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title>Sightings</title>
</head>
<body>
	<jsp:include page="navbar.jsp"></jsp:include>

	<form action="createForm.do">
		<button type="submit" class="btn btn-info btn-md">Upload New
			Sighting</button>

	</form>


	<div class="grid-container">
		<c:forEach var="sighting" items="${sighting}" varStatus="status">
			<div class="grid-item">
				<form action="selectedSighting.do">
					<br>
					<input type="hidden" value="${sighting.id}" name="id">
					<c:forEach var="image" items="${sighting.getImages}"
						varStatus="status">
						<img src="${image.image}">
					</c:forEach>

					<c:out value="${sighting.description}"></c:out>
					<br>
				</form>
			</div>

		</c:forEach>


	</div>




</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>