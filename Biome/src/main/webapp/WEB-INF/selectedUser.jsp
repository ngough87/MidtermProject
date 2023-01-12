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

<title>Selected User</title>
<link rel="stylesheet" href="css/selectedUser.css">
<link rel="stylesheet" href="css/allrecords.css">
</head>
<body style="background-color: #FFFCF1">

	<jsp:include page="navbar.jsp"></jsp:include>


	<div
		class="row h-100 justify-content-center align-items-center text-center ">

		<div class="card " style="max-width: 800px; margin: 100px;">



			<div class="Aligner">
				<div class="Aligner-item">

					<div>

						<div class="card-header-img-img">
							<div class="card-header-img">
								<img class="card-img-top img-fluid"
									src="${user.profileImage.imageUrl}">
								<div
									class="mask text-light d-flex justify-content-center flex-column text-center"
									style="background-color: rgba(0, 0, 0, 0.5)">
									<h3>Welcome, ${user.username}!</h3>
									<p class="m-0">Member since: ${user.createDate.month}
										${user.createDate.year }</p>
								</div>
							</div>
						</div>
					</div>
				</div>




				<div class="card-body text-center">



					<c:choose>
						<c:when test="${!empty sessionScope.loggedInUser }">

							<form action="followUser.do" method="post" target="_self">
								<input type="hidden" value="${user.id}" name="id">
								<button type="submit" class="btn btn-info btn-md">Follow
									${user.username}</button>

							</form>

						</c:when>

						<c:otherwise>




						</c:otherwise>


					</c:choose>

				</div>
				<ul class="list-group list-group-flush">

					<li class="list-group-item">Location: ${user.address.state}</li>


				</ul>
				<div class="card-body">
					<h5 class="card-title">Recent User Activity</h5>
					<div class="col text-center">

						<div class="d-flex">
							<div style="width: 850px; height: 400px; overflow-y: scroll;">

								<c:if test="${!empty user.comments}">
									<table class="table table-striped table-hover">
										<thead>
											<tr>
												<th>Date</th>
												<th>User</th>
												<th>Comment</th>
											</tr>
										</thead>

										<tbody>

											<c:forEach var="comment" items="${user.comments}">
												<tr>
													<td class="comments"><font size="2">
															${comment.datePosted.dayOfMonth}
															${comment.datePosted.month} ${comment.datePosted.year}</font></td>
													<c:choose>
														<c:when test="${empty sessionScope.loggedInUser }">

															<td><img src="${user.profileImage.imageUrl}"
																class="rounded-circle" height="40" loading="lazy">
																${user.username}</td>


														</c:when>
														<c:otherwise>

															<td><a href="selectedUser.do?id=${sighting.user.id}">
																	<img src="${user.profileImage.imageUrl}"
																		class="rounded-circle" height="40" loading="lazy">
																	${user.username}
																</a></td>




														</c:otherwise>
													</c:choose>

													<td>${comment.contents}</td>

												</tr>
											</c:forEach>
										</tbody>
									</table>
								</c:if>


							</div>
						</div>
					</div>
				</div>
				<h5>Following</h5>
				<div class="showName">
					<div class="followed Users:</p>container">
						<div class="grid-container">
							<c:forEach var="followedUser" items="${user.followedUsers}"
								varStatus="followed">
								<div class="grid-item">
									<form action="selectedUser.do">
										<br> <input type="hidden" value="${followedUser.id}"
											name="id"> <input type="image"
											src="${followedUser.profileImage.imageUrl}" width="200"
											height="200"> <br>
										<c:out value="${followedUser.username}"></c:out>
										<br>
									</form>
								</div>

							</c:forEach>

						</div>
					</div>
				</div>
			</div>


			<br>
			<div class="card-body text-center">

				<c:choose>
					<c:when test="${empty sessionScope.loggedInUser }">
						<a href="home.do">
							<h5>Sign in/Register to Follow!</h5>
						</a>

					</c:when>
				</c:choose>

			</div>

		</div>
	</div>

</body>

<jsp:include page="footer.jsp"></jsp:include>
</html>