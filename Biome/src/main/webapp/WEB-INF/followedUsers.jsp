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
<title>Follow Users</title>

<link rel="stylesheet" href="css/allrecords.css">
<link rel="stylesheet" href="css/biomelogo.css">
</head>
<body style="background-color: #FFFCF1">

	<jsp:include page="navbar.jsp"></jsp:include>



	<!-- Background image -->


	<div class="bg-image" id="background">
<br>
<br>
<br>
<br>

		<div class="showName">

			<div class="pagetitle">
				<h3>Followed Users</h3>
			</div>
			<c:choose>

				<c:when test="${ !empty followedUser}">

					<div class="container">
						<div class="grid-container">
							<c:forEach var="user" items="${followedUser}" varStatus="status">
								<div class="grid-item">
									<form action="selectedUser.do">
										<br>
										<input type="hidden" value="${user.id}" name="id">
										<input type="image" src="${user.profileImage.imageUrl}"
											width="200" height="200">
										<br>
										<c:out value="${user.username}">
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

	<!-- Background image -->



</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>