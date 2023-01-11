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
		<div class="mask" style="background-color: rgba(0, 0, 0, 0.3);">
	<div class="bg-image"
		style="background-image: url('https://cdn.discordapp.com/attachments/1054906456043966619/1062479301640982728/Biomewithoutbackground.png');ß background-repeat:no-repeat; height: 100vh;">
			<div class="d-flex justify-content-center align-items-center h-100">
				<div class="col-auto button-container">
					<div class="showName">

						<div class="pagetitle">
							<h3>Followed Users</h3>
						</div>
						<c:choose>

							<c:when test="${ !empty followedUser}">

								<div class="container" >
									<div class="grid-container">
										<c:forEach var="user" items="${followedUser}"
											varStatus="status">
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

			</div>
		</div>
	</div>
	<!-- Background image -->



</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>