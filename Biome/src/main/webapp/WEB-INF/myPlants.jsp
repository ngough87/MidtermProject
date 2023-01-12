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

<link rel="stylesheet" href="css/mysightings.css">
<link rel="stylesheet" href="css/biomelogo.css">
<link rel="stylesheet" href="css/allrecords.css">

<title>My Sightings</title>



</head>
<body style="background-color: #FFFCF1">

	<jsp:include page="navbar.jsp"></jsp:include>
	<div class="bg-image" id="background" class="text-center">
<br>
<br>
<br>
<br>
<div class="showName">

			<div class="pagetitle">
				<h3>My Plants</h3>
			</div>

	<div class="container">
		<div class="grid-container">
			<c:forEach var="plant" items="${plants}" varStatus="status">
				<div class="grid-item">
					<form action="selectedPlant.do">
						<br>
						<input type="hidden" value="${plant.id}" name="id">
						<input type="image" src="${plant.imageUrl}" width="200"
							height="200">

						<c:out value="${plant.commonName}"></c:out>
						<br>
						
						
					</form>
				</div>

			</c:forEach>

		</div>
	</div>

</div>


</div>

</body>


<jsp:include page="footer.jsp"></jsp:include>
</html>